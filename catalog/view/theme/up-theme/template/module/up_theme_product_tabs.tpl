<?php global $config; ?>

<div class="tabs-products">

<?php $tabs = 0; ?>
<div id="product-tabs" class="row content-padd">
        <div class="col-sm-12">
          <ul id="tabs-<?php echo $module; ?>" class="nav nav-tabs">
            <?php if($latest_products) { ?>
            <li class="active pt"><a href="#tab-latest-<?php echo $module; ?>" data-toggle="tab"><?php echo $text_latest; ?></a></li>
            <?php } ?>
            <?php if($bestseller_products) { ?>
            <li class="pt"><a href="#tab-bestseller-<?php echo $module; ?>" data-toggle="tab"><?php echo $text_bestseller; ?></a></li>
            <?php } ?>
            <?php if($featured_products) { ?>
            <li class="pt"><a href="#tab-featured-<?php echo $module; ?>" data-toggle="tab"><?php echo $text_featured; ?></a></li>
            <?php } ?>
            <?php if($special_products) { ?>
            <li class="pt"><a href="#tab-special-<?php echo $module; ?>" data-toggle="tab"><?php echo $text_special; ?></a></li>
            <?php } ?>
            <?php if($most_viewed_products) { ?>
            <li class="pt"><a href="#tab-most-viewed-<?php echo $module; ?>" data-toggle="tab"><?php echo $text_most_viewed; ?></a></li>
            <?php } ?>
          </ul>


<div class="tab-content"> 


