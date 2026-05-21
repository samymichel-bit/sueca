<template>
  <div>
    <HeroSection />

    <!-- Services -->
    <section class="section bg-blanc">
      <div class="container mx-auto">
        <div class="text-center mb-14">
          <h2 class="section-title">{{ $t('home.servicesTitle') }}</h2>
          <div class="divider mx-auto"></div>
          <p class="section-sub mt-4">{{ $t('services.sub') }}</p>
        </div>

        <!-- Loading -->
        <div
          v-if="store.loading.services"
          class="grid md:grid-cols-2 lg:grid-cols-3 gap-8"
        >
          <div v-for="n in 3" :key="n" class="skeleton h-64 rounded-2xl"></div>
        </div>

        <!-- Error -->
        <div v-else-if="store.errors.services" class="text-center py-10">
          <p class="text-gris font-body">{{ $t('common.error') }}</p>
          <button @click="store.fetchServices()" class="btn-ghost mt-3">
            {{ $t('common.retry') }}
          </button>
        </div>

        <!-- Data -->
        <div v-else class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <ServiceCard v-for="s in store.services" :key="s.id" :service="s" />
        </div>
      </div>
    </section>

    <!-- Portfolio -->
    <section class="section bg-grisClair">
      <div class="container mx-auto">
        <div class="text-center mb-14">
          <h2 class="section-title">{{ $t('home.portfolioTitle') }}</h2>
          <div class="divider mx-auto"></div>
        </div>

        <div v-if="store.loading.projects" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div v-for="n in 3" :key="n" class="skeleton aspect-[4/3] rounded-2xl"></div>
        </div>

        <div v-else class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <ProjectCard
            v-for="p in store.projects.slice(0, 3)"
            :key="p.id"
            :project="p"
            @click="openLightbox(p)"
          />
        </div>

        <div class="text-center mt-10">
          <router-link to="/portfolio" class="btn-primary">
            {{ $t('home.portfolioCta') }}
          </router-link>
        </div>
      </div>
    </section>

    <!-- Témoignages -->
    <section class="section bg-blanc">
      <div class="container mx-auto">
        <div class="text-center mb-14">
          <h2 class="section-title">{{ $t('home.testimonialsTitle') }}</h2>
          <div class="divider mx-auto"></div>
        </div>

        <div v-if="store.loading.testimonials" class="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
          <div v-for="n in 2" :key="n" class="skeleton h-48 rounded-2xl"></div>
        </div>

        <div v-else class="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
          <TestimonialCard
            v-for="t in store.testimonials.slice(0, 4)"
            :key="t.id"
            :testimonial="t"
          />
        </div>
      </div>
    </section>

    <!-- CTA -->
    <section class="relative py-24 px-4 bg-noir overflow-hidden text-center">
      <div class="blob w-80 h-80 bg-menthe top-0 -right-20 animate-blob"></div>
      <div class="blob w-60 h-60 bg-rose bottom-0 -left-16 animate-blob-delay"></div>

      <div class="container mx-auto relative z-10">
        <h2 class="text-3xl md:text-5xl font-heading font-bold text-blanc mb-6">
          {{ $t('home.ctaTitle') }}
        </h2>
        <router-link to="/contact" class="btn-menthe text-base">
          {{ $t('home.ctaBtn') }}
        </router-link>
      </div>
    </section>

    <!-- Lightbox -->
    <Lightbox
      v-if="lightboxOpen"
      :images="lightboxImages"
      :initial-index="0"
      @close="lightboxOpen = false"
    />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useMainStore } from '@/stores/main'
import HeroSection from '@/components/HeroSection.vue'
import ServiceCard from '@/components/ServiceCard.vue'
import ProjectCard from '@/components/ProjectCard.vue'
import TestimonialCard from '@/components/TestimonialCard.vue'
import Lightbox from '@/components/Lightbox.vue'

const store = useMainStore()
const lightboxOpen = ref(false)
const lightboxImages = ref([])

function openLightbox(project) {
  if (!project.cover_image) return
  lightboxImages.value = [project.cover_image]
  lightboxOpen.value = true
}

onMounted(() => {
  store.fetchServices()
  store.fetchProjects()
  store.fetchTestimonials()
})
</script>

