<template>
  <div class="pt-24 pb-20 bg-noir min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-3xl sm:text-4xl md:text-5xl font-heading font-bold text-creme mb-6 leading-tight">
          Contactez-<span class="bg-clip-text text-transparent bg-gradient-to-r from-or via-terre to-bleu">nous</span>
        </h1>
        <p class="text-creme/80 font-body max-w-2xl mx-auto text-base sm:text-lg leading-relaxed">
          Prêt à transformer votre vision en réalité? Contactez-nous dès maintenant.
        </p>
      </div>
      
      <!-- Contact Form -->
      <div class="max-w-2xl mx-auto">
        <form @submit.prevent="submit">
          <div class="space-y-5 sm:space-y-6">
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">Nom complet <span class="text-or">*</span></label>
              <input v-model="form.name" required 
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                placeholder="ex. Aminata Traoré" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">Email <span class="text-or">*</span></label>
              <input v-model="form.email" type="email" required
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                placeholder="ex. amina@entreprise.cm" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">Téléphone</label>
              <input v-model="form.phone" type="tel"
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-bleu focus:ring-2 focus:ring-bleu/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                placeholder="ex. +237 6 00 00 00 00" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">Entreprise / Projet</label>
              <input v-model="form.company" 
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-bleu focus:ring-2 focus:ring-bleu/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                placeholder="ex. Start-up Ntchisi" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">Service souhaité</label>
              <select v-model="form.service" class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm appearance-none cursor-pointer">
                <option value="">Sélectionner un service</option>
                <option v-for="s in store.services" :key="s.id" :value="s.id">
                  {{ s.title }}
                </option>
              </select>
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">Message <span class="text-or">*</span></label>
              <textarea v-model="form.message" rows="5" required
                class="w-full min-h-[120px] px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm resize-vertical placeholder-creme/50"
                placeholder="Décrivez votre projet, vos besoins et comment nous pouvons vous accompagner..."></textarea>
            </div>
            <button type="submit" 
              class="w-full bg-gradient-to-r from-or to-terre hover:from-terre hover:to-or text-noir font-bold py-4 px-8 rounded-2xl shadow-or-glow hover:shadow-2xl active:scale-[0.98] transition-all duration-300 uppercase tracking-wide text-lg font-heading min-h-[52px]">
              Envoyer le message
            </button>
          </div>
        </form>
        
        <!-- Contact Info -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-12">
          <div class="bg-creme/5 backdrop-blur-md border border-or/20 p-8 rounded-2xl shadow-glass text-center hover:shadow-glass-hover transition-all hover:-translate-y-1">
            <div class="text-4xl mb-4 mx-auto w-16 h-16 rounded-2xl bg-or/20 flex items-center justify-center">📞</div>
            <h3 class="text-xl font-heading font-bold text-creme mb-3">Téléphone</h3>
            <p class="text-or text-lg font-medium">+237 652 11 72 45</p>
          </div>
          <div class="bg-creme/5 backdrop-blur-md border border-bleu/20 p-8 rounded-2xl shadow-glass text-center hover:shadow-glass-hover transition-all hover:-translate-y-1">
            <div class="text-4xl mb-4 mx-auto w-16 h-16 rounded-2xl bg-bleu/20 flex items-center justify-center">📍</div>
            <h3 class="text-xl font-heading font-bold text-creme mb-3">Localisation</h3>
            <p class="text-bleu text-lg font-medium">Douala & Yaoundé, Cameroun</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive, onMounted } from 'vue';
import { useMainStore } from '@/stores/main';
import api from '@/api';

const store = useMainStore();
const form = reactive({ 
  name: '', 
  email: '', 
  phone: '', 
  company: '', 
  service: null, 
  message: '' 
});

onMounted(() => {
  store.fetchServices();
});

const submit = async () => {
  try {
    await api.post('/contacts/', form);
    alert('Message envoyé avec succès! ✦');
    Object.keys(form).forEach(key => {
      form[key] = key === 'service' ? null : '';
    });
  } catch (error) {
    alert('Erreur lors de l\'envoi. Veuillez réessayer.');
  }
};
</script>