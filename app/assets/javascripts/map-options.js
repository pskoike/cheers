window.GEOLOCATOR_OPTIONS = {
  enableHighAccuracy: false,
  timeout: 5000,
  maximumWait: 10000,     // max wait time for desired accuracy
  maximumAge: 0,          // disable cache
  desiredAccuracy: 30,    // meters
  fallbackToIP: true,     // fallback to IP if Geolocation fails or rejected
  addressLookup: true,    // requires Google API key if true
  //timezone: true,         // requires Google API key if true
  //map: {element: "map-canvas"},      // interactive map element id (or options object)
  //staticMap: true         // map image URL (boolean or options object)
  };


window.MAP_OPTIONS = {
  center: {lat: -23.533773, lng: -46.625290},
  zoom: 11,
  zoomControl: true,
  mapTypeControl: false,
  zoomControl: false,
  fullscreenControl: false,
  streetViewControl: false,
  scrollwheel: false,
  draggable: true,

  styles: [{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#7dcdcd"}]}]
};
