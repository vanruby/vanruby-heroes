jQuery.fn.random = function() {
  var randomIndex = Math.floor(Math.random() * this.length);
  return jQuery(this[randomIndex]);
};

$( document ).ready(function() {

  (function() {

    if( $('.dash').length ){

      $('#container').BlocksIt({
        numOfCol: 7
      });

      var timeTilPageReloads      = 33000,
          timeTilHighlightNominee = 1000,
          highlightDuration       = 100000;

      var $nominee = $('td.nominee').random();
      $('.reason-bridge').html($nominee.find('.hidden').html());

      function reloadPage(){
        return window.location.reload(true);
      }

      function startHighlight(){
        $('.dash table').addClass('slide-down');
        $nominee.addClass('slide-up');

        setTimeout(function(){
          $nominee.addClass('visible');
          $('.overlay').addClass('visible');
          $('.reason-bridge').addClass('visible');
        }, 2000);

        setTimeout(function(){
          $('.reason-bridge').removeClass('hidden');
        }, 4000);

        setTimeout(stopHighlight, highlightDuration);
        setTimeout(reloadPage, timeTilPageReloads);
      }

      function stopHighlight(){
        $('.overlay').removeClass('visible');
        $nominee.removeClass('visible');
      }

      setTimeout(startHighlight, timeTilHighlightNominee);

    }

  })();

});
