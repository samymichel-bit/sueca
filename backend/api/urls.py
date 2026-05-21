from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    ServiceViewSet, ProjectViewSet, TalentViewSet,
    TeamMemberViewSet, TestimonialViewSet, ContactMessageViewSet,
    TalentTypeViewSet, ServiceWorkflowViewSet, ServiceOrderViewSet,
    OrderPhaseViewSet, process_payment
)

router = DefaultRouter()
router.register(r'services', ServiceViewSet)
router.register(r'projects', ProjectViewSet)
router.register(r'talents', TalentViewSet)
router.register(r'team', TeamMemberViewSet)
router.register(r'testimonials', TestimonialViewSet)
router.register(r'contacts', ContactMessageViewSet)
router.register(r'talent-types', TalentTypeViewSet)
router.register(r'workflows', ServiceWorkflowViewSet)
router.register(r'orders', ServiceOrderViewSet, basename='order')
router.register(r'order-phases', OrderPhaseViewSet)   # cette ligne est cruciale

urlpatterns = [
    path('payment/<int:phase_id>/', process_payment, name='process_payment'),
    path('', include(router.urls)),
]