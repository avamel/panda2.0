// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require jquery.ui.datepicker
//= require jquery.ui.slider
//= require masonry.js
//= require_self
//= require_tree .

$(document).ready(function() {

  if (jQuery.browser.mobile == false){
    $('a[href^="tel"]').attr( 'onClick', 'return false' );
  }

  $('.search-btn').click(function(){
    var re = /\D+/
    var place_param = $('.place.to_param').text();
    var date_param = $('.date.to_param').text();
    var price_range = $('.rangeText').text().split(re);

    console.log(place_param);
    console.log(date_param);
    console.log(price_range);

    $('.search-nav form').append('<input type="hidden" name="country_name" value="' + place_param + '" /><input type="hidden" name="start" value="' + date_param + '" /><input type="hidden" name="min" value="' + price_range[1] + '" /><input type="hidden" name="max" value="' + price_range[2] + '" />').submit();

  });
});