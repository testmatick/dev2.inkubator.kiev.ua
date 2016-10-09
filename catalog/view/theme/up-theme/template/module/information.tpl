
<div id="dr-menu" class="dr-menu panel panel-default">
	<div class="dr-trigger panel-heading"><span class="dr-icon dr-icon-menu"><i class="fa fa-bars"></i></span><?php echo $heading_title; ?></div>
	<ul>
		<?php foreach ($informations as $information) { ?>
            <li class="list-group">
                <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
            </li>
        <?php } ?>
        <li class="list-group">
            <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
        </li>

        <li class="list-group">
            <a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
        </li>
	</ul>
</div>

<script type="text/javascript">    
var YTMenu = (function() {

	function init() {
		
		[].slice.call( document.querySelectorAll( '.dr-menu' ) ).forEach( function( el, i ) {

			var trigger = el.querySelector( 'div.dr-trigger' ),
				icon = trigger.querySelector( 'span.dr-icon-menu' ),
				open = false;

			trigger.addEventListener( 'click', function( event ) {
				if( !open ) {
					el.className += ' dr-menu-open';
					open = true;
				}
			}, false );

			icon.addEventListener( 'click', function( event ) {
				if( open ) {
					event.stopPropagation();
					open = false;
					el.className = el.className.replace(/\bdr-menu-open\b/,'');
					return false;
				}
			}, false );

		} );

	}

	init();

})();
</script>
