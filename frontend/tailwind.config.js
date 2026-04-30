/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        terre: '#C87A5C',
        or: '#D4AF37',
        noir: '#0D0D0D',
        bleu: '#1E2A78',
        creme: '#FAF7F2',
        // Futuriste
        dark: '#0a0a0f',
        darkSecondary: '#12121f',
        cyan: '#00f0ff',
        purple: '#7b2ff7',
        pink: '#f207b8',
      },
      fontFamily: {
        heading: ['Poppins', 'sans-serif'],
        body: ['Inter', 'sans-serif'],
        accent: ['Lora', 'serif'],
        orbitron: ['Orbitron', 'sans-serif'],
        rajdhani: ['Rajdhani', 'sans-serif'],
      },
      animation: {
        'float': 'float 6s ease-in-out infinite',
        'pulse-glow': 'pulseGlow 2s ease-in-out infinite',
        'gradient-shift': 'gradientShift 8s ease infinite',
      },
      boxShadow: {
        'neon-cyan': '0 0 5px #00f0ff, 0 0 10px #00f0ff, 0 0 20px #00f0ff40',
        'neon-purple': '0 0 5px #7b2ff7, 0 0 10px #7b2ff7, 0 0 20px #7b2ff740',
        'neon-pink': '0 0 5px #f207b8, 0 0 10px #f207b8, 0 0 20px #f207b840',
      },
    },
  },
  plugins: [],
};
