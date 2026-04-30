<template>
  <div class="card-futur group p-8 relative overflow-hidden">
    <!-- Decorative glow -->
    <div class="absolute -top-20 -right-20 w-40 h-40 bg-cyan/10 rounded-full blur-3xl group-hover:bg-cyan/20 transition-all duration-500"></div>
    
    <!-- Icon with glow -->
    <div class="relative mb-6 w-16 h-16 flex items-center justify-center rounded-xl bg-gradient-to-br from-cyan/20 to-purple/20 border border-cyan/30 group-hover:border-cyan/60 transition-all duration-300">
      <span class="text-3xl">{{ service.icon }}</span>
    </div>
    
    <!-- Title -->
    <h3 class="text-2xl font-heading font-bold text-white mb-3 group-hover:text-cyan transition-colors duration-300">
      {{ service.title }}
    </h3>
    
    <!-- Description -->
    <p class="text-gray-400 text-sm leading-relaxed">
      {{ service.description?.slice(0, 120) }}...
    </p>
    
    <!-- Learn more link -->
    <router-link :to="`/services/${service.id}`" class="inline-flex items-center mt-4 text-cyan text-sm font-medium group-hover:text-white transition-colors duration-300">
      En savoir plus
      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
      </svg>
    </router-link>
  </div>
</template>

<script setup>
defineProps({ service: Object })
</script>
