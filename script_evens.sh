#!/bin/bash

# 🚀 Script de création de l'arborescence SUECA Website
# À exécuter dans un dossier vide (ex: sueca-website)

echo "🌱 Création de l'arborescence du projet SUECA..."

# ----- BACKEND DJANGO -----
mkdir -p backend/sueca_backend
touch backend/sueca_backend/__init__.py
touch backend/sueca_backend/settings.py
touch backend/sueca_backend/urls.py
touch backend/sueca_backend/wsgi.py
touch backend/sueca_backend/asgi.py

mkdir -p backend/api
touch backend/api/__init__.py
touch backend/api/models.py
touch backend/api/admin.py
touch backend/api/serializers.py
touch backend/api/views.py
touch backend/api/urls.py
touch backend/api/tests.py
touch backend/api/utils.py

touch backend/manage.py
touch backend/requirements.txt
touch backend/.env

# ----- FRONTEND VUE.JS -----
mkdir -p frontend/public
touch frontend/public/favicon.ico

mkdir -p frontend/src/assets/styles
touch frontend/src/assets/styles/main.css

mkdir -p frontend/src/components
touch frontend/src/components/Navbar.vue
touch frontend/src/components/Footer.vue
touch frontend/src/components/WhatsAppButton.vue
touch frontend/src/components/ServiceCard.vue
touch frontend/src/components/ProjectCard.vue
touch frontend/src/components/TestimonialCard.vue

mkdir -p frontend/src/views
touch frontend/src/views/Home.vue
touch frontend/src/views/About.vue
touch frontend/src/views/Services.vue
touch frontend/src/views/ServiceDetail.vue
touch frontend/src/views/Portfolio.vue
touch frontend/src/views/ProjectDetail.vue
touch frontend/src/views/Contact.vue

mkdir -p frontend/src/router
touch frontend/src/router/index.js

mkdir -p frontend/src/stores
touch frontend/src/stores/main.js

mkdir -p frontend/src/api
touch frontend/src/api/index.js

touch frontend/src/App.vue
touch frontend/src/main.js
touch frontend/index.html
touch frontend/tailwind.config.js
touch frontend/vite.config.js
touch frontend/package.json
touch frontend/.env

# ----- RACINE -----
touch .gitignore
touch README.md

echo "✅ Arborescence créée avec succès !"
echo "📂 Tu peux maintenant ouvrir le dossier dans VS Code : code ."