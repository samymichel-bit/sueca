<template>
  <nav
    class="fixed w-full top-0 z-50 transition-all duration-300"
    :class="scrolled ? 'bg-noir shadow-2xl' : 'bg-noir/80 backdrop-blur-md'"
  >
    <div class="container mx-auto flex items-center justify-between px-4 h-16">

      <!-- Logo -->
      <router-link to="/" class="flex items-center gap-2 shrink-0">
        <img src="/img/logo-sueca.jpg" alt="SUECA" class="h-9 w-auto rounded" />
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
      </div>

      <!-- Right: lang + CTA -->
      <div class="hidden md:flex items-center gap-3">
        <button
          @click="toggleLang"
          class="flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-body font-semibold
                 border border-white/20 text-white/70 hover:text-white hover:border-white/50
                 transition-all duration-200"
        >
          <span>{{ locale === 'fr' ? '🇫🇷 FR' : '🇬🇧 EN' }}</span>
          <span class="text-white/40">↕</span>
          <span class="text-white/50">{{ locale === 'fr' ? 'EN' : 'FR' }}</span>
        </button>

        <router-link to="/contact" class="btn-menthe !py-2 !px-5 !text-xs">
          {{ $t('nav.contact') }}
        </router-link>
      </div>

      <!-- Mobile hamburger -->
      <div class="md:hidden flex items-center gap-3">
        <button @click="toggleLang" class="text-white/60 hover:text-white text-xs font-semibold transition">
          {{ locale === 'fr' ? 'EN' : 'FR' }}
        </button>
        <button
          @click="menuOpen = !menuOpen"
          class="w-9 h-9 flex flex-col items-center justify-center gap-1.5 rounded-lg
                 hover:bg-white/10 transition"
          aria-label="Menu"
        >
          <span
            class="w-5 h-0.5 bg-white transition-all duration-300 origin-center"
            :class="menuOpen ? 'rotate-45 translate-y-2' : ''"
          ></span>
          <span
            class="w-5 h-0.5 bg-white transition-all duration-300"
            :class="menuOpen ? 'opacity-0' : ''"
          ></span>
          <span
            class="w-5 h-0.5 bg-white transition-all duration-300 origin-center"
            :class="menuOpen ? '-rotate-45 -translate-y-2' : ''"
          ></span>
        </button>
      </div>
    </div>

    <!-- Mobile menu -->
    <transition name="mobile-menu">
      <div v-if="menuOpen" class="md:hidden bg-noir border-t border-white/10">
        <div class="container mx-auto px-4 py-4 flex flex-col gap-1">
          <router-link
            v-for="link in links"
            :key="link.to"
            :to="link.to"
            @click="menuOpen = false"
            class="flex items-center px-3 py-3 rounded-xl text-white/70 hover:text-white
                   hover:bg-white/5 font-body font-medium text-sm transition"
            active-class="text-white bg-white/5"
          >
            {{ $t(link.label) }}
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
import { ref, onMounted, onUnmounted } from 'vue'
import { useI18n } from 'vue-i18n'

const { locale, t } = useI18n()
const menuOpen = ref(false)
const scrolled  = ref(false)

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

onMounted(() => window.addEventListener('scroll', onScroll))
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