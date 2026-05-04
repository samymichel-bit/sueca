from django.db import models
from django.utils.text import slugify

class Service(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    description = models.TextField()
    icon = models.CharField(max_length=50, blank=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        app_label = 'api'
        verbose_name = "Service"
        verbose_name_plural = "Services"
        ordering = ['-created_at']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)[:50]
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title

class Project(models.Model):
    CATEGORIES = [
        ('event', 'Événementiel'),
        ('coaching', 'Coaching'),
        ('shooting', 'Shooting'),
        ('caravan', 'Caravane'),
        ('other', 'Autre'),
    ]
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    description = models.TextField()
    category = models.CharField(max_length=20, choices=CATEGORIES)
    cover_image = models.ImageField(upload_to='projects/')
    is_featured = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        app_label = 'api'
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
    full_name = models.CharField(max_length=200)
    age = models.IntegerField(null=True, blank=True)
    bio = models.TextField()
    photo = models.ImageField(upload_to='talents/')
    instagram = models.URLField(blank=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        app_label = 'api'
        verbose_name = "Talent"
        verbose_name_plural = "Talents"
        ordering = ['full_name']

    def __str__(self):
        return self.full_name

class TeamMember(models.Model):
    full_name = models.CharField(max_length=200)
    role = models.CharField(max_length=200)
    bio = models.TextField(blank=True)
    photo = models.ImageField(upload_to='team/')

    class Meta:
        app_label = 'api'
        verbose_name = "Membre de l'équipe"
        verbose_name_plural = "Membres de l'équipe"
        ordering = ['full_name']

    def __str__(self):
        return f"{self.full_name} - {self.role}"

class Testimonial(models.Model):
    author = models.CharField(max_length=200)
    company = models.CharField(max_length=200, blank=True)
    content = models.TextField()
    photo = models.ImageField(upload_to='testimonials/', blank=True)
    is_visible = models.BooleanField(default=True)

    class Meta:
        app_label = 'api'
        verbose_name = "Témoignage"
        verbose_name_plural = "Témoignages"
        ordering = ['author']

    def __str__(self):
        return self.author

class ContactMessage(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()
    phone = models.CharField(max_length=30, blank=True)
    company = models.CharField(max_length=200, blank=True)
    service = models.CharField(max_length=200, blank=True)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        app_label = 'api'
        verbose_name = "Message de contact"
        verbose_name_plural = "Messages de contact"
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.name} - {self.email}"