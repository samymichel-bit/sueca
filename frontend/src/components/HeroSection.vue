<template>
  <section class="relative min-h-screen flex items-center justify-center overflow-hidden bg-noir">

    <!-- Blobs inspirés du logo -->
    <div class="blob w-96 h-96 bg-menthe top-1/4 -left-20 animate-blob"></div>
    <div class="blob w-80 h-80 bg-rose bottom-1/4 -right-16 animate-blob-delay"></div>
    <div class="blob w-64 h-64 bg-menthe/40 bottom-10 left-1/4 animate-blob" style="animation-delay:5s"></div>

    <!-- Grain overlay -->
    <div class="absolute inset-0 opacity-[0.04] pointer-events-none"
         style="background-image: url('data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22300%22 height=%22300%22><filter id=%22n%22><feTurbulence type=%22fractalNoise%22 baseFrequency=%220.75%22 numOctaves=%224%22/><feColorMatrix type=%22saturate%22 values=%220%22/></filter><rect width=%22300%22 height=%22300%22 filter=%22url(%23n)%22 opacity=%221%22/></svg>')">
    </div>

    <!-- Content -->
    <div class="container mx-auto px-4 pt-24 pb-16 relative z-10 text-center">

      <!-- Badge -->
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full
                  border border-menthe/30 bg-menthe/10 text-menthe
                  text-xs font-body font-semibold uppercase tracking-widest mb-8
                  animate-fade-up">
        <span class="w-1.5 h-1.5 rounded-full bg-menthe animate-pulse-soft inline-block"></span>
        {{ $t('hero.tagline') }}
      </div>

      <!-- Headline -->
      <h1
        class="text-5xl sm:text-6xl md:text-7xl lg:text-8xl font-heading font-bold
               text-blanc leading-none mb-6 animate-fade-up animate-delay-100"
      >
        {{ $t('hero.headline_1') }}<br />
        <span class="text-gradient italic">{{ $t('hero.headline_2') }}</span>
      </h1>

      <!-- Subtext -->
      <p
        class="text-blanc/60 font-body text-base md:text-xl max-w-2xl mx-auto mb-10
               leading-relaxed animate-fade-up animate-delay-200"
      >
        {{ $t('hero.sub') }}
      </p>

      <!-- CTAs -->
      <div class="flex flex-wrap gap-4 justify-center animate-fade-up animate-delay-300">
        <router-link to="/services" class="btn-menthe text-sm md:text-base">
          {{ $t('hero.cta1') }}
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </router-link>
        <router-link to="/contact" class="btn-outline text-sm md:text-base">
          {{ $t('hero.cta2') }}
        </router-link>
      </div>

      <!-- Stats -->
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6 mt-20 max-w-3xl mx-auto
                  animate-fade-up animate-delay-400">
        <div v-for="stat in stats" :key="stat.value"
             class="text-center p-4 rounded-2xl border border-blanc/10 bg-blanc/5 backdrop-blur-sm">
          <div class="text-3xl md:text-4xl font-heading font-bold text-blanc mb-1">
            {{ stat.value }}
          </div>
          <div class="text-blanc/50 font-body text-xs uppercase tracking-wider">
            {{ $t(stat.label) }}
          </div>
        </div>
      </div>
    </div>

    <!-- Scroll indicator -->
    <div class="absolute bottom-8 left-1/2 -translate-x-1/2 flex flex-col items-center gap-2
                text-blanc/30 animate-float">
      <span class="text-xs font-body uppercase tracking-widest">Scroll</span>
      <div class="w-px h-10 bg-gradient-to-b from-blanc/30 to-transparent"></div>
    </div>
  </section>
</template>

<script setup>
const stats = [
  { value: '7+',  label: 'home.stats.years' },
  { value: '50+', label: 'home.stats.projects' },
  { value: '80+', label: 'home.stats.clients' },
  { value: '20+', label: 'home.stats.experts' },
]
</script>
