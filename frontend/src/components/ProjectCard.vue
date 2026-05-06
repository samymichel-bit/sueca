<template>
  <div class="group relative overflow-hidden bg-noir rounded-2xl shadow-glass hover:shadow-glass-hover transition-all duration-500 border border-blanc/10 hover:border-menthe/30">
    <!-- Image with overlay -->
    <div class="relative h-48 overflow-hidden">
      <img :src="mediaUrl(project.cover_image)" :alt="project.title" loading="lazy" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
      <div class="absolute inset-0 bg-gradient-to-t from-noir via-noir/80 to-transparent opacity-80 backdrop-blur-sm"></div>
      
      <!-- View project button -->
      <div class="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
        <router-link :to="`/portfolio/${project.id}`" class="w-14 h-14 rounded-2xl bg-blanc/20 border-2 border-menthe/30 flex items-center justify-center hover:bg-menthe hover:text-noir shadow-glass hover:shadow-menthe transition-all duration-300 min-h-[44px]">
          <svg class="w-6 h-6 text-menthe hover:text-noir" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
          </svg>
        </router-link>
      </div>
    </div>
    
    <!-- Content -->
    <div class="p-6">
      <h3 class="font-heading font-bold text-blanc text-lg sm:text-xl mb-3 group-hover:text-menthe transition-colors duration-300 leading-tight">{{ project.title }}</h3>
      <p class="text-blanc/80 font-body text-sm leading-relaxed">{{ project.description?.slice(0, 80) }}...</p>
    </div>
  </div>
</template>

<script setup>
import { mediaUrl } from '@/utils/media'
defineProps({ project: Object })
</script>