<?php echo $header; ?>

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
      <h1><?php echo $heading_title; ?></h1>

  <div class="articles-info">
  <?php if (iconv_strlen($description,'UTF-8') > 20) { ?>

    <?php if ($image_popup) { ?>
    	<div class="article-image"><a class="image_popup" href="<?php echo $image_popup; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
    <?php } else { ?>
	    <?php if ($image) { ?>
	    	<div class="article-image"><img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" /></div>
	    <?php } ?>
    <?php } ?>

    <?php echo $description; ?>

	<?php if (!$articles) { ?>
		<div class="article-add-info">
			<div>
			<?php if ($show_date) { ?>
			<span class="article-date"><?php echo $date; ?></span>
			<?php } ?>
			<?php if ($show_views) { ?>
			<span class="article-viewed"><?php echo $viewed; ?></span>
			<?php } ?>
			</div>

			<?php if ($social) { ?>
			<div class="article-share"><?php echo $social; ?></div>
			<?php } ?>

			<?php if ($continue) { ?>
			<a href="<?php echo $continue; ?>" class="btn-continue"><?php echo $button_continue; ?></a>
			<?php } ?>
		</div>
	<?php } ?>

      <?php if ($products) { ?>
      <div class="related-art-product">
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'product-layout col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
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
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
     </div>
      <?php } ?>

    <?php } ?>
  </div>
  <?php if ($articles) { ?>
      <div class="row">  
      <?php foreach ($articles as $article) { ?>
      <?php if ($article['children']) { ?>

        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>

<div class="art_category <?php echo $class; ?>">
<div class="transition">
         <?php if ($article['thumb_category']) { ?>
      <div class="article-image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb_category']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
      <?php } ?>
	<div class="name"><h3><i class="fa fa-bars"></i> <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3></div>
</div></div>
<?php } ?><?php } ?>
</div>

<?php foreach ($articles_list as $article) { ?>
	<div class="articles-list">
		<div>
		      <?php if ($article['thumb']) { ?>
		      <div class="article-image"><a <?php echo ($article['external']) ? 'class="external" id="img_' . $article["article_id"] .'"' : ''; ?> href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
		      <?php } ?>

		<div class="description">
		      <div class="name"><a <?php echo ($article['external']) ? 'class="external" id="link_' . $article["article_id"] .'"' : ''; ?> href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
		
			<?php echo $article['description']; ?>

			<div class="add-info">
			<?php if ($show_date) { ?>
			<span class="article-date"><?php echo $article['date']; ?></span>
			<?php } ?>
			<?php if ($show_views) { ?>
			<span class="article-viewed"><?php echo $article['viewed']; ?></span>
			<?php } ?>
			<?php if ($article['description'] && $show_readmore) { ?>
			<a <?php echo ($article['external']) ? 'class="art-readmore external" id="more_' . $article["article_id"] .'"' : 'class="art-readmore"'; ?> href="<?php echo $article['href']; ?>"><?php echo $text_readmore; ?></a>
			<?php } ?>
			</div>
		</div>
		
		</div>
	</div>
<?php } ?>

<br />
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>

  <?php } ?>

<?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.image_popup').magnificPopup({type:'image'});
});
//--></script>
<script type="text/javascript"><!--
	$('.external').click(function(){
		var id = this.id.replace(/[^0-9]/g, '');
		$.ajax({
			url: 'index.php?route=information/article/updateViewed',
			type: 'post',
			data: 'article_id=' + id,
			dataType: 'html'	
		});
	});
//--></script>
<?php echo $footer; ?>