$(function() {

  var firstChild = $('.phoneSelectWrapper').find('li.phoneOption')[0];
  var numberWrapper = $('.phoneSelectWrapper').find('span.number')[0];
  var phoneSelectWrapper = $('.phoneSelectWrapper');
  $(numberWrapper).html($(firstChild).html());
  $(phoneSelectWrapper).on("click", function(event){
    $(this).toggleClass('active');
  });
  $('.phoneOption').on('click', function(event){
    $(numberWrapper).html($(this).html());
  });

});