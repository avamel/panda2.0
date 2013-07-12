$(document).ready(function() {
  function isScrolledTo(elem) {
    var docViewTop = $(window).scrollTop(); //num of pixels hidden above current screen
    var docViewBottom = docViewTop + $(window).height();
    var elemTop = $(elem).offset().top; //num of pixels above the elem
    var elemBottom = elemTop + $(elem).height();

    // console.log($(elem).height());

    return ((elemTop <= docViewTop || elemTop >= docViewTop));
  }
  var catcher = $('#catcher');
  var sticky = $('#sticky');
  var footer = $('.undermap');
  var footTop = footer.offset().top;
  var lastStickyTop = sticky.offset().top;

  // set min height of wrapper as soon as stick element is absolute positioned
  $('.show-tour').css('min-height', lastStickyTop + sticky.height())

  $(window).scroll(function() {
    if(isScrolledTo(sticky)) {
      sticky.css('position','fixed');
      sticky.css('top','0px');
      sticky.css('z-index', 10000);
    }
    var stopHeight = catcher.offset().top + catcher.height();
    var stickyFoot = sticky.offset().top + sticky.height();
    
    if(stickyFoot > $('.show-tour').offset().top + $('.show-tour').height() - 12){
      sticky.css({
        position:'absolute',
        top: ($('.show-tour').offset().top + $('.show-tour').height()) - sticky.height() - 12
      });
    } else {
      if ( stopHeight > sticky.offset().top) {
        sticky.css('position','absolute');
        sticky.css('top',stopHeight);
      }
    }
  });
}); 

