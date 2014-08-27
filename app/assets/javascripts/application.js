// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require classie
//= require uiMorphingButton_fixed
//= require_tree .

$( document ).ready(function() {

  (function() {
    var docElem = window.document.documentElement, didScroll, scrollPosition;

    // trick to prevent scrolling when opening/closing button
    function noScrollFn() {
      window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
    }

    function noScroll() {
      window.removeEventListener( 'scroll', scrollHandler );
      window.addEventListener( 'scroll', noScrollFn );
    }

    function scrollFn() {
      window.addEventListener( 'scroll', scrollHandler );
    }

    function canScroll() {
      window.removeEventListener( 'scroll', noScrollFn );
      scrollFn();
    }

    function scrollHandler() {
      if( !didScroll ) {
        didScroll = true;
        setTimeout( function() { scrollPage(); }, 60 );
      }
    };

    function scrollPage() {
      scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
      didScroll = false;
    };

    scrollFn();

    [].slice.call( document.querySelectorAll( '.morph-button' ) ).forEach( function( bttn ) {
      new UIMorphingButton( bttn, {
        closeEl : '.icon-close',
        onBeforeOpen : function() {
          // don't allow to scroll
          noScroll();
        },
        onAfterOpen : function() {
          // can scroll again
          canScroll();
        },
        onBeforeClose : function() {
          // don't allow to scroll
          noScroll();
        },
        onAfterClose : function() {
          // can scroll again
          canScroll();
        }
      } );
    } );

    // for demo purposes only
    [].slice.call( document.querySelectorAll( 'form button' ) ).forEach( function( bttn ) {
      bttn.addEventListener( 'click', function( ev ) { ev.preventDefault(); } );
    } );
  })();

});
