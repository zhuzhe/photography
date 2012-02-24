$(function () {
	var create_mark = function () {
		var $mark = $('div');
		$mark.css({
			'position': absolute,
			'top': 0,
			'left': 0,
			'width': '100%',
			'height': '100%',
			'opacity': '0.5',
			'z-index': 1000
		})
		$('body').append($mark);
	}
	$('.work li a').click(function () {
		create_mark();
	})
})