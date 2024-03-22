'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "c2f8395ccf228f381e59b68201d4875a",
"index.html": "dd456d8dae7f70feaec0f041bcb94b3e",
"/": "dd456d8dae7f70feaec0f041bcb94b3e",
"main.dart.js": "22b5323499ee2394449976d5fe52451d",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "08580d76d1a04191e53d53f1f2b6f6df",
"assets/AssetManifest.json": "1fc0f5af29ac6801504adc4c97b9e0e9",
"assets/NOTICES": "544fb9f04d59ba554cb69f7c6780eb66",
"assets/FontManifest.json": "8df584a9c6dd450cf02283e05acd69de",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "d5a03af663b68980b4aac788a391c8c7",
"assets/fonts/sfmono.otf": "f28892de5e5d3e75a4247d62be1e6cf0",
"assets/fonts/MaterialIcons-Regular.otf": "4ff8d79be03d0f002072bc6677e91d0e",
"assets/assets/svg/emtees.png": "8cb27ed211b88436b9add03e4734d7e6",
"assets/assets/svg/eduon.png": "05269ff96528db2573fdef3f15a3cf7e",
"assets/assets/svg/github.svg": "c0e94df08ad3d521af33fa4ad69e2162",
"assets/assets/svg/GenLive.png": "07e8505949308d92ee31fce16c927150",
"assets/assets/svg/appLogo.png": "7df7d2690ea72b34c624b25dfaec2644",
"assets/assets/svg/tetris.svg": "aed2bed354a99caef2018d99af16b1d5",
"assets/assets/svg/GenWorksLive.png": "49e14cd172dd6112526418c006c53e5e",
"assets/assets/svg/instagram.svg": "0f51da178eff1d87826480d0e5db970b",
"assets/assets/svg/profilePic.jpg": "8ab2142bc31e795fa79f7ceb6d0695f6",
"assets/assets/svg/externalLink.svg": "0643c8ac463560aa447647c1a6ecafb8",
"assets/assets/svg/inmakes.png": "6492a77ebce0086d2b80091579485541",
"assets/assets/svg/GenService.png": "60e8c36b0a6838bb07aacc9b7556fa36",
"assets/assets/svg/googlePlay.svg": "afea3054a7aa83436e06822ca443718d",
"assets/assets/svg/NoData.png": "5488e0ea22f996684e5fc26021876061",
"assets/assets/svg/tetrisLogo.svg": "331417e7b94c0fe0633ee1a44e8ea92e",
"assets/assets/svg/stackoverflow.svg": "ec181e798c8b9fe73dcf64d47926667a",
"assets/assets/svg/profile.jpg": "2f576f1b6aee2689a657b137a27a603d",
"assets/assets/svg/profile.png": "3c44ab2e7bd2a28ef93c45984da1e671",
"assets/assets/svg/TargetParent.png": "2bbc1af5fbc96aa6efc9fa542817fced",
"assets/assets/svg/introImage.jpg": "e56ec0c3c9f41575a31e7d70ce20065e",
"assets/assets/svg/HomeImage.jpg": "c411b94f922356c9c30a5a36cb58e2e5",
"assets/assets/svg/linkedIn.svg": "c408ef7fbd143d9052cd195819076f90",
"assets/assets/svg/twitter.svg": "d278ea034ebbe0c01e76739232fa2a3e",
"assets/assets/svg/TargetLearning.png": "50c6fe42741fd14f0c7a025ff2e47cb2",
"assets/assets/svg/folder.svg": "46a545a4289ba140f5b90613ceccd879",
"assets/assets/lright.png": "43d0ae737b59d92884ad02e07356d40b",
"assets/assets/lleft.png": "544a834902df4faa60240b87bb3cd4c4",
"assets/assets/na.png": "6ab30470a8c58fac0b1ae4c1af3ea49f",
"assets/assets/line.png": "50c295964ed314248e60a88a51f33eee",
"assets/assets/square.png": "32c79b2828f4043a32542bb303d5b853",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
