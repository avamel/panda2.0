$(document).ready(function() {
  var re = /\D+/
  var place_param = $('.place');
  var date_param = $('.date');
  if ($('input[name="country_name"]').val() != "") {
    $(place_param).text($('input[name="country_name"]').val());
    $(place_param).addClass('to_param');
  }
  if ($('input[name="start"]').val() != "") {
    $(date_param).text($('input[name="start"]').val());
    $(date_param).addClass('to_param');
  }
  $( "#slider-range" ).slider({
    range: true,
    min: 0,
    max: 1000,
    values: [ 200, 500 ],
    slide: function( event, ui ) {
      $(".rangeText").text( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    }
  });
  if ($('input[name="min"]').val() != 200 && $('input[name="min"]').val() != 0) {
    $( "#slider-range" ).slider( "values", 0, $('input[name="min"]').val() );
  }
  if ($('input[name="max"]').val() != 500 && $('input[name="max"]').val() != 0) {
    $( "#slider-range" ).slider( "values", 1, $('input[name="max"]').val() );
  }
  $(".rangeText").text( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );
});