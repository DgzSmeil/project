var Countly = Countly || {};
Countly.q = Countly.q || [];
Countly.app_key = '773a8efadc921a1969ffd532c4960e063e9df841';
Countly.url = 'https://countly.51cto.com';
Countly.q.push(['track_sessions']);
Countly.q.push(['track_pageview']);
Countly.q.push(['track_clicks']);
Countly.q.push(['track_errors']);
/*(function() {
    var cly = document.createElement('script'); cly.type = 'text/javascript';
    cly.async = true;
    cly.src = 'http://countly.51cto.com/sdk/web/countly.min.js';
    cly.onload = function(){Countly.init()};
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(cly, s);
})();
*/