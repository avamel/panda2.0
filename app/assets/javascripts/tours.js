$(document).ready(function() {
  function isScrolledTo(elem) {
    var docViewTop = $(window).scrollTop(); //num of pixels hidden above current screen
    var docViewBottom = docViewTop + $(window).height();
    var elemTop = $(elem).offset().top; //num of pixels above the elem
    var elemBottom = elemTop + $(elem).height();
    return ((elemTop <= docViewTop || elemTop >= docViewTop));
  }
  var catcher = $('#catcher');
  var sticky = $('#sticky');
  var footer = $('#footer');
  var footTop = footer.offset().top;
  var lastStickyTop = sticky.offset().top;

  // set min height of wrapper as soon as stick element is absolute positioned
  $('.show-tour').css('min-height', lastStickyTop + sticky.height() - 200)

  $(window).scroll(function() {
    if(isScrolledTo(sticky)) {
      sticky.css('position','fixed');
      sticky.css('top','2px');
      sticky.css('z-index', 10000);
    }
    var stopHeight = catcher.offset().top + catcher.height();
    var stickyFoot = sticky.offset().top + sticky.height();
       
    if(stickyFoot > footTop -10){
      sticky.css({
        position:'absolute',
        top: (footTop - 200) - sticky.height()
      });
    } else {
      if ( stopHeight > sticky.offset().top) {
        sticky.css('position','absolute');
        sticky.css('top',stopHeight - 200);
      }
    }
  });
}); 

