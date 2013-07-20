$(document).ready(function() {

  var $container;
  $container = $(".hits-masonry");
  return $container.imagesLoaded(function() {
    $('.slide img').css('display', 'block');
    $('.caption').css('display', 'block');
    $container.masonry({
      columnWidth: 240,
      itemSelector: '.hits-item'
    });
    $(".slider2").bxSlider({
      minSlides: 1,
      maxSlides: 1,
      moveSlides: 1,
      responsive: true,
      // video: true,
      auto: false,
      controls: true,
      pagerCustom: '#bx-pager',
      touchEnabled: false,
      onSliderLoad: function() {
        $('.tour-slide img').css('display', 'block');
        $('.tour-slider-title').css('display', 'block');
      }
    });
    return $(".slider").bxSlider({
      minSlides: 3,
      maxSlides: 3,
      moveSlides: 3,
      responsive: true,
      auto: false,
      controls: false,
      touchEnabled: false
    });
  });
});
