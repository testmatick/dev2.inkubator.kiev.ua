<?php global $config; ?>
<?php if($config->get('t1o_left_right_column_categories_type')== 1) { ?>  
<div class="panel panel-default panel-category">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
<div class="list-group">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <div class="cat-mod-child">
  <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
  </div>
  <?php } else { ?>
  <div class="cat-mod-child">
  <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
  </div>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
</div>
<?php } ?>
<?php if($config->get('t1o_left_right_column_categories_type')== 0) { ?> 
<script type="text/javascript">
$(document).ready(function() {
	$('#accordion-1').dcAccordion({
		disableLink: false,	
		menuClose: false,
		autoClose: true,
		autoExpand: true,		
		saveState: false
	});
});
</script>
<div class="panel panel-default panel-category">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
    <div class="list-group">
      <ul class="accordion" id="accordion-1">
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a><div class="dcjq-icon"><i class="fa fa-plus"></i></div>
          <?php } else if($category['children']) { ?>
          <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a><div class="dcjq-icon"><i class="fa fa-plus"></i></div>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="list-group-item active"><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>" class="list-group-item"><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
  </div>
</div>
<?php } ?>
