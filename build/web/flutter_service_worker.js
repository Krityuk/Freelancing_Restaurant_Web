'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "63b28bee23d12a0a2811b4ac95310daf",
"assets/AssetManifest.json": "bc97a0f1bb05886e5c972b9e1bef0f96",
"assets/assets/foods/aaloo.png": "92e4495aef2fc44a08f97c3b535f9262",
"assets/assets/foods/balosahi.png": "e97b6a9d47d19e3e26e4289631cb7417",
"assets/assets/foods/combo.png": "5f716f66e8c7fffeaf2933f23ed4cf38",
"assets/assets/foods/dal.png": "914b1a57dd7c1c88a47fab5927d6b798",
"assets/assets/foods/gravy.png": "3343971b011242540524185053279895",
"assets/assets/foods/khichdi.png": "6f0a93bf5bb3d0c69d3d6dd6d61fd78e",
"assets/assets/foods/meal.png": "2248f62977b180cf2e22c55905caea0b",
"assets/assets/foods/menuButton.png": "0b79d5da6b1b49196220012fc02922db",
"assets/assets/foods/menulist.png": "ef2389593a610d32b72b75d4193e239b",
"assets/assets/foods/paneer.png": "b4f4e16ad8caad90c5149fe448acbaab",
"assets/assets/foods/rice.png": "b1344e5b8610dc92ef10b8b741480a3d",
"assets/assets/foods/roti.png": "09a6ecedd25a86610355c3e2ed7eaab7",
"assets/assets/foods/sukhi.png": "9e46a59b9d3ed92dfa247d537e032469",
"assets/assets/images/analytics.png": "610a95aedc2c0c32d1316562dc8ec248",
"assets/assets/images/brush-stroke.png": "41854d93cc2b183ac9bf55e4b5097846",
"assets/assets/images/coding.png": "af1b456dad3dd6f43f14994963b57316",
"assets/assets/images/face.png": "3e569c0b44e18cf4ac36c2f52ca2c4fc",
"assets/assets/images/free1.png": "2343c1d4f32cb677adf2719660055930",
"assets/assets/images/free_.png": "5c6060a12f4305ffa7392a214aef817a",
"assets/assets/images/git.png": "7b08b14f30c2110a685bafcd33e8a480",
"assets/assets/images/image1.jpeg": "c042c8bfd98ddbbeceb37c892a8fcdc7",
"assets/assets/images/image2.jpeg": "9e8caa712373c22c1888ebf393fadf0a",
"assets/assets/images/image3.jpeg": "8bb5c6c1bd7b6bf783a9874f5900ea29",
"assets/assets/images/image4.jpeg": "ea24d89966b8a5bb876c88c2ecd648a5",
"assets/assets/images/image5.jpeg": "3da997133ff6a881c4652fba6bd03439",
"assets/assets/images/in.png": "a65bf53ef6a1d1555120edfc1810f551",
"assets/assets/images/insta.png": "bd3f44e94e19e2cd2fed522e65f67657",
"assets/assets/images/pro1.png": "a618dc4969d82a6d2ece39a7ee5d11f1",
"assets/assets/images/pro2.png": "c25801745513b563c939c527a2d2d46f",
"assets/assets/images/share.png": "7d05af750cd03cdda7f247d7dc8b532e",
"assets/assets/images/twit.png": "3f2b027c50dd30dd9abeeaeb1b68b1c3",
"assets/assets/images/WhatsApp%2520Image%25202023-09-18%2520at%252010.12.58%2520PM%2520(1).jpeg": "10dc549f05ef2f782adb99be891b8247",
"assets/assets/images/WhatsApp%2520Image%25202023-09-18%2520at%252010.13.00%2520PM.jpeg": "6b99c19c3059cf681de18e35ebcabd67",
"assets/assets/images/WhatsApp%2520Image%25202023-09-18%2520at%252010.13.01%2520PM%2520(1).jpeg": "3750594d61664750425031bc7d4b7899",
"assets/assets/images/WhatsApp%2520Image%25202023-09-18%2520at%252010.13.02%2520PM.jpeg": "f2631f06b79e4c190b553dd3611f3e2d",
"assets/assets/images/work1.jpg": "58bbc11e54a3643754df21fd0d1e59a8",
"assets/assets/images/work2.jpg": "8ac2eef16dd7a05a53702e965891c948",
"assets/assets/json/menu.json": "da5fab201799bb51e3c08ad7630100cb",
"assets/assets/menu/menu1.jpg": "e33fde6b1847874cd5e52435bab94f7e",
"assets/assets/menu/menu2.jpg": "e13406fafabf23b34d384bf75d745989",
"assets/assets/menu/menu3.jpg": "c56025a74afe65424824cf9b0d35faf7",
"assets/assets/menu/menuButton.png": "0b79d5da6b1b49196220012fc02922db",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0829cfdfa19842f707f0578f92db1778",
"assets/NOTICES": "c5f4947387e7427927c835e47c25c969",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "637e2b09466570f9dfcfb2472bce1daa",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9f78f3ac31e61181f0cf318a3fd54523",
"/": "9f78f3ac31e61181f0cf318a3fd54523",
"main.dart.js": "073c7580fe5877abe3f1ecce74ec6d87",
"manifest.json": "aa7c44298591ebe73a2c0e94ab68efb8",
"version.json": "3a56f0068393d1f9b7d37f7c8f92c422"};
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
