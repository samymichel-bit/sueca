import { defineStore } from 'pinia';
import api from '@/api';

export const useMainStore = defineStore('main', {
  state: () => ({
    services: [],
    projects: [],
    testimonials: [],
    teamMembers: [],
    talents: [],
    errors: {
      services: null,
      projects: null,
      testimonials: null,
      teamMembers: null,
      talents: null,
    },
    loading: {
      services: false,
      projects: false,
      testimonials: false,
      teamMembers: false,
      talents: false,
    },
  }),
  actions: {
    async fetchServices() {
      this.loading.services = true
      this.errors.services = null
      try {
        const { data } = await api.get('/services/')
        this.services = data
      } catch (e) {
        this.errors.services = e
      } finally {
        this.loading.services = false
      }
    },
    async fetchProjects() {
      this.loading.projects = true
      this.errors.projects = null
      try {
        const { data } = await api.get('/projects/')
        this.projects = data
      } catch (e) {
        this.errors.projects = e
      } finally {
        this.loading.projects = false
      }
    },
    async fetchTestimonials() {
      this.loading.testimonials = true
      this.errors.testimonials = null
      try {
        const { data } = await api.get('/testimonials/')
        this.testimonials = data
      } catch (e) {
        this.errors.testimonials = e
      } finally {
        this.loading.testimonials = false
      }
    },
    async fetchTeamMembers() {
      this.loading.teamMembers = true
      this.errors.teamMembers = null
      try {
        const { data } = await api.get('/team/')
        this.teamMembers = data
      } catch (e) {
        this.errors.teamMembers = e
      } finally {
        this.loading.teamMembers = false
      }
    },
    async fetchTalents() {
      this.loading.talents = true
      this.errors.talents = null
      try {
        const { data } = await api.get('/talents/')
        this.talents = data
      } catch (e) {
        this.errors.talents = e
      } finally {
        this.loading.talents = false
      }
    },
  },
});

