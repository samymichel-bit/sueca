<template>
  <div class="pt-32 pb-16 bg-dark min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-4xl md:text-6xl font-heading font-bold text-white mb-6">
          Port<span class="gradient-text-neon">folio</span>
        </h1>
        <p class="text-gray-400 max-w-2xl mx-auto text-lg">
          Découvrez nos réalisations et projets.
        </p>
      </div>
      
      <!-- Projects Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <ProjectCard v-for="p in store.projects" :key="p.id" :project="p" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useMainStore } from '@/stores/main';
import ProjectCard from '@/components/ProjectCard.vue';

const store = useMainStore();
onMounted(() => store.fetchProjects());
</script>
