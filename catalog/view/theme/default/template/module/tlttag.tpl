<div class="list-group">
  <?php foreach ($tags as $tag) { ?>
  <?php if ($tag['tlttag_id'] == $current_tag) { ?>
  	<a href="<?php echo $tag['href']; ?>" class="list-group-item active"><?php echo $tag['title']; ?></a>
  <?php } else { ?>
  	<a href="<?php echo $tag['href']; ?>" class="list-group-item"><?php echo $tag['title']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
