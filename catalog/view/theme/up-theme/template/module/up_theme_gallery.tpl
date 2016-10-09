<div id="up-theme-gallery" class="panel panel-default">
<?php if(($gallery['title']) !='') { ?>
<div class="panel-heading"><h2><?php echo $gallery['title']; ?></h2></div>
<?php } ?>
<div id="up_theme_gallery<?php echo $module; ?>" class="thumbnails box-content up-theme-gallery-content">
  <?php foreach ($banners as $banner) { ?>
  <div class="<?php echo $pr_id; ?> col-sm-2">
  <a href="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>" class="thumbnail">
  <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
  <span class="gallery-hover-box"><i class="fa fa-search"></i></span>
  </a>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript"><!--
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
