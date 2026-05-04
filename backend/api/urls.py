from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ServiceViewSet, ProjectViewSet, TalentViewSet, TeamMemberViewSet, TestimonialViewSet, ContactMessageViewSet

router = DefaultRouter()
router.register(r'services', ServiceViewSet)
router.register(r'projects', ProjectViewSet)
router.register(r'talents', TalentViewSet)
router.register(r'team', TeamMemberViewSet)
router.register(r'testimonials', TestimonialViewSet)
router.register(r'contacts', ContactMessageViewSet)

urlpatterns = [
    path('', include(router.urls)),
]