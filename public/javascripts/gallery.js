$(function(){                             
	 var $gallery = $('.gallery');    
	 var $image = $gallery.find('.slide img');
	 var $prev = $('.prev'); 
	 var $next = $('.next');  
	 var current_photo_id = $('#first_photo_id').val();
	 $image.attr('src', $('#first_photo_url').val())
	 $gallery.mouseenter(function(){
	}).mouseleave(function(){
	});   
	
	$prev.add($next).mouseenter(function(){
		$(this).animate({
			opacity: 1
		})
	}).mouseleave(function(){
		$(this).animate({
			opacity: 0.3
		})
	})       
	
	$prev.click(function(){            
		$.get('/photos/'+ current_photo_id +'/prev', function(result){   
			current_photo_id = result.id;  
			$image.css('opacity', 0);   
			$image.attr('src', result.url); 
		}, 'json');
	});
	
	$next.click(function(){            
		$.get('/photos/'+ current_photo_id +'/next', function(result){   
			current_photo_id = result.id;  
			$image.css('opacity', 0);   
			$image.attr('src', result.url); 
			
		}, 'json');
	});             
	
	$image.load(function(){  
	    $(this).animate({
			opacity: 1
		}) 
	});
})