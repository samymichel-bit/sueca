<template>
  <div class="pt-24 pb-20 bg-noir min-h-screen">
    <div class="container mx-auto px-4">
      <div class="text-center mb-16">
        <h1 class="text-3xl sm:text-4xl md:text-5xl font-heading font-bold text-creme mb-6 leading-tight">
          {{ $t('contact.title') }}
        </h1>
        <p class="text-creme/80 font-body max-w-2xl mx-auto text-base sm:text-lg leading-relaxed">
          {{ $t('contact.sub') }}
        </p>
      </div>

      <div class="max-w-2xl mx-auto">
        <form @submit.prevent="submit">
          <div class="space-y-5 sm:space-y-6">
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">
                {{ $t('contact.name') }} <span class="text-or">*</span>
              </label>
              <input v-model="form.name" required
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                :placeholder="$t('contact.namePH')" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">
                {{ $t('contact.email') }} <span class="text-or">*</span>
              </label>
              <input v-model="form.email" type="email" required
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                :placeholder="$t('contact.emailPH')" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">
                {{ $t('contact.phone') }}
              </label>
              <input v-model="form.phone" type="tel"
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-bleu focus:ring-2 focus:ring-bleu/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                :placeholder="$t('contact.phonePH')" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">
                {{ $t('contact.company') }}
              </label>
              <input v-model="form.company"
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-bleu focus:ring-2 focus:ring-bleu/30 focus:outline-none transition-all shadow-sm placeholder-creme/50"
                :placeholder="$t('contact.companyPH')" />
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">
                {{ $t('contact.service') }}
              </label>
              <select v-model="form.service"
                class="w-full h-14 px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm appearance-none cursor-pointer">
                <option value="">{{ $t('contact.servicePH') }}</option>
                <option v-for="s in store.services" :key="s.id" :value="s.id">{{ s.title }}</option>
              </select>
            </div>
            <div>
              <label class="block text-creme/80 font-medium mb-3 font-body text-sm uppercase tracking-wide">
                {{ $t('contact.message') }} <span class="text-or">*</span>
              </label>
              <textarea v-model="form.message" rows="5" required
                class="w-full min-h-[120px] px-5 py-4 bg-creme/5 border border-creme/20 rounded-2xl text-creme font-body focus:border-or focus:ring-2 focus:ring-or/30 focus:outline-none transition-all shadow-sm resize-vertical placeholder-creme/50"
                :placeholder="$t('contact.messagePH')"></textarea>
            </div>
            <button type="submit"
              class="w-full bg-gradient-to-r from-or to-terre hover:from-terre hover:to-or text-noir font-bold py-4 px-8 rounded-2xl shadow-or-glow hover:shadow-2xl active:scale-[0.98] transition-all duration-300 uppercase tracking-wide text-lg font-heading min-h-[52px]">
              {{ $t('contact.send') }}
            </button>
          </div>
        </form>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-12">
          <div class="bg-creme/5 backdrop-blur-md border border-or/20 p-8 rounded-2xl shadow-glass text-center hover:shadow-glass-hover transition-all hover:-translate-y-1">
            <div class="text-4xl mb-4 mx-auto w-16 h-16 rounded-2xl bg-or/20 flex items-center justify-center">📞</div>
            <h3 class="text-xl font-heading font-bold text-creme mb-3">{{ $t('contact.phone_label') }}</h3>
            <p class="text-or text-lg font-medium">{{ $t('contact.phone_val') }}</p>
          </div>
          <div class="bg-creme/5 backdrop-blur-md border border-bleu/20 p-8 rounded-2xl shadow-glass text-center hover:shadow-glass-hover transition-all hover:-translate-y-1">
            <div class="text-4xl mb-4 mx-auto w-16 h-16 rounded-2xl bg-bleu/20 flex items-center justify-center">📍</div>
            <h3 class="text-xl font-heading font-bold text-creme mb-3">{{ $t('contact.location') }}</h3>
            <p class="text-bleu text-lg font-medium">{{ $t('contact.location_val') }}</p>
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

onMounted(async () => {
  try {
    await store.fetchServices();
  } catch (e) {
    console.warn('Impossible de charger les services.');
  }
});

const submit = async () => {
  try {
    await api.post('/contacts/', form);
    alert('Message envoyé avec succès !');
    Object.keys(form).forEach(key => form[key] = key === 'service' ? null : '');
  } catch (error) {
    alert("Erreur lors de l'envoi. Veuillez réessayer.");
  }
};
</script>