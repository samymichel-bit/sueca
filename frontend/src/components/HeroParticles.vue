<template>
  <div class="absolute inset-0 overflow-hidden pointer-events-none">
    <!-- Particles -->
    <div class="particle" v-for="n in 30" :key="n" :style="particleStyle(n)"></div>
    
    <!-- Glowing orbs -->
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    
    <!-- Grid lines -->
    <div class="grid-line grid-line-1"></div>
    <div class="grid-line grid-line-2"></div>
  </div>
</template>

<script setup>
function particleStyle(n) {
  const colors = ['#00f0ff', '#7b2ff7', '#f207b8'];
  const color = colors[n % 3];
  const size = 2 + Math.random() * 4;
  const duration = 4 + Math.random() * 6;
  const delay = Math.random() * 5;
  
  return {
    position: 'absolute',
    width: size + 'px',
    height: size + 'px',
    background: color,
    borderRadius: '50%',
    left: Math.random() * 100 + '%',
    top: Math.random() * 100 + '%',
    boxShadow: `0 0 ${size * 2}px ${size}px ${color}60`,
    animation: `particleFloat ${duration}s infinite ease-in-out ${delay}s`,
    opacity: 0.3 + Math.random() * 0.5,
  };
}
</script>

<style scoped>
@keyframes particleFloat {
  0% { 
    transform: translateY(0px) scale(1); 
    opacity: 0.3;
  }
  50% { 
    transform: translateY(-50px) scale(1.5); 
    opacity: 0.8;
  }
  100% { 
    transform: translateY(-100px) scale(0.8); 
    opacity: 0.1;
  }
}

.orb {
  position: absolute;
  border-radius: 50%;
  filter: blur(60px);
}

.orb-1 {
  width: 300px;
  height: 300px;
  background: radial-gradient(circle, rgba(0, 240, 255, 0.3) 0%, transparent 70%);
  top: 10%;
  left: 20%;
  animation: orbFloat 8s ease-in-out infinite;
}

.orb-2 {
  width: 250px;
  height: 250px;
  background: radial-gradient(circle, rgba(123, 47, 247, 0.3) 0%, transparent 70%);
  bottom: 20%;
  right: 20%;
  animation: orbFloat 10s ease-in-out infinite 2s;
}

@keyframes orbFloat {
  0%, 100% { 
    transform: translate(0, 0) scale(1); 
  }
  33% { 
    transform: translate(30px, -30px) scale(1.2); 
  }
  66% { 
    transform: translate(-20px, 20px) scale(0.9); 
  }
}

.grid-line {
  position: absolute;
  background: linear-gradient(90deg, transparent, rgba(0, 240, 255, 0.1), transparent);
  height: 1px;
}

.grid-line-1 {
  width: 100%;
  top: 30%;
  animation: gridScan 4s ease-in-out infinite;
}

.grid-line-2 {
  width: 100%;
  top: 70%;
  animation: gridScan 4s ease-in-out infinite 2s;
}

@keyframes gridScan {
  0% { opacity: 0; transform: translateX(-100%); }
  50% { opacity: 1; }
  100% { opacity: 0; transform: translateX(100%); }
}
</style>
