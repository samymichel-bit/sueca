/**
 * Helper pour construire les URLs des médias
 * Utilise VITE_API_URL de l'environnement
 */
export function mediaUrl(path) {
  if (!path) return '/placeholder.jpg';
  if (path.startsWith('http')) return path;
  
  // Récupérer l'URL de base depuis les variables d'environnement
  const baseURL = import.meta.env.VITE_API_URL || 'http://localhost:8000';
  
  // Retirer /api/v1 pour obtenir l'URL racine du serveur
  const serverURL = baseURL.replace('/api/v1', '');
  
  return `${serverURL}${path}`;
}
