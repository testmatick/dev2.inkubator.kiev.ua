<div id="load_container"></div>
<script>
$(function() {
	var ajax_url = 'index.php?route=module/ajax_viewed/getproducts';
	if (<?php echo $product_id; ?> != 0) 
		ajax_url += '&product_id=' + <?php echo $product_id; ?>;
		
	ajax_url += '&setting=' + '<?php echo $module_setting; ?>' ;
	
	var ajax_container;
	
	$.get(ajax_url,	function(data){
		$('#load_container').replaceWith(data),
		$('#ajax_viewed').owlCarousel({
						responsiveBaseWidth: '#ajax_viewed',
						itemsCustom: [[0, 1], [448, 2], [668, 3], [848, 4], [1000, 5]],
						theme: 'product-carousel',
						navigation: true,
						slideSpeed: 200,
						paginationSpeed: 300,
						autoPlay: false,
						stopOnHover: true,
						touchDrag: false,
						mouseDrag: false,
						navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
						pagination: false,
		
		});
		

		
	
		
    });
});
</script>
