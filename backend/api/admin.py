from django.contrib import admin
from django.utils.html import format_html
from .models import (
    Service, Project, Talent, TeamMember, Testimonial, ContactMessage,
    ServiceWorkflow, ServiceOrder, OrderPhase,
    TalentType,  # ← ajouté
)

admin.site.site_header  = "SUECA Administration"
admin.site.site_title   = "SUECA Admin"
admin.site.index_title  = "Tableau de bord"


@admin.register(Service)
class ServiceAdmin(admin.ModelAdmin):
    list_display  = ['title', 'order', 'is_active', 'preview_image']
    list_editable = ['order', 'is_active']
    list_filter   = ['is_active']
    search_fields = ['title', 'description']
    fieldsets = (
        ('Français', {'fields': ('title', 'slug', 'description')}),
        ('English', {'fields': ('title_en', 'description_en'),
                     'classes': ('collapse',)}),
        ('Média & Affichage', {'fields': ('icon', 'image', 'order', 'is_active')}),
    )
    prepopulated_fields = {'slug': ('title',)}

    def preview_image(self, obj):
        if obj.image:
            return format_html('<img src="{}" height="40" style="border-radius:4px"/>', obj.image.url)
        return '—'
    preview_image.short_description = 'Image'


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display  = ['title', 'category', 'is_featured', 'created_at', 'preview']
    list_editable = ['is_featured']
    list_filter   = ['category', 'is_featured']
    search_fields = ['title', 'description']
    fieldsets = (
        ('Français', {'fields': ('title', 'slug', 'description')}),
        ('English', {'fields': ('title_en', 'description_en'),
                     'classes': ('collapse',)}),
        ('Détails', {'fields': ('category', 'cover_image', 'is_featured')}),
    )
    prepopulated_fields = {'slug': ('title',)}

    def preview(self, obj):
        if obj.cover_image:
            return format_html('<img src="{}" height="40" style="border-radius:4px;object-fit:cover"/>', obj.cover_image.url)
        return '—'
    preview.short_description = 'Aperçu'


@admin.register(Talent)
class TalentAdmin(admin.ModelAdmin):
    list_display  = ['full_name', 'display_types', 'is_active', 'preview_photo']
    list_editable = ['is_active']
    search_fields = ['full_name']

    def preview_photo(self, obj):
        if obj.photo:
            return format_html('<img src="{}" height="40" style="border-radius:50%"/>', obj.photo.url)
        return '—'
    preview_photo.short_description = 'Photo'

    def display_types(self, obj):
        return ", ".join([t.name for t in obj.types.all()])
    display_types.short_description = "Types"


@admin.register(TeamMember)
class TeamMemberAdmin(admin.ModelAdmin):
    list_display  = ['full_name', 'role', 'order', 'preview_photo']
    list_editable = ['order']
    search_fields = ['full_name', 'role']
    fieldsets = (
        ('Informations', {'fields': ('full_name', 'photo', 'order')}),
        ('Français', {'fields': ('role', 'bio')}),
        ('English', {'fields': ('role_en', 'bio_en'), 'classes': ('collapse',)}),
    )

    def preview_photo(self, obj):
        if obj.photo:
            return format_html('<img src="{}" height="40" style="border-radius:50%"/>', obj.photo.url)
        return '—'
    preview_photo.short_description = 'Photo'


@admin.register(Testimonial)
class TestimonialAdmin(admin.ModelAdmin):
    list_display  = ['author', 'company', 'rating', 'is_visible']
    list_editable = ['is_visible']
    list_filter   = ['rating', 'is_visible']
    search_fields = ['author', 'company']
    fieldsets = (
        ('Auteur', {'fields': ('author', 'company', 'photo', 'rating', 'is_visible')}),
        ('Français', {'fields': ('content',)}),
        ('English', {'fields': ('content_en',), 'classes': ('collapse',)}),
    )


@admin.register(ContactMessage)
class ContactMessageAdmin(admin.ModelAdmin):
    list_display  = ['name', 'email', 'phone', 'service', 'is_read', 'created_at']
    list_editable = ['is_read']
    list_filter   = ['is_read', 'service', 'created_at']
    search_fields = ['name', 'email', 'company']
    readonly_fields = ['name', 'email', 'phone', 'company', 'service', 'message', 'created_at']

    def has_add_permission(self, request):
        return False


# ===== V2 : Workflow & Commandes =====

@admin.register(ServiceWorkflow)
class ServiceWorkflowAdmin(admin.ModelAdmin):
    list_display = ('service', 'name', 'order', 'default_price')

@admin.register(ServiceOrder)
class ServiceOrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'client_name', 'service', 'status', 'created_at')
    list_filter = ('status', 'service')

@admin.register(OrderPhase)
class OrderPhaseAdmin(admin.ModelAdmin):
    list_display = ('service_order', 'name', 'status', 'price', 'due_date')
    list_filter = ('status',)


# ===== V2 : Marketplace RH =====

@admin.register(TalentType)
class TalentTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug')
    prepopulated_fields = {'slug': ('name',)}