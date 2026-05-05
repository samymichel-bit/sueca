<template>
  <Teleport to="body">
    <div v-if="isOpen" @click.self="close" class="fixed inset-0 z-[1000] bg-noir/95 backdrop-blur-md flex items-center justify-center p-4 animate-in fade-in-0 zoom-in-95 duration-200 md:p-8">
      <!-- Close button -->
      <button @click="close" class="absolute top-6 right-6 md:top-8 md:right-8 w-12 h-12 rounded-2xl bg-noir/50 backdrop-blur border border-creme/30 flex items-center justify-center hover:bg-creme/10 transition-all text-creme text-2xl hover:scale-110 shadow-glass-hover z-10">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>

      <!-- Image container -->
      <div ref="imageContainer" class="w-full max-w-full max-h-[90vh] flex items-center justify-center relative touch-pan-y">
        <img ref="imageEl" :src="currentImage" :alt="currentAlt" class="max-w-full max-h-[90vh] object-contain rounded-2xl shadow-2xl cursor-zoom-out md:hover:scale-105 transition-transform duration-200">
      </div>

      <!-- Navigation arrows (desktop) -->
      <button v-if="images.length > 1" @click="prev" class="absolute left-6 md:left-12 top-1/2 -translate-y-1/2 w-14 h-14 rounded-2xl bg-noir/50 backdrop-blur border border-creme/30 flex items-center justify-center hover:bg-creme/10 transition-all text-creme hover:scale-110 shadow-glass-hover opacity-80 hover:opacity-100">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 rotate-180" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
        </svg>
      </button>
      <button v-if="images.length > 1" @click="next" class="absolute right-6 md:right-12 top-1/2 -translate-y-1/2 w-14 h-14 rounded-2xl bg-noir/50 backdrop-blur border border-creme/30 flex items-center justify-center hover:bg-creme/10 transition-all text-creme hover:scale-110 shadow-glass-hover opacity-80 hover:opacity-100">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
        </svg>
      </button>
    </div>
  </Teleport>
</template>

<script setup>
import { ref, nextTick } from 'vue'

const emit = defineEmits(['update:modelValue', 'close'])

const props = defineProps({
  modelValue: Boolean,
  images: {
    type: Array,
    default: () => []
  },
  initialIndex: {
    type: Number,
    default: 0
  },
  alt: {
    type: String,
    default: 'Portfolio image'
  }
})

const isOpen = computed({
  get: () => props.modelValue,
  set: (value) => emit('update:modelValue', value)
})

const currentIndex = ref(0)
const imageContainer = ref(null)
const imageEl = ref(null)
const startX = ref(0)
let currentTranslateX = 0

onMounted(() => {
  if (props.initialIndex) currentIndex.value = props.initialIndex
  nextTick(() => setupSwipe())
})

const setupSwipe = () => {
  if (!imageContainer.value) return

  let startX = 0
  let startY = 0
  let isSwiping = false

  const handleStart = (e) => {
    isSwiping = true
    startX = e.touches ? e.touches[0].clientX : e.clientX
    startY = e.touches ? e.touches[0].clientY : e.clientY
    currentTranslateX = 0
  }

  const handleMove = (e) => {
    if (!isSwiping) return
    e.preventDefault()
    const currentX = e.touches ? e.touches[0].clientX : e.clientX
    const currentY = e.touches ? e.touches[0].clientY : e.clientY
    const deltaX = currentX - startX
    const deltaY = currentY - startY

    if (Math.abs(deltaX) > Math.abs(deltaY)) {
      currentTranslateX = deltaX
      if (imageEl.value) {
        imageEl.value.style.transform = `translateX(${currentTranslateX}px)`
      }
    }
  }

  const handleEnd = () => {
    if (!isSwiping) return
    isSwiping = false

    const threshold = 80
    if (currentTranslateX > threshold) {
      prev()
    } else if (currentTranslateX < -threshold) {
      next()
    } else {
      // Snap back
      if (imageEl.value) {
        imageEl.value.style.transform = 'translateX(0)'
      }
    }
  }

  imageContainer.value.addEventListener('touchstart', handleStart, { passive: false })
  imageContainer.value.addEventListener('touchmove', handleMove, { passive: false })
  imageContainer.value.addEventListener('touchend', handleEnd, { passive: false })

  // Mouse support for desktop
  imageContainer.value.addEventListener('mousedown', handleStart)
  document.addEventListener('mousemove', handleMove)
  document.addEventListener('mouseup', handleEnd)
}

const close = () => {
  emit('close')
  emit('update:modelValue', false)
  currentIndex.value = 0
}

const next = () => {
  currentIndex.value = (currentIndex.value + 1) % props.images.length
}

const prev = () => {
  currentIndex.value = currentIndex.value === 0 ? props.images.length - 1 : currentIndex.value - 1
}

watch(() => isOpen.value, (newVal) => {
  if (!newVal) {
    currentIndex.value = 0
  }
})
</script>

<style scoped>
.touch-pan-y {
  touch-action: pan-y pinch-zoom;
}
</style>
