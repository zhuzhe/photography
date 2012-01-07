$(function(){                             
	 var $gallery = $('.gallery');    
	 var $image = $gallery.find('.slide img');
	 var $prev = $('.prev'); 
	 var $next = $('.next');  
	 var current_photo = '/images/photos/2222_9.JPG'
	 $gallery.mouseenter(function(){
	}).mouseleave(function(){
	});     
	
	$prev.click(function(){
		$.get('/photos/'+ 1 +'/next', function(result){  
			$image.attr('src', current_photo); 
		}, 'json');
	});
})