<template>
  <div class="bg-noir text-blanc min-h-screen">
    <!-- Hero -->
    <section class="relative pt-32 pb-20 px-4 text-center overflow-hidden">
      <div class="blob w-80 h-80 bg-menthe/15 -top-20 -right-20 absolute"></div>
      <div class="blob w-64 h-64 bg-rose/10 bottom-0 -left-10 absolute"></div>
      <div class="container mx-auto relative z-10">
        <h1 class="text-5xl md:text-7xl font-heading font-bold mb-4">
           <span class="text-gradient">{{ $t('about.title') }}</span>
        </h1>
        <p class="text-blanc/60 text-lg max-w-xl mx-auto">
          {{ $t('about.sub') }}
        </p>
      </div>
    </section>

    <!-- Agence -->
    <section class="section">
      <div class="container mx-auto grid md:grid-cols-2 gap-12 items-center">
        <div class="card-glass p-10 text-center md:text-left">
          <div class="text-6xl mb-6">🚀</div>
          <h3 class="text-2xl font-heading font-bold mb-4">Start‑Up Event's Consulting Agency</h3>
          <p class="text-blanc/70 leading-relaxed">
            Fondée en 2017 par M. Litse Firmin, artiste plasticien, promoteur culturel et coach de talents,
            SUECA est née d'une conviction&nbsp;: le Cameroun regorge de talents et d'initiatives
            entrepreneuriales qui ne demandent qu'à être structurés, promus et connectés.
            Basée à Douala (Ndogbati 1er) avec un point focal à Yaoundé (Essos), l'agence accompagne
            aussi bien les entreprises, les porteurs de projets que les créatifs dans leur quête de
            visibilité, de professionnalisation et de croissance.
          </p>
        </div>
        <div class="space-y-6">
          <div class="card-glass p-8">
            <h4 class="text-xl font-heading font-bold text-menthe mb-2">{{ $t('about.vision') }}</h4>
            <p class="text-blanc/70 leading-relaxed">
              {{ $t('about.visionText') }}
            </p>
          </div>
          <div class="card-glass p-8">
            <h4 class="text-xl font-heading font-bold text-rose mb-2">{{ $t('about.mission') }}</h4>
            <p class="text-blanc/70 leading-relaxed">
              {{ $t('about.missionText') }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Valeurs -->
    <section class="section bg-noir">
      <div class="container mx-auto text-center">
        <h2 class="section-title mb-12">{{ $t('about.values') }}</h2>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
          <div class="card-glass p-6 flex flex-col items-center gap-3">
            <span class="text-3xl">💡</span>
            <h5 class="font-heading font-bold">{{ $t('about.v1') }}</h5>
            <p class="text-blanc/50 text-sm">Créativité et digital pour des solutions modernes.</p>
          </div>
          <div class="card-glass p-6 flex flex-col items-center gap-3">
            <span class="text-3xl">✨</span>
            <h5 class="font-heading font-bold">{{ $t('about.v2') }}</h5>
            <p class="text-blanc/50 text-sm">Qualité maximale dans chaque prestation.</p>
          </div>
          <div class="card-glass p-6 flex flex-col items-center gap-3">
            <span class="text-3xl">🎨</span>
            <h5 class="font-heading font-bold">{{ $t('about.v3') }}</h5>
            <p class="text-blanc/50 text-sm">Sensibilité artistique au service de nos clients.</p>
          </div>
          <div class="card-glass p-6 flex flex-col items-center gap-3">
            <span class="text-3xl">🤝</span>
            <h5 class="font-heading font-bold">Proximité</h5>
            <p class="text-blanc/50 text-sm">À l'écoute et disponibles, toujours.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Fondateur -->
    <section class="section">
      <div class="container mx-auto max-w-3xl text-center">
        <div class="card-glass p-10">
          <div class="w-20 h-20 rounded-full bg-gradient-to-br from-menthe to-rose mx-auto mb-6 flex items-center justify-center text-3xl font-bold">LF</div>
          <h3 class="text-2xl font-heading font-bold mb-2">M. Litse Firmin</h3>
          <p class="text-blanc/60 text-sm">
            Expert en développement et promotion des projets, artiste plasticien, promoteur culturel,
            directeur artistique et coach formateur professionnel de models talents.
          </p>
        </div>
      </div>
    </section>

    <!-- Chiffres -->
    <section class="section bg-noir">
      <div class="container mx-auto">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-6 text-center">
          <div class="card-glass p-6">
            <div class="text-4xl font-heading font-bold text-menthe">7+</div>
            <div class="text-blanc/50 text-sm mt-2">ans d'expérience</div>
          </div>
          <div class="card-glass p-6">
            <div class="text-4xl font-heading font-bold text-rose">50+</div>
            <div class="text-blanc/50 text-sm mt-2">projets & événements</div>
          </div>
          <div class="card-glass p-6">
            <div class="text-4xl font-heading font-bold text-menthe">80+</div>
            <div class="text-blanc/50 text-sm mt-2">clients satisfaits</div>
          </div>
          <div class="card-glass p-6">
            <div class="text-4xl font-heading font-bold text-rose">20+</div>
            <div class="text-blanc/50 text-sm mt-2">experts mobilisés</div>
          </div>
        </div>
      </div>
    </section>

    <!-- Domaines -->
    <section class="section">
      <div class="container mx-auto">
        <h2 class="section-title text-center mb-10">Nos domaines d'intervention</h2>
        <div class="flex flex-wrap justify-center gap-4">
          <span class="badge-menthe">Consulting & Conseils</span>
          <span class="badge-menthe">Campagnes de communication</span>
          <span class="badge-menthe">Marketing événementiel</span>
          <span class="badge-menthe">Coaching & Training artistique</span>
          <span class="badge-menthe">Mise en relation d'experts</span>
          <span class="badge-menthe">Plans de carrière personnalisés</span>
          <span class="badge-menthe">Organisation d'événements</span>
        </div>
      </div>
    </section>

    <!-- Pourquoi SUECA -->
    <section class="section bg-noir">
      <div class="container mx-auto max-w-3xl text-center">
        <div class="card-glass p-10">
          <h2 class="text-2xl font-heading font-bold mb-4">Pourquoi choisir SUECA ?</h2>
          <p class="text-blanc/70 leading-relaxed">
            Parce que nous conjuguons rigueur méthodologique et sensibilité artistique.
            Chaque client bénéficie d'un suivi permanent, de solutions innovantes et d'un réseau
            professionnel dense. Nous ne nous contentons pas de conseiller – nous nous engageons
            pleinement dans la réussite de vos projets.
          </p>
        </div>
      </div>
    </section>

    <!-- CTA -->
    <section class="py-20 px-4 text-center">
      <div class="container mx-auto">
        <h2 class="text-3xl md:text-5xl font-heading font-bold mb-6">
          Prêt à donner vie à votre projet ?
        </h2>
        <router-link to="/contact" class="btn-menthe text-base">
          Prendre rendez-vous
        </router-link>
      </div>
    </section>
  </div>
</template>

<script setup>
// Aucune logique spécifique nécessaire pour le moment
</script>