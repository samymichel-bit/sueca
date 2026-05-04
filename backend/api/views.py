from rest_framework import viewsets
from .models import Service, Project, Talent, TeamMember, Testimonial, ContactMessage
from .serializers import ServiceSerializer, ProjectSerializer, TalentSerializer, TeamMemberSerializer, TestimonialSerializer, ContactMessageSerializer

class ServiceViewSet(viewsets.ModelViewSet):
    queryset = Service.objects.filter(is_active=True)
    serializer_class = ServiceSerializer

class ProjectViewSet(viewsets.ModelViewSet):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer

class TalentViewSet(viewsets.ModelViewSet):
    queryset = Talent.objects.filter(is_active=True)
    serializer_class = TalentSerializer

class TeamMemberViewSet(viewsets.ModelViewSet):
    queryset = TeamMember.objects.all()
    serializer_class = TeamMemberSerializer

class TestimonialViewSet(viewsets.ModelViewSet):
    queryset = Testimonial.objects.filter(is_visible=True)
    serializer_class = TestimonialSerializer

class ContactMessageViewSet(viewsets.ModelViewSet):
    queryset = ContactMessage.objects.all()
    serializer_class = ContactMessageSerializer