$(document).ready(function(event){
  navigator.geolocation.getCurrentPosition(function(position) {
    console.log('Got position');

    $('#survey_latitude').val(position.coords.latitude);
    $('#survey_longitude').val(position.coords.longitude);
  });
  if ( $('#map').length) {
    getPoints();
  }
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
  current_user_marker = new google.maps.Marker({
    position: myLatLng,
    animation: google.maps.Animation.DROP,
    title:"Hello World!"
  });
  current_user_marker.setMap(map);
  current_user_marker.addListener('click', toggleBounce);
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

    var points = [];
    for(var i = 0; i < response.surveys.length; i++) {
    points[i] = [response.surveys[i].id, response.surveys[i].latitude, response.surveys[i].longitude, response.surveys[i].carbon_footprint]
    }

    var infowindow = new google.maps.InfoWindow();
    var mapAllPoints = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(40.7060883, -74.0093815),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    for (var i = 0; i < points.length; i++) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(points[i][1], points[i][2]),
        map: mapAllPoints,
        title: toString(points[i][3]),
        visible: true
      });
    }
  });
};





