import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import About from '@/views/About.vue'
import Services from '@/views/Services.vue'
import ServiceDetail from '@/views/ServiceDetail.vue'
import Portfolio from '@/views/Portfolio.vue'
import Contact from '@/views/Contact.vue'
import Register from '@/views/Register.vue'
import Login from '@/views/Login.vue'
import Dashboard from '@/views/Dashboard.vue'
import OrderDetail from '@/views/OrderDetail.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: Home },
    { path: '/about', component: About },
    { path: '/services', component: Services },
    { path: '/services/:id', component: ServiceDetail },
    { path: '/portfolio', component: Portfolio },
    { path: '/contact', component: Contact },
    { path: '/register', component: Register },
    { path: '/login', component: Login },
    { path: '/dashboard', component: Dashboard },
    { path: '/dashboard/:id', component: OrderDetail },
    
  ]
})

export default router