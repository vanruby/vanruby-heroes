jQuery.fn.random = function() {
  var randomIndex = Math.floor(Math.random() * this.length);
  return jQuery(this[randomIndex]);
};

$( document ).ready(function() {

  (function() {

    if( $('.dash').length ){

      var timeTilPageReloads      = 33000,
          timeTilHighlightNominee = 4000,
          highlightDuration       = 30000;

      var $nominee = $('td.nominee').random();
      $('.reason-bridge').html($nominee.find('.hidden').html());

      function reloadPage(){
        return window.location.reload(true);
      }

      function startHighlight(){
        $('.overlay').addClass('visible');
        $nominee.addClass('visible');

        $('.dash table').addClass('slide-down');

        $('.reason-bridge').addClass('visible');
        setTimeout(function(){
          $('.reason-bridge').removeClass('hidden');
        }, 2000);

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
