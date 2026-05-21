<template>
  <div class="min-h-screen bg-noir pt-24 pb-16 px-4">
    <div class="container mx-auto max-w-4xl">
      
      <!-- En-tête avec bouton Nouvelle commande -->
      <div class="flex flex-col md:flex-row justify-between md:items-center mb-8">
        <h1 class="text-3xl md:text-4xl font-heading font-bold text-blanc">
          Mon espace client
        </h1>
        <router-link to="/services" class="btn-menthe mt-4 md:mt-0">
          + Nouvelle commande
        </router-link>
      </div>

      <!-- Message si aucune commande -->
      <div v-if="!loading && orders.length === 0" class="text-center py-20">
        <p class="text-blanc/60 text-lg">Vous n'avez pas encore de commande.</p>
        <router-link to="/services" class="btn-menthe mt-4 inline-block">
          Découvrir nos services
        </router-link>
      </div>

      <!-- Liste des commandes -->
      <div v-else class="space-y-6">
        <div
          v-for="order in orders"
          :key="order.id"
          class="bg-[#1A1A1A] border border-menthe/20 rounded-2xl p-6 hover:border-menthe/50 transition"
        >
          <div class="flex flex-col md:flex-row justify-between md:items-center gap-4">
            <div>
              <h3 class="text-xl font-heading font-bold text-blanc">
                Commande #{{ order.id }}
              </h3>
              <p class="text-blanc/60 text-sm mt-1">
                Service : {{ order.service_title || '—' }}
              </p>
              <p class="text-blanc/60 text-sm">
                Statut : <span class="font-semibold text-menthe">{{ order.status }}</span>
              </p>
            </div>
            <router-link
              :to="`/dashboard/${order.id}`"
              class="text-menthe text-sm font-semibold hover:underline whitespace-nowrap"
            >
              Voir le détail →
            </router-link>
          </div>

          <!-- Barre de progression simple -->
          <div class="mt-4 w-full bg-noir rounded-full h-2">
            <div
              class="bg-menthe h-2 rounded-full transition-all duration-500"
              :style="{ width: progressPercent(order) + '%' }"
            ></div>
          </div>
          <p class="text-blanc/40 text-xs mt-1">{{ progressPercent(order) }}% complété</p>
        </div>
      </div>

      <!-- Chargement -->
      <div v-if="loading" class="text-center py-20">
        <p class="text-blanc/60">Chargement de vos commandes...</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import api from '@/api'

const orders = ref([])
const loading = ref(true)

onMounted(async () => {

  if (!localStorage.getItem('access_token')) {
  window.location.href = '/login'
  return
}
  try {
    const response = await api.get('/orders/')
    orders.value = response.data.results || response.data
  } catch (error) {
    console.error('Erreur chargement commandes', error)
  } finally {
    loading.value = false
  }
})

function progressPercent(order) {
  const statusMap = {
    'pending': 10,
    'consulting': 30,
    'planning': 50,
    'execution': 75,
    'completed': 100,
    'cancelled': 0
  }
  return statusMap[order.status] || 0
}
</script>