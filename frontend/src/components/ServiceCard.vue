<template>
<div class="group relative p-6 sm:p-8 bg-creme/5 backdrop-blur-md border border-or/20 shadow-glass rounded-2xl overflow-hidden hover:shadow-glass-hover hover:-translate-y-2 transition-all duration-500 hover:border-or/40">
    <!-- Decorative glow -->
    <div class="absolute -top-16 -right-16 w-32 h-32 md:w-40 md:h-40 bg-or/5 rounded-full blur-xl group-hover:bg-or/15 transition-all duration-500 -translate-x-2 -translate-y-2"></div>
    
    <!-- Icon with glow -->
    <div class="relative mb-4 sm:mb-6 w-16 h-16 flex items-center justify-center rounded-2xl bg-creme/20 border-2 border-or/30 group-hover:border-or/50 shadow-or-glow/50 hover:shadow-or-glow transition-all duration-300 mx-auto">
      <span class="text-2xl sm:text-3xl font-accent">{{ service.icon }}</span>
    </div>
    
    <!-- Title -->
    <h3 class="text-xl sm:text-2xl lg:text-2xl font-heading font-bold text-creme mb-3 sm:mb-4 group-hover:text-or transition-all duration-300 leading-tight">
      {{ service.title }}
    </h3>
    
    <!-- Description -->
    <p class="text-creme/80 font-body text-sm leading-relaxed mb-6 text-center sm:text-left">
      {{ service.description?.slice(0, 120) }}...
    </p>
    
    <!-- Learn more link -->
    <router-link :to="`/services/${service.id}`" class="inline-flex items-center justify-center mt-4 sm:mt-6 text-or/90 hover:text-or text-sm font-medium group-hover:text-creme bg-or/10 hover:bg-or/20 px-6 py-3 rounded-xl border border-or/30 hover:border-or/50 transition-all duration-300 shadow-md hover:shadow-or-glow min-h-[44px]">
      En savoir plus
      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-2 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
      </svg>
    </router-link>
  </div>
</template>

<script setup>
defineProps({ service: Object })
</script>
