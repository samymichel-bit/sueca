import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue'
import About from '@/views/About.vue'
import Services from '@/views/Services.vue'
import Portfolio from '@/views/Portfolio.vue'
import Contact from '@/views/Contact.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: Home },
    { path: '/about', component: About },
    { path: '/services', component: Services },
    { path: '/portfolio', component: Portfolio },
    { path: '/contact', component: Contact },
  ],
});

export default router;
