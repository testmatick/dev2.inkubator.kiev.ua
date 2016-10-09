<?php echo $header; ?>
<?php global $config; ?>

<style type="text/css">
#top, header, #menu, #top-custom-block-wrapper, .menu_label, .facebook_left, .facebook_right, .twitter_left, .twitter_right, .video_box_left, .video_box_right, .custom_box_left, .custom_box_right {
	display: none!important;
}
#content {
	padding: 15px 30px 45px;
}
.wrapper.framed {
	margin: 0 auto;
	padding: 0;
}
</style>

<div id="content" class="quickview-content">

  <div class="row">
    <?php if ($thumb || $images) { ?>

    <div class="col-sm-6 product-left">
     
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li class="image-main">
            <span class="badge-wrapper">    
            <?php if($config->get('t1o_sale_badge_status') ==1) { ?>	
            <?php if (($special)&&($config->get('t1o_sale_badge_type') == 0)) { ?> 
            <span class="badge sale"><?php echo $text_sale; ?></span>
            <?php } ?> 
            <?php if (($special)&&($config->get('t1o_sale_badge_type') == 1)) { ?> 
            <?php 
            $val1 = preg_replace("/[^0-9.]/", "", $special);
	        $val2 = preg_replace("/[^0-9.]/", "", $price);
            ?>
            <?php
            $res = ($val1 / $val2) * 100;
            $res = 100 - $res;
            $res = round($res, 0);
            ?>
            <span class="badge sale">-<?php echo $res; ?>%</span>
            <?php } ?> 
            <?php } ?>
            <?php if($config->get('t1o_new_badge_status') ==1) { ?>	
            <?php
            $startDate1 = strtotime(mb_substr($newstart, 0, 10));
            $endDate2 = strtotime(date("Y-m-d"));
            $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 /86400));
            ?>
            <?php $newproductdays = 30; ?>
            <?php if ($days < $newproductdays) { ?>
            <span class="badge new"><?php echo $text_new_prod; ?></span>
            <?php } ?>
            <?php } ?>
            </span>    
            <a class="cloud-zoom thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id='zoom1' rel="position:'inside', adjustX: 15, adjustY: 0, tint:'#ffffff', tintOpacity:0.1, smoothMove:3, showTitle:false">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" id="image" />
            </a>
            </li>
            <?php } ?>
          </ul>
          <div class="row">
          <ul class="image-additional-wrapper thumbnails">
            <?php if ($images) { ?>
            <li class="image-additional col-sm-12">
            <div>
            <a href='<?php echo $popup; ?>' title='<?php echo $heading_title; ?>' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' ">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" /></a>
            </div>  
            </li>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional col-sm-12">
            <div>
            <a class="cloud-zoom-gallery" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' ">
            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" />
            </a>
            </div>
            </li>
            <?php } ?>
            <?php } ?>
          </ul>
          </div>       
<script type="text/javascript"><!--
$('.image-additional-wrapper').owlCarousel({
	items: <?php echo $config->get('t1o_additional_images'); ?>,
	singleItem: false,
	pagination: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>

        <?php 
        $t1o_product_custom_block_1_title = $config->get('t1o_product_custom_block_1_title');
        $t1o_product_custom_block_1_content = $config->get('t1o_product_custom_block_1_content'); 
        ?>
        <?php if($config->get('t1o_product_custom_block_1_status')== 1) { ?>
          <div class="product-under-image-custom-block">
          <?php if($t1o_product_custom_block_1_title[$config->get('config_language_id')]) { ?>
          <legend><?php echo $t1o_product_custom_block_1_title[$config->get('config_language_id')]; ?></legend>
          <?php } ?>
          <?php echo html_entity_decode($t1o_product_custom_block_1_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>    
          </div>
        <?php } ?>   
        
    </div>
    <?php } ?>

    <div class="col-sm-6 product-buy">

          <h1><?php echo $heading_title; ?></h1>
          
          <ul class="list-unstyled pf">
            <li><?php echo $text_stock; ?> <span class="stock"><?php echo $stock; ?></span></li>
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
            <?php } ?>
          </ul>
          <hr />
          <?php if ($price) { ?>
          <ul class="list-unstyled pp">
            <?php if (!$special) { ?>
            <li>
              <h2><span class="price-reg"><?php echo $price; ?></span></h2>
            </li>
            <?php } else { ?>
            <li class="product-special">
              <div class="row">
              <div class="col-sm-4">
              <?php echo $text_special_price; ?><br />
              <h2><span class="price-new"><?php echo $special; ?></span></h2>
              </div>
              <div class="col-sm-4">
              <?php echo $text_old_price; ?><br />
              <h2><span class="price-old"><?php echo $price; ?></span></h2>
              </div>
              <div class="col-sm-4">
              <?php if($config->get('t1o_product_save_percent_status') ==1) { ?>
              <?php echo $text_percent_saved; ?><br />
              <h2><span class="save-percent"><?php echo $percent_savings; ?>%</span></h2>
              <?php } ?>
              </div>
              </div>
            </li>
            <?php } ?>
            <?php if($config->get('t1o_product_tax_status') ==1) { ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
          </div>
          <?php } ?>
          <hr />
          <?php
          $t1o_product_custom_block_2_title = $config->get('t1o_product_custom_block_2_title');
          $t1o_product_custom_block_2_content = $config->get('t1o_product_custom_block_2_content'); 
          ?>
          <?php if($config->get('t1o_product_custom_block_2_status')== 1) { ?>
            <div class="product-under-image-custom-block">
            <?php if($t1o_product_custom_block_2_title[$config->get('config_language_id')]) { ?>
            <legend><?php echo $t1o_product_custom_block_2_title[$config->get('config_language_id')]; ?></legend>
            <?php } ?> 
            <?php echo html_entity_decode($t1o_product_custom_block_2_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>    
            </div>
          <?php } ?>   
        
          <div id="product">
            <?php if ($options) { ?>
            <legend><?php echo $text_option; ?></legend>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            
            <?php } ?>
            <br />
            <div class="form-group">
              <div class="qty">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <br />
              <?php if($config->get('t1o_product_i_c_status') ==1) { ?>   
              <input type="button" class="dec" value=" - " />
              <?php } ?>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control i-d-quantity" />
              <?php if($config->get('t1o_product_i_c_status') ==1) { ?>
              <input type="button" class="inc" value=" + " />
              <?php } ?>
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              
     
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_cart; ?></button>
              </div>
              <button type="button" data-toggle="tooltip" class="btn btn-default wcs" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" class="btn btn-default wcs" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-gavel"></i></button>
            <?php function curPageURL() {
              if (!empty($_SERVER['HTTPS'])) {
                $pref = 'https';
              } else {
                $pref = 'http';
              }
              $pageURL = $pref."://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
              return urlencode($pageURL);
            } ?>
            <a class="btn btn-default wcs" data-toggle="tooltip" title="<?php echo $text_product_friend; ?>" href="mailto:enterfriend@addresshere.com?subject=<?php echo $heading_title; ?>&body=<?php echo $heading_title; ?>: <?php echo curPageURL(); ?>"><i class="fa fa-envelope"></i></a> 
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>

    
</div>    



</div>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.product-left').parent().before('<div class="alert alert-success"><i class="fa fa-check"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				setTimeout(function() {
				    $('.alert').delay(500).fadeOut(1000);
				}, 5000);
						
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
