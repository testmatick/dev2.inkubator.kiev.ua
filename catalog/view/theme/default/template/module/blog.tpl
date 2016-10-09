<?php foreach ($blog_blocks as $blog_block) { ?>

<?php if ($blog_block == 'search') { ?>

 <h3><?php echo $heading_search; ?></h3>
<div id="blog-search" class="input-group">
  <input type="text" name="filter_title" value="<?php echo $filter_title; ?>" placeholder="<?php echo $text_search; ?>" class="form-control" />
  <span class="input-group-btn">
    <button type="button"  class="btn btn-primary"><i class="fa fa-search"></i></button>
  </span>
</div>

<?php } elseif ($blog_block == 'categories') { ?>

 <h3><?php echo $heading_category; ?></h3>
<div class="list-group">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['blog_category_id'] == $blog_category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>

<?php } elseif ($blog_block == 'archives') { ?>

 <h3><?php echo $heading_archive; ?></h3>
<div class="list-group">
  <?php foreach ($archives as $archive) { ?>
  <?php if ($archive['date_added'] == $date_added) { ?>
  <a href="<?php echo $archive['href']; ?>" class="list-group-item active"><?php echo $archive['title']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $archive['href']; ?>" class="list-group-item"><?php echo $archive['title']; ?></a>
  <?php } ?>
  <?php } ?>
</div>

<?php } elseif ($blog_block == 'recent_posts') { ?>

 <h3><?php echo $heading_post; ?></h3>
<div>
  <?php foreach ($recent_posts as $recent_post) { ?>
    <a href="<?php echo $recent_post['href']; ?>"><?php echo $recent_post['title']; ?></a>
    <p><?php echo $recent_post['description']; ?></p>
    <p><?php echo $recent_post['date_added']; ?></p>
  <?php } ?>
</div>

<?php } elseif ($blog_block == 'recent_comments') { ?>

 <h3><?php echo $heading_comment; ?></h3>
<div>
  <?php foreach ($recent_comments as $recent_comment) { ?>
    <a href="<?php echo $recent_comment['href']; ?>"><?php echo $recent_comment['title']; ?></a>
    <p><?php echo $recent_comment['text']; ?></p>
    <p><?php echo $recent_comment['author']; ?> (<?php echo $recent_comment['date_added']; ?>)</p>
  <?php } ?>
</div>

<?php } elseif ($blog_block == 'tags') { ?>

<h3><?php echo $heading_tag; ?></h3>
<div>

      <?php if ($tags) { ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>

      <?php } ?> 
</div>

<?php } ?>


<?php } ?>
<script type="text/javascript"><!--
$(document).ready(function() {
  /* Search */
  $('#blog-search input[name=\'filter_title\']').parent().find('button').on('click', function() {
    url = $('base').attr('href') + 'index.php?route=blog/category';

    var filter_title = $('input[name=\'filter_title\']').val();

    if (filter_title) {
      url += '&filter_title=' + encodeURIComponent(filter_title);
    }

    location = url;
  });

  $('#blog-search input[name=\'filter_title\']').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('input[name=\'filter_title\']').parent().find('button').trigger('click');
    }
  });
  });
  //--></script>