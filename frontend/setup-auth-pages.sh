#!/bin/bash
# setup-auth-pages.sh – Création des pages Login/Register + routes

echo "🔐 Mise en place des pages d'authentification..."

# 1. Login.vue
cat > src/views/Login.vue << 'EOF'
<template>
  <div class="pt-32 pb-16 bg-noir min-h-screen">
    <div class="container mx-auto px-4 max-w-md">
      <h1 class="text-3xl font-heading font-bold text-blanc text-center mb-8">Connexion</h1>

      <form @submit.prevent="login" class="bg-[#1A1A1A] border border-menthe/30 rounded-2xl p-8 space-y-5">
        <input v-model="username" placeholder="Nom d'utilisateur" required class="input-dark" />
        <input v-model="password" type="password" placeholder="Mot de passe" required class="input-dark" />

        <button type="submit" class="btn-menthe w-full">Se connecter</button>

        <p v-if="error" class="text-rose text-sm text-center">{{ error }}</p>
        <p class="text-blanc/60 text-sm text-center">
          Pas encore de compte ? <router-link to="/register" class="text-menthe">Créer un compte</router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import api from '@/api'

const router = useRouter()
const route = useRoute()
const username = ref('')
const password = ref('')
const error = ref('')

const login = async () => {
  try {
    const { data } = await api.post('/auth/login/', {
      username: username.value,
      password: password.value,
    })
    localStorage.setItem('access_token', data.access)
    localStorage.setItem('refresh_token', data.refresh)

    const orderId = route.query.order
    if (orderId) {
      router.push(`/dashboard?order=${orderId}`)
    } else {
      router.push('/dashboard')
    }
  } catch (e) {
    error.value = 'Identifiants incorrects. Veuillez réessayer.'
  }
}
</script>
EOF

# 2. Register.vue
cat > src/views/Register.vue << 'EOF'
<template>
  <div class="pt-32 pb-16 bg-noir min-h-screen">
    <div class="container mx-auto px-4 max-w-md">
      <h1 class="text-3xl font-heading font-bold text-blanc text-center mb-8">Créer un compte</h1>

      <form @submit.prevent="register" class="bg-[#1A1A1A] border border-menthe/30 rounded-2xl p-8 space-y-5">
        <input v-model="username" placeholder="Nom d'utilisateur" required class="input-dark" />
        <input v-model="email" type="email" placeholder="Email" required class="input-dark" />
        <input v-model="password" type="password" placeholder="Mot de passe" required class="input-dark" />

        <button type="submit" class="btn-menthe w-full">Créer mon compte</button>

        <p v-if="error" class="text-rose text-sm text-center">{{ error }}</p>
        <p class="text-blanc/60 text-sm text-center">
          Déjà un compte ? <router-link to="/login" class="text-menthe">Se connecter</router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import api from '@/api'

const router = useRouter()
const username = ref('')
const email = ref('')
const password = ref('')
const error = ref('')

const register = async () => {
  try {
    await api.post('/auth/register/', {
      username: username.value,
      email: email.value,
      password: password.value,
    })
    router.push('/login')
  } catch (e) {
    error.value = "Erreur lors de l'inscription. Veuillez réessayer."
  }
}
</script>
EOF

# 3. Ajout des routes dans le routeur (si pas déjà présentes)
ROUTER_FILE="src/router/index.js"

if ! grep -q "path: '/login'" "$ROUTER_FILE"; then
  # Ajoute les imports
  sed -i "1s/^/import Login from '..\/views\/Login.vue'\nimport Register from '..\/views\/Register.vue'\n/" "$ROUTER_FILE"
  # Ajoute les routes avant le tableau routes existant
  sed -i "/routes: \[/a \    { path: '/login', component: Login },\n    { path: '/register', component: Register }," "$ROUTER_FILE"
  echo "✅ Routes ajoutées"
else
  echo "✅ Routes déjà présentes"
fi

echo ""
echo "🎉 Pages Login et Register prêtes !"
echo "👉 Relance le frontend avec 'npm run dev'"