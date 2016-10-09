<?php echo $header; ?>
<?php global $config; ?>

<?php if($config->get('t1o_product_name_position') ==2) { ?>
<div id="title_above_content" class="product_top_title">
<div class="container">
<h1><?php echo $heading_title; ?></h1>
</div>
</div>
<?php } ?>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  
  <?php if ($prev_prod_name) { ?>
  <div class="prev">
        <div class="prev-img">
        <a href="<?php echo $prev_prod_url; ?>" class="prev-img-link" title="<?php echo $prev_prod_name;?>">
        <img src="<?php echo $prev_prod_thumb; ?>" alt="<?php echo $prev_prod_name; ?>">
        <div class="prev-name"><?php echo $prev_prod_name;?></div>
        </a>
        </div>
        <div class="prev-arrow">
        <a href="<?php echo $prev_prod_url; ?>" title="<?php echo $prev_prod_name;?>" class="prev-arrow-link">
        <i class="fa fa-angle-left"></i>
        </a>
        </div> 
  </div>
  <?php } ?>
  <?php if ($next_prod_name) { ?>
  <div class="next">
        <div class="next-img">
        <a href="<?php echo $next_prod_url; ?>" class="next-img-link" title="<?php echo $next_prod_name;?>">
        <img src="<?php echo $next_prod_thumb; ?>" alt="<?php echo $next_prod_name; ?>">
        <div class="next-name"><?php echo $next_prod_name;?></div>
        </a> 
        </div>
        <div class="next-arrow">
        <a href="<?php echo $next_prod_url; ?>" title="<?php echo $next_prod_name;?>" class="next-arrow-link">
        <i class="fa fa-angle-right"></i>
        </a>
        </div>
  </div>
  <?php } ?>
  
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> product-page"><?php echo $content_top; ?>
    <?php if($config->get('t1o_product_name_position') ==1) { ?>
    <h1><?php echo $heading_title; ?></h1>
    <?php } ?> 
      <div class="row">
      
        <?php if($config->get('t1o_layout_product_page')== 1) { ?>    
        <div class="col-sm-6 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 2) { ?>      
        <div class="col-sm-4 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 3) { ?>      
        <div class="col-sm-7 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 4) { ?>      
        <div class="col-sm-12 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 5) { ?>      
        <div class="col-sm-4 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 6) { ?>      
        <div class="col-sm-3 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 7) { ?>      
        <div class="col-sm-5 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 8) { ?>      
        <div class="col-sm-6 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 9) { ?>      
        <div class="col-sm-4 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 10) { ?>      
        <div class="col-sm-5 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 11) { ?>      
        <div class="col-sm-6 product-left">
        <?php }
        if($config->get('t1o_layout_product_page')== 12) { ?>      
        <div class="col-sm-5 product-left">
        <?php } ?>  
        
          <?php if ($thumb || $images) { ?>
          <?php if(($config->get('t1o_layout_product_page')== 1) || ($config->get('t1o_layout_product_page')== 2) || ($config->get('t1o_layout_product_page')== 3) || ($config->get('t1o_layout_product_page')== 4) || ($config->get('t1o_layout_product_page')== 5) || ($config->get('t1o_layout_product_page')== 6) || ($config->get('t1o_layout_product_page')== 7) || ($config->get('t1o_layout_product_page')== 11) || ($config->get('t1o_layout_product_page')== 12)) { ?>                  
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

          <?php } else { ?> 
          
          <ul class="thumbnails">      
            <div class="col-xs-3">         
            <?php if ($images) { ?>
            <li class="image-additional col-sm-12">
            <a href='<?php echo $popup; ?>' title='<?php echo $heading_title; ?>' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' ">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" /></a>  
            </li>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional col-sm-12">
            <a class="cloud-zoom-gallery" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' ">
            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" />
            </a>
            </li>
            <?php } ?>
            <?php } ?>
            </div>
            <div class="col-xs-9">
            <?php if ($thumb) { ?>
            <li class="image-main">
            <span class="badge-wrapper">    
            <?php if($config->get('t1o_sale_badge_status') ==1) { ?>	
            <?php if (($special)&&($config->get('t1o_category_sale_badge_type') == 0)) { ?> 
            <span class="badge sale"><?php echo $text_sale; ?></span>
            <?php } ?> 
            <?php if (($special)&&($config->get('t1o_category_sale_badge_type') == 1)) { ?> 
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
            <a class="cloud-zoom thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id='zoom1' rel="position:'inside', adjustX: 10, adjustY: 0, tint:'#ffffff', tintOpacity:0.1, smoothMove:3, showTitle:false">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" id="image" />
            </a>
            </li>
            <?php } ?>
            </div>
          </ul>
          
          <?php } ?>
          <?php } ?>
        
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
        
            <?php if ($tags) { ?>
    
    <div class="product-tags hidden-xs">
      <hr />
      <p><?php echo $text_tags; ?>
      </p>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a class="btn btn-default" href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } else { ?>
        <a class="btn btn-default" href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
    </div>
    <?php } ?>
          
        </div>
        
        <?php if($config->get('t1o_layout_product_page')== 1) { ?>    
        <div class="col-sm-6 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 2) { ?>      
        <div class="col-sm-8 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 3) { ?>      
        <div class="col-sm-5 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 4) { ?>      
        <div class="col-sm-12 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 5) { ?>      
        <div class="col-sm-5 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 6) { ?>      
        <div class="col-sm-6 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 7) { ?>      
        <div class="col-sm-4 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 8) { ?>      
        <div class="col-sm-6 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 9) { ?>      
        <div class="col-sm-8 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 10) { ?>      
        <div class="col-sm-4 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 11) { ?>      
        <div class="col-sm-6 product-buy">
        <?php }
        if($config->get('t1o_layout_product_page')== 12) { ?>      
        <div class="col-sm-7 product-buy">
        <?php } ?>
        
        <div class="product-buy-wrapper">
       
          <?php if($config->get('t1o_product_name_position') ==0) { ?>
          <h1><?php echo $heading_title; ?></h1>
          <?php } ?>
          <ul class="list-unstyled pf">
            <li><?php echo $text_stock; ?> <span class="stock"><?php echo $stock; ?></span></li>
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
            <?php } ?>
            <?php if($config->get('t1o_product_viewed_status') ==1) { ?>
            <li><?php echo $text_product_viewed; ?> <span><?php echo $product_info['viewed']; ?></span></li>
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
              <div class="col-md-4">
              <?php echo $text_special_price; ?><br />
              <h2><span class="price-new"><?php echo $special; ?></span></h2>
              </div>
              <div class="col-md-4">
              <?php echo $text_old_price; ?><br />
              <h2><span class="price-old"><?php echo $price; ?></span></h2>
              </div>
              <div class="col-md-4">
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
              <br />
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a><a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><i class="fa fa-pencil"></i> <?php echo $text_write; ?></a></p>
          </div>
          <?php } ?>
          
          <hr />
          
          <?php
          $t1o_product_custom_block_2_title = $config->get('t1o_product_custom_block_2_title');
          $t1o_product_custom_block_2_content = $config->get('t1o_product_custom_block_2_content'); 
          ?>
          <?php if($config->get('t1o_product_custom_block_2_status')== 1) { ?>
            <div class="product-buy-custom-block">
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
          
          <hr />
          
          <?php echo $text_share; ?>
          
          <div class="product-share">
          <!-- Share This -->
          <script type="text/javascript" src="//w.sharethis.com/button/buttons.js"></script> 
          <span class="st_facebook_hcount" displayText="Facebook"></span>
          <span class="st_twitter_hcount" displayText="Tweet"></span>
          <span class="st_pinterest_hcount" displayText="Pinterest"></span>
          <span class='st_googleplus_hcount'></span>
          <!-- END Share This -->
          </div>
          
        </div>
        </div>
 
        
        <?php if(($config->get('t1o_layout_product_page')== 5) || ($config->get('t1o_layout_product_page')== 6) || ($config->get('t1o_layout_product_page')== 7) || ($config->get('t1o_layout_product_page')== 10)) { ?>	
        <div class="col-sm-3 product-right-sm hidden-xs">
        <?php if($config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order'] !='') { ?>
       <button id="fast_order" class="btn btn-primary btn-lg btn-block" type="button" onclick="fastorder_open('<?php echo $product_id; ?>');" title="Заказ в 1 клик">
<i style="color:#;" class="fa fa-flip-horizontal fa-reply-all"></i>
<span class="hidden-xs"><?php echo isset($config_text_open_form_send_order[$lang_id]) ? $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order'] : ''; ?></span>
</button>
<?php } ?>


        <?php if (($manufacturer) && ($manufacturers_img) && ($config->get('t1o_product_manufacturer_logo_status') ==1)) { ?>  
          <div class="product-right-sm-logo">   
            <a href="<?php echo $manufacturers; ?>"><?php echo ($manufacturers_img) ? '<img src="'.$manufacturers_img.'" title="'.$manufacturers.'" alt="'.$manufacturers.'" />' : $manufacturers ;?></a>
            <a class="see-all btn btn-default" href="<?php echo $manufacturers; ?>"><span class="hidden-sm"><?php echo $text_see_all_products_by; ?> </span><?php echo $manufacturer; ?></a>
          </div> 
        <?php } ?> 
        
        <?php
        $t1o_product_custom_block_3_title = $config->get('t1o_product_custom_block_3_title');
        $t1o_product_custom_block_3_content = $config->get('t1o_product_custom_block_3_content'); 
        ?>
        <?php if($config->get('t1o_product_custom_block_3_status')== 1) { ?>
          <div class="product-right-sm-custom">
            <?php if($t1o_product_custom_block_3_title[$config->get('config_language_id')]) { ?>
            <legend><?php echo $t1o_product_custom_block_3_title[$config->get('config_language_id')]; ?></legend>
            <?php } ?>
            <?php echo html_entity_decode($t1o_product_custom_block_3_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>    
          </div>
        <?php } ?> 
        
        <?php 
    $t1o_product_fb1_title = $config->get('t1o_product_fb1_title');
    $t1o_product_fb1_subtitle = $config->get('t1o_product_fb1_subtitle'); 
    $t1o_product_fb1_content = $config->get('t1o_product_fb1_content');
    $t1o_product_fb2_title = $config->get('t1o_product_fb2_title');
    $t1o_product_fb2_subtitle = $config->get('t1o_product_fb2_subtitle'); 
    $t1o_product_fb2_content = $config->get('t1o_product_fb2_content');
    $t1o_product_fb3_title = $config->get('t1o_product_fb3_title');
    $t1o_product_fb3_subtitle = $config->get('t1o_product_fb3_subtitle'); 
    $t1o_product_fb3_content = $config->get('t1o_product_fb3_content');
    ?>
    
    <?php if(($t1o_product_fb1_title[$config->get('config_language_id')]) || ($t1o_product_fb2_title[$config->get('config_language_id')]) || ($t1o_product_fb3_title[$config->get('config_language_id')])) { ?>
    <hr />
    <div class="product-right-sm-info">
    
<?php if($t1o_product_fb1_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal">
<a href="#" data-toggle="modal" data-target="#modal-product-fb1">
<div class="product-right-sm-info-content">
      <span class="p-icon">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_product_fb1_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_product_fb1_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_product_fb1_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_product_fb1_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="p-title"><?php echo $t1o_product_fb1_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_product_fb1_subtitle) { ?>
<span class="p-subtitle"><?php echo $t1o_product_fb1_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-product-fb1" tabindex="-1" role="dialog" aria-labelledby="modal-product-fb1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-product-fb">
        <h1><?php echo $t1o_product_fb1_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_product_fb1_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_product_fb1_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>
    
<?php if($t1o_product_fb2_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal">
<a href="#" data-toggle="modal" data-target="#modal-product-fb2">
<div class="product-right-sm-info-content">
      <span class="p-icon">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_product_fb2_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_product_fb2_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_product_fb2_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_product_fb2_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="p-title"><?php echo $t1o_product_fb2_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_product_fb2_subtitle) { ?>
<span class="p-subtitle"><?php echo $t1o_product_fb2_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-product-fb2" tabindex="-1" role="dialog" aria-labelledby="modal-product-fb2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-product-fb">
        <h1><?php echo $t1o_product_fb2_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_product_fb2_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_product_fb2_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>
    
<?php if($t1o_product_fb3_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal">
<a href="#" data-toggle="modal" data-target="#modal-product-fb3">
<div class="product-right-sm-info-content">
      <span class="p-icon">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_product_fb3_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_product_fb3_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_product_fb3_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_product_fb3_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="p-title"><?php echo $t1o_product_fb3_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_product_fb3_subtitle) { ?>
<span class="p-subtitle"><?php echo $t1o_product_fb3_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-product-fb3" tabindex="-1" role="dialog" aria-labelledby="modal-product-fb3" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-product-fb">
        <h1><?php echo $t1o_product_fb3_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_product_fb3_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_product_fb3_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>
    
    </div>  
    <?php } ?>
    
<?php if ($products) { ?>
<?php if (($config->get('t1o_product_related_status')== 1) && ($config->get('t1o_product_related_position')== 0)) { ?>  
<div class="product-right-sm-related panel panel-default">
<div class="panel-heading"><?php echo $text_related; ?></div>   
<div class="product-right-sm-related-carousel owl-carousel">       
    <?php foreach ($products as $product) { ?> 
    <div class="item">
      <div class="image">
      <span class="badge-wrapper">
            <?php if($config->get('t1o_sale_badge_status') ==1) { ?>	
            <?php if (($product['special'])&&($config->get('t1o_sale_badge_type') == 0)) { ?>
            <span class="badge sale"><?php echo $text_sale; ?></span>
            <?php } ?> 
            <?php if (($product['special'])&&($config->get('t1o_sale_badge_type') == 1)) { ?>
            <?php 
            $val1 = preg_replace("/[^0-9.]/", "", $product['special']);
	        $val2 = preg_replace("/[^0-9.]/", "", $product['price']);
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
            $startDate1 = strtotime(mb_substr($product['newstart'], 0, 10));
            $endDate2 = strtotime(date("Y-m-d"));
            $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 /86400));
            ?>
            <?php $newproductdays = 30; ?>
            <?php if ($days < $newproductdays) { ?>
            <span class="badge new"><?php echo $text_new_prod; ?></span>
            <?php } ?>
            <?php } ?>
            </span>
        <?php if ($product['thumb_swap']) { ?>
        <a href="<?php echo $product['href']; ?>">
        <img class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        <img class="thumb_swap img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" src="<?php echo $product['thumb_swap']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        </a>
        <?php } else {?>
        <a href="<?php echo $product['href']; ?>"><img class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        <?php } ?> 
      </div>
      <div class="caption">  
        <div class="name"><h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4></div>
        <div class="product_box_brand"><?php if ($product['brand']) { ?><a href="<?php echo $product['brand_url']; ?>"><?php echo $product['brand']; ?></a><?php } ?></div>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
      </div>            
    </div>
    <?php } ?>
</div>  
<script type="text/javascript"><!--
$('.product-right-sm-related-carousel').owlCarousel({
	items: 1,
	autoPlay: 5000,
	singleItem: true,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>
</div>    
<?php } ?>
<?php } ?>     
  
        
        </div>
        <?php } ?>
        
      </div>
      
      <div id="product-tabs" class="row content-padd">
        <div class="col-sm-12">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
            <?php $t1o_product_custom_tab = $config->get('t1o_product_custom_tab');  ?>
            <?php for ($i = 1; $i <= 3; $i++) { ?>
            <?php if($t1o_product_custom_tab[$i]['status'] == 1 && $t1o_product_custom_tab[$i][$config->get('config_language_id')]['title'] !='') { ?>
            <li><a href="#tab-custom<?php echo $i; ?>" data-toggle="tab"><?php echo $t1o_product_custom_tab[$i][$config->get('config_language_id')]['title']; ?></a></li>
            <?php } ?>
            <?php } ?> 
          </ul>
          <div class="tab-content">
            <div class="fade in tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="fade tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="fade tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            
            <?php for ($i = 1; $i <= 3; $i++) { ?>
            <?php if($t1o_product_custom_tab[$i]['status'] == 1 && $t1o_product_custom_tab[$i][$config->get('config_language_id')]['title'] !='') { ?>
            <div class="fade tab-pane" id="tab-custom<?php echo $i; ?>">
            <?php echo html_entity_decode($t1o_product_custom_tab[$i][$config->get('config_language_id')]['content'], ENT_QUOTES, 'UTF-8');?>
            </div>
            <?php } ?>
            <?php } ?> 
            
            <?php } ?>
          </div>
        </div>
      </div>
      
      <?php if ($products) { ?>
      <?php if (($config->get('t1o_product_related_status')== 1) && ($config->get('t1o_product_related_position')== 1)) { ?>
      <h2><?php echo $text_related; ?></h2>
      <div class="row product-slider">
      <div class="product-items product-items-related">
        <?php foreach ($products as $product) { ?>
          
          <?php if($config->get('t1o_product_related_style') ==1) { ?>
          <div class="product-layout-slider product-grid col-xs-12">
          <?php } else { ?>
          <div class="product-layout-grid product-grid col-xs-12">
          <?php } ?>

          <div class="product-thumb">

            <div class="image">
            <span class="badge-wrapper">
            <?php if($config->get('t1o_sale_badge_status') ==1) { ?>	
            <?php if (($product['special'])&&($config->get('t1o_category_sale_badge_type') == 0)) { ?>
            <span class="badge sale"><?php echo $text_sale; ?></span>
            <?php } ?> 
            <?php if (($product['special'])&&($config->get('t1o_category_sale_badge_type') == 1)) { ?>
            <?php 
            $val1 = preg_replace("/[^0-9.]/", "", $product['special']);
	        $val2 = preg_replace("/[^0-9.]/", "", $product['price']);
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
            $startDate1 = strtotime(mb_substr($product['newstart'], 0, 10));
            $endDate2 = strtotime(date("Y-m-d"));
            $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 /86400));
            ?>
            <?php $newproductdays = 30; ?>
            <?php if ($days < $newproductdays) { ?>
            <span class="badge new"><?php echo $text_new_prod; ?></span>
            <?php } ?>
            <?php } ?>
            </span>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="wishlist"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="compare"><i class="fa fa-gavel"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $product['description']; ?>" class="info"><i class="fa fa-info"></i></button>
            <div class="flybar">  
            <div class="flybar-quickview">
            <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
            </div>
            <div class="flybar-cart">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>  
            </div>   
            </div>
            <?php if ($product['thumb_swap']) { ?>
            <a href="<?php echo $product['href']; ?>">
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" />
            <img src="<?php echo $product['thumb_swap']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive thumb_swap img-<?php echo $config->get('t1d_img_style'); ?>" />
            </a>
            <?php } else {?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive img-<?php echo $config->get('t1d_img_style'); ?>" /></a>
            <?php } ?> 
            </div>
            <div>
            
              <div class="caption">
                <div class="name"><h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4></div> 
                <div class="product_box_brand"><?php if ($product['brand']) { ?><a href="<?php echo $product['brand_url']; ?>"><?php echo $product['brand']; ?></a><?php } ?></div>
                <p class="description"><?php echo $product['description']; ?></p>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <div class="product-list-buttons">
                <div class="list-quickview">
                  <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
                </div>
                <div class="cart">
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div>
              </div>
                            
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      </div>
      
<?php if($config->get('t1o_product_related_style') ==1) { ?>
<script type="text/javascript"><!--
$('.product-items-related').owlCarousel({
	items: 4,
	autoPlay: 5000,
	singleItem: false,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>
<?php } ?>

      <?php } ?>
      <?php } ?>
      
    <?php if ($tags) { ?>
    <div class="product-bottom-tags hidden-sm hidden-md hidden-lg">
      <p><?php echo $text_tags; ?>
      </p>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a class="btn btn-default" href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } else { ?>
        <a class="btn btn-default" href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
    </div>
    <?php } ?>
    
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
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
				$('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-check"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				setTimeout(function() {
				    $('.alert').delay(500).fadeOut(1000);
				}, 5000);
						
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
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
<?php echo $footer; ?>
