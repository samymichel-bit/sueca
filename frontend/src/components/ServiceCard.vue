<template>
  <div class="group relative bg-[#F5F9F7] border border-[#E0E8E3] rounded-2xl p-6 shadow-md hover:shadow-lg hover:shadow-menthe/10 hover:-translate-y-1 transition-all duration-300 cursor-pointer overflow-hidden">
    <!-- Pastille décorative en haut à droite -->
    <div class="absolute -top-4 -right-4 w-16 h-16 bg-menthe/10 rounded-full blur-xl group-hover:bg-menthe/20 transition-colors"></div>

    <!-- Icône -->
    <div class="relative w-14 h-14 flex items-center justify-center rounded-xl bg-menthe/10 text-3xl mb-4 group-hover:scale-110 transition-transform">
      {{ service.icon || '📦' }}
    </div>

    <!-- Titre -->
    <h3 class="text-xl font-heading font-bold text-noir mb-2 group-hover:text-menthe transition-colors">
      {{ service.title }}
    </h3>

    <!-- Description -->
    <p class="text-gris text-sm leading-relaxed mb-5">
      {{ service.description?.slice(0, 100) }}...
    </p>

    <!-- Lien -->
    <router-link
      :to="`/services/${service.id}`"
      class="inline-flex items-center gap-2 text-menthe font-semibold text-sm hover:gap-3 transition-all"
    >
      En savoir plus
      <span class="text-lg leading-none">→</span>
    </router-link>
  </div>
</template>

<script setup>
defineProps({ service: Object })
</script>