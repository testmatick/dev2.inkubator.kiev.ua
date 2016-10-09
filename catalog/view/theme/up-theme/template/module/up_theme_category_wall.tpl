<div id="homepage-category-wall" class="panel panel-default">
<?php if(($category_wall['title']) !='') { ?>
<div class="panel-heading"><h2><?php echo $category_wall['title']; ?></h2></div>
<?php } ?>
  <div class="box-category-home row marg-b-30">  
    <?php foreach ($categories as $category) { ?>
    <div class="<?php echo $ca_id; ?> col-sm-6 marg-b-20"> 
      <?php if ($cw_status_caticons) {?>
      <?php if ($category['thumb']) { ?>
      <a href="<?php echo $category['href']; ?>"><div class="image"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" /></div></a>
      <?php } ?>
      <?php } ?>
      <a href="<?php echo $category['href']; ?>"><div class="name"><?php echo $category['name']; ?></div></a>
      <?php if ($cw_status_subcategories) {?>  
      <?php if ($category['children']) { ?>
      <div class="subcat">
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
     </div>
     <?php } ?>
  </div> 
</div>  