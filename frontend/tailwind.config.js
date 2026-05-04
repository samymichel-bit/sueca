/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],

        noir: '#0D0D0D',
        bleu: '#1E2A78',
        creme: '#FAF7F2',
        // Legacy futuriste (reduced opacity)
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
        'pulse-halo': 'pulseHalo 2s infinite',
        'label-slide': 'labelSlide 0.3s ease-out',
      },
boxShadow: {
        'terre-glow': '0 0 10px rgba(200, 122, 92, 0.4), 0 0 20px rgba(200, 122, 92, 0.2), 0 0 30px rgba(200, 122, 92, 0.1)',
        'or-glow': '0 0 15px rgba(212, 175, 55, 0.6), 0 0 25px rgba(212, 175, 55, 0.3), 0 0 40px rgba(212, 175, 55, 0.15)',
        'bleu-glow': '0 0 10px rgba(30, 42, 120, 0.5), 0 0 20px rgba(30, 42, 120, 0.25)',
        'glass': '0 8px 32px rgba(13, 13, 13, 0.5), inset 0 1px 0 rgba(250, 247, 242, 0.15)',
        'glass-hover': '0 20px 40px rgba(13, 13, 13, 0.6), 0 0 30px rgba(212, 175, 55, 0.2), inset 0 1px 0 rgba(250, 247, 242, 0.25)',
      },
    },
  },
  plugins: [],
};
