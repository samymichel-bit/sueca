<template>
<div class="pt-24 pb-20 bg-noir min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-3xl sm:text-4xl md:text-5xl font-heading font-bold text-creme mb-6 leading-tight">
          {{ $t('services.title') }}
        </h1>
        <p class="text-creme/80 font-body max-w-2xl mx-auto text-base sm:text-lg leading-relaxed">
          {{ $t('services.sub') }}
        </p>
      </div>
      
      <!-- Services Grid -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 lg:gap-12 max-w-7xl mx-auto">
        <div v-for="s in store.services" :key="s.id" class="max-w-md mx-auto">
          <ServiceCard :service="s" />
        </div>
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
