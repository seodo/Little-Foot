$(document).ready(function () {

getUserData();
// var chart = new Highcharts.chart(options);
});


var getUserData = function(){
  $.ajax({
    url: window.location.pathname,
    dataType: "JSON"
  }).done(function (response){
    foodData = [];
    transportationData = [];
    lifestyleData = [];
    createdAt = []
    for(var i = 0; i < response.surveys.length; i++){
      foodData[i] = response.surveys[i].food_category
      transportationData[i] = response.surveys[i].transportation_category
      lifestyleData[i] = response.surveys[i].lifestyle_category
      createdAt[i] = response.surveys[i].created_at
    }
  }).then(function(response){
      drawChart();
  })

};

var drawChart = function(){

  $('#bar-container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Past Emissions Results'
        },
        xAxis: {
            categories: createdAt,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Carbon Dioxide Emissions (lb)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} lb</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Food',
            data: foodData
        }, {
            name: 'Transportation',
            data: transportationData
        }, {
            name: 'Lifestyle',
            data: lifestyleData

        }]
    });
}

