from rest_framework import serializers
from .models import Service, Project, Talent, TeamMember, Testimonial, ContactMessage, TalentType, ServiceOrder, ServiceWorkflow, OrderPhase

class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = '__all__'

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = '__all__'

class TalentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Talent
        fields = '__all__'

class TeamMemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = TeamMember
        fields = '__all__'

class TestimonialSerializer(serializers.ModelSerializer):
    class Meta:
        model = Testimonial
        fields = '__all__'

class ContactMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactMessage
        fields = '__all__'
class TalentTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = TalentType
        fields = '__all__'

# Mettre à jour le TalentSerializer pour inclure les types
# On remplace le serializer existant par un nouveau incluant les types
# (On va simplement ajouter un champ types dans la classe existante)


class ServiceOrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiceOrder
        fields = ['id', 'service', 'client_name', 'client_email', 'client_phone', 'description', 'status', 'created_at']
        read_only_fields = ['status', 'created_at', 'client_email']

    def validate_client_phone(self, value):
        value = value.strip().replace(' ', '')
        if not value.startswith('+'):
            value = '+237' + value
        return value
        
        


class ServiceWorkflowSerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiceWorkflow
        fields = '__all__'        
class OrderPhaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderPhase
        fields = '__all__'
