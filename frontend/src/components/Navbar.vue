<template>
  <nav class="fixed w-full top-0 z-50 transition-all duration-500" :class="scrolled ? 'bg-[#0a0a0f]/95 backdrop-blur-xl border-b border-cyan/20 shadow-lg shadow-cyan/5' : 'bg-transparent'">
    <div class="container mx-auto flex justify-between items-center py-4 px-4">
      <router-link to="/" class="text-2xl font-orbitron font-black text-transparent bg-clip-text bg-gradient-to-r from-cyan to-purple tracking-wider hover:text-glow-cyan transition-all">
        <span class="text-cyan">◆</span> SUECA
      </router-link>
      <div class="hidden md:flex gap-10 items-center">
        <router-link v-for="link in links" :key="link.to" :to="link.to" 
          class="relative text-gray-300 hover:text-cyan transition-all font-medium text-sm uppercase tracking-wider group">
          {{ link.label }}
          <span class="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-cyan to-purple transition-all duration-300 group-hover:w-full"></span>
        </router-link>
      </div>
      <button class="md:hidden text-cyan text-3xl">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
const scrolled = ref(false);
const links = [
  { to: '/', label: 'Accueil' },
  { to: '/about', label: 'À propos' },
  { to: '/services', label: 'Services' },
  { to: '/portfolio', label: 'Portfolio' },
  { to: '/contact', label: 'Contact' },
];

const onScroll = () => { scrolled.value = window.scrollY > 50; };
onMounted(() => window.addEventListener('scroll', onScroll));
onUnmounted(() => window.removeEventListener('scroll', onScroll));
</script>
