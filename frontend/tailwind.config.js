/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        // ── Palette SUECA (issue du logo) ──
        noir:    '#0D0D0D',
        blanc:   '#FAFAFA',
        menthe:  '#4CAF82',   // vert du logo
        rose:    '#E040A0',   // rose/magenta du logo
        gris:    '#6B7280',   // textes secondaires
        grisClair: '#F4F4F5', // fond sections alternées

        // tokens utilisés dans tes composants (alignés sur la palette du logo)
        or: '#F2B35B',       // orange doré
        terre: '#7A5C3A',   // brun terre
        bleu: '#2F80ED',    // bleu

        // variantes "bg-*" / "from-*" / "to-*" attendues
        creme: '#F5F0E8',
        dark: '#0D0D0D',

        // nuances

        // tokens utilisés par certaines classes shadow/* glow/* dans tes composants
        'shadow-or-glow': '0 0 24px rgba(242,179,91,0.35)',
        'shadow-bleu-glow': '0 0 24px rgba(47,128,237,0.35)',
        'shadow-rose-glow': '0 0 24px rgba(224,64,160,0.35)',
        'menthe-light': '#D1F0E2',
        'menthe-dark':  '#2E7D57',
        'rose-light':   '#FCE4F5',
        'rose-dark':    '#9C2070',
      },
      fontFamily: {
        heading: ['"DM Serif Display"', 'Georgia', 'serif'],
        body:    ['"DM Sans"', 'system-ui', 'sans-serif'],
        mono:    ['"JetBrains Mono"', 'monospace'],
      },
      animation: {
        'float':       'float 7s ease-in-out infinite',
        'blob':        'blob 9s ease-in-out infinite',
        'blob-delay':  'blob 9s ease-in-out 3s infinite',
        'fade-up':     'fadeUp 0.6s ease-out both',
        'slide-right': 'slideRight 0.5s ease-out both',
        'pulse-soft':  'pulseSoft 3s ease-in-out infinite',
      },
      keyframes: {
        float: {
          '0%,100%': { transform: 'translateY(0px)' },
          '50%':     { transform: 'translateY(-18px)' },
        },
        blob: {
          '0%,100%': { borderRadius: '60% 40% 30% 70% / 60% 30% 70% 40%' },
          '50%':     { borderRadius: '30% 60% 70% 40% / 50% 60% 30% 60%' },
        },
        fadeUp: {
          from: { opacity: '0', transform: 'translateY(24px)' },
          to:   { opacity: '1', transform: 'translateY(0)' },
        },
        slideRight: {
          from: { opacity: '0', transform: 'translateX(-24px)' },
          to:   { opacity: '1', transform: 'translateX(0)' },
        },
        pulseSoft: {
          '0%,100%': { opacity: '0.6' },
          '50%':     { opacity: '1' },
        },
      },
      boxShadow: {
        'menthe': '0 4px 24px rgba(76,175,130,0.25)',
        'rose':   '0 4px 24px rgba(224,64,160,0.25)',
        'card':   '0 2px 16px rgba(13,13,13,0.08)',
        'card-hover': '0 8px 40px rgba(13,13,13,0.14)',
        'or-glow': '0 0 24px rgba(242,179,91,0.35)',
        'bleu-glow': '0 0 24px rgba(47,128,237,0.35)',
        'rose-glow': '0 0 24px rgba(224,64,160,0.35)',
      },
      backgroundImage: {
        'gradient-brand': 'linear-gradient(135deg, #4CAF82 0%, #E040A0 100%)',
        'gradient-hero':  'linear-gradient(160deg, #0D0D0D 0%, #1a1a1a 60%, #0f2318 100%)',
      },
    },
  },
  plugins: [],
};
