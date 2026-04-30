<template>
  <div class="pt-32 pb-16 bg-dark min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-4xl md:text-6xl font-heading font-bold text-white mb-6">
          Nos <span class="gradient-text-neon">services</span>
        </h1>
        <p class="text-gray-400 max-w-2xl mx-auto text-lg">
          Des solutions complètes pour votre succès.
        </p>
      </div>
      
      <!-- Services Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <ServiceCard v-for="s in store.services" :key="s.id" :service="s" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useMainStore } from '@/stores/main';
import ServiceCard from '@/components/ServiceCard.vue';

const store = useMainStore();
onMounted(() => store.fetchServices());
</script>
