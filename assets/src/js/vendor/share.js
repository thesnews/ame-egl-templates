$(document).ready(function() {

  var $sidebar   = $("#sharebox"),
      $window    = $(window),
      offset     = $sidebar.offset(),
      topPadding = 50;

  $window.scroll(function() {
    if($window.scrollTop() > $('.related-stories').offset().top) {
      $sidebar.stop().css('marginTop', $('.related-stories').offset().top);
    } else if ($window.scrollTop() > offset.top) {
      $sidebar.stop().animate({
        marginTop: $window.scrollTop() - offset.top + topPadding
      });
    } else {
      $sidebar.stop().animate({
        marginTop: 0 
      });
    }
  });
});


