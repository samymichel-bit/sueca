<template>
  <div class="min-h-screen bg-noir flex items-center justify-center px-4 py-24">
    <div class="w-full max-w-md bg-[#1A1A1A] border border-menthe/20 rounded-2xl p-8 shadow-xl">
      <h1 class="text-3xl font-heading font-bold text-blanc mb-6 text-center">Connexion</h1>

      <form @submit.prevent="login" class="space-y-5">
        <div>
          <label class="block text-sm text-blanc/70 mb-2">Nom d'utilisateur</label>
          <input v-model="username" type="text" required
            class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
            placeholder="Votre nom d'utilisateur" />
        </div>
        <div>
          <label class="block text-sm text-blanc/70 mb-2">Mot de passe</label>
          <input v-model="password" type="password" required
            class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
            placeholder="Votre mot de passe" />
        </div>

        <div v-if="error" class="text-rose text-sm bg-rose/10 border border-rose/20 rounded-xl p-3">
          {{ error }}
        </div>

        <button type="submit" :disabled="loading"
          class="w-full bg-menthe text-noir font-bold py-3 rounded-xl hover:bg-menthe/90 transition disabled:opacity-50 disabled:cursor-not-allowed">
          {{ loading ? 'Connexion...' : 'Se connecter' }}
        </button>
      </form>

      <p class="mt-6 text-center text-blanc/60 text-sm">
        Pas encore de compte ?
        <router-link to="/register" class="text-menthe hover:underline">Créer un compte</router-link>
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const username = ref('')
const password = ref('')
const loading = ref(false)
const error = ref('')

async function login() {
  error.value = ''
  loading.value = true

  try {
    const res = await axios.post('/api/auth/login/', {
      username: username.value,
      password: password.value
    })

    localStorage.setItem('access_token', res.data.access)
    localStorage.setItem('refresh_token', res.data.refresh)
    window.location.replace('/dashboard')
  } catch (err) {
    if (err.response?.status === 401) {
      error.value = 'Identifiants incorrects.'
    } else if (err.response?.data?.detail) {
      error.value = err.response.data.detail
    } else {
      error.value = 'Erreur réseau. Veuillez réessayer.'
    }
  } finally {
    loading.value = false
  }
}
</script>