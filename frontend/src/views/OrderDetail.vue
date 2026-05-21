<template>
  <div class="min-h-screen bg-noir pt-24 pb-16 px-4">
    <div class="container mx-auto max-w-4xl">
      <!-- En-tête -->
      <div class="mb-10">
        <router-link to="/dashboard" class="text-menthe text-sm hover:underline mb-4 inline-block">
          ← Retour au tableau de bord
        </router-link>
        <h1 class="text-3xl md:text-4xl font-heading font-bold text-blanc">
          Commande #{{ order.id }}
        </h1>
        <p class="text-blanc/60 mt-2">
          Service : {{ order.service_title || '—' }}
        </p>
        <p class="text-blanc/60">
          Statut : <span class="text-menthe font-semibold">{{ order.status }}</span>
        </p>
      </div>

      <!-- Barre de progression -->
      <div class="mb-12">
        <div class="w-full bg-noir rounded-full h-3">
          <div
            class="bg-menthe h-3 rounded-full transition-all duration-700"
            :style="{ width: progressPercent + '%' }"
          ></div>
        </div>
        <p class="text-blanc/40 text-xs mt-2">{{ progressPercent }}% complété</p>
      </div>

      <!-- Phases -->
      <div class="space-y-4">
        <div
          v-for="phase in phases"
          :key="phase.id"
          class="bg-[#1A1A1A] border border-menthe/20 rounded-2xl p-5"
        >
          <div class="flex flex-col md:flex-row justify-between md:items-start gap-4">
            <div class="flex-1">
              <h3 class="font-heading font-bold text-blanc text-lg">{{ phase.name }}</h3>
              <p class="text-blanc/60 text-sm mt-1">{{ phase.description }}</p>

              <!-- Message de persuasion pour la première phase -->
              <div v-if="phase.phase_order === 1 && phase.status !== 'paid' && phase.status !== 'completed'" class="mt-3 bg-menthe/10 border border-menthe/30 rounded-xl p-4">
                <p class="text-blanc/80 text-sm leading-relaxed">
                  Cette première étape est le socle de votre projet. Nous analysons en profondeur votre besoin, étudions sa faisabilité et vous orientons vers la meilleure stratégie. Payer cette phase, c’est sécuriser un diagnostic professionnel qui vous évitera des erreurs coûteuses.
                </p>
              </div>

              <p class="text-blanc/40 text-xs mt-2">Échéance : {{ phase.due_date || '—' }}</p>
            </div>

            <div class="text-right">
              <span
                v-if="phase.status === 'paid' || phase.status === 'completed'"
                class="text-menthe font-semibold text-sm"
              >
                ✅ Payée
              </span>
              <button
                v-else
                @click="payPhase(phase.id)"
                class="btn-menthe text-xs py-2 px-4"
              >
                Payer {{ phase.price }} FCFA
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Message si aucune phase -->
      <div v-if="phases.length === 0" class="text-center py-10 text-blanc/60">
        Aucune phase définie pour cette commande.
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import api from '@/api'

const route = useRoute()
const orderId = route.params.id
const order = ref({})
const phases = ref([])

const progressPercent = computed(() => {
  if (phases.value.length === 0) return 0
  const paidCount = phases.value.filter(p => p.status === 'paid' || p.status === 'completed').length
  return Math.round((paidCount / phases.value.length) * 100)
})

onMounted(async () => {
  try {
    const [orderRes, phasesRes] = await Promise.all([
      api.get(`/orders/${orderId}/`),
      api.get(`/order-phases/?service_order=${orderId}`)
    ])
    order.value = orderRes.data
    phases.value = phasesRes.data.results || phasesRes.data
  } catch (error) {
    console.error('Erreur chargement commande', error)
  }
})

async function payPhase(phaseId) {
  try {
    const response = await api.post(`/payment/${phaseId}/`)
    // Recharger les phases après paiement
    const phasesRes = await api.get(`/order-phases/?service_order=${orderId}`)
    phases.value = phasesRes.data.results || phasesRes.data
  } catch (error) {
    // Afficher l'erreur réelle renvoyée par le serveur
    if (error.response) {
      const detail = error.response.data?.detail || JSON.stringify(error.response.data)
      alert(`Erreur serveur : ${detail}`)
    } else if (error.request) {
      alert('Le serveur ne répond pas. Vérifiez que le backend est lancé.')
    } else {
      alert(`Erreur : ${error.message}`)
    }
  }
}
</script>