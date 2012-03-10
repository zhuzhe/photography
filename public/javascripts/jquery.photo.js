$(function () {
	var create_photo_container = function (opts) {
		var $container = $('<div class="container"/>'),
			$photo_container = $('<div class="photo-container"/>'),
			$img = $('<img style="opacity:0"/>'),
			$close = $('<div class="close">x</div>'),
			$mark = $('<div/>');

		$mark.css({
			'position': 'absolute',
			'top': 0,
			'left': 0,
			'width': '100%',
			'height': '100%',
			'opacity': '0.8',
			'z-index': 1000,
			'background-color': 'black'
		});

		$(document.body);
		$container.css({
			'position': 'absolute',
			'width': '100%',
			'height': '100%',
			'z-index': 1001,
			'top': 0,
			'left': 0
		});

		$photo_container.css({
			'position': 'absolute',
			'top': '200px',
			'left': '500px',
			'background-color': 'white',
			'width': '300px',
			'height': '300px',
			'overflow': 'hidden'
		});

		$close.css({
			'position': 'absolute',
			'top': '0',
			'right': '0',
			'z-index': 1003,
			'width': '70px',
			'font-size': '100px',
			'color': 'red',
			'padding': '5px 20px 0px 20px',
			'opacity': '0.5',
			'cursor': 'pointer'
		});

		$mark.css({
			width: $(document).width(),
			height: $(document).height()
		})

		$photo_container.append($img);
		$container.append($photo_container).append($close);
		$(document.body).append($mark).append($container);

		$img.load(function () {
			$photo_container.animate({
				'width': $(this).width(),
				'height': $(this).height()
			}, 1000,function () {
				$img.animate({
					'opacity': 1
				}, 1000)
			})	
		});

		$close.click(function () {
			$mark.remove();
			$container.remove();
		})

		$img.attr('src', opts.url)
	}
	$('.work li a').click(function () {
		create_photo_container({'url': $(this).find('img').attr('src')});
	});

	// $('.work li a:first').click();
})