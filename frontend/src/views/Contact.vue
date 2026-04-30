<template>
  <div class="pt-32 pb-16 bg-dark min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-4xl md:text-6xl font-heading font-bold text-white mb-6">
         Contactez-<span class="gradient-text-neon">nous</span>
        </h1>
        <p class="text-gray-400 max-w-2xl mx-auto text-lg">
          Prêt à illuminer votre projet? Parlons-en!
        </p>
      </div>
      
      <!-- Contact Form -->
      <div class="max-w-2xl mx-auto">
        <form @submit.prevent="submit" class="card-futur p-8 md:p-12 space-y-6">
          <div class="grid md:grid-cols-2 gap-6">
            <div>
              <label class="block text-gray-400 text-sm mb-2">Nom complet</label>
              <input v-model="form.name" 
                class="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:border-cyan focus:outline-none focus:ring-1 focus:ring-cyan/50 transition-all"
                placeholder="John Doe" />
            </div>
            <div>
              <label class="block text-gray-400 text-sm mb-2">Email</label>
              <input v-model="form.email" type="email"
                class="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:border-cyan focus:outline-none focus:ring-1 focus:ring-cyan/50 transition-all"
                placeholder="john@example.com" />
            </div>
          </div>
          
          <div>
            <label class="block text-gray-400 text-sm mb-2">Sujet</label>
            <input v-model="form.subject" 
              class="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:border-purple focus:outline-none focus:ring-1 focus:ring-purple/50 transition-all"
              placeholder="Sujet de votre message" />
          </div>
          
          <div>
            <label class="block text-gray-400 text-sm mb-2">Message</label>
            <textarea v-model="form.message" rows="6"
              class="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:border-pink focus:outline-none focus:ring-1 focus:ring-pink/50 transition-all resize-none"
              placeholder="Décrivez votre projet ou需求..."></textarea>
          </div>
          
          <button type="submit" 
            class="w-full btn-futur-primary">
            Envoyer le message
          </button>
        </form>
        
        <!-- Contact Info -->
        <div class="grid md:grid-cols-2 gap-6 mt-12">
          <div class="glass-futur p-6 text-center">
            <div class="text-3xl mb-3">📞</div>
            <h3 class="text-lg font-bold text-white mb-2">Téléphone</h3>
            <p class="text-cyan">+237 652 11 72 45</p>
          </div>
          <div class="glass-futur p-6 text-center">
            <div class="text-3xl mb-3">📍</div>
            <h3 class="text-lg font-bold text-white mb-2">Localisation</h3>
            <p class="text-purple">Douala & Yaoundé, Cameroun</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue';
import api from '@/api';

const form = reactive({ name: '', email: '', subject: '', message: '' });

const submit = async () => {
  try {
    await api.post('/contacts/', form);
    alert('Message envoyé avec succès! ✦');
    form.name = '';
    form.email = '';
    form.subject = '';
    form.message = '';
  } catch (error) {
    alert('Erreur lors de l\'envoi. Veuillez réessayer.');
  }
};
</script>
