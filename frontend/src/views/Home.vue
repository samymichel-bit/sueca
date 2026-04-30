<template>
  <div>
    <!-- Hero Futuriste -->
    <section class="relative hero-futur text-white py-48 text-center mt-16 overflow-hidden">
      <HeroParticles />
      <!-- Grille décorative -->
      <div class="absolute inset-0 opacity-10 pointer-events-none">
        <div class="absolute inset-0" style="background-image: linear-gradient(rgba(0,240,255,0.1) 1px, transparent 1px), linear-gradient(90deg, rgba(0,240,255,0.1) 1px, transparent 1px); background-size: 50px 50px;"></div>
      </div>
      <div class="relative z-10 container mx-auto px-4">
        <h1 class="text-5xl md:text-7xl lg:text-8xl font-heading font-black tracking-tight leading-tight mb-6">
          Éclairez votre 
          <span class="bg-clip-text text-transparent bg-gradient-to-r from-cyan via-purple to-pink gradient-text-neon">vision</span>
        </h1>
        <p class="mt-6 text-lg md:text-xl text-gray-400 max-w-2xl mx-auto font-light">Consulting • Coaching • Événementiel — une agency, un écosystème.</p>
        <div class="mt-12 flex gap-6 justify-center flex-wrap">
          <router-link to="/services" class="btn-futur-primary">
            Découvrir nos services
          </router-link>
          <router-link to="/contact" class="btn-futur-outline">
            Prendre rendez-vous
          </router-link>
        </div>
      </div>
    </section>

    <!-- Services avec cartes futuristes -->
    <section class="py-24 px-4 container mx-auto bg-dark">
      <h2 class="text-4xl md:text-5xl font-heading font-bold text-white mb-4 text-center">
        Notre <span class="gradient-text-neon">expertise</span>
      </h2>
      <p class="text-gray-400 text-center mb-16 max-w-xl mx-auto">Des solutions innovantes pour propulser votre entreprise vers le futur.</p>
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <ServiceCard v-for="s in store.services" :key="s.id" :service="s" />
      </div>
    </section>

    <!-- Témoignages -->
    <section class="py-24 px-4 bg-darkSecondary/50 relative overflow-hidden">
      <!-- Decorations -->
      <div class="absolute top-0 left-0 w-64 h-64 bg-cyan/5 rounded-full blur-3xl"></div>
      <div class="absolute bottom-0 right-0 w-64 h-64 bg-purple/5 rounded-full blur-3xl"></div>
      
      <div class="container mx-auto relative z-10">
        <h2 class="text-4xl md:text-5xl font-heading font-bold text-white mb-4 text-center">
          Ils nous font <span class="gradient-text-neon">confiance</span>
        </h2>
        <p class="text-gray-400 text-center mb-16 max-w-xl mx-auto">Découvrez ce que nos clients disent de notre collaboration.</p>
        <div class="grid md:grid-cols-2 gap-8">
          <TestimonialCard v-for="t in store.testimonials" :key="t.id" :testimonial="t" />
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useMainStore } from '@/stores/main';
import ServiceCard from '@/components/ServiceCard.vue';
import TestimonialCard from '@/components/TestimonialCard.vue';
import HeroParticles from '@/components/HeroParticles.vue';

const store = useMainStore();

onMounted(() => {
  store.fetchServices();
  store.fetchTestimonials();
});
</script>
