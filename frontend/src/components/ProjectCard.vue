<template>
  <div class="card-futur group overflow-hidden">
    <!-- Image with overlay -->
    <div class="relative h-48 overflow-hidden">
      <img :src="`http://localhost:8000${project.cover_image}`" :alt="project.title" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
      <div class="absolute inset-0 bg-gradient-to-t from-dark via-dark/50 to-transparent opacity-60"></div>
      
      <!-- View project button -->
      <div class="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
        <router-link :to="`/portfolio/${project.id}`" class="w-12 h-12 rounded-full bg-cyan/20 border border-cyan flex items-center justify-center hover:bg-cyan hover:text-dark transition-all duration-300">
          <svg class="w-5 h-5 text-cyan group-hover:text-dark" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
          </svg>
        </router-link>
      </div>
    </div>
    
    <!-- Content -->
    <div class="p-6">
      <h3 class="font-bold text-white text-lg mb-2 group-hover:text-cyan transition-colors duration-300">{{ project.title }}</h3>
      <p class="text-gray-400 text-sm">{{ project.description?.slice(0, 80) }}...</p>
    </div>
  </div>
</template>

<script setup>
defineProps({ project: Object })
</script>
