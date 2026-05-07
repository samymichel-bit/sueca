<template>
  <div class="pt-24 pb-16 bg-noir min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-20">
        <h1 class="text-4xl md:text-6xl lg:text-7xl font-heading font-bold text-blanc mb-6 leading-tight">
          Nos <span class="text-gradient">Experts</span>
        </h1>
        <p class="text-blanc/70 font-body max-w-3xl mx-auto text-xl md:text-2xl leading-relaxed">
          Une équipe d'excellence camerounaise dédiée à transformer vos ambitions en succès concrets.
        </p>
      </div>

      <!-- Team Grid -->
      <div v-if="store.loading.teamMembers" class="grid md:grid-cols-2 lg:grid-cols-3 gap-10 lg:gap-12">
        <div v-for="n in 3" :key="n" class="h-96 rounded-3xl bg-creme/5 border border-blanc/10 animate-pulse" />
      </div>

      <div v-else class="grid md:grid-cols-2 lg:grid-cols-3 gap-10 lg:gap-12">
        <div v-for="member in teamMembers" :key="member.id" class="group">
          <div
            class="relative overflow-hidden rounded-3xl bg-noir border border-blanc/10 shadow-2xl hover:shadow-menthe hover:-translate-y-4 transition-all duration-500 h-96 flex items-end p-8"
          >
            <div class="absolute inset-0 bg-gradient-to-t from-noir via-noir/50 to-transparent"></div>
            <img
              v-if="member.photo"
              :src="member.photo"
              :alt="member.full_name"
              class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
            <div v-else class="absolute inset-0 bg-bleu/20" />

            <div class="relative z-10 text-blanc">
              <h3 class="text-2xl font-heading font-bold mb-2">{{ member.full_name }}</h3>
              <p class="font-medium text-menthe mb-4 opacity-90">{{ member.role }}</p>
              <p class="text-blanc/90 leading-relaxed line-clamp-3">{{ member.bio }}</p>
            </div>
          </div>
        </div>

        <div v-if="!teamMembers.length" class="col-span-full text-center text-blanc/70 py-10">
          Aucun membre d’équipe disponible pour le moment.
        </div>
      </div>

      <!-- Talents Section -->
      <div class="col-span-full mt-16">
        <div v-if="store.loading.talents" class="text-center">
          <div class="text-blanc/70">Chargement des talents…</div>
        </div>

        <template v-else>
          <div v-if="talents.length">
            <h2 class="text-3xl md:text-4xl font-heading font-bold text-blanc mb-12 text-center">
              Talents <span class="text-gradient">Repérés</span>
            </h2>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
              <div v-for="talent in talents" :key="talent.id" class="text-center group">
                <div class="w-32 h-32 mx-auto rounded-3xl overflow-hidden shadow-xl hover:shadow-menthe transition-all duration-500 mb-6">
                  <img
                    v-if="talent.photo"
                    :src="talent.photo"
                    :alt="talent.full_name"
                    class="w-full h-full object-cover"
                  />
                  <div v-else class="w-full h-full bg-rose/10" />
                </div>
                <h3 class="text-xl font-heading font-bold text-blanc">{{ talent.full_name }}</h3>
                <p class="text-blanc/60">{{ talent.bio }}</p>
              </div>
            </div>
          </div>

          <div v-else class="text-center text-blanc/70 py-10">
            Aucun talent repéré pour le moment.
          </div>
        </template>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, computed } from 'vue'
import { useMainStore } from '@/stores/main'

const store = useMainStore()

onMounted(() => {
  store.fetchTeamMembers()
  store.fetchTalents()
})

const teamMembers = computed(() => store.teamMembers || [])
const talents = computed(() => store.talents || [])
</script>

