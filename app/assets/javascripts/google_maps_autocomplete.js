$(document).ready(function() {
  var flat_address = $('#confirmation_leaving_address').get(0);

  if (flat_address) {
    var autocomplete = new google.maps.places.Autocomplete(flat_address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(flat_address, 'keydown', function(e) {

      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});





function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  //document.getElementsById('#confirmation_leaving_address')[0].placeholder='XXXXXX';
  console.log('testXXXX');
  var coord = {lat: place.geometry.location.lat(), lng:  place.geometry.location.lng()};

  markers[0].setMap(null);
  markers = [];
  //var map = new google.maps.Map(document.getElementById('map'), window.MAP_OPTIONS);
  map.panTo(coord);
  var marker = new google.maps.Marker({position: coord, map: map});
  markers.push(marker);
  console.log(marker);
  map.setZoom(14);
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {address: place.formated_address};
}
