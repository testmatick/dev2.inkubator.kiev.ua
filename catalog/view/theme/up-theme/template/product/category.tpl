<?php echo $header; ?>
<?php global $config; ?>

<?php if($config->get('t1o_category_title_position')== 0) { ?>
<div id="title_above_content" class="category_top_title" <?php if($thumb) { ?>style="background-image: url(<?php echo $thumb; ?>)<?php } ?>" <?php if($config->get('t1o_category_img_parallax')== 1) { ?>data-stellar-background-ratio="0.5"<?php } ?>>
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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>    
    
      <?php if(($config->get('t1o_category_desc_status') == 1) || ($config->get('t1o_category_img_status') == 1)) { ?>
      <div class="row content-padd">
        <div class="col-sm-<?php if(($config->get('t1o_category_desc_status') == 1) && ($config->get('t1o_category_img_status') == 1) && ($thumb)) { ?>7<?php } else { ?>12<?php } ?> cat-description">
          <?php if($config->get('t1o_category_title_position')== 1) { ?>
          <h1><?php echo $heading_title; ?></h1>
          <?php } ?>
          <?php if(($config->get('t1o_category_desc_status') == 1) && ($description)) { ?>
          <?php echo $description; ?>
          <?php } ?>    
        </div>
        <?php if(($config->get('t1o_category_img_status') == 1) && ($thumb)) { ?>
        <div class="col-sm-5 cat-img marg-b-15">
          <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
        </div>
        <?php } ?>
      </div>
      <?php } ?>
 
      <?php if($config->get('t1o_category_subcategories_status')== 1) { ?>
      <?php if($config->get('t1o_category_subcategories_style')== 0) { ?> 
      
      <?php if ($categories) { ?>
      <div class="category-list row">
      <?php foreach ($categories as $category) { ?>
		<div class="col-sm-2 col-xs-6">
		  <?php if ($category['thumb']) { ?>
		  <a href="<?php echo $category['href']; ?>"><div class="image"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
          <div class="subcatname"><?php echo $category['name']; ?></div>
          </div></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><div class="image"><div class="subcam"><i class="fa fa-camera"></i></div>
          <div class="subcatname"><?php echo $category['name']; ?></div>
          </div></a>
		  <?php } ?>
		</div>
      <?php } ?>  
      </div>        
      <?php } ?>
   
      <?php } else { ?>
      
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row category-list-oc">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row category-list-oc">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
  
      <?php } ?>
      <?php } ?>

      <?php if ($products) { ?>
      <div class="row content-padd padd-t-b-25 product-filter">
        <div class="col-md-3">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            <button type="button" id="gallery-view" class="btn btn-default" data-toggle="tooltip" title="Gallery"><i class="fa fa-th-large"></i></button>
          </div>
        </div>
        <div class="col-md-2">
          <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-primary"><?php echo $text_compare; ?></a>
        </div>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-1 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>

      <div class="row product-items category-product-items">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
          
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
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></button>
                </div>
                </div>
                
              </div>
              
            </div>
          </div>
          
        </div>
        <?php } ?>
      </div>
      <div class="row pagination-box content-padd padd-t-b-25">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
