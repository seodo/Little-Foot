// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation

//= require_tree .

$(function(){ $(document).foundation();

$(document).ready(function () {

        // Build the chart
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Category Percentages of Survey Results'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Category',
                colorByPoint: true,
                data: [{
                    name: 'Food',
                    y: parseFloat($('#food-data').html())/parseFloat($('#total-carbon').html())*100
                }, {
                    name: 'Transportation',
                    y: parseFloat($('#transportation-data').html())/parseFloat($('#total-carbon').html())*100,
                    sliced: true,
                    selected: true
                }, {
                    name: 'Lifestyle',
                    y: parseFloat($('#lifestyle-data').html())/parseFloat($('#total-carbon').html())*100
                }]
            }]
        });
    });



});
