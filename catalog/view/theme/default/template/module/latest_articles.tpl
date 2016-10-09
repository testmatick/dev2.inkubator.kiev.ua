<h3><?php echo $heading_title; ?></h3>
<div class="row latest-articles">
      <?php foreach ($articles as $article) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-thumb transition">
        <?php if ($article['thumb']) { ?>
        <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
	<div class="article-caption"><?php echo $article['caption']; ?></div>
      </div>
    </div>
      <?php } ?>
  </div>
	<div class="all-articles"><a href="<?php echo $parent_href; ?>"><i class="fa fa-bars"></i> <?php echo $text_all_articles; ?></a></div>
