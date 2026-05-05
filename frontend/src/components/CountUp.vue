<template>
  <div class="text-center p-8 sm:p-12 bg-creme/5 backdrop-blur-md rounded-2xl border border-or/20 shadow-glass hover:shadow-glass-hover transition-all duration-300 group">
    <div class="text-3xl sm:text-4xl lg:text-5xl font-heading font-bold text-or mb-3 group-hover:text-terre drop-shadow-or-glow">
      {{ formattedNumber }}
      <span class="text-lg sm:text-xl font-body text-creme/80 ml-1">{{ props.suffix }}</span>
    </div>
    <p class="text-creme/80 font-medium text-sm sm:text-base tracking-wide">{{ props.title }}</p>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { mediaUrl } from '@/utils/media.js' // Not used but for consistency

const props = defineProps({
  number: {
    type: Number,
    required: true
  },
  suffix: {
    type: String,
    default: ''
  },
  title: {
    type: String,
    required: true
  }
})

const count = ref(0)
const isVisible = ref(false)

const formattedNumber = computed(() => {
  return isVisible.value ? count.value.toLocaleString() : '0'
})

let animationFrame = null

const animateCount = () => {
  const duration = 2500
  const startTime = performance.now()

  const updateCount = (currentTime) => {
    const elapsed = currentTime - startTime
    const progress = Math.min(elapsed / duration, 1)
    const easeProgress = 1 - Math.pow(1 - progress, 3) // easeOutCubic

    count.value = Math.floor(props.number * easeProgress)

    if (progress < 1) {
      animationFrame = requestAnimationFrame(updateCount)
    }
  }

  animationFrame = requestAnimationFrame(updateCount)
}

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting && !isVisible.value) {
      isVisible.value = true
      animateCount()
    }
  })
}, {
  threshold: 0.3,
  rootMargin: '0px 0px -100px 0px'
})

onMounted(() => {
  const el = document.querySelector(`#countup-${props.number}`)
  if (el) {
    observer.observe(el)
  }
})

onUnmounted(() => {
  if (animationFrame) {
    cancelAnimationFrame(animationFrame)
  }
  observer.disconnect()
})
</script>
