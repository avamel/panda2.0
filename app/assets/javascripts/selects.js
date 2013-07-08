$(function($) {

  var makeUnactive = function makeUnactive (list, wrapper) {
      $(list).on({
        mouseleave: function() {
          setTimeout(function(){
            $(wrapper).removeClass('active');
          }, 2000);
        }
      });
  };

  var selectBox = function selectBox (wrapper, wrapper_inner, input, list, item) {
    $(wrapper).on("click", function(event){
      $(this).toggleClass('active');
      $(input).val(null);

      $(input).click(function(event) {
        event.stopPropagation();
      });

      $(item).click(function(e) {
        $(wrapper).removeClass('.active');
        $(wrapper_inner).text($(this).text());
      });

      $(input).bind('keyup', function(e) {
        if ( e.keyCode === 13 ) {
          $(wrapper_inner).text($(input).val());
          $(wrapper).removeClass('active');
        }
      });
      makeUnactive(list, wrapper);
    });
  };

  $.datepicker.regional['ru'] = {
          closeText: 'Закрыть',
          prevText: '&#x3c;Пред',
          nextText: 'След&#x3e;',
          currentText: 'Сегодня',
          monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь',
          'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
          monthNamesShort: ['Янв','Фев','Мар','Апр','Май','Июн',
          'Июл','Авг','Сен','Окт','Ноя','Дек'],
          dayNames: ['воскресенье','понедельник','вторник','среда','четверг','пятница','суббота'],
          dayNamesShort: ['вск','пнд','втр','срд','чтв','птн','сбт'],
          dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
          weekHeader: 'Не',
          dateFormat: 'dd.mm.yy',
          firstDay: 1,
          isRTL: false,
          showMonthAfterYear: false,
          yearSuffix: ''};
  $.datepicker.setDefaults($.datepicker.regional['ru']);

  var dp = $('#datePicker').datepicker({
    firstDay: 1,
    changeMonth: true,
    onSelect: function(dateText, inst) {
      $('span.date').text(dateText);
      $('.dateSelectWrapper').removeClass('active');
    }
  });
  $('.dateSelectWrapper').on('click', function(){
    dp.show();
  });

  $('.dateSelectWrapper').click(function(event){
    if ($(this).hasClass('active')) {
      event.preventPropagation();
    }
  });

  $( "#slider-range" ).slider({
    range: true,
    min: 0,
    max: 1000,
    values: [ 200, 500 ],
    slide: function( event, ui ) {
      $(".rangeText").text( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    }
  });
  $(".rangeText").text( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );




  selectBox('.phoneSelectWrapper', null, null, '.phoneSelectList');
  selectBox('.weatherSelectWrapper', 'span.weather1', '.weatherInput', '.weatherSelectList', '.city');
  selectBox('.dateSelectWrapper', null, null, '.dateSelectList');
  selectBox('.placeSelectWrapper', 'span.place', null, '.placeSelectList', '.countryName');
});