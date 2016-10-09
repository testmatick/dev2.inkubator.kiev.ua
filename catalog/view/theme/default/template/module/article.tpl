<div class="list-group">
        <?php foreach ($articles as $article) { ?>
          <?php if ($article['article_id'] == $article_id) { ?>
          <a href="<?php echo $article['href']; ?>" class="list-group-item active"><?php echo $article['name']; ?></a>
          <?php if ($article['children']) { ?>
            <?php foreach ($article['children'] as $child) { ?>
              <?php if ($child['article_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
              <?php } ?>
            <?php } ?>
          <?php } ?>
<?php } else { ?>
<a href="<?php echo $article['href']; ?>" class="list-group-item"><?php echo $article['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>