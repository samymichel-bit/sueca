<template>
  <div>
    <!-- Hero Section -->
    <section class="relative bg-gradient-to-br from-noir via-noir to-bleu text-white py-32 text-center mt-16 overflow-hidden min-h-screen flex items-center">
      <HeroParticles />
      <!-- Grille décorative subtile -->
      <div class="absolute inset-0 opacity-10 pointer-events-none">
        <div class="absolute inset-0" style="background-image: linear-gradient(rgba(212,175,55,0.2) 1px, transparent 1px), linear-gradient(90deg, rgba(212,175,55,0.2) 1px, transparent 1px); background-size: 50px 50px;"></div>
      </div>

      <div class="relative z-10 w-full">
        <h1 class="text-4xl md:text-6xl font-heading font-black tracking-tight">
          Éclairez votre 
          <span class="bg-clip-text text-transparent bg-gradient-to-r from-or to-terre">vision</span>
        </h1>
        <p class="mt-6 text-lg md:text-xl text-gray-300 max-w-2xl mx-auto font-light">Consulting • Coaching • Événementiel — une agence, un écosystème.</p>
        <div class="mt-12 flex gap-6 justify-center flex-wrap">
          <router-link to="/services" class="bg-gradient-to-r from-or to-terre text-black px-8 py-4 rounded-full font-bold text-sm md:text-base hover:shadow-xl hover:shadow-or/20 transition transform hover:-translate-y-1">
            Découvrir nos services
          </router-link>
          <router-link to="/contact" class="border-2 border-or text-or px-8 py-4 rounded-full font-bold text-sm md:text-base hover:bg-or hover:text-black transition transform hover:-translate-y-1">
            Prendre rendez-vous
          </router-link>
        </div>
      </div>
    </section>

    <!-- Services -->
    <section class="py-24 px-4 container mx-auto">
      <h2 class="text-4xl font-heading font-bold text-noir mb-12 text-center">
        Notre <span class="bg-clip-text text-transparent bg-gradient-to-r from-or to-terre">expertise</span>
      </h2>
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <ServiceCard v-for="s in store.services" :key="s.id" :service="s" />
      </div>
    </section>

    <!-- Témoignages -->
    <section class="py-24 px-4 bg-creme relative overflow-hidden">
      <div class="container mx-auto relative z-10">
        <h2 class="text-4xl font-heading font-bold text-noir mb-12 text-center">
          Ils nous font <span class="bg-clip-text text-transparent bg-gradient-to-r from-or to-terre">confiance</span>
        </h2>
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