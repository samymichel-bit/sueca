import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue'
import About from '@/views/About.vue'
import Services from '@/views/Services.vue'
import Portfolio from '@/views/Portfolio.vue'
import Contact from '@/views/Contact.vue'
import Experts from '@/views/Experts.vue'
import ServiceDetail from '@/views/ServiceDetail.vue'
import ProjectDetail from '@/views/ProjectDetail.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: Home },
    { path: '/about', component: About },
    { path: '/services', component: Services },
    { path: '/services/:id', component: ServiceDetail },
    { path: '/portfolio', component: Portfolio },
    { path: '/portfolio/:id', component: ProjectDetail },
    { path: '/experts', component: Experts },
    { path: '/contact', component: Contact },
  ]
});

export default router;

