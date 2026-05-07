<template>
  <section class="relative min-h-screen flex items-center justify-center overflow-hidden bg-noir">
    <div class="blob w-96 h-96 bg-menthe top-1/4 -left-20 animate-blob"></div>
    <div class="blob w-80 h-80 bg-rose bottom-1/4 -right-16 animate-blob-delay"></div>
    <div class="absolute inset-0 opacity-[0.04] pointer-events-none"
         style="background-image: url('data:image/svg+xml,...')">
    </div>

    <div class="container mx-auto px-4 pt-24 pb-16 relative z-10 text-center">
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-menthe/30 bg-menthe/10 text-menthe text-xs font-body font-semibold uppercase tracking-widest mb-8">
        <span class="w-1.5 h-1.5 rounded-full bg-menthe animate-pulse-soft inline-block"></span>
        Agence de conseil & événementiel
      </div>

      <h1 class="text-5xl sm:text-6xl md:text-7xl lg:text-8xl font-heading font-bold text-blanc leading-none mb-6">
        Éclairez votre<br />
        <span class="text-gradient italic">vision.</span>
      </h1>

      <p class="text-blanc/60 font-body text-base md:text-xl max-w-2xl mx-auto mb-10 leading-relaxed">
        Nous accompagnons les startups et entreprises dans leur développement commercial, leurs événements et leur mise en relation avec les bons experts.
      </p>

      <div class="flex flex-wrap gap-4 justify-center">
        <router-link to="/services" class="btn-menthe text-sm md:text-base">
          Découvrir nos services
        </router-link>
        <router-link to="/contact" class="btn-outline text-sm md:text-base">
          Prendre rendez-vous
        </router-link>
      </div>
    </div>
  </section>
</template>

<script setup>
// Aucune logique nécessaire
</script>