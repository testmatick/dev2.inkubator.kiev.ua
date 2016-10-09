<div id="homepage-brands-wall" class="panel panel-default">
<?php if(($brand_wall['title']) !='') { ?>
<div class="panel-heading"><h2><?php echo $brand_wall['title']; ?></h2></div>
<?php } ?>
<div class="box-manufacturers-home row marg-b-30">  
<?php if ($manufacturers) { ?>
<?php foreach ($manufacturers as $manufacturer) { ?>
    <div class="brand-item <?php echo $ca_id; ?> col-sm-6 marg-b-20 style-<?php echo $cw_brands_display_style; ?>">
          <a href="<?php echo $manufacturer['href']; ?>">
          <?php if ($manufacturer['image']) { ?>
          <div class="image"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></div>
          <?php } else { ?>
          <div class="image"><i class="fa fa-camera"></i></div>
          <?php } ?>
          <div class="name"><?php echo $manufacturer['name']; ?></div>
          </a>  
</div>
<?php } ?>
<?php } ?>
</div>
</div>