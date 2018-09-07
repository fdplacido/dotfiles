// To reset a preference, first comment it out (put //) then go to about:config and change it

// Check up to date examples:
// https://github.com/ghacksuserjs/ghacks-user.js
// https://github.com/atomGit/Firefox-user.js
// https://gist.github.com/0XDE57/fbd302cef7693e62c769

// START: internal custom pref to test for syntax errors
// [NOTE] In FF60+, not all syntax errors cause parsing to abort i.e. reaching the last debug
// pref no longer necessarily means that all prefs have been applied. Check the console right
// after startup for any warnings/error messages related to non-applied prefs
// [1] https://blog.mozilla.org/nnethercote/2018/03/09/a-new-preferences-parser-for-firefox/
user_pref("_user.js.parrot", "START: My Firefox prefs!!");


// Disable geolocalization
user_pref("geo.enabled", false);
user_pref("geo.wifi.uri", "");
user_pref("browser.search.geoip.url", "");
// 0=always ask (default), 1=allow, 2=block
user_pref("permissions.default.geo", 2); 

// Disable WebSockets - WebRTC
user_pref("media.peerconnection.enabled", false);
user_pref("network.websocket.enabled", false);

// // Disable Google Safe Browsing and malware and phishing protection.
// // Stop sending links and downloading lists from google.
// // Security risk, but privacy improvement.
// user_pref("browser.safebrowsing.enabled", false);
// user_pref("browser.safebrowsing.phishing.enabled", false);
// user_pref("browser.safebrowsing.malware.enabled", false  );
// user_pref("browser.safebrowsing.downloads.enabled", false);
// user_pref("browser.safebrowsing.provider.google4.dataSharing.enabled", "");
// user_pref("browser.safebrowsing.provider.google4.updateURL", "");
// user_pref("browser.safebrowsing.provider.google4.reportURL", "");
// user_pref("browser.safebrowsing.provider.google4.reportPhishMistakeURL", "");
// user_pref("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", "");
// user_pref("browser.safebrowsing.provider.google4.lists", "");
// user_pref("browser.safebrowsing.provider.google4.gethashURL", "");
// user_pref("browser.safebrowsing.provider.google4.dataSharingURL", "");
// user_pref("browser.safebrowsing.provider.google4.dataSharing.enabled", false);
// user_pref("browser.safebrowsing.provider.google4.advisoryURL", "");
// user_pref("browser.safebrowsing.provider.google4.advisoryName", "");
// user_pref("browser.safebrowsing.provider.google.updateURL", "");
// user_pref("browser.safebrowsing.provider.google.reportURL", "");
// user_pref("browser.safebrowsing.provider.google.reportPhishMistakeURL", "");
// user_pref("browser.safebrowsing.provider.google.reportMalwareMistakeURL", "");
// user_pref("browser.safebrowsing.provider.google.pver", "");
// user_pref("browser.safebrowsing.provider.google.lists", "");
// user_pref("browser.safebrowsing.provider.google.gethashURL", "");
// user_pref("browser.safebrowsing.provider.google.advisoryURL", "");
// user_pref("browser.safebrowsing.downloads.remote.url", "");
// user_pref("browser.safebrowsing.appRepURL", false);

// // Can call home to every time firefox is started or home page is visited.
// // https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections
// // http://kb.mozillazine.org/Connections_established_on_startup_-_Firefox
// user_pref("browser.selfsupport.url", "");
// user_pref("browser.aboutHomeSnippets.updateUrL", "");
// user_pref("browser.startup.homepage_override.mstone", "ignore");
// user_pref("browser.startup.homepage_override.buildID", "");
// user_pref("startup.homepage_welcome_url", "");
// user_pref("startup.homepage_welcome_url.additional", "");
// user_pref("startup.homepage_override_url", "");

// Tracking protection
user_pref("privacy.trackingprotection.enabled", true);

// Recovery file lest frequent (less write to SSD)
// Set it higher
user_pref("browser.sessionstore.interval", 30000);

// Disable pocket
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.site", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");
user_pref("extensions.pocket.api", "");