<?php if($latest_products){ ?>
<div id="tab-latest-<?php echo $module; ?>" class="row product-items fade in tab-pane active">
<div id="slider-latest-<?php echo $module; ?>">
  <?php foreach ($latest_products as $product) { ?>
  <?php if($config->get('t1o_product_tabs_style') ==1) { ?>
  <div class="product-layout product-grid col-xs-12">
  <?php } else { ?>
  <div class="product-layout-grid product-grid col-xs-12">
  <?php } ?>
    <div class="product-thumb transition">
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
      
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="wishlist"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="compare"><i class="fa fa-gavel"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $product['description']; ?>" class="info"><i class="fa fa-info"></i></button>
      
            <div class="flybar">  
            <div class="flybar-quickview">
            <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
            </div>
            <div class="flybar-cart">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>  
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
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div>
                
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php if($config->get('t1o_product_tabs_style') ==1) { ?>  
<script type="text/javascript"><!--
$('#slider-latest-<?php echo $module; ?>').owlCarousel({
	items: <?php echo $config->get('t1o_product_tabs_per_row'); ?>,
	singleItem: false,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>
<?php } ?>
</div>

<?php } ?>

<?php if($bestseller_products){ ?>
 <div id="tab-bestseller-<?php echo $module; ?>" class="row product-items fade tab-pane">
 <div id="slider-bestseller-<?php echo $module; ?>">
  <?php foreach ($bestseller_products as $product) { ?>
  <?php if($config->get('t1o_product_tabs_style') ==1) { ?>
  <div class="product-layout product-grid col-xs-12">
  <?php } else { ?>
  <div class="product-layout-grid product-grid col-xs-12">
  <?php } ?>
    <div class="product-thumb transition">
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
      
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="wishlist"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="compare"><i class="fa fa-gavel"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $product['description']; ?>" class="info"><i class="fa fa-info"></i></button>
      
            <div class="flybar">  
            <div class="flybar-quickview">
            <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
            </div>
            <div class="flybar-cart">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>  
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
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div>
                
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php if($config->get('t1o_product_tabs_style') ==1) { ?>
<script type="text/javascript"><!--
$('#slider-bestseller-<?php echo $module; ?>').owlCarousel({
	items: <?php echo $config->get('t1o_product_tabs_per_row'); ?>,
	singleItem: false,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>
<?php } ?>   
 </div>
<?php } ?>

<?php if($featured_products){ ?>
  <div id="tab-featured-<?php echo $module; ?>" class="row product-items fade tab-pane">
  <div id="slider-featured-<?php echo $module; ?>">
  <?php foreach ($featured_products as $product) { ?>
  <?php if($config->get('t1o_product_tabs_style') ==1) { ?>
  <div class="product-layout product-grid col-xs-12">
  <?php } else { ?>
  <div class="product-layout-grid product-grid col-xs-12">
  <?php } ?>
    <div class="product-thumb transition">
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
      
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="wishlist"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="compare"><i class="fa fa-gavel"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $product['description']; ?>" class="info"><i class="fa fa-info"></i></button>
      
            <div class="flybar">  
            <div class="flybar-quickview">
            <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
            </div>
            <div class="flybar-cart">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>  
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
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div> 
                
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php if($config->get('t1o_product_tabs_style') ==1) { ?>
<script type="text/javascript"><!--
$('#slider-featured-<?php echo $module; ?>').owlCarousel({
	items: <?php echo $config->get('t1o_product_tabs_per_row'); ?>,
	singleItem: false,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script> 
<?php } ?> 
 </div>
<?php } ?>

<?php if($special_products){ ?>
 <div id="tab-special-<?php echo $module; ?>" class="row product-items fade tab-pane">
 <div id="slider-special-<?php echo $module; ?>">
  <?php foreach ($special_products as $product) { ?>
  <?php if($config->get('t1o_product_tabs_style') ==1) { ?>
  <div class="product-layout product-grid col-xs-12">
  <?php } else { ?>
  <div class="product-layout-grid product-grid col-xs-12">
  <?php } ?>
    <div class="product-thumb transition">
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
      
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="wishlist"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="compare"><i class="fa fa-gavel"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $product['description']; ?>" class="info"><i class="fa fa-info"></i></button>
      
            <div class="flybar">  
            <div class="flybar-quickview">
            <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
            </div>
            <div class="flybar-cart">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>  
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
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div>
                
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php if($config->get('t1o_product_tabs_style') ==1) { ?>  
<script type="text/javascript"><!--
$('#slider-special-<?php echo $module; ?>').owlCarousel({
	items: <?php echo $config->get('t1o_product_tabs_per_row'); ?>,
	singleItem: false,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>
<?php } ?>
 </div>
<?php } ?>

<?php if($most_viewed_products){ ?>
<div id="tab-most-viewed-<?php echo $module; ?>" class="row product-items fade tab-pane">
<div id="slider-most-viewed-<?php echo $module; ?>">
  <?php foreach ($most_viewed_products as $product) { ?>
  <?php if($config->get('t1o_product_tabs_style') ==1) { ?>
  <div class="product-layout product-grid col-xs-12">
  <?php } else { ?>
  <div class="product-layout-grid product-grid col-xs-12">
  <?php } ?>
    <div class="product-thumb transition">
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
      
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="wishlist"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="compare"><i class="fa fa-gavel"></i></button>
            <button type="button" data-toggle="tooltip" data-placement="left" title="<?php echo $product['description']; ?>" class="info"><i class="fa fa-info"></i></button>
      
            <div class="flybar">  
            <div class="flybar-quickview">
            <a class="btn btn-default quickview" href="<?php echo $product['quickview']; ?>"><?php echo $text_quickview; ?></a>
            </div>
            <div class="flybar-cart">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>  
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
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div>
                
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php if($config->get('t1o_product_tabs_style') ==1) { ?>  
<script type="text/javascript"><!--
$('#slider-most-viewed-<?php echo $module; ?>').owlCarousel({
	itemsCustom : [
        [0, 1],
        [980, <?php echo $config->get('t1o_product_tabs_per_row'); ?>],
    ],
	singleItem: false,
	pagination: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
});
--></script>
<?php } ?>
 
 </div>
<?php } ?>

</div>
</div>
</div>
</div>
