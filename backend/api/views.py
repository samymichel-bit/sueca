from rest_framework import viewsets, mixins, status
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAdminUser, AllowAny
from rest_framework.response import Response
from django.core.mail import send_mail
from django.conf import settings

from .models import Service, Project, Talent, TeamMember, Testimonial, ContactMessage
from .serializers import (
    ServiceSerializer, ProjectSerializer, TalentSerializer,
    TeamMemberSerializer, TestimonialSerializer, ContactMessageSerializer
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
            # Ne pas bloquer la réponse si l'email échoue
            import logging
            logging.getLogger(__name__).error(f"Email failed: {e}")
