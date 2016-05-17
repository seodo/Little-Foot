$(document).ready(function(event){
  navigator.geolocation.getCurrentPosition(function(position) {
    $('#survey_latitude').val(position.coords.latitude);
    $('#survey_longitude').val(position.coords.longitude);
  });

  getPoints();
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

function getPoints() {
  $.ajax({
    url: "/surveys",
    dataType: "JSON"
  }).done(function (response){
    var locations = []
    for(var i = 0; i < response.length; i++) {
      console.log(response[i].latitude)

    }

    // for (var latitude in response) {
    //   if (response.hasOwnProperty(latitude)) {
    //     debugger
    //     alert(lattitude + " -> " + response[latitude]);
    //   }
    // }
    alert(response);
  })
}





