<template>
  <div class="fixed bottom-6 right-6 z-50">
    <a
      href="https://wa.me/237652117245?text=Bonjour%20SUECA,%20je%20souhaite%20un%20renseignement."
      target="_blank"
      class="bg-[#25D366] hover:bg-[#1ebe5c] w-14 h-14 rounded-full flex items-center justify-center shadow-xl hover:shadow-2xl transition-all duration-300 animate-pulse"
      aria-label="Discuter sur WhatsApp"
    >
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="w-7 h-7">
        <path d="M12.04 0C5.82 0 .83 4.99.83 11.22c0 2.01.52 3.93 1.43 5.6L.02 24l7.43-2.23a11.2 11.2 0 004.59.89c6.22 0 11.21-4.99 11.21-11.22S18.26 0 12.04 0zm0 20.63a9.3 9.3 0 01-4.74-1.3l-.34-.2-4.37 1.31 1.17-4.24-.23-.36a9.21 9.21 0 01-1.42-4.91 9.3 9.3 0 019.3-9.3 9.3 9.3 0 019.3 9.3 9.3 9.3 0 01-9.3 9.3zm5.1-6.96c-.28-.14-1.65-.81-1.91-.9-.25-.1-.44-.14-.63.14s-.72.9-.88 1.09c-.16.19-.32.21-.6.07a7.5 7.5 0 01-2.79-2.06c-.23-.28-.02-.43.1-.57.1-.1.28-.26.42-.39.14-.13.19-.22.28-.38.1-.16.05-.3-.02-.42-.08-.12-.72-1.75-.99-2.4-.26-.64-.53-.55-.72-.56h-.62c-.21 0-.55.08-.84.39-.28.3-1.1 1.07-1.1 2.62 0 1.55 1.13 3.04 1.29 3.25.15.21 2.22 3.39 5.38 4.75.75.33 1.34.52 1.8.67.76.24 1.44.21 1.99.13.6-.09 1.85-.75 2.11-1.48.26-.73.26-1.36.18-1.49-.08-.12-.28-.19-.56-.33z"/>
      </svg>
    </a>
  </div>
</template>

<style scoped>
@keyframes pulse-green {
  0% { box-shadow: 0 0 0 0 rgba(37, 211, 102, 0.6); }
  70% { box-shadow: 0 0 0 15px rgba(37, 211, 102, 0); }
  100% { box-shadow: 0 0 0 0 rgba(37, 211, 102, 0); }
}
.animate-pulse {
  animation: pulse-green 2s infinite;
}
</style>
