var RevealEmbedTweet = window.RevealEmbedTweet || (function(){
	var ready = false;

	function load() {
		if ( window.twttr != undefined && !document.querySelector('section[data-markdown]:not([data-markdown-parsed])') ) {
			tweets = document.querySelectorAll(".tweet");
			for (i = 0; i < tweets.length; ++i) {
				tweets[i].style.cssText = "margin: 0;position: absolute; left: 50%;transform: translate(-50%,0%);" + tweets[i].style.cssText;
				tweets[i].innerHTML = 	'<blockquote class="twitter-tweet" data-lang="en"><a href="' + tweets[i].getAttribute('data-src') + '">Tweet</a></blockquote>';
			}
			window.twttr.widgets.load()
		}
		else {
			// wait for markdown to be loaded and parsed
			setTimeout( load, 100 );
		}
	}

	Reveal.addEventListener( 'ready', function( event ) {
		load();
	} );


})();




