$(function() {

  var selectBox = function selectBox (wrapper, wrapper_inner, input) {
    $(wrapper).on("click", function(event){
      $(this).toggleClass('active');
      $(input).val(null);

      $(input).click(function(event) {
        event.stopPropagation();
      });

      $(input).bind('keyup', function(e) {
          if ( e.keyCode === 13 ) {
            $(wrapper_inner).text($(input).val());
            $(wrapper).removeClass('active');
          }
      });

    });
  };

  selectBox('.phoneSelectWrapper', null, null);
  selectBox('.weatherSelectWrapper', 'span.weather1', '.weatherInput');




  // var firstChild = $('.phoneSelectWrapper').find('li.phoneOption')[0];
  // var numberWrapper = $('.phoneSelectWrapper').find('span.number')[0];
  // var phoneSelectWrapper = $('.phoneSelectWrapper');
  // // $(numberWrapper).html($(firstChild).html());
  // $(phoneSelectWrapper).on("click", function(event){
  //   $(this).toggleClass('active');
  // });
  // $('.phoneOption').on('click', function(event){
  //   // $(numberWrapper).html($(this).html());
  // });

});