#!/bin/bash

# ⚙️ Script d'initialisation de l'environnement SUECA
# À exécuter depuis la racine du projet (suenca-website/)

echo "⚡ Démarrage de l'initialisation de l'environnement..."

# ---------- GIT ----------
echo "📦 Configuration Git..."
git init
git checkout -b main
echo "# SUECA Website" > README.md
git add .
git commit -m "Initial commit — structure du projet"

# ---------- BACKEND ----------
echo "🐍 Configuration du backend Django..."
cd backend

# Création et activation de l'environnement virtuel
python3 -m venv venv
source venv/bin/activate  # Sur Windows : venv\Scripts\activate

# Installation des dépendances
pip install django djangorestframework django-cors-headers psycopg2-binary python-decouple pillow
pip freeze > requirements.txt

# Création du projet Django et de l'app 'api'
django-admin startproject sueca_backend .
python manage.py startapp api

# Remplacement du settings.py par un squelette prêt à l'emploi
cat > sueca_backend/settings.py << 'EOF'
import dj_database_url
from decouple import config
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = config('SECRET_KEY', default='dev-key-change-in-production')
DEBUG = config('DEBUG', default=True, cast=bool)
ALLOWED_HOSTS = ['*']

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'corsheaders',
    'api',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'suenca_backend.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'suenca_backend.wsgi.application'

DATABASES = {
    'default': dj_database_url.config(
        default=config('DATABASE_URL', default='sqlite:///db.sqlite3'),
        conn_max_age=600
    )
}

AUTH_PASSWORD_VALIDATORS = []

LANGUAGE_CODE = 'fr-fr'
TIME_ZONE = 'Africa/Douala'
USE_I18N = True
USE_TZ = True

STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / 'staticfiles'
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

CORS_ALLOW_ALL_ORIGINS = True

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.AllowAny',
    ]
}

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
EOF

# Génération d'une clé secrète aléatoire pour .env
echo "SECRET_KEY='$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')'" > .env

# Fichier manage.py (déjà créé par startproject)
# On rend exécutable
chmod +x manage.py

# Premières migrations
python manage.py makemigrations api
python manage.py migrate

deactivate
cd ..

# ---------- FRONTEND ----------
echo "💚 Initialisation du frontend Vue.js..."
cd frontend

# Création du package.json minimaliste
cat > package.json << 'EOF'
{
  "name": "suenca-frontend",
  "private": true,
  "version": "0.0.1",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "vue": "^3.4.0",
    "vue-router": "^4.3.0",
    "pinia": "^2.1.0",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^5.0.0",
    "vite": "^5.4.0",
    "tailwindcss": "^3.4.0",
    "postcss": "^8.4.0",
    "autoprefixer": "^10.4.0"
  }
}
EOF

# Fichier index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SUECA - Start-Up Event's Consulting Agency</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.js"></script>
  </body>
</html>
EOF

# Fichier vite.config.js
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
EOF

# Initialiser Tailwind
npx tailwindcss init -p

# Config Tailwind avec les couleurs personnalisées
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        terre: '#C87A5C',
        or: '#D4AF37',
        noir: '#0D0D0D',
        bleu: '#1E2A78',
        creme: '#FAF7F2',
      },
      fontFamily: {
        heading: ['Poppins', 'sans-serif'],
        body: ['Inter', 'sans-serif'],
        accent: ['Lora', 'serif'],
      },
    },
  },
  plugins: [],
};
EOF

# Fichier CSS principal
cat > src/assets/styles/main.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800;900&family=Inter:wght@300;400;500;600&family=Lora:ital,wght@0,400;0,600;1,400&display=swap');

body {
  font-family: 'Inter', sans-serif;
  background-color: #FAF7F2;
}
EOF

# main.js
cat > src/main.js << 'EOF'
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import router from './router'
import App from './App.vue'
import './assets/styles/main.css'

const app = createApp(App)
app.use(createPinia())
app.use(router)
app.mount('#app')
EOF

# App.vue squelette
cat > src/App.vue << 'EOF'
<template>
  <div>
    <Navbar />
    <router-view />
    <Footer />
    <WhatsAppButton />
  </div>
</template>

<script setup>
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'
import WhatsAppButton from '@/components/WhatsAppButton.vue'
</script>
EOF

# Router index.js
cat > src/router/index.js << 'EOF'
import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue'
import About from '@/views/About.vue'
import Services from '@/views/Services.vue'
import Portfolio from '@/views/Portfolio.vue'
import Contact from '@/views/Contact.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: Home },
    { path: '/about', component: About },
    { path: '/services', component: Services },
    { path: '/portfolio', component: Portfolio },
    { path: '/contact', component: Contact },
  ],
});

export default router;
EOF

# Store Pinia
cat > src/stores/main.js << 'EOF'
import { defineStore } from 'pinia';
import api from '@/api';

export const useMainStore = defineStore('main', {
  state: () => ({
    services: [],
    projects: [],
    testimonials: [],
  }),
  actions: {
    async fetchServices() {
      const { data } = await api.get('/services/');
      this.services = data;
    },
    async fetchProjects() {
      const { data } = await api.get('/projects/');
      this.projects = data;
    },
    async fetchTestimonials() {
      const { data } = await api.get('/testimonials/');
      this.testimonials = data;
    },
  },
});
EOF

# Instance Axios
cat > src/api/index.js << 'EOF'
import axios from 'axios';

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://localhost:8000/api/v1',
  timeout: 10000,
});

export default api;
EOF

# Fichiers .env
echo "VITE_API_URL=http://localhost:8000/api/v1" > .env

# Installation des dépendances
npm install

cd ..

echo ""
echo "✅ Environnement initialisé avec succès !"
echo "🚀 Prochaines étapes :"
echo "   1. cd backend && source venv/bin/activate && python manage.py runserver"
echo "   2. cd frontend && npm run dev"