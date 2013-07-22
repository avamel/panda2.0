$(function($) {

  var makeUnactive = function makeUnactive (list, wrapper) {
      $(list).on({
        mouseleave: function() {
          // alert('lol');
          setTimeout(function(){
            $(wrapper).removeClass('active');
          }, 3000);
        }
      });
  };

  var selectBox = function selectBox (wrapper, wrapper_inner, input, list, item) {
    $(wrapper).on("click", function(event){
      $(this).toggleClass('active');
      $(input).val(null);

      var active = $(':not('+wrapper+').active');
      $(active).removeClass('active');

      $(input).click(function(event) {
        event.stopPropagation();
      });

      $(item).click(function(e) {
        $(wrapper).removeClass('.active');
        $(wrapper_inner).text($(this).text());
        $(wrapper_inner).addClass('to_param');
        var forecast = $('.weather1.to_param').text();
        $('input#forecast').val(forecast);
        $('.weather form').submit();
      });

      $(input).bind('keyup', function(e) {
        if ( e.keyCode === 13 ) {
          $(wrapper_inner).text($(input).val());
          $(wrapper_inner).addClass('to_param');
          $(wrapper).removeClass('active');
          var forecast = $(wrapper_inner).text();
          $('input#forecast').val(forecast);
          $('.weather form').submit();
        }
      });
      // makeUnactive(list, wrapper);
    });
  };

  $(".city").click(function(){
    var forecast = $('.weather1.to_param').text();
    $('input#forecast').val(forecast);
    $('.weather form').submit();
  });

  $('.weather form').on('submit', function(event) {
    $.get($(this).attr('action'), $(this).serialize(), function(json) {
      $('span.weather-text').text(json['temp'])
    }, 'json');
    return false;
  });



  $(document).mouseup(function (e)
  {
    var container = $(".container");
    if (container.has(e.target).length === 0)
    {
      $(container).removeClass('active');
    }
  });


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
      $('span.date').addClass('to_param');
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


  selectBox('.phoneSelectWrapper', null, null, '.phoneSelectList');
  selectBox('.weatherSelectWrapper', 'span.weather1', '.weatherInput', '.weatherSelectList', '.city');
  selectBox('.dateSelectWrapper', null, null, '.dateSelectList');
  selectBox('.placeSelectWrapper', 'span.place', null, '.placeSelectList', '.countryName');
});