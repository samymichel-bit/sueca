<template>
  <div class="pt-24 pb-16 bg-creme min-h-screen">
    <div class="container mx-auto px-4">
      <!-- Header -->
      <div class="text-center mb-20">
        <h1 class="text-4xl md:text-6xl lg:text-7xl font-heading font-bold text-noir mb-6 leading-tight">
          Nos <span class="bg-clip-text text-transparent bg-gradient-to-r from-or to-terre">Experts</span>
        </h1>
        <p class="text-noir/80 font-body max-w-3xl mx-auto text-xl md:text-2xl leading-relaxed">
          Une équipe d'excellence camerounaise dédiée à transformer vos ambitions en succès concrets.
        </p>
      </div>

      <!-- Team Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-10 lg:gap-12">
        <div v-for="member in teamMembers" :key="member.id" class="group">
          <div class="relative overflow-hidden rounded-3xl bg-creme shadow-2xl shadow-noir/10 hover:shadow-or-glow hover:-translate-y-4 transition-all duration-500 h-96 flex items-end p-8">
            <div class="absolute inset-0 bg-gradient-to-t from-noir via-noir/50 to-transparent"></div>
            <img :src="member.photo" :alt="member.full_name" class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" />
            <div class="relative z-10 text-white">
              <h3 class="text-2xl font-heading font-bold mb-2">{{ member.full_name }}</h3>
              <p class="font-medium text-or mb-4 opacity-90">{{ member.role }}</p>
              <p class="text-creme/90 leading-relaxed line-clamp-3">{{ member.bio }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Talents Section (optionnelle, affichée uniquement si talents existent) -->
      <div v-if="talents.length" class="col-span-full mt-16">
        <h2 class="text-3xl md:text-4xl font-heading font-bold text-noir mb-12 text-center">
          Talents <span class="bg-clip-text text-transparent bg-gradient-to-r from-bleu to-or">Repérés</span>
        </h2>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div v-for="talent in talents" :key="talent.id" class="text-center group">
            <div class="w-32 h-32 mx-auto rounded-3xl overflow-hidden shadow-xl shadow-bleu-glow hover:shadow-2xl hover:shadow-or-glow transition-all duration-500 mb-6">
              <img :src="talent.photo" :alt="talent.full_name" class="w-full h-full object-cover" />
            </div>
            <h3 class="text-xl font-heading font-bold text-noir">{{ talent.full_name }}</h3>
            <p class="text-gray-500">{{ talent.bio }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, computed } from 'vue';
import { useMainStore } from '@/stores/main';

const store = useMainStore();

// Charger les membres de l'équipe et les talents au montage
onMounted(() => {
  store.fetchTeamMembers(); // Assure-toi que cette action existe dans le store
  store.fetchTalents();     // Idem
});

// Accès réactif aux données du store
const teamMembers = computed(() => store.teamMembers);
const talents = computed(() => store.talents);
</script>