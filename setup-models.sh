#!/bin/bash
# 🔧 Injection des modèles Django pour SUECA
# À exécuter depuis la racine du projet

echo "📝 Écriture des modèles dans backend/api/models.py..."

cat > backend/api/models.py << 'EOF'
from django.db import models
from django.utils.text import slugify

class Service(models.Model):
    """Services proposés par l'agence (consulting, coaching, etc.)"""
    title = models.CharField(max_length=200, verbose_name="Titre")
    slug = models.SlugField(unique=True, blank=True)
    description = models.TextField(verbose_name="Description")
    icon = models.CharField(max_length=50, help_text="Emoji ou classe CSS (ex: 🎯, fa-rocket)")
    is_active = models.BooleanField(default=True, verbose_name="Actif")

    class Meta:
        verbose_name = "Service"
        verbose_name_plural = "Services"
        ordering = ['title']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)[:50]
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title


class Project(models.Model):
    """Réalisations / Portfolio : événements, shootings, caravanes"""
    CATEGORIES = [
        ('event', 'Événementiel'),
        ('coaching', 'Coaching'),
        ('shooting', 'Shooting'),
        ('caravan', 'Caravane'),
        ('other', 'Autre'),
    ]
    title = models.CharField(max_length=200, verbose_name="Titre")
    slug = models.SlugField(unique=True, blank=True)
    description = models.TextField(verbose_name="Description")
    category = models.CharField(max_length=20, choices=CATEGORIES, verbose_name="Catégorie")
    cover_image = models.ImageField(upload_to='projects/', verbose_name="Image de couverture")
    is_featured = models.BooleanField(default=False, verbose_name="Mis en avant")
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Projet"
        verbose_name_plural = "Projets"
        ordering = ['-created_at']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)[:50]
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title


class Talent(models.Model):
    """Model talents et créatifs accompagnés"""
    full_name = models.CharField(max_length=200, verbose_name="Nom complet")
    age = models.IntegerField(null=True, blank=True, verbose_name="Âge")
    bio = models.TextField(verbose_name="Biographie")
    photo = models.ImageField(upload_to='talents/', verbose_name="Photo")
    instagram = models.URLField(blank=True, verbose_name="Instagram")
    is_active = models.BooleanField(default=True, verbose_name="Actif")

    class Meta:
        verbose_name = "Talent"
        verbose_name_plural = "Talents"
        ordering = ['full_name']

    def __str__(self):
        return self.full_name


class TeamMember(models.Model):
    """Équipe de l'agence (M. Litse Firmin et collaborateurs)"""
    full_name = models.CharField(max_length=200, verbose_name="Nom complet")
    role = models.CharField(max_length=200, verbose_name="Rôle")
    bio = models.TextField(blank=True, verbose_name="Biographie")
    photo = models.ImageField(upload_to='team/', verbose_name="Photo")

    class Meta:
        verbose_name = "Membre de l'équipe"
        verbose_name_plural = "Membres de l'équipe"
        ordering = ['full_name']

    def __str__(self):
        return f"{self.full_name} - {self.role}"


class Testimonial(models.Model):
    """Témoignages clients"""
    author = models.CharField(max_length=200, verbose_name="Auteur")
    company = models.CharField(max_length=200, blank=True, verbose_name="Entreprise")
    content = models.TextField(verbose_name="Témoignage")
    photo = models.ImageField(upload_to='testimonials/', blank=True, verbose_name="Photo")
    is_visible = models.BooleanField(default=True, verbose_name="Visible")

    class Meta:
        verbose_name = "Témoignage"
        verbose_name_plural = "Témoignages"
        ordering = ['author']

    def __str__(self):
        return self.author


class ContactMessage(models.Model):
    """Messages reçus via le formulaire de contact"""
    name = models.CharField(max_length=200, verbose_name="Nom")
    email = models.EmailField(verbose_name="Email")
    phone = models.CharField(max_length=30, blank=True, verbose_name="Téléphone")
    subject = models.CharField(max_length=300, verbose_name="Sujet")
    message = models.TextField(verbose_name="Message")
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Message de contact"
        verbose_name_plural = "Messages de contact"
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.name} - {self.subject}"
EOF

echo "✅ Modèles écrits avec succès !"
echo "🚀 Lance maintenant :"
echo "   cd backend && source venv/bin/activate"
echo "   python manage.py makemigrations api"
echo "   python manage.py migrate"
echo "   python manage.py createsuperuser"