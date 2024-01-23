const CACHE_NAME = 'SpoHealApp-Cache-v15';

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll([
        '/',
        '/manifest.json',
        '/favicon.ico',
      ]);
    })
    .catch((error) => {
      console.error('Error durante la instalación del Service Worker:', error);
    })
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    })
    .catch((error) => {
      console.error('Error durante la activación del Service Worker:', error);
    })
  );
});