import { createI18n } from 'vue-i18n'

const messages = {
  fr: {
    nav: { home:'Accueil', about:'À propos', services:'Services', portfolio:'Portfolio', experts:'Experts', contact:'Contact' },
    hero: { tagline:'Agence de conseil & événementiel', headline_1:'Éclairez votre', headline_2:'vision.', sub:"Nous accompagnons les startups et entreprises dans leur développement commercial, leurs événements et leur mise en relation avec les bons experts.", cta1:'Découvrir nos services', cta2:'Prendre rendez-vous' },
    home: { servicesTitle:'Notre expertise', portfolioTitle:'Nos réalisations', portfolioCta:'Voir tout le portfolio', testimonialsTitle:'Ils nous font confiance', ctaTitle:'Prêt à booster votre projet ?', ctaBtn:'Prendre rendez-vous', stats:{ years:"ans d'expérience", projects:'projets réalisés', clients:'clients satisfaits', experts:'experts mobilisés' } },
    services: { title:'Nos services', sub:'Une offre complète pour accompagner votre croissance.', detail:'En savoir plus' },
    portfolio: { title:'Portfolio', sub:'Découvrez nos réalisations et projets.', all:'Tous' },
    experts: { title:'Nos experts', sub:"Une équipe d'excellence dédiée à transformer vos ambitions en succès.", team:"L'équipe", talents:'Talents repérés' },
    about: { title:'À propos', sub:'Depuis 2017, SUECA accompagne les entrepreneurs camerounais.', vision:'Notre vision', mission:'Notre mission', values:'Nos valeurs', visionText:"Devenir l'agence de référence en Afrique centrale pour l'accompagnement des startups.", missionText:'Éclairez vos événements et projets avec une vision innovante.', v1:'Innovation', v2:'Excellence', v3:'Créativité' },
    contact: { title:'Contactez-nous', sub:'Prêt à transformer votre vision en réalité ? Écrivez-nous.', name:'Nom complet', namePH:'ex. Aminata Traoré', email:'Adresse e-mail', emailPH:'ex. amina@entreprise.cm', phone:'Téléphone', phonePH:'ex. +237 6 00 00 00 00', company:'Entreprise / Projet', companyPH:'ex. Start-up Ntchisi', service:'Service souhaité', servicePH:'Sélectionner un service', message:'Message', messagePH:'Décrivez votre projet et vos besoins...', send:'Envoyer le message', sending:'Envoi en cours…', success:'✓ Message envoyé ! Nous vous répondons sous 24h.', error:"✗ Erreur lors de l'envoi. Veuillez réessayer.", phone_label:'Téléphone', phone_val:'+237 652 11 72 45', location:'Localisation', location_val:'Douala & Yaoundé, Cameroun', email_label:'E-mail', email_val:'litse83@gmail.com' },
    footer: { tagline:"Start-Up Event's Consulting Agency — depuis 2017.", links:'Liens rapides', contact:'Contact', address:'Adresse', rights:'© {year} SUECA. Tous droits réservés.' },
    common: { loading:'Chargement…', error:'Erreur de chargement.', retry:'Réessayer', readMore:'En savoir plus', seeAll:'Voir tout' },
  },
  en: {
    nav: { home:'Home', about:'About', services:'Services', portfolio:'Portfolio', experts:'Experts', contact:'Contact' },
    hero: { tagline:'Consulting & Event Agency', headline_1:'Illuminate your', headline_2:'vision.', sub:'We support startups and businesses in their commercial development, events and matchmaking with the right experts.', cta1:'Discover our services', cta2:'Book a meeting' },
    home: { servicesTitle:'Our expertise', portfolioTitle:'Our work', portfolioCta:'See full portfolio', testimonialsTitle:'They trust us', ctaTitle:'Ready to boost your project?', ctaBtn:'Book a meeting', stats:{ years:'years of experience', projects:'projects completed', clients:'satisfied clients', experts:'experts mobilised' } },
    services: { title:'Our Services', sub:'A complete offer to support your growth.', detail:'Learn more' },
    portfolio: { title:'Portfolio', sub:'Discover our work and projects.', all:'All' },
    experts: { title:'Our Experts', sub:'A team of excellence dedicated to turning your ambitions into success.', team:'The Team', talents:'Spotted Talents' },
    about: { title:'About us', sub:'Since 2017, SUECA has been supporting Cameroonian entrepreneurs.', vision:'Our Vision', mission:'Our Mission', values:'Our Values', visionText:'To become the reference agency in Central Africa for startup support.', missionText:'Illuminate your events and projects with an innovative vision.', v1:'Innovation', v2:'Excellence', v3:'Creativity' },
    contact: { title:'Contact us', sub:'Ready to turn your vision into reality? Write to us.', name:'Full name', namePH:'e.g. Aminata Traoré', email:'Email address', emailPH:'e.g. amina@company.com', phone:'Phone number', phonePH:'e.g. +237 6 00 00 00 00', company:'Company / Project', companyPH:'e.g. My Startup', service:'Desired service', servicePH:'Select a service', message:'Message', messagePH:'Describe your project and needs…', send:'Send message', sending:'Sending…', success:"✓ Message sent! We'll reply within 24h.", error:'✗ Error sending. Please try again.', phone_label:'Phone', phone_val:'+237 652 11 72 45', location:'Location', location_val:'Douala & Yaoundé, Cameroon', email_label:'Email', email_val:'litse83@gmail.com' },
    footer: { tagline:"Start-Up Event's Consulting Agency — since 2017.", links:'Quick links', contact:'Contact', address:'Address', rights:'© {year} SUECA. All rights reserved.' },
    common: { loading:'Loading…', error:'Loading error.', retry:'Retry', readMore:'Learn more', seeAll:'See all' },
  },
}

export default createI18n({
  legacy: false,
  locale: localStorage.getItem('sueca_lang') || 'fr',
  fallbackLocale: 'fr',
  messages,
})
