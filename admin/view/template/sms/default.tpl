<?php echo $header; ?><?php echo $column_left; ?>

<?php if(substr(VERSION, 0, 3) != "1.4")
    echo '<div id="content">';
?>
<div class="page-header">
<div id='cartsms'>  
    
<link rel="stylesheet" type="text/css" href="view/stylesheet/cartsms.css">
<link rel="stylesheet" type="text/css" href="view/stylesheet/jquery.datetimepicker.css">
<?php
    echo $html;
?>
</div>
<?php if(substr(VERSION, 0, 3) != "1.4")
    echo '</div>';
?></div>
<?php echo $footer; ?>
