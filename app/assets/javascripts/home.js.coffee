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

    $(".slider2").bxSlider
      minSlides: 1
      maxSlides: 1
      moveSlides: 1
      responsive: true
      auto: false
      controls: true
      pagerCustom: '#bx-pager'
    $(".slider").bxSlider
      minSlides: 3
      maxSlides: 3
      moveSlides: 3
      responsive: true
      auto: false
      controls: false


$(document).ready(ready)
$(document).on('page:load', ready)