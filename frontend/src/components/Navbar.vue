<template>
  <nav
    class="fixed w-full top-0 z-50 transition-all duration-300"
    :class="scrolled ? 'bg-noir/95 shadow-2xl' : 'bg-noir/70 backdrop-blur-md shadow-lg'"
  >
    <div class="container mx-auto flex items-center justify-between px-6 h-16">
      <!-- Logo -->
      <router-link to="/" class="flex items-center gap-2 shrink-0">
        <img
          src="/img/logo-sueca.jpg"
          alt="SUECA"
          class="h-9 w-auto rounded-md ring-1 ring-blanc/10"
        />
      </router-link>

      <!-- Desktop nav -->
      <div class="hidden md:flex items-center gap-1">
        <router-link
          v-for="link in links"
          :key="link.to"
          :to="link.to"
          class="nav-link px-3 py-1.5"
        >
          {{ $t(link.label) }}
        </router-link>

        <!-- Mon compte (desktop) -->
        <router-link
          v-if="isLoggedIn"
          to="/dashboard"
          class="nav-link px-3 py-1.5">
          Mon compte
        </router-link>
      </div>

      <!-- Right: lang + CTA -->
      <div class="hidden md:flex items-center gap-3">
        <button
          @click="toggleLang"
          class="flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-body font-semibold
                 border border-blanc/15 text-blanc/70 hover:text-blanc hover:border-menthe/40
                 bg-blanc/5 hover:bg-blanc/10 transition-all duration-200"
        >
          <span>{{ locale === 'fr' ? '🇫🇷 FR' : '🇬🇧 EN' }}</span>
          <span class="text-blanc/40">↕</span>
          <span class="text-blanc/50">{{ locale === 'fr' ? 'EN' : 'FR' }}</span>
        </button>

        <router-link to="/contact" class="btn-menthe !py-2 !px-5 !text-xs">
          {{ $t('nav.contact') }}
        </router-link>
      </div>

      <!-- Mobile hamburger -->
      <div class="md:hidden flex items-center gap-3">
        <button
          @click="toggleLang"
          class="px-2.5 py-1.5 rounded-full text-xs font-semibold text-blanc/70 hover:text-blanc hover:bg-blanc/10 transition"
        >
          {{ locale === 'fr' ? 'EN' : 'FR' }}
        </button>

        <button
          @click="menuOpen = !menuOpen"
          class="w-10 h-10 flex flex-col items-center justify-center gap-1.5 rounded-xl
                 hover:bg-blanc/10 transition border border-blanc/10"
          aria-label="Menu"
        >
          <span
            class="w-5 h-0.5 bg-blanc transition-all duration-300 origin-center"
            :class="menuOpen ? 'rotate-45 translate-y-2' : ''"
          ></span>
          <span
            class="w-5 h-0.5 bg-blanc transition-all duration-300"
            :class="menuOpen ? 'opacity-0' : ''"
          ></span>
          <span
            class="w-5 h-0.5 bg-blanc transition-all duration-300 origin-center"
            :class="menuOpen ? '-rotate-45 -translate-y-2' : ''"
          ></span>
        </button>
      </div>
    </div>

    <!-- Mobile menu -->
    <transition name="mobile-menu">
      <div
        v-if="menuOpen"
        class="md:hidden bg-noir/95 backdrop-blur-md border-t border-blanc/10"
      >
        <div class="container mx-auto px-4 py-4 flex flex-col gap-2">
          <router-link
            v-for="link in links"
            :key="link.to"
            :to="link.to"
            @click="menuOpen = false"
            class="flex items-center px-3 py-3 rounded-xl text-blanc/70 hover:text-blanc
                   hover:bg-blanc/5 font-body font-medium text-sm transition border border-transparent hover:border-menthe/30"
            active-class="text-blanc bg-blanc/5 border-menthe/30"
          >
            {{ $t(link.label) }}
          </router-link>

          <!-- Mon compte (mobile) -->
          <router-link
            v-if="isLoggedIn"
            to="/dashboard"
            @click="menuOpen = false"
            class="flex items-center px-3 py-3 rounded-xl text-blanc/70 hover:text-blanc
                   hover:bg-blanc/5 font-body font-medium text-sm transition border border-transparent hover:border-menthe/30"
          >
            Mon compte
          </router-link>

          <router-link
            to="/contact"
            @click="menuOpen = false"
            class="mt-2 btn-menthe text-center"
          >
            {{ $t('nav.contact') }}
          </router-link>
        </div>
      </div>
    </transition>
  </nav>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useI18n } from 'vue-i18n'

const { locale } = useI18n()
const menuOpen = ref(false)
const scrolled = ref(false)

const isLoggedIn = computed(() => !!localStorage.getItem('access_token'))

const links = [
  { to: '/',          label: 'nav.home' },
  { to: '/about',     label: 'nav.about' },
  { to: '/services',  label: 'nav.services' },
  { to: '/portfolio', label: 'nav.portfolio' },
  { to: '/experts',   label: 'nav.experts' },
]

function toggleLang() {
  locale.value = locale.value === 'fr' ? 'en' : 'fr'
  localStorage.setItem('sueca_lang', locale.value)
}

function onScroll() { scrolled.value = window.scrollY > 20 }

onMounted(()  => window.addEventListener('scroll', onScroll))
onUnmounted(() => window.removeEventListener('scroll', onScroll))
</script>

<style scoped>
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition: opacity 0.2s ease, transform 0.2s ease;
}
.mobile-menu-enter-from,
.mobile-menu-leave-to {
  opacity: 0;
  transform: translateY(-8px);
}
</style>