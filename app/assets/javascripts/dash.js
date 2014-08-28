$( document ).ready(function() {

  (function() {

    if($('.dash')){

      var timeTilPageReloads = 15000;
      var timeTilHighlightNominee = 2000;
      var highlightDuration = 10000;

      function reloadPage(){
        return window.location.reload(true);
      }

      function stopHighlight(){
        $('.overlay').removeClass('visible');
        $('#github_id_pcreux').removeClass('visible');
      }

      function startHighlight(){
        $('.overlay').addClass('visible');
        $('#github_id_pcreux').addClass('visible');

        setTimeout(stopHighlight, highlightDuration);
        setTimeout(reloadPage, timeTilPageReloads);
      }

      setTimeout(startHighlight, timeTilHighlightNominee);

    }

  })();

});
