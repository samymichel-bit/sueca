<template>
  <div class="bg-white rounded-2xl p-8 shadow-card border border-gray-100 relative hover:shadow-card-hover transition-all duration-300">
    <span class="text-6xl font-serif text-menthe absolute -top-6 left-4">“</span>
    <p class="italic font-accent text-gray-700 mt-4">{{ testimonial.content }}</p>
    <div class="mt-6 flex items-center gap-4">
      <div class="w-12 h-12 rounded-full bg-gradient-to-br from-rose to-menthe flex items-center justify-center text-white font-bold">?</div>
      <div>
        <p class="font-bold text-noir">{{ testimonial.author }}</p>
        <p class="text-sm text-gray-500">{{ testimonial.company }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({ testimonial: Object })
</script>