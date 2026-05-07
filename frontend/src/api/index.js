import axios from 'axios';

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://192.168.1.194:8000/api/v1',
  timeout: 10000,
});

export default api;