// Don't allow websites to block right-click
// One can do shift+right click
user_pref("dom.event.contextmenu.enabled", false);

// Don't allow websites to prevent copy and paste.
// Disable notifications of copy, paste, or cut functions.
// Stop webpage knowing which part of the page had been selected.
user_pref("dom.event.clipboardevents.enabled", false);

// Disable site reading installed plugins.
user_pref("plugins.enumerable_names", "");

// // Tells website where you came from. Disabling may break some sites.
// // 0 = Disable referrer headers. 
// // 1 = Send only on clicked links.
// // 2 = (default) Send for links and image.
// user_pref("network.http.sendRefererHeader", 0);

// // Disable referrer headers between https websites.
// user_pref("network.http.sendSecureXSiteReferrer", false);

// no telemetry cached
user_pref("toolkit.telemetry.cachedClientID", "");

// Prevent website tracking clicks.
user_pref("browser.send_pings", false);
// Only send pings if send and receiving host match (same website).
user_pref("browser.send_pings.require_same_host", true);

// Disable website reading how much battery your mobile device or laptop has.
user_pref("dom.battery.enabled", false);

// // Disable cookies.
// // 0 = All cookies are allowed. (Default) 
// // 1 = Only cookies from the originating server are allowed. (block third party cookies)
// // 2 = No cookies are allowed. 
// // 3 = Third-party cookies are allowed only if that site has stored cookies already from a previous visit 
// user_pref("network.cookie.cookieBehavior", 0);

// // cookies are deleted at the end of the session
// // 0 = The cookie's lifetime is supplied by the server. (Default) 
// // 1 = The user is prompted for the cookie's lifetime. 
// // 2 = The cookie expires at the end of the session (when the browser closes). 
// // 3 = The cookie lasts for the number of days specified by network.cookie.lifetime.days.   
// user_pref("network.cookie.lifetimePolicy ", 0);

// Disables saving of form data.
user_pref("browser.formfill.enable", false);

// // Disables caching for ssl connections.
// user_pref("browser.cache.disk_cache_ssl", false);

// // Disables caching in memory.
// user_pref("browser.cache.memory.enable", false);

// // Disables caching on hardrive.
// user_pref("browser.cache.disk.enable", false);

// Link prefetching is when a webpage hints to the browser that certain pages are likely to be visited, 
// so the browser downloads them immediately so they can be displayed immediately when the user requests it.
user_pref("network.predictor.enabled", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);

// Disable prefetch link on hover.
user_pref("network.http.speculative-parallel-limit", 0);

//////////////////////
// Performance
//////////////////////

// Increases animation speed. May mitigate choppy scrolling.
user_pref("layout.frame_rate.precise", true);

user_pref("browser.tabs.animate", false);
user_pref("browser.download.animateNotifications", false);

//////////////////////
// Other
//////////////////////

// // Show punycode. Help protect from character 'spoofing`
// user_pref("network.IDN_show_punycode", true);

// // (Meh) Toggle Tabs alt+tab style
// user_pref("browser.ctrlTab.previews", true);

// // Disables acceptance of session cookies.
// user_pref("network.cookie.alwaysAcceptSessionCookies", false);

// // Number of cached DNS entries. Lower number = More requests but less data stored.
// user_pref("network.dnsCacheEntries", 100);

// // Time DNS entries are cached in seconds.
// user_pref("network.dnsCacheExpiration", 60);

// // disable GeoIP-based search results
// // [NOTE] May not be hidden if Firefox has changed your settings due to your locale
// // [1] https://trac.torproject.org/projects/tor/ticket/16254
// // [2] https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections#w_geolocation-for-default-search-engine
// user_pref("browser.search.countryCode", "US"); // (hidden pref)
// user_pref("browser.search.region", "US"); // (hidden pref)

// // disable geographically specific results/search engines e.g. "browser.search.*.US"
// // i.e. ignore all of Mozilla's various search engines in multiple locales
// user_pref("browser.search.geoSpecificDefaults", false);
// user_pref("browser.search.geoSpecificDefaults.url", "");

