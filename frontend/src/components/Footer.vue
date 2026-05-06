<template>
  <footer class="bg-noir text-white py-16 relative overflow-hidden">
    <!-- Decorations -->
    <div class="absolute top-0 left-1/4 w-96 h-96 bg-menthe/5 rounded-full blur-3xl"></div>
    <div class="absolute bottom-0 right-1/4 w-64 h-64 bg-rose/5 rounded-full blur-3xl"></div>
    
    <div class="container mx-auto px-4 relative z-10">
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-12">
        <!-- Logo & Social -->
        <div>
          <h3 class="text-2xl font-heading font-bold text-gradient mb-4">
            ◆ SUECA
          </h3>
          <p class="text-blanc/60 text-sm mb-6 max-w-md">Start-Up Event's Consulting Agency — Depuis 2017. Nous illuminons vos événements avec une touche de futur.</p>
          <div class="flex gap-4">
            <a href="#" class="w-10 h-10 flex items-center justify-center rounded-lg bg-blanc/5 border border-blanc/10 hover:border-menthe/50 hover:bg-menthe/10 transition-all duration-300">
              <svg class="w-5 h-5 text-menthe" fill="currentColor" viewBox="0 0 24 24"><path d="M24 4.557c-.883.392-1.832.656-2.828.875 1.051-.615 1.805-1.585 2.175-2.772-.983.567-2.085.98-3.25 1.198-.93-.963-2.253-1.565-3.715-1.565-2.812 0-5.091 2.279-5.091 5.091 0 .399.045.788.131 1.16-4.23-.211-7.973-2.239-10.485-5.322-.442.76-.695 1.645-.695 2.588 0 1.765 1.119 3.322 2.82 4.235-.798-.025-1.55-.245-2.205-.608v.06c0 2.468 1.754 4.528 4.079 4.99-.425.116-.873.178-1.337.178-.328 0-.645-.032-.955-.092.647 2.019 2.525 3.488 4.75 3.531-1.741 1.365-3.934 2.197-6.313 2.197-.411 0-.817-.024-1.215-.071 2.255 1.447 4.928 2.291 7.803 2.291 9.368 0 14.489-7.764 14.489-14.489 0-.221-.004-.441-.012-.659.993-.716 1.854-1.608 2.536-2.625z"/></svg>
            </a>
            <a href="#" class="w-10 h-10 flex items-center justify-center rounded-lg bg-blanc/5 border border-blanc/10 hover:border-rose/50 hover:bg-rose/10 transition-all duration-300">
              <svg class="w-5 h-5 text-rose" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.668.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.947.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.947-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073z"/><path d="M12 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zm0 10.162a3.999 3.999 0 110-7.998 3.999 3.999 0 010 7.998z"/><circle cx="16.857" cy="7.143" r="1.143"/></svg>
            </a>
            <a href="#" class="w-10 h-10 flex items-center justify-center rounded-lg bg-blanc/5 border border-blanc/10 hover:border-rose/50 hover:bg-rose/10 transition-all duration-300">
              <svg class="w-5 h-5 text-rose" fill="currentColor" viewBox="0 0 24 24"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/></svg>
            </a>
          </div>
        </div>
        
        <!-- Contact -->
        <div>
          <h4 class="font-heading font-bold text-white mb-4">Contact</h4>
          <ul class="space-y-3 text-blanc/60 text-sm">
            <li class="flex items-center gap-3">
              <span class="text-menthe">📞</span> +237 652 11 72 45
            </li>
            <li class="flex items-center gap-3">
              <span class="text-menthe">✉️</span> litse83@gmail.com
            </li>
          </ul>
        </div>
        
        <!-- Address -->
        <div>
          <h4 class="font-heading font-bold text-white mb-4">Adresse</h4>
          <ul class="space-y-3 text-blanc/60 text-sm">
            <li class="flex items-center gap-3">
              <span class="text-rose">📍</span> Ndogbati 1er, Douala
            </li>
            <li class="flex items-center gap-3">
              <span class="text-rose">📍</span> Essos, Yaoundé
            </li>
          </ul>
        </div>

        <!-- Quick Links -->
        <div>
          <h4 class="font-heading font-bold text-white mb-4">Quick Links</h4>
          <ul class="space-y-3 text-blanc/60 text-sm">
            <li><a href="/" class="hover:text-menthe transition-colors">Accueil</a></li>
            <li><a href="/services" class="hover:text-menthe transition-colors">Services</a></li>
            <li><a href="/portfolio" class="hover:text-menthe transition-colors">Portfolio</a></li>
            <li><a href="/contact" class="hover:text-menthe transition-colors">Contact</a></li>
          </ul>
        </div>
      </div>
      
      <!-- Bottom -->
      <div class="mt-16 pt-8 border-t border-blanc/10 flex flex-col md:flex-row justify-between items-center gap-4">
        <p class="text-blanc/40 text-sm">© 2024 SUECA. Tous droits réservés.</p>
        <p class="text-blanc/40 text-sm font-mono">Créé avec <span class="text-rose">♦</span> pour le futur</p>
      </div>
    </div>
  </footer>
</template>

<script setup>
</script>