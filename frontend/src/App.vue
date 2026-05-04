<template>
  <div id="app">
    <Navbar />
    <transition name="fade" mode="out-in">
      <router-view />
    </transition>
    <Footer />
    <WhatsAppButton />
  </div>
</template>

<script setup>
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'
import WhatsAppButton from '@/components/WhatsAppButton.vue'
</script>