// // 0330: disable telemetry
// // the pref (.unified) affects the behaviour of the pref (.enabled)
// // IF unified=false then .enabled controls the telemetry module
// // IF unified=true then .enabled ONLY controls whether to record extended data
// // so make sure to have both set as false
// // [NOTE] FF58+ `toolkit.telemetry.enabled` is now LOCKED to reflect prerelease
// // or release builds (true and false respectively), see [2]
// // [1] https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/telemetry/internals/preferences.html
// // [2] https://medium.com/georg-fritzsche/data-preference-changes-in-firefox-58-2d5df9c428b5
// user_pref("toolkit.telemetry.unified", false);
// user_pref("toolkit.telemetry.enabled", false); // see [NOTE] above FF58+
// user_pref("toolkit.telemetry.server", "data:,");
// user_pref("toolkit.telemetry.archive.enabled", false);
// user_pref("toolkit.telemetry.cachedClientID", "");
// user_pref("toolkit.telemetry.newProfilePing.enabled", false); // (FF55+)
// user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // (FF55+)
// user_pref("toolkit.telemetry.updatePing.enabled", false); // (FF56+)
// user_pref("toolkit.telemetry.bhrPing.enabled", false); // (FF57+) Background Hang Reporter
// user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // (FF57+)
// user_pref("toolkit.telemetry.hybridContent.enabled", false); // (FF59+)

// // 0502: disable Mozilla permission to silently opt you into tests
// user_pref("network.allow-experiments", false);

// // 0503: disable Normandy/Shield (FF60+)
// // Shield is an telemetry system (including Heartbeat) that can also push and test "recipes"
// // [1] https://wiki.mozilla.org/Firefox/Shield
// // [2] https://github.com/mozilla/normandy
// user_pref("app.normandy.enabled", false);
// user_pref("app.normandy.api_url", "");
// user_pref("app.shield.optoutstudies.enabled", false);
// user_pref("shield.savant.enabled", false); // (FF61+)

// // 0513: disable Follow On Search (FF53+)
// // Just DELETE the XPI file in your System Add-ons directory
// // [1] https://blog.mozilla.org/data/2017/06/05/measuring-search-in-firefox/

// // 0514: disable Activity Stream (FF54+)
// // Activity Stream is the default homepage/newtab in FF57+. It is based on metadata and browsing behavior,
// // and includes telemetry and web content such as snippets, top stories (pocket), top sites, etc.
// //  - ONE: make sure to set your "home" and "newtab" to about:blank (or use an extension to control them)
// //  - TWO: DELETE the XPI file in your System Add-ons directory (note this get reinstalled on app updates)
// // And/or you can try to control the ever-growing, ever-changing "browser.newtabpage.activity-stream.*" prefs
// // [1] https://wiki.mozilla.org/Firefox/Activity_Stream
// // [2] https://www.ghacks.net/2016/02/15/firefox-mockups-show-activity-stream-new-tab-page-and-share-updates/
// user_pref("browser.library.activity-stream.enabled", false); // (FF57+)

// // 0517: disable Form Autofill (FF55+)
// // [SETTING] Privacy & Security>Forms & Passwords>Enable Profile Autofill
// // [NOTE] Stored data is NOT secure (uses a JSON file)
// // [NOTE] Heuristics controls Form Autofill on forms without @autocomplete attributes
// // [1] https://wiki.mozilla.org/Firefox/Features/Form_Autofill
// // [2] https://www.ghacks.net/2017/05/24/firefoxs-new-form-autofill-is-awesome/
// user_pref("extensions.formautofill.addresses.enabled", false);
// user_pref("extensions.formautofill.available", "off"); // (FF56+)
// user_pref("extensions.formautofill.creditCards.enabled", false); // (FF56+)
// user_pref("extensions.formautofill.heuristics.enabled", false);

//////////////////////
// End
//////////////////////

// END: internal custom pref to test for syntax errors
user_pref("_user.js.parrot", "FINISH: My Firefox prefs!!");
