jQuery.fn.random = function() {
  var randomIndex = Math.floor(Math.random() * this.length);
  return jQuery(this[randomIndex]);
};

$( document ).ready(function() {

  (function() {

    if( $('.dash').length ){

      $('.grid-container').BlocksIt({
        numOfCol: 7
      });

      var timeTilHighlightNominee = 3000,
          highlightDuration       = 9000;

      var $nomineeGrid = $('.grid').random();
      $('.reason-bridge').html($nomineeGrid.find('.nominee').find('.hidden').html());

      $('.grid-container').delay(200).animate({opacity: 1}, 200);

      function reloadPage(){
        return window.location.reload(true);
      }

      function startHighlight(){
        var bridgeOffset = $('.reason-bridge').offset();

        // Figure out where the person to highlight is, move them in the DOM
        // so they're relative to their quote, and keep track of their position
        // from the top and left
        var previousOffset = $nomineeGrid.offset();
        var $element       = $nomineeGrid.detach();
        $('.container').append($element);
        $element.css(previousOffset);

        $element.animate({
          top:  bridgeOffset.top  + 20,
          left: bridgeOffset.left - 149
        }, 2000, 'easeInOutBack');

        $('.dash .grid-container').addClass('slide-down');

        setTimeout(function(){
          $nomineeGrid.addClass('visible');
          $('.overlay').addClass('visible');
          $('.reason-bridge').addClass('visible');
        }, 500);

        setTimeout(stopHighlight, highlightDuration);
      }

      function stopHighlight(){
        $('.reason-bridge').addClass('dark-on-light');
        $('.overlay').removeClass('visible');
        $nomineeGrid.removeClass('visible');

        $('.grid').delay(1200).fadeOut();
        $('.dash').delay(1400).fadeOut();
        $nomineeGrid.delay(1600).fadeOut();
        // $('.reason-bridge').delay(1000).fadeOut();

        // setTimeout(function(){ $('.dash .grid-container').removeClass('slide-down'); }, 2000);

        setTimeout(reloadPage, 3000);
      }

      setTimeout(startHighlight, timeTilHighlightNominee);
    }

  })();

});
