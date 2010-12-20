/*
 * jQuery Flash Message Plugin v0.0.1
 * http://textro.ws
 *
 * This document is licensed as free software under the terms of the
 * MIT License: http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright (c) 2010 by Alex Soulim (soulim@gmail.com).
 */

(function( $ ){
	var $this = $("#flash");

	var methods = {
		init: function () {			
			if ( $this.html() != "" ) {
				$.flash("toggle");
			};
		},
		toggle: function () {
			$this.slideDown("slow").delay(2000).slideUp("fast");
		},
		notice: function ( message ) {
			$this.html($("<div />", { "class": "message notice", text: message }));
			$.flash("toggle");
		},
		error: function ( message ) {
			$this.html($("<div />", { "class": "message error", text: message }));
			$.flash("toggle");
		}
	};

  $.flash = function( method ) {
		if ( methods[method] ) {
      return methods[method].apply(this, Array.prototype.slice.call( arguments, 1 ));
    } else if ( typeof method === 'object' || ! method ) {
      return methods.init.apply(this, arguments);
    } else {
      $.error( 'Method ' +  method + ' does not exist on jQuery.flash' );
    }    
  };
})( jQuery );
