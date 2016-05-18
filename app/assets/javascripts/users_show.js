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
      if (points[i][3] >= 0 && points[i][3] <= 40) {
        points[i][3] = '/images/markers/purple_MarkerP.png';
      } else if (points[i][3] >= 41 && points[i][3] <= 60) {
        points[i][3] = '/images/markers/blue_MarkerB.png';
      } else if (points[i][3] >= 61 && points[i][3] <= 80) {
        points[i][3] = '/images/markers/green_MarkerG.png';
      } else if (points[i][3] >= 81 && points[i][3] <= 100) {
        points[i][3] = '/images/markers/yellow_MarkerY.png';
      } else if (points[i][3] >= 101 && points[i][3] <= 120) {
        points[i][3] = '/images/markers/orange_MarkerO.png';
      } else if (points[i][3] >= 121) {
        points[i][3] = '/images/markers/red_MarkerR.png';
      };
    };

    for (var i = 0; i < points.length; i++) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(points[i][1], points[i][2]),
        map: mapAllPoints,
        icon: points[i][3],
        visible: true
      });
    }
  });
};





