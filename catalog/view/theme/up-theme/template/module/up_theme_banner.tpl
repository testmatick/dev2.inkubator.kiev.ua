<div id="up_theme_banner<?php echo $module; ?>" class="panel panel-default up-theme-banner">
  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div class="<?php echo $pr_id; ?> col-sm-4 up-theme-banner-item slide-<?php echo $title_slide_status; ?>">
  <a href="<?php echo $banner['link']; ?>">
  <img src="<?php echo $banner['image']; ?>" alt="" title="" />

  </a>
  </div>
  <?php } else { ?>
  <div class="<?php echo $pr_id; ?> col-sm-4 up-theme-banner-item slide-<?php echo $title_slide_status; ?>">
  <img src="<?php echo $banner['image']; ?>" alt="" title="" />

  </div>
  <?php } ?>
  <?php } ?>
</div>
