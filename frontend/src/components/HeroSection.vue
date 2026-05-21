<template>
  <section class="relative min-h-screen flex items-center justify-center overflow-hidden bg-noir">
    <div class="blob w-96 h-96 bg-menthe top-1/4 -left-20 animate-blob"></div>
    <div class="blob w-80 h-80 bg-rose bottom-1/4 -right-16 animate-blob-delay"></div>

    <!-- Subtle texture (no external colors beyond palette) -->
    <div
      class="absolute inset-0 opacity-[0.05] pointer-events-none"
      style="background-image: linear-gradient(90deg, rgba(13,13,13,0.0), rgba(13,13,13,0.35));"
    ></div>

    <div class="container mx-auto px-4 pt-24 pb-16 relative z-10 text-center">
      <div
        class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-menthe/30 bg-menthe/10
               text-menthe text-xs font-body font-semibold uppercase tracking-widest mb-8"
      >
        <span class="w-1.5 h-1.5 rounded-full bg-menthe animate-pulse-soft inline-block"></span>
        {{ $t('hero.tagline') }}
      </div>

      <h1 class="text-5xl sm:text-6xl md:text-7xl lg:text-8xl font-heading font-bold text-blanc leading-none mb-6">
        {{ $t('hero.headline_1') }}<br />
        <span class="text-gradient italic">{{ $t('hero.headline_2') }}</span>
      </h1>

      <p class="text-blanc/60 font-body text-base md:text-xl max-w-2xl mx-auto mb-10 leading-relaxed">
        {{ $t('hero.sub') }}
      </p>

      <div class="flex flex-wrap gap-4 justify-center">
        <router-link to="/services" class="btn-menthe text-sm md:text-base">
          {{ $t('hero.cta1') }}
        </router-link>
        <router-link to="/contact" class="btn-outline text-sm md:text-base">
          {{ $t('hero.cta2') }}
        </router-link>
      </div>
    </div>
  </section>
</template>

<script setup>
// Aucune logique nécessaire
</script>

