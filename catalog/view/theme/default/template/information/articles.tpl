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
      <?php echo $articles_description; ?>
   <div class="box-articles">
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
		<div class="product-thumb transition">
		       <?php if ($article['thumb_category']) { ?>
		      <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb_category']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
		      <?php } ?>
			<div class="name"><h3><i class="fa fa-bars"></i> <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3></div>
		</div>
	</div>

	<?php } ?>
	<?php } ?>
    </div>

<?php if ($latest_articles) { ?>
<?php foreach ($latest_articles as $article) { ?>
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

	<?php } else { ?>
		<p><?php echo $text_empty; ?></p>
	<?php } ?>
    </div>    
<?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

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