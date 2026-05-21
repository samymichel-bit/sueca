<template>
  <div class="min-h-screen bg-noir flex items-center justify-center px-4 py-24">
    <div class="w-full max-w-md bg-[#1A1A1A] border border-menthe/20 rounded-2xl p-8 shadow-xl">
      <h1 class="text-3xl font-heading font-bold text-blanc mb-6 text-center">
        Créer un compte
      </h1>

      <div v-if="successMessage" class="text-menthe text-sm bg-menthe/10 border border-menthe/20 rounded-xl p-3 mb-4">
        {{ successMessage }}
      </div>

      <form @submit.prevent="handleRegister" class="space-y-5">
        <div>
          <label class="block text-sm text-blanc/70 mb-2">Nom d'utilisateur</label>
          <input v-model="form.username" type="text" required minlength="3"
            class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
            placeholder="Choisissez un nom" />
        </div>
        <div>
          <label class="block text-sm text-blanc/70 mb-2">Adresse email</label>
          <input v-model="form.email" type="email" required
            class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
            placeholder="ex. amina@entreprise.cm" />
        </div>
        <div>
          <label class="block text-sm text-blanc/70 mb-2">Mot de passe</label>
          <input v-model="form.password" type="password" required minlength="6"
            class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
            placeholder="Minimum 6 caractères" />
        </div>
        <div>
          <label class="block text-sm text-blanc/70 mb-2">Confirmer le mot de passe</label>
          <input v-model="form.password2" type="password" required minlength="6"
            class="w-full p-3 bg-noir border border-blanc/20 rounded-xl text-blanc focus:border-menthe focus:ring-1 focus:ring-menthe outline-none"
            placeholder="Répétez le mot de passe" />
        </div>

        <div v-if="errorMessage" class="text-rose text-sm bg-rose/10 border border-rose/20 rounded-xl p-3">
          {{ errorMessage }}
        </div>

        <button type="submit" :disabled="loading"
          class="w-full bg-menthe text-noir font-bold py-3 rounded-xl hover:bg-menthe/90 transition disabled:opacity-50 disabled:cursor-not-allowed">
          {{ loading ? 'Création en cours...' : 'Créer mon compte' }}
        </button>
      </form>

      <p class="mt-6 text-center text-blanc/60 text-sm">
        Déjà un compte ?
        <router-link to="/login" class="text-menthe hover:underline">Se connecter</router-link>
      </p>
    </div>
  </div>
</template>

<script setup>
import { reactive, ref } from 'vue'
import api from '@/api'

const form = reactive({
  username: '',
  email: '',
  password: '',
  password2: ''
})

const loading = ref(false)
const errorMessage = ref('')
const successMessage = ref('')

async function handleRegister() {
  errorMessage.value = ''
  successMessage.value = ''

  if (form.password !== form.password2) {
    errorMessage.value = 'Les mots de passe ne correspondent pas.'
    return
  }
  if (form.password.length < 6) {
    errorMessage.value = 'Le mot de passe doit contenir au moins 6 caractères.'
    return
  }

  loading.value = true
  try {
    await api.post('http://localhost:8000/api/auth/register/', {
      username: form.username,
      email: form.email,
      password: form.password
    })
    successMessage.value = 'Compte créé avec succès ! Redirection...'
    setTimeout(() => {
      window.location.href = '/login'
    }, 1500)
  } catch (error) {
    if (error.response?.data) {
      const data = error.response.data
      const messages = []
      for (const [field, value] of Object.entries(data)) {
        if (Array.isArray(value)) {
          messages.push(`${field}: ${value.join(', ')}`)
        } else if (typeof value === 'string') {
          messages.push(`${field}: ${value}`)
        } else {
          messages.push(`${field}: ${JSON.stringify(value)}`)
        }
      }
      errorMessage.value = messages.join('\n')
    } else {
      errorMessage.value = 'Erreur réseau. Veuillez réessayer.'
    }
  } finally {
    loading.value = false
  }
}
</script>