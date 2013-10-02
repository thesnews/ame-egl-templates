(function($) {
	$(function() {
		if( !$('.inline-gallery').length ) {
			return;
		}


		var current = 0,
			images = $('.inline-gallery'),
			container = $('#'+$(images[0]).attr('rel')),
			loader = $('<div></div>')
				.css({
					'background-color': '#FFF',
					'background-image': 'url(http://cdn.thesn.net/assets/dist/img/loader.gif)',
					'background-repeat': 'no-repeat',
					'background-position': 'center center',
					'width': 50,
					'height': 50,
					'position': 'absolute',
					'top': 0,
					'left': 0,
					'border-radius': 3
				})
				.html('&nbsp;');
			$('body').append(loader);
			loader.hide();

		var template = Handlebars.compile($("#gallery-template").html());

		$('body').keyup(function(e) {
			if( $(e.target).prop("nodeName") == 'INPUT'
				|| $(e.target).prop("nodeName") == 'TEXTAREA'  ) {

				return;
			}
			// 37,39
			if( e.keyCode == 39 ) {
				$('.pager .next a').trigger('click');
			} else if( e.keyCode == 37 ) {
				$('.pager .previous a').trigger('click');
			}
			return;
		});

		$('.pager .next a').click(function(e) {
			e.preventDefault();
			if( current >= images.length-1 ) {
				current = 0;
			} else {
				current++;
			}

			$(images[current]).trigger('click');
		});
		$('.pager .previous a').click(function(e) {
			e.preventDefault();
			if( current == 0 ) {
				current = images.length - 1;
			} else {
				current--;
			}

			$(images[current]).trigger('click');
		});

		images.click(function(e) {
			e.preventDefault();

			var $this = $(this);

			var src = $(this).attr('href');

			loader.css({
				'top': ($(container).offset().top + ($(container).height()/2) - 25)+'px',
				'left': ($(container).offset().left + ($(container).width()/2) - 25)+'px'
			});

			console.log(loader);
			loader.show();

			var tmp = new Image;
			tmp.onload = function() {

				var html = template({
					url: src,
					caption: $this.attr('title').replace("<![CDATA[", "").replace("]]>", ""),
					author: $this.attr('data-author'),
					created: $this.attr('data-created')
				});

				$(container).empty();
				$(container).append(html);
				loader.hide();
			};
			tmp.src = src;
		});
	});
})(jQuery);