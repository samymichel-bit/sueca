from django.contrib import admin
from .models import Service, Project, Talent, TeamMember, Testimonial, ContactMessage

admin.site.register(Service)
admin.site.register(Project)
admin.site.register(Talent)
admin.site.register(TeamMember)
admin.site.register(Testimonial)
admin.site.register(ContactMessage)