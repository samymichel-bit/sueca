<template>
  <div class="pt-24 pb-16 min-h-screen bg-noir text-blanc">
    <div class="container mx-auto px-4">
      <!-- Chargement -->
      <div v-if="loading" class="text-center py-20">
        <p>Chargement...</p>
      </div>

      <!-- Erreur -->
      <div v-else-if="error" class="text-center py-20">
        <p class="text-rose">{{ error }}</p>
      </div>

      <!-- Contenu du service -->
      <div v-else>
        <!-- En-tête -->
        <div class="text-center mb-16">
          <span class="text-5xl mb-4 block">{{ service.icon || '📦' }}</span>
          <h1 class="text-4xl md:text-5xl font-heading font-bold mb-4">
            {{ service.title }}
          </h1>
          <p class="text-blanc/70 max-w-3xl mx-auto leading-relaxed">
            {{ service.description }}
          </p>
        </div>

        <!-- Plan d'action (3 phases) -->
        <div class="mb-16">
          <h2 class="text-2xl font-heading font-bold mb-8 text-center">
            Notre plan d'action
          </h2>
          <div class="grid md:grid-cols-3 gap-6">
            <div v-for="phase in workflows" :key="phase.id"
                 class="bg-[#1A1A1A] border border-menthe/20 rounded-2xl p-6">
              <div class="text-3xl mb-3">
                {{ phase.order === 1 ? '①' : phase.order === 2 ? '②' : '③' }}
              </div>
              <h3 class="font-heading font-bold text-lg mb-2">{{ phase.name }}</h3>
              <p class="text-blanc/60 text-sm">{{ phase.description }}</p>
              <p v-if="phase.default_price" class="text-menthe font-semibold mt-3">
                {{ phase.default_price }} FCFA
              </p>
            </div>
          </div>
        </div>

        <!-- Animation de succès -->
        <div v-if="orderSuccess" class="max-w-2xl mx-auto text-center py-10">
          <div class="text-6xl mb-4">✅</div>
          <h3 class="text-2xl font-heading font-bold text-menthe mb-2">Commande créée avec succès !</h3>
          <p class="text-blanc/60 mb-6">Redirection vers votre espace client...</p>
          <div class="w-12 h-12 border-4 border-menthe/30 border-t-menthe rounded-full animate-spin mx-auto"></div>
        </div>

        <!-- Formulaire de commande -->
        <div v-else class="max-w-2xl mx-auto bg-[#1A1A1A] border border-menthe/20 rounded-2xl p-8">
          <h2 class="text-2xl font-heading font-bold mb-6 text-center">
            Démarrer ce service
          </h2>
          <form @submit.prevent="submitOrder" class="space-y-5">
            <div>
              <label class="block text-sm text-blanc/70 mb-2">Nom complet</label>
              <input v-model="form.name" required
                class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none" />
            </div>
            <div>
              <label class="block text-sm text-blanc/70 mb-2">Email</label>
              <input v-model="form.email" type="email" required
                class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none" />
            </div>
            <div>
  <label class="block text-sm text-blanc/70 mb-2">Téléphone</label>
  <div class="flex gap-2">
    <!-- Sélecteur d'indicatif (largeur automatique) -->
    <select v-model="form.indicatif"
      class="w-auto p-3 bg-noir border border-blanc/20 roundePd-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none whitespace-nowrap">
      <option value="+237">🇨🇲 +237</option>
      <option value="+33">🇫🇷 +33</option>
      <option value="+1">🇺🇸 +1</option>
      <option value="+44">🇬🇧 +44</option>
      <option value="+225">🇨🇮 +225</option>
      <option value="+229">🇧🇯 +229</option>
    </select>
    <!-- Numéro local (prend le reste de la largeur) -->
    <input v-model="form.phone" type="tel" required
      class="flex-1 min-w-0 p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
      placeholder="6 00 00 00 00" />
  </div>
</div>
            <div>
              <label class="block text-sm text-blanc/70 mb-2">Décrivez votre besoin</label>
              <textarea v-model="form.message" rows="4" required
                class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"></textarea>
            </div>
            <button type="submit"
              class="w-full bg-menthe text-noir font-bold py-3 rounded-xl hover:bg-menthe/90 transition">
              Créer la commande
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import api from '@/api'

const route = useRoute()
const serviceId = ref(route.params.id)

const service = ref(null)
const workflows = ref([])
const loading = ref(true)
const error = ref(null)
const orderSuccess = ref(false)

const form = reactive({
  name: '',
  email: '',
  indicatif: '+237',
  phone: '',
  message: ''
})

onMounted(async () => {
  try {
    const [serviceRes, workflowsRes] = await Promise.all([
      api.get(`/services/${serviceId.value}/`),
      api.get(`/workflows/?service=${serviceId.value}`)
    ])
    service.value = serviceRes.data
    workflows.value = workflowsRes.data.results || workflowsRes.data
  } catch (e) {
    error.value = 'Impossible de charger le service.'
    console.error(e)
  } finally {
    loading.value = false
  }
})

const submitOrder = async () => {
  try {
    const payload = {
      service: parseInt(serviceId.value),
      client_name: form.name,
      client_email: form.email,
      client_phone: form.indicatif + form.phone,
      description: form.message
    }
    await api.post('/orders/', payload)

    // Animation de succès
    orderSuccess.value = true

    // Redirection automatique après 2 secondes
    setTimeout(() => {
      window.location.href = '/login'
    }, 2000)
  } catch (error) {
    if (error.response) {
      alert('Erreur : ' + JSON.stringify(error.response.data))
    } else if (error.request) {
      alert('Le serveur ne répond pas.')
    } else {
      alert('Erreur : ' + error.message)
    }
  }
}
</script>