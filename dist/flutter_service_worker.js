'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1053af8a0cfacbb3d19b9bb34bf6c701",
"version.json": "a6b67c440645dcd8583761d7ddd24e17",
"index.html": "dbf5e70d5dc44d78d9e072817c5b3fa3",
"/": "dbf5e70d5dc44d78d9e072817c5b3fa3",
"main.dart.js": "7c6270af190ee1849d30bc73ca87e988",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4f27430c54e1955f1ae0335e1b0ae544",
"assets/NOTICES": "4c5927b202ed7ec5e2beb3e63b14d188",
"assets/FontManifest.json": "80ad89deb2b96bae1676b413bf2a4b4a",
"assets/AssetManifest.bin.json": "f20816f345ec29377b5cd6a353f156a1",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "a3096580607510d3710231ef69223b73",
"assets/fonts/MaterialIcons-Regular.otf": "f8fc34fc36d46a30692c932cb6b38f6d",
"assets/assets/ddp_explain.png": "f520105f28dbe1e0dd4336e11eefdce4",
"assets/assets/default_avatar.png": "41b44e0d96a1c4dad33338e6a80f1b75",
"assets/assets/escrow_explain.png": "30961d1c895d567d69f48ff808d68c48",
"assets/assets/mbrics_logo.png": "1f48d5d7115185baa354b7db5415aae5",
"assets/assets/google_logo.png": "670971f841e3fe4652ca6b8aba5c54b4",
"assets/assets/icons/forex_01.png": "6f9701099a12443af4d26bbb5ec222d9",
"assets/assets/icons/forex_02.png": "b466cd41222d5a94fcc9fb792c412b49",
"assets/assets/icons/lang_en.png": "8e713582ad4530148ffee78e56c3df52",
"assets/assets/icons/mm_01.png": "ef02b9eaa411dd492e11872f7dc1f4d9",
"assets/assets/icons/mm_02.png": "12abb810518a02dd8350fb72e138f6bf",
"assets/assets/icons/mm_03.png": "b7864f964489d28afb1228cd79cf38a8",
"assets/assets/icons/lang_cn.png": "a2bfe5bb1c917b74ce9e0d61ad4ff013",
"assets/assets/icons/mm_06.png": "22d1d03f95ab4245fab738c18b404c73",
"assets/assets/icons/instant_settlements_en.png": "1b01e933e5f5f97470afd189f7f48abd",
"assets/assets/icons/trust_01.png": "7416046bf91fe573ce170caffde33f5d",
"assets/assets/icons/mm_04.png": "9ccde489ecc66a70aa8c364e0d3ee562",
"assets/assets/icons/mm_05.png": "88cdb52ff1e90d3153225947446819b1",
"assets/assets/icons/register_6.png": "651b34ef16059fe2f6fb4513f8a34b9b",
"assets/assets/icons/register_4.png": "1734ce76d9e4da7aefc8d137c4c85124",
"assets/assets/icons/register_5.png": "89e2b3df38c7b3ee330fb5add3806fb9",
"assets/assets/icons/register_1.png": "651b34ef16059fe2f6fb4513f8a34b9b",
"assets/assets/icons/register_2.png": "e4d52a4a5d5a2cea3c34e406086a589e",
"assets/assets/icons/register_3.png": "fe01c8a49b2ff3a002654f0d871607a8",
"assets/assets/icons/did_you_know_en.png": "2581bbd5bb1bc65cb7b6b41534b28c28",
"assets/assets/icons/core_functions.png": "ce5218b7353a9afb15b94a4f5dae7599",
"assets/assets/icons/icon_1.png": "b9ab0aeb601049393d398b43251e49c7",
"assets/assets/icons/icon_3.png": "cdf32b206360ef54b24ee11cb46e80dd",
"assets/assets/icons/icon_2.png": "05d16dba0b8cc963d653f5b2e1d6ba3e",
"assets/assets/icons/icon_6.png": "672250edceeabd19722b13dc024e7d67",
"assets/assets/icons/icon_5.png": "dd11b1b57e2536d606f1db634afd91a0",
"assets/assets/icons/icon_4.png": "fd49bc9cc7101b55fd8e54a97520c08c",
"assets/assets/fonts/Inter_28pt-LightItalic.ttf": "53fd3364ffe65ab2ff79f7fe024c83ce",
"assets/assets/fonts/Inter_18pt-ExtraBoldItalic.ttf": "b03bfa9ceab3df1f81834d0523331c30",
"assets/assets/fonts/Inter_24pt-Medium.ttf": "4591e900425d177e6ba268d165bf12e8",
"assets/assets/fonts/Inter_28pt-ExtraLightItalic.ttf": "44168090bcf11276f500c0f02b154ff4",
"assets/assets/fonts/Inter_28pt-Bold.ttf": "ac37d4dadca27dd30e188aa580757645",
"assets/assets/fonts/Inter_28pt-ExtraLight.ttf": "97f88391f7a4de7986e436bdeeb86d8c",
"assets/assets/fonts/Inter_28pt-Thin.ttf": "f045084a42b5d5a11297b0c058ecf884",
"assets/assets/fonts/Inter_28pt-ThinItalic.ttf": "3a4d750a496f2c6e20eef12f2f28443c",
"assets/assets/fonts/Inter_24pt-ExtraBold.ttf": "995fb5ac38b90303c0cc1a0b21e2c9fe",
"assets/assets/fonts/Inter_24pt-SemiBold.ttf": "c77560a8441d664af3e65dd57026dff9",
"assets/assets/fonts/Inter_28pt-BoldItalic.ttf": "91e7c1ba5da0203505e739112a2a5679",
"assets/assets/fonts/Inter_24pt-Regular.ttf": "e48c1217adab2a0e44f8df400d33c325",
"assets/assets/fonts/Inter_28pt-ExtraBoldItalic.ttf": "0a060bf48937936c4aa7d9952dfe1ae8",
"assets/assets/fonts/Inter_18pt-LightItalic.ttf": "6eb3a2d2c6f095080ac034867886d0bf",
"assets/assets/fonts/Inter_18pt-ExtraLight.ttf": "2c6c78d98816958b53fea58451f921d3",
"assets/assets/fonts/Inter_18pt-ThinItalic.ttf": "95d83862ccec5b0d0487f243e34fcc61",
"assets/assets/fonts/Inter_18pt-ExtraBold.ttf": "a6ed481bff60bc9270904d214947ab13",
"assets/assets/fonts/Inter_18pt-BoldItalic.ttf": "da935c5b19ddded26aab2c880d835a8e",
"assets/assets/fonts/Inter_28pt-Light.ttf": "3ea4007efbbb2f30c2c73275eef5c2b0",
"assets/assets/fonts/Inter_18pt-Thin.ttf": "6f2d2f41f504aee66da88684f15d7e1d",
"assets/assets/fonts/Inter_28pt-Medium.ttf": "4bf75147230e93108702b004fdee55df",
"assets/assets/fonts/Inter_18pt-BlackItalic.ttf": "6a6d7edd78447c5edcb33570ce97efe8",
"assets/assets/fonts/Inter_28pt-BlackItalic.ttf": "ff93e5c0c4542fe58a56430a3be67cce",
"assets/assets/fonts/Inter_18pt-ExtraLightItalic.ttf": "24df6449633144fa3f4258c775dd67c5",
"assets/assets/fonts/Inter_24pt-ExtraLightItalic.ttf": "c37c2ef7e42dc86b284a5cbaf8a8efae",
"assets/assets/fonts/Inter_18pt-Black.ttf": "b797a429ef21b9b7d44b96038cdb10f2",
"assets/assets/fonts/Inter_24pt-Light.ttf": "65ec965bd90e1a297cdb3be407420abc",
"assets/assets/fonts/Inter_28pt-SemiBoldItalic.ttf": "f6a4fc371cbdc516f1b3aa53e570e25e",
"assets/assets/fonts/Inter_24pt-ExtraBoldItalic.ttf": "054fe10e7073eb84bf31447dfd79e522",
"assets/assets/fonts/Inter_24pt-MediumItalic.ttf": "5ed286000cb7a0e7b015ec71e190a767",
"assets/assets/fonts/Inter_28pt-SemiBold.ttf": "70c03908b3ab82969b38ba14745f3a54",
"assets/assets/fonts/Inter_18pt-MediumItalic.ttf": "c64a8c393f4d6ffd87f80723727b7f2c",
"assets/assets/fonts/Inter_24pt-BlackItalic.ttf": "1fa0b44e2ca8a6ce911e0fc8cc3b7255",
"assets/assets/fonts/Inter_28pt-Italic.ttf": "457934416e3b66a693b814d64446076e",
"assets/assets/fonts/ShareTechMono-Regular.ttf": "3f66b5f09e49a3619d4d9e4b5fb653ec",
"assets/assets/fonts/Inter_24pt-Thin.ttf": "1e9e30c74648950a240427636b6c1992",
"assets/assets/fonts/Inter_24pt-SemiBoldItalic.ttf": "9685a9dcf0c26640b3828dd34b953bcd",
"assets/assets/fonts/Inter_24pt-Black.ttf": "2392341284c30f5fffb9fe0ab0cd983e",
"assets/assets/fonts/Inter_18pt-Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/assets/fonts/Inter_28pt-Regular.ttf": "fc20e0880f7747bb39b85f2a0722b371",
"assets/assets/fonts/Inter_28pt-MediumItalic.ttf": "ecec8d44b9cfb67aafab4573295b3c29",
"assets/assets/fonts/Inter_28pt-ExtraBold.ttf": "7c8dddeead3a39ebb25d4be0e0c4b876",
"assets/assets/fonts/Inter_24pt-Bold.ttf": "a041f18d0d0c67b376bec0343f7c0cf0",
"assets/assets/fonts/Inter_18pt-Italic.ttf": "ab4004692577ac82604c777fa83da556",
"assets/assets/fonts/Inter_28pt-Black.ttf": "298c6ce1b2641dfe1647544180b67fd1",
"assets/assets/fonts/Inter_18pt-SemiBoldItalic.ttf": "0f93bef7d8e8ea0612ba37a71efcccff",
"assets/assets/fonts/Inter_24pt-BoldItalic.ttf": "79bdd17736cfe1b6ca071a6e298691ed",
"assets/assets/fonts/Inter_18pt-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/fonts/Inter_24pt-ThinItalic.ttf": "27a3a82e0df426a69c7a7562a2293bda",
"assets/assets/fonts/Inter_24pt-ExtraLight.ttf": "8da347e947a38e1262841f21fe7c893e",
"assets/assets/fonts/Inter_24pt-Italic.ttf": "0b52c6d11ac407c2ef591475f2b4ed11",
"assets/assets/fonts/Inter_24pt-LightItalic.ttf": "a401ba0ab41163ff9ec6247c023b1c68",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
