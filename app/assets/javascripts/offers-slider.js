$(function() {
  var $container, $prev, $next, slides_number, slide_width, total_width, counter, limit;
  $container = $('.slides-container');
  $prev = $('.prev');
  $next = $('.next');
  
  slides_number = $container.find('li').size();
  slide_width = 360;
  total_width = slide_width * slides_number;
  counter = 0;
  limit = total_width - (2*slide_width);
  $container.width(total_width);
  

  $prev.on('click', function(event){
  
    if(!($container.css('left') == "0px")){
      counter = counter + 360;
      $container.animate({left: counter + "px"}, 600);
    }

    event.prevenDefault;
    return false;
  });

  $next.on('click', function(event){
    
    if(!($container.css('left') >= ((limit*-1) + "px")) || $container.css('left') == '0px'){
      if(counter != (limit*-1)){
        counter = counter - 360;
        $container.animate({left: counter + "px"}, 600);
      } 
    }

    event.prevenDefault;
    return false;
  });
});