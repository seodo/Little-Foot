$(document).ready(function(event){
    navigator.geolocation.getCurrentPosition(function(position) {
      var lat = $('#survey_latitude').val(position.coords.latitude);
      var lng = $('#survey_longitude').val(position.coords.longitude);
    });
});

   function initMap() {
      var survey_lat = parseFloat($('#lat').val());
      var survey_lng = parseFloat($('#lng').val());
      var myLatLng = {lat: survey_lat, lng: survey_lng};
      var mapDiv = document.getElementById('map');
      var map = new google.maps.Map(mapDiv, {
        center: {lat: survey_lat, lng: survey_lng},
        zoom: 8
      });
      marker = new google.maps.Marker({
          position: myLatLng,
          animation: google.maps.Animation.DROP,
          title:"Hello World!"
      });
      marker.setMap(map);
      marker.addListener('click', toggleBounce);
   }

function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}


