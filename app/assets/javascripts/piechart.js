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
