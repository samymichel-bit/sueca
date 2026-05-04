import { defineStore } from 'pinia';
import api from '@/api';

export const useMainStore = defineStore('main', {
state: () => ({
    services: [],
    projects: [],
    testimonials: [],
    teamMembers: [],
    talents: [],
  }),
  actions: {
    async fetchServices() {
      const { data } = await api.get('/services/');
      this.services = data;
    },
    async fetchProjects() {
      const { data } = await api.get('/projects/');
      this.projects = data;
    },
async fetchTestimonials() {
      const { data } = await api.get('/testimonials/');
      this.testimonials
});
