#!/bin/bash
# Module 2 – Espace Client V2 pour SUECA

set -e
echo "👤 Mise en place de l'espace client..."

cd backend
source venv/bin/activate

# =============================================
# 1. Dépendances pour l'authentification
# =============================================
pip install djangorestframework-simplejwt
pip freeze > requirements.txt
echo "✅ SimpleJWT installé"

# =============================================
# 2. Configuration dans settings.py
# =============================================
# Ajoute 'rest_framework_simplejwt' dans INSTALLED_APPS si pas déjà présent
if ! grep -q "rest_framework_simplejwt" sueca_backend/settings.py; then
    sed -i "/'rest_framework',/a \    'rest_framework_simplejwt'," sueca_backend/settings.py
    echo "✅ SimpleJWT ajouté à INSTALLED_APPS"
else
    echo "✅ SimpleJWT déjà présent dans INSTALLED_APPS"
fi

# Configure DRF pour utiliser JWT par défaut
if ! grep -q "DEFAULT_AUTHENTICATION_CLASSES" sueca_backend/settings.py; then
    cat >> sueca_backend/settings.py << 'EOF'

# JWT Authentication
from datetime import timedelta

REST_FRAMEWORK['DEFAULT_AUTHENTICATION_CLASSES'] = (
    'rest_framework_simplejwt.authentication.JWTAuthentication',
)

SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(hours=1),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=7),
    'AUTH_HEADER_TYPES': ('Bearer',),
}
EOF
    echo "✅ Configuration JWT ajoutée"
else
    echo "✅ JWT déjà configuré"
fi

# =============================================
# 3. Créer l'app accounts (si pas déjà)
# =============================================
if [ ! -d "accounts" ]; then
    python manage.py startapp accounts
    echo "✅ App accounts créée"
else
    echo "✅ App accounts déjà présente"
fi

# Ajouter 'accounts' dans INSTALLED_APPS
if ! grep -q "'accounts'" sueca_backend/settings.py; then
    sed -i "/'api',/a \    'accounts'," sueca_backend/settings.py
    echo "✅ accounts ajouté à INSTALLED_APPS"
fi

# =============================================
# 4. Sérialiseur, vues et URLs pour l'auth
# =============================================

# --- Serializer ---
cat > accounts/serializers.py << 'EOF'
from django.contrib.auth.models import User
from rest_framework import serializers

class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, min_length=6)

    class Meta:
        model = User
        fields = ['username', 'email', 'password']

    def create(self, validated_data):
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data.get('email', ''),
            password=validated_data['password']
        )
        return user
EOF

# --- Views ---
cat > accounts/views.py << 'EOF'
from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import RegisterSerializer
from django.contrib.auth.models import User

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = RegisterSerializer

class MeView(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = request.user
        return Response({
            'id': user.id,
            'username': user.username,
            'email': user.email,
        })
EOF

# --- URLs ---
cat > accounts/urls.py << 'EOF'
from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import RegisterView, MeView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', TokenObtainPairView.as_view(), name='login'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('me/', MeView.as_view(), name='me'),
]
EOF

# =============================================
# 5. Ajouter les URLs dans le projet principal
# =============================================
if ! grep -q "accounts" sueca_backend/urls.py; then
    sed -i "/path('api\/v1\/', include('api.urls')),/a \    path('api/auth/', include('accounts.urls'))," sueca_backend/urls.py
    echo "✅ URLs accounts ajoutées"
else
    echo "✅ URLs accounts déjà présentes"
fi

# =============================================
# 6. Migrations
# =============================================
python manage.py makemigrations accounts
python manage.py migrate

echo "🧪 Test – création d'un utilisateur de test"

# Test d'inscription via le shell
python manage.py shell << 'EOF'
from django.contrib.auth.models import User
if not User.objects.filter(username='client_test').exists():
    User.objects.create_user(username='client_test', password='suena2026', email='client@test.cm')
    print("✅ Utilisateur 'client_test' créé (password: suena2026)")
else:
    print("✅ Utilisateur 'client_test' déjà présent")
EOF

deactivate

echo ""
echo "🎉 Module 2 – Espace Client installé !"
echo ""
echo "🔗 Endpoints disponibles :"
echo "   POST /api/auth/register/       (username, email, password)"
echo "   POST /api/auth/login/           (username, password) → renvoie access + refresh tokens"
echo "   POST /api/auth/token/refresh/   (refresh token)"
echo "   GET  /api/auth/me/              (Header: Authorization Bearer <token>)"
echo ""
echo "🧪 Test rapide :"
echo "   curl -X POST http://localhost:8000/api/auth/login/ -H \"Content-Type: application/json\" -d '{\"username\":\"client_test\",\"password\":\"suena2026\"}'"