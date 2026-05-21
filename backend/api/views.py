from rest_framework import viewsets, mixins, status
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.response import Response
from django.core.mail import send_mail
from django.conf import settings
from .models import ServiceOrder
from .serializers import ServiceOrderSerializer
from .models import ServiceWorkflow
from .serializers import ServiceWorkflowSerializer

from .models import Service, Project, Talent, TeamMember, Testimonial, ContactMessage, TalentType
from .serializers import (
    ServiceSerializer, ProjectSerializer, TalentSerializer,
    TeamMemberSerializer, TestimonialSerializer, ContactMessageSerializer,
    TalentTypeSerializer, ServiceOrderSerializer, ServiceWorkflowSerializer,
    OrderPhaseSerializer   # ← ajouté
)


# ── Vues publiques (lecture seule) ────────────────────────────
class ServiceViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Service.objects.filter(is_active=True)
    serializer_class = ServiceSerializer
    permission_classes = [AllowAny]
    lookup_field = 'id'


class ProjectViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    permission_classes = [AllowAny]
    lookup_field = 'id'


class TalentViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Talent.objects.filter(is_active=True)
    serializer_class = TalentSerializer
    permission_classes = [AllowAny]


class TeamMemberViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = TeamMember.objects.all()
    serializer_class = TeamMemberSerializer
    permission_classes = [AllowAny]


class TestimonialViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Testimonial.objects.filter(is_visible=True)
    serializer_class = TestimonialSerializer
    permission_classes = [AllowAny]


# ── Contact : création publique uniquement ────────────────────
class ContactMessageViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    queryset = ContactMessage.objects.all()
    serializer_class = ContactMessageSerializer
    permission_classes = [AllowAny]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance = serializer.save()

        # Envoi email aux deux destinataires
        self._send_notification(instance)

        return Response(
            {'detail': 'Message envoyé avec succès.'},
            status=status.HTTP_201_CREATED
        )

    def _send_notification(self, msg):
        subject = f"[SUECA] Nouveau message de {msg.name}"
        body = (
            f"Nom      : {msg.name}\n"
            f"Email    : {msg.email}\n"
            f"Tél      : {msg.phone or '—'}\n"
            f"Société  : {msg.company or '—'}\n"
            f"Service  : {msg.service or '—'}\n"
            f"\nMessage :\n{msg.message}"
        )
        recipients = [r for r in settings.CONTACT_RECIPIENTS if r]
        try:
            send_mail(
                subject,
                body,
                settings.DEFAULT_FROM_EMAIL,
                recipients,
                fail_silently=False,
            )
        except Exception as e:
            import logging
            logging.getLogger(__name__).error(f"Email failed: {e}")


# ── V2 : Paiement simulé (corrigé avec service_order) ────────
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from .models import OrderPhase

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def process_payment(request, phase_id):
    """Simule le paiement d'une phase"""
    try:
        phase = OrderPhase.objects.get(id=phase_id)
    except OrderPhase.DoesNotExist:
        return Response({'error': 'Phase non trouvée ou non autorisée'}, status=404)
    
    if phase.status == 'paid':
        return Response({'error': 'Cette phase a déjà été payée'}, status=400)
    
    # Simulation : on passe la phase en "payée"
    phase.status = 'paid'
    phase.save()
    
    # Si toutes les phases sont payées, on peut faire avancer la commande
    service_order = phase.service_order
    if all(p.status == 'paid' for p in service_order.phases.all()):
        service_order.status = 'completed'
        service_order.save()
    
    return Response({
        'success': True,
        'phase': phase.name,
        'order_status': service_order.status,
    })
class TalentTypeViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = TalentType.objects.all()
    serializer_class = TalentTypeSerializer
    permission_classes = [AllowAny]





class ServiceOrderViewSet(mixins.CreateModelMixin,
                          mixins.ListModelMixin,
                          mixins.RetrieveModelMixin,
                          viewsets.GenericViewSet):
    serializer_class = ServiceOrderSerializer
    permission_classes = [IsAuthenticated]  # Seuls les utilisateurs connectés peuvent voir leurs commandes

    def get_queryset(self):
        # Retourne UNIQUEMENT les commandes du client connecté
        return ServiceOrder.objects.filter(client_email=self.request.user.email)

    def perform_create(self, serializer):
        # Assigne automatiquement l'email du client connecté
        serializer.save(client_email=self.request.user.email)
    
    


class ServiceWorkflowViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = ServiceWorkflow.objects.all()
    serializer_class = ServiceWorkflowSerializer
    permission_classes = [AllowAny]
    filterset_fields = ['service']    
class OrderPhaseViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = OrderPhaseSerializer
    permission_classes = [AllowAny]
    queryset = OrderPhase.objects.all()
    filterset_fields = ['service_order']
