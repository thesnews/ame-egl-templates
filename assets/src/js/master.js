(function($) {
	$(function() {
        $(".accordion-group").on("shown", function(){
          console.log('fired?');
          $(this).find('i').removeClass("icon-plus");
          $(this).find('i').addClass("icon-minus");
        });
        $(".accordion-group").on("hidden", function(){
          console.log('fired2?');
          $(this).find('i').removeClass("icon-minus");
          $(this).find('i').addClass("icon-plus");
        });

		if(window.innerWidth >= 500 ) {
			if( $('.fancybox-single').length ) {
				$('.fancybox-single').fancybox({
					topRatio	: 0.1,
					openEffect	: 'fade',
					closeEffect	: 'fade',
					afterShow: function() {
						setTimeout(function() {
							$.fancybox.update();
						},500);
					},
					helpers: {
						title: {
							type: 'outside'
						},
						thumbs : {
							width: 50,
							height: 50
						}
					}
				});
			}
			if( $('.fancybox-gallery').length ) {
				$('.fancybox-gallery').fancybox({
					topRatio	: 0.1,
					openEffect	: 'fade',
					closeEffect	: 'fade',
					afterShow: function() {
						setTimeout(function() {
							$.fancybox.update();
						},500);
					},
					helpers: {
						title: {
							type: 'outside'
						},
						thumbs : {
							width: 50,
							height: 50
						}
					}
				});
			}
		}


		$(".integrated-media-left .video a").fancybox({
			topRatio	: 0.1,
			openEffect	: 'fade',
			closeEffect	: 'fade',
			afterShow: function() {
				setTimeout(function() {
					$.fancybox.update();
				},500);
			}

		});

        if( $('.beforeAfter-container').length !== 0 ) {
            setTimeout(function() {
                $('.beforeAfter-container').beforeAfter({
                    showFullLinks: false
                });
            }, 500);
        }

	});
})(jQuery);
