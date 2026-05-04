<template>
  <nav class="fixed w-full top-0 z-50 transition-all duration-500 backdrop-blur-xl" 
       :class="scrolled ? 'bg-noir/95 border-b border-or/20 shadow-2xl shadow-or/10' : 'bg-noir/80 border-b border-or/10 shadow-glass'">
    <div class="container mx-auto flex justify-between items-center py-4 px-4 md:px-6">
      <!-- Logo -->
      <router-link to="/" class="flex items-center z-[100]">
        <img src="/img/logo-sueca.jpg" alt="SUECA Logo" class="h-10 md:h-12 w-auto drop-shadow-lg">
      </router-link>
      
      <!-- Desktop Menu -->
      <div class="hidden md:flex gap-8 items-center">
        <router-link 
          v-for="link in links" 
          :key="link.to" 
          :to="link.to" 
          class="relative text-creme hover:text-or font-medium text-sm uppercase tracking-wider group transition-all px-3 py-2 rounded-lg hover:bg-or/10">
          {{ link.label }}
          <span class="absolute -bottom-1 left-1/2 -translate-x-1/2 w-0 h-px bg-gradient-to-r from-or via-terre to-or rounded-full transition-all duration-300 group-hover:w-full"></span>
        </router-link>
      </div>
      
      <!-- Mobile Menu Button -->
      <button 
        @click="isOpen = !isOpen" 
        class="md:hidden p-2 rounded-full hover:bg-or/10 transition-colors text-creme hover:text-or z-[100]"
        aria-label="Menu">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7 transition-transform" :class="isOpen ? 'rotate-90' : ''" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="isOpen ? 'M6 18L18 6M6 6l12 12' : 'M4 6h16M4 12h16M4 18h16'" />
        </svg>
      </button>
    </div>

    <!-- Mobile Menu Overlay -->
    <transition
      enter-active-class="transition-opacity duration-300"
      leave-active-class="transition-opacity duration-300"
      enter-from-class="opacity-0"
      leave-to-class="opacity-0">
      <div 
        v-if="isOpen" 
        @click="isOpen = false" 
        class="fixed inset-0 z-[90] bg-noir/95 backdrop-blur-md md:hidden">
        
        <!-- Mobile Menu Content -->
        <div class="flex flex-col h-full pt-24 pb-8 px-6">
          <!-- Navigation Links -->
          <nav class="flex-1 flex flex-col justify-center space-y-4">
            <router-link 
              v-for="link in links" 
              :key="link.to" 
              :to="link.to" 
              @click="isOpen = false"
              class="flex items-center justify-between py-5 px-6 rounded-2xl text-lg font-medium text-creme hover:bg-or/20 hover:text-or border border-or/20 backdrop-blur transition-all group">
              <span>{{ link.label }}</span>
              <svg class="h-5 w-5 text-or opacity-70 group-hover:translate-x-2 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
              </svg>
            </router-link>
          </nav>
          
          <!-- Footer Info -->
          <div class="text-center text-creme/60 text-sm mt-8">
            <p>SUECA - Start-Up Event's Consulting Agency</p>
          </div>
        </div>
      </div>
    </transition>
  </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const scrolled = ref(false);
const isOpen = ref(false);

const links = [
  { to: '/', label: 'Accueil' },
  { to: '/about', label: 'À propos' },
  { to: '/services', label: 'Services' },
  { to: '/portfolio', label: 'Portfolio' },
  { to: '/contact', label: 'Contact' },
];

const onScroll = () => { 
  scrolled.value = window.scrollY > 50; 
};

onMounted(() => {
  window.addEventListener('scroll', onScroll);
});

onUnmounted(() => {
  window.removeEventListener('scroll', onScroll);
});
</script>
