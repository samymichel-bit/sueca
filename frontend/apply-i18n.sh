#!/bin/bash
# 🎯 Remplacement automatique des textes en dur par $t() – SUECA i18n

echo "🔄 Remplacement des textes en dur par $t()…"

# ============================
# Home.vue
# ============================
sed -i \
  -e 's/"Notre expertise"/"\$t('"'"'home.servicesTitle'"'"')"/g' \
  -e 's/"Une offre complète pour accompagner votre croissance."/"\$t('"'"'services.sub'"'"')"/g' \
  -e 's/"Nos réalisations"/"\$t('"'"'home.portfolioTitle'"'"')"/g' \
  -e 's/"Voir tout le portfolio"/"\$t('"'"'home.portfolioCta'"'"')"/g' \
  -e 's/"Ils nous font confiance"/"\$t('"'"'home.testimonialsTitle'"'"')"/g' \
  -e 's/"Prêt à booster votre projet ?"/"\$t('"'"'home.ctaTitle'"'"')"/g' \
  -e 's/"Prendre rendez-vous"/"\$t('"'"'home.ctaBtn'"'"')"/g' \
  src/views/Home.vue

# ============================
# About.vue
# ============================
sed -i \
  -e 's/"Découvrez l'\''histoire et la mission de SUECA."/"\$t('"'"'about.sub'"'"')"/g' \
  -e 's/"Notre Vision"/"\$t('"'"'about.vision'"'"')"/g' \
  -e 's/"Faciliter l'\''émergence.*$/"\$t('"'"'about.visionText'"'"')"/g' \
  -e 's/"Notre Mission"/"\$t('"'"'about.mission'"'"')"/g' \
  -e 's/"Éclairer les projets.*$/"\$t('"'"'about.missionText'"'"')"/g' \
  -e 's/"Nos Valeurs"/"\$t('"'"'about.values'"'"')"/g' \
  -e 's/"Innovation"/"\$t('"'"'about.v1'"'"')"/g' \
  -e 's/"Excellence"/"\$t('"'"'about.v2'"'"')"/g' \
  -e 's/"Créativité"/"\$t('"'"'about.v3'"'"')"/g' \
  -e 's/"Prêt à donner vie à votre projet ?"/"\$t('"'"'home.ctaTitle'"'"')"/g' \
  -e 's/"Prendre rendez-vous"/"\$t('"'"'home.ctaBtn'"'"')"/g' \
  src/views/About.vue

# ============================
# HeroSection.vue
# ============================
sed -i \
  -e 's/"Agence de conseil & événementiel"/"\$t('"'"'hero.tagline'"'"')"/g' \
  -e 's/"Éclairez votre"/"\$t('"'"'hero.headline_1'"'"')"/g' \
  -e 's/"vision."/"\$t('"'"'hero.headline_2'"'"')"/g' \
  -e 's/"Nous accompagnons les startups.*$/"\$t('"'"'hero.sub'"'"')"/g' \
  -e 's/"Découvrir nos services"/"\$t('"'"'hero.cta1'"'"')"/g' \
  -e 's/"Prendre rendez-vous"/"\$t('"'"'hero.cta2'"'"')"/g' \
  src/components/HeroSection.vue

# ============================
# Contact.vue
# ============================
sed -i \
  -e 's/"Contactez-nous"/"\$t('"'"'contact.title'"'"')"/g' \
  -e 's/"Prêt à transformer votre vision.*$/"\$t('"'"'contact.sub'"'"')"/g' \
  -e 's/"Nom complet"/"\$t('"'"'contact.name'"'"')"/g' \
  -e 's/"ex. Aminata Traoré"/"\$t('"'"'contact.namePH'"'"')"/g' \
  -e 's/"Email"/"\$t('"'"'contact.email'"'"')"/g' \
  -e 's/"ex. amina@entreprise.cm"/"\$t('"'"'contact.emailPH'"'"')"/g' \
  -e 's/"Téléphone"/"\$t('"'"'contact.phone'"'"')"/g' \
  -e 's/"ex. \+237 6 00 00 00 00"/"\$t('"'"'contact.phonePH'"'"')"/g' \
  -e 's/"Entreprise \/ Projet"/"\$t('"'"'contact.company'"'"')"/g' \
  -e 's/"ex. Start-up Ntchisi"/"\$t('"'"'contact.companyPH'"'"')"/g' \
  -e 's/"Service souhaité"/"\$t('"'"'contact.service'"'"')"/g' \
  -e 's/"Sélectionner un service"/"\$t('"'"'contact.servicePH'"'"')"/g' \
  -e 's/"Message"/"\$t('"'"'contact.message'"'"')"/g' \
  -e 's/"Décrivez votre projet.*$/"\$t('"'"'contact.messagePH'"'"')"/g' \
  -e 's/"Envoyer le message"/"\$t('"'"'contact.send'"'"')"/g' \
  -e 's/"Téléphone"/"\$t('"'"'contact.phone_label'"'"')"/g' \
  -e 's/"\+237 652 11 72 45"/"\$t('"'"'contact.phone_val'"'"')"/g' \
  -e 's/"Localisation"/"\$t('"'"'contact.location'"'"')"/g' \
  -e 's/"Douala & Yaoundé, Cameroun"/"\$t('"'"'contact.location_val'"'"')"/g' \
  src/views/Contact.vue

# ============================
# Services.vue
# ============================
sed -i \
  -e 's/"Nos services"/"\$t('"'"'services.title'"'"')"/g' \
  -e 's/"Une offre complète pour accompagner votre croissance."/"\$t('"'"'services.sub'"'"')"/g' \
  src/views/Services.vue

# ============================
# Navbar.vue (liens déjà en $t, mais on vérifie les labels)
# ============================
# Les liens utilisent déjà $t(link.label), donc pas besoin de modification.

# ============================
# Footer.vue (rapide)
# ============================
sed -i \
  -e 's/"SUECA"/"\$t('"'"'footer.tagline'"'"')"/g' \
  -e 's/"Start-Up Event\\'"'"'s Consulting Agency.*$/"\$t('"'"'footer.tagline'"'"')"/g' \
  -e 's/"Contact"/"\$t('"'"'footer.contact'"'"')"/g' \
  -e 's/"\+237 652 11 72 45"/"\$t('"'"'contact.phone_val'"'"')"/g' \
  -e 's/"litse83@gmail.com"/"\$t('"'"'contact.email_val'"'"')"/g' \
  -e 's/"Adresse"/"\$t('"'"'footer.address'"'"')"/g' \
  -e 's/"Ndogbati 1er, Douala"/"\$t('"'"'footer.address_douala'"'"')"/g' \
  -e 's/"Essos, Yaoundé"/"\$t('"'"'footer.address_yaounde'"'"')"/g' \
  src/components/Footer.vue

echo "✅ Remplacement terminé. Vérifie les fichiers et lance 'npm run dev'."