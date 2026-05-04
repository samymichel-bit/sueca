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
      

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8">
        <div v-for="p in store.projects" :key="p.id" class="group">
          <ProjectCard :project="p" @click="openLightbox(p.images || [p.cover_image], 0, p.title)" />
        </div>
      </div>
    </div>
    
    <Lightbox v-model="lightboxOpen" :images="lightboxImages" :initial-index="lightboxInitialIndex" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useMainStore } from '@/stores/main';
import ProjectCard from '@/components/ProjectCard.vue';
import Lightbox from '@/components/Lightbox.vue';

const store = useMainStore();
const lightboxOpen = ref(false)
const lightboxImages = ref([])
const lightboxInitialIndex = ref(0)

const openLightbox = (images, index, alt) => {
  lightboxImages.value = images
  lightboxInitialIndex.value = index
  lightboxOpen.value = true
}

onMounted(() => store.fetchProjects());
</script>
