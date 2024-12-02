'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "27e08a51eab8a0ec3859e8e67303f152",
"firebase-debug.log": "72c1f485600332f4c09c8907f54fb136",
"version.json": "0a1050a279fb1c82ae6e532e315654f1",
"index.html": "9969b27c7a28bb670e2ef74180dd48c3",
"/": "9969b27c7a28bb670e2ef74180dd48c3",
"main.dart.js": "301c62fa83121b5ab159527bc2b4beb6",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3cda6cd276510ec3dbd05a8276a60afe",
"assets/AssetManifest.json": "08f166d276920d0ded2b2a3b6edf0e7c",
"assets/NOTICES": "cf1b8bc7c818494e0ee83e5c9ecb513e",
"assets/FontManifest.json": "8724d6913e44114fff0a253e90e35198",
"assets/AssetManifest.bin.json": "ca4ca1ec3dfdacbe69b81c2e0e5ba7d4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/packages/feather_icons/fonts/feather.ttf": "ad5435302c3c2d1f23f275d0f22d36c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "98f53d0dcce64350471888823618d595",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/offers/2.png": "eafff0126110e0ee75b2a89d8eec23fa",
"assets/assets/offers/3.png": "217de3aadcc966bd051b76ebbfa8490a",
"assets/assets/offers/1.png": "639a1363be76a13bca1d6ef0067db5ce",
"assets/assets/cat8/4.png": "bcc8c119d9f4ab8ea8d98f4343537aee",
"assets/assets/cat8/5.png": "51059a4b211e6556e6f26e63db7f4167",
"assets/assets/cat8/2.png": "47c0530823720b0bacbb254b0a4ceb79",
"assets/assets/cat8/3.png": "e36f9cf73c7f0a26731cdc595177f675",
"assets/assets/cat8/1.png": "fc24fe4b46cb9e9aaedffbcde4d55387",
"assets/assets/cat6/4.png": "aa296914b5b6a5910e30a8f9f6a70a20",
"assets/assets/cat6/5.png": "8175e4f73180f0bbb9ff6ec6774b19a5",
"assets/assets/cat6/2.png": "ad2c3c1a0f7f6424541106b973c0c833",
"assets/assets/cat6/3.png": "19252c5c02da5fa1fe4bdc1f7437a048",
"assets/assets/cat6/1.png": "a3510b244424bb75d9baa40b0e558831",
"assets/assets/cat1/8.png": "4c307acb64c874d15749f5d15c85feda",
"assets/assets/cat1/4.png": "f80f5789470673e2a78cb83bdb9e0e39",
"assets/assets/cat1/5.png": "3c09fac911c56cdf9189b98d51bd377c",
"assets/assets/cat1/7.png": "40efb3d69f03aa47546efd25f74ccf95",
"assets/assets/cat1/6.png": "bacaa1ffa1f16372351464a471cdab76",
"assets/assets/cat1/2.png": "611f551ae5bdca100a9ad17b9765bcce",
"assets/assets/cat1/3.png": "d79ad46f585fa031ec467cac3349b457",
"assets/assets/cat1/1.png": "23f3bc3ca00bb77321d2d17596d07682",
"assets/assets/cat0/8.png": "f45cb5d272c2d977b40b1a94a436f8fe",
"assets/assets/cat0/9.png": "5149a704ab2846d7d22161baf2f161b9",
"assets/assets/cat0/12.png": "a3953dc4843cff325a3acbc25c35fb21",
"assets/assets/cat0/11.png": "98a964b13dcad3854102b6df998b2d7c",
"assets/assets/cat0/10.png": "a2c2e6fe7353c96d5b42009c8130f3ea",
"assets/assets/cat0/4.png": "03de4f3234b0f3b322b0bb9d064ed3fb",
"assets/assets/cat0/5.png": "38b3e50a88508990ad55deefb6b0e782",
"assets/assets/cat0/7.png": "9e2f2cc383db9dcb0c0684d9c1896190",
"assets/assets/cat0/6.png": "65d607eb2c987554f6f76147c38000cd",
"assets/assets/cat0/2.png": "ae31d5bf0a28bb1ddce6b7036ec24352",
"assets/assets/cat0/3.png": "4f5756e63552ab6fb790d1e350bedf3b",
"assets/assets/cat0/1.png": "d2baabc40dbc08069ebb381409bd4ec3",
"assets/assets/cat7/4.png": "03eb6aa88f7e253957ad374d8d685892",
"assets/assets/cat7/5.png": "50896292d83b2cad0c9c78ed9dfc332c",
"assets/assets/cat7/6.png": "bbeefe2fe070b861239ce0533fd73013",
"assets/assets/cat7/2.png": "f8fd8b96754c3dad298184db6934ebd8",
"assets/assets/cat7/3.png": "6235cf5c337cab0734c52bc31752003b",
"assets/assets/cat7/1.png": "90492d2ce5852f43c4a986e3658dfcd7",
"assets/assets/cat9/8.png": "ba65b8f403953dbb021201e0d0418df8",
"assets/assets/cat9/4.png": "b6126d9697ed612e3726a5e8f4bcecbe",
"assets/assets/cat9/5.png": "f90467cbbc42b9ba8e3a5af5d177e5d9",
"assets/assets/cat9/7.png": "4d5eec4711ae2d294f75127fb90a9c22",
"assets/assets/cat9/6.png": "451bb9b49a09bf2dbeba8b98f8e03a71",
"assets/assets/cat9/2.png": "8e19c8f9c39a3f7df0d3d11dff81d811",
"assets/assets/cat9/3.png": "39f2f98c41d1aae51ba1fa68fc68f5c8",
"assets/assets/cat9/1.png": "cd19e4dd83de165ee3f9586a350f13a4",
"assets/assets/instagram.png": "682f6d60ca4caae67a645111b303e188",
"assets/assets/cat10/8.png": "d32d5da1068f1e602a4b0695d4e047a6",
"assets/assets/cat10/4.png": "eb28b58fa3c0887753901a19e27ede2e",
"assets/assets/cat10/5.png": "92121ff194f60dc09015ec42db083512",
"assets/assets/cat10/7.png": "d9889dacd7316e019b578b90e54aa309",
"assets/assets/cat10/6.png": "b19aff52f119e3c146f520bc02261c91",
"assets/assets/cat10/2.png": "1a08ee3b1d4f84b87463869df751c1ba",
"assets/assets/cat10/3.png": "73bff3605f73ce298c5344c61707dafb",
"assets/assets/cat10/1.png": "fdbce59b80cca7295d10e93e88794747",
"assets/assets/cat11/4.png": "04946685e8587d873c18b7ceff72e1b5",
"assets/assets/cat11/5.png": "2ebf0b4120e615e84e0c3dad152f1a2b",
"assets/assets/cat11/7.png": "ab0a9d676363631ef336068d16d1cad1",
"assets/assets/cat11/6.png": "68e177b8ebf9852461cf4c94c6a29dbd",
"assets/assets/cat11/2.png": "118a9ad022737599899f8e50f3bee934",
"assets/assets/cat11/3.png": "3f59bbd89ddf025f247eb9e8dc6719f9",
"assets/assets/cat11/1.png": "f01858f3fbcdd4a05f8ccc95f2f55250",
"assets/assets/Menu_Arabic.json": "9467e9590e72498a8b3494661b86f1ae",
"assets/assets/cat2/8.png": "3122dbf3b3ef829e9fd948eab6447391",
"assets/assets/cat2/9.png": "644b85fe9952d1ff7a80c9afcf86dfac",
"assets/assets/cat2/10.png": "ca1b51f151a9448dad71380378baf3a2",
"assets/assets/cat2/4.png": "5d390280043d81e904af652a7b53c58b",
"assets/assets/cat2/5.png": "71d96f206cadd5d1406e5f01d839a5a1",
"assets/assets/cat2/7.png": "71d96f206cadd5d1406e5f01d839a5a1",
"assets/assets/cat2/6.png": "ed0295360b4d85aae56d85ecc533025d",
"assets/assets/cat2/2.png": "ded3403932623edf32bc6ced144885c5",
"assets/assets/cat2/3.png": "fc228b4a307e60be7b1ed9b5b2052ff3",
"assets/assets/cat2/1.png": "1c5cd66ca2ac7991048f1d86aaf6f719",
"assets/assets/cat5/4.png": "fde9430c9170bb75410e9d3b3884ddd5",
"assets/assets/cat5/5.png": "b8b030b73fbb993829556b31344b294c",
"assets/assets/cat5/6.png": "4cdc895f408df90b3250cfc47e7e011c",
"assets/assets/cat5/2.png": "ea5f48196ecfc61ac85c5b9bea6e29d5",
"assets/assets/cat5/3.png": "14a76c79aa81cca8ebda2d1d5dbe0fbb",
"assets/assets/cat5/1.png": "06a0b3afd4dfb48a32ef8944d98162bf",
"assets/assets/cat4/4.png": "d50ad491b134821f03e21b916fb9d424",
"assets/assets/cat4/5.png": "eeac3665b6de40b09f6d87298e2e6e38",
"assets/assets/cat4/2.png": "64335f2a187bcdfdb1b5639321498f38",
"assets/assets/cat4/3.png": "3c5ac9d9c3cd09db51c08c1088481de7",
"assets/assets/cat4/1.png": "1d5993b264a95a7cce921150e5d71b25",
"assets/assets/cat3/8.png": "c6fcfa1f7d8cf0016832d2d586e192f9",
"assets/assets/cat3/9.png": "8b8b88f1a0d67a4f72267ec5a2268011",
"assets/assets/cat3/12.png": "ce0fa208b1f19e7dc50d70ed2b0823b1",
"assets/assets/cat3/11.png": "10dad35c6aefdd5160ad82718ab806d2",
"assets/assets/cat3/10.png": "264f34fc692f0a39e6beea898e6011ae",
"assets/assets/cat3/4.png": "4aa546fdce260f141883993a4c67a1b0",
"assets/assets/cat3/5.png": "124e452d2c9b2b18cd804e31ade22738",
"assets/assets/cat3/7.png": "57a6852bd61de8a95f37fe5bd4f937f9",
"assets/assets/cat3/6.png": "e5101263d025fe980db106f6b08b4a76",
"assets/assets/cat3/2.png": "94100509ead050235a7cea199da65523",
"assets/assets/cat3/3.png": "c8a97bf14dcbfba94eed1bcca1469d39",
"assets/assets/cat3/1.png": "d586f6b230a9476b7b0d9eb701007d8c",
"assets/assets/b.png": "9b215f465c1b3c664d0195e3bd8d3345",
"assets/assets/Menu_Kurdish.json": "2ea6498f6e7cf1063d9b007dac5e858b",
"assets/assets/Menu_Turkish.json": "bc7851d1a3bb49485630b0955403b323",
"assets/assets/Menu_English.json": "ebbe2f45f2992f295bafd733bab75feb",
"assets/assets/Categories/8.png": "1356fcb8588de663e16b7aeb7b7712c0",
"assets/assets/Categories/9.png": "60c12dcca4dd15947b390471eb9ce1dd",
"assets/assets/Categories/12.png": "65e70b445bf2b0bf729501e6c6dfdf02",
"assets/assets/Categories/13.png": "cf577cff787044cdf6d7f8c1ae7d1cc6",
"assets/assets/Categories/11.png": "00d8f4d4e404153d59d67f9af1f2949e",
"assets/assets/Categories/10.png": "b98f16f96f53bcb95267b60511034bca",
"assets/assets/Categories/4.png": "8e48eaf7ecba31e16d0d05598640d86b",
"assets/assets/Categories/5.png": "5da91bbe1bb2d93da3414f2f75c626dc",
"assets/assets/Categories/7.png": "e410d9158ae483738c2d5247e90aa4c3",
"assets/assets/Categories/6.png": "9d3b736f7ede5c0a123e5e4c8a25cf37",
"assets/assets/Categories/2.png": "ac7bbdea519ec0a94036934dbf96e01c",
"assets/assets/Categories/3.png": "0777237280e4ab3a62baedb7300f6f03",
"assets/assets/Categories/1.png": "3f4b173bd6642e8182c0762cc67ed29c",
"assets/assets/milkshake.jpg": "178716112e46b6b3f9edac4cce9c1bda",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
