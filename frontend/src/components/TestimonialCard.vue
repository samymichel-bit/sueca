<template>
  <div
    class="group relative overflow-hidden rounded-2xl p-8 shadow-card border border-noir/5 bg-blanc/70 backdrop-blur-md
           hover:shadow-card-hover hover:-translate-y-1 transition-all duration-300"
  >
    <!-- Decorative accent -->
    <div
      class="absolute -top-12 -right-12 w-32 h-32 bg-gradient-to-br from-menthe/20 via-rose/10 to-transparent rounded-full blur-2xl opacity-60 group-hover:opacity-80 transition-opacity"
    ></div>

    <!-- Quote mark -->
    <span class="text-7xl font-serif text-menthe absolute -top-6 left-4 opacity-90">“</span>

    <p class="italic font-accent text-noir/80 mt-6 leading-relaxed">
      {{ testimonial.content }}
    </p>

    <div class="mt-8 flex items-center gap-4">
      <div class="w-12 h-12 rounded-full bg-gradient-brand flex items-center justify-center text-blanc font-bold shadow-rose-glow/0">
        <span class="text-2xl leading-none">“</span>
      </div>
      <div>
        <p class="font-bold text-noir">{{ testimonial.author }}</p>
        <p class="text-sm text-gris mt-0.5">{{ testimonial.company }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({ testimonial: Object })
</script>

