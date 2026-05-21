#!/bin/bash
# Module 3 – Paiement (simulation) V2 pour SUECA

set -e
echo "💰 Mise en place du paiement simulé..."

cd backend
source venv/bin/activate

# =============================================
# 1. Ajouter l'endpoint de paiement dans api/views.py
# =============================================
if ! grep -q "process_payment" api/views.py; then
    cat >> api/views.py << 'EOF'

from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .models import OrderPhase

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def process_payment(request, phase_id):
    """Simule le paiement d'une phase"""
    try:
        phase = OrderPhase.objects.get(id=phase_id, order__client_email=request.user.email)
    except OrderPhase.DoesNotExist:
        return Response({'error': 'Phase non trouvée ou non autorisée'}, status=404)
    
    if phase.status == 'paid':
        return Response({'error': 'Cette phase a déjà été payée'}, status=400)
    
    # Simulation : on passe la phase en "payée"
    phase.status = 'paid'
    phase.save()
    
    # Si toutes les phases sont payées, on peut faire avancer la commande (optionnel)
    order = phase.order
    if all(p.status == 'paid' for p in order.phases.all()):
        order.status = 'completed'
        order.save()
    
    return Response({
        'success': True,
        'phase': phase.name,
        'order_status': order.status,
    })
EOF
    echo "✅ Vue de paiement ajoutée"
fi

# =============================================
# 2. Ajouter l'URL dans api/urls.py
# =============================================
if ! grep -q "process_payment" api/urls.py; then
    sed -i "/urlpatterns = \[/a \    path('payment/<int:phase_id>/', process_payment, name='process_payment')," api/urls.py
    # Ajouter l'import en haut
    sed -i "s/from .views import/from .views import process_payment,/" api/urls.py
    echo "✅ URL de paiement ajoutée"
fi

# =============================================
# 3. Test
# =============================================
echo ""
echo "🧪 Test – simulation d'un paiement"

python manage.py shell << 'EOF'
from django.contrib.auth.models import User
from api.models import Service, ServiceOrder, OrderPhase

# Créer un client si pas déjà
client, _ = User.objects.get_or_create(username='client_test', defaults={'email': 'client@test.cm'})

# Créer un service si pas déjà
s, _ = Service.objects.get_or_create(title="Test Paiement", defaults={"description":"x", "icon":"💰", "is_active":True})

# Créer une commande liée à ce client
o, _ = ServiceOrder.objects.get_or_create(
    service=s,
    client_name=client.username,
    client_email=client.email,
    client_phone="+237600000000",
    description="Test paiement",
    defaults={'status': 'consulting'}
)

# Créer une phase à payer
p, _ = OrderPhase.objects.get_or_create(
    order=o,
    name="Phase test",
    defaults={'price': 10000, 'phase_order': 1, 'status': 'pending'}
)

print(f"Phase '{p.name}' status={p.status}")

# Simuler le paiement (sans requête HTTP, juste la logique)
p.status = 'paid'
p.save()
print(f"Après paiement : status={p.status}, order status={o.status}")
EOF

deactivate

echo ""
echo "🎉 Module 3 – Paiement (simulation) installé !"
echo ""
echo "🔗 Endpoint :"
echo "   POST /api/v1/payment/<phase_id>/  (Header: Authorization Bearer <token>)"
echo ""
echo "🧪 Test API :"
echo "   curl -X POST http://localhost:8000/api/v1/payment/1/ -H \"Authorization: Bearer <token>\""