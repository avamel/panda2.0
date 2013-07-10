#for turbolinks
ready = ->
  $(".customSelect").customSelect()
  # $(".phoneSelect").customSelect({customClass:'phoneSelect'})
  # $(".placeSelect").customSelect({customClass:'placeSelect'})
  # $(".dateSelect").customSelect({customClass:'dateSelect'})
  # $(".rangeSelect").customSelect({customClass:'rangeSelect'})


  $container = $(".hits-masonry")
  $container.imagesLoaded ->
    $container.masonry
      columnWidth: 240,
      itemSelector: '.hits-item'

   $(".slider").bxSlider
    minSlides: 3
    maxSlides: 3
    moveSlides: 3
    auto: false
    controls: false


$(document).ready(ready)
$(document).on('page:load', ready)