<template>
  <div class="pt-24 pb-16 bg-noir min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-4xl md:text-6xl font-heading font-bold text-blanc mb-6">
          À <span class="text-gradient">propos</span>
        </h1>
        <p class="text-blanc/50 max-w-2xl mx-auto text-lg">Découvrez notre histoire et notre mission.</p>
      </div>
      
      <!-- Content -->
      <div class="grid md:grid-cols-2 gap-12 items-center">
        <!-- Image/Visual -->
        <div class="relative">
          <div class="card-glass p-8 relative overflow-hidden">
            <div class="relative z-10">
              <div class="text-8xl mb-6">🚀</div>
              <h3 class="text-2xl font-bold text-blanc mb-4">Start-Up Event's Consulting Agency</h3>
              <p class="text-blanc/50">Fondée en 2017 par M. Litse Firmin</p>
            </div>
          </div>
        </div>
        
        <!-- Text -->
        <div class="space-y-6">
          <div class="card-glass p-8">
            <h3 class="text-xl font-bold text-menthe mb-4">Notre Vision</h3>
            <p class="text-blanc/70 leading-relaxed">
              SUECA est une agence de conseil et d'événementiel qui accompagne les entreprises 
              vers le succès. Nous apportons une touche d'innovation et de créativité à chaque projet.
            </p>
          </div>
          
          <div class="card-glass p-8">
            <h3 class="text-xl font-bold text-rose mb-4">Notre Mission</h3>
            <p class="text-blanc/70 leading-relaxed">
              Éclairer vos événements et vos projets avec une vision futuriste, créer des expériences 
              mémorables et durables pour nos clients et leurs audiences.
            </p>
          </div>
          
          <div class="card-glass p-8">
            <h3 class="text-xl font-bold text-rose mb-4">Nos Valeurs</h3>
            <ul class="text-blanc/70 space-y-2">
              <li class="flex items-center gap-3">
                <span class="text-menthe">✦</span> Innovation
              </li>
              <li class="flex items-center gap-3">
                <span class="text-rose">✦</span> Excellence
              </li>
              <li class="flex items-center gap-3">
                <span class="text-rose">✦</span> Créativité
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>