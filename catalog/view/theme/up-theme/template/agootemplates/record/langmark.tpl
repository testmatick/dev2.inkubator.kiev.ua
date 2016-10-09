<?php if (count($languages) > 1) { ?>


<div class="pull-right">

<div id="langmark">
 

<div class="btn-group">
 <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
 <?php foreach ($languages as $language) { ?>
 <?php if ($language['code'] == $code) { ?>
 <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
 <?php } ?>
 <?php } ?>
 <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_language; ?></span> <i class="fa fa-angle-down"></i></button>
 <ul class="dropdown-menu dropdown-menu-right">
 <?php foreach ($languages as $language) { ?>
 <li><a href="<?php echo $language['url']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
 <?php } ?>
 </ul>
 </div>


 
 
</div>

</div>


<?php } ?>
