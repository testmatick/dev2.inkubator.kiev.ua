<?php global $config; ?>

<footer>

<?php 
    $t1o_fp_fb1_title = $config->get('t1o_fp_fb1_title');
    $t1o_fp_fb1_subtitle = $config->get('t1o_fp_fb1_subtitle'); 
    $t1o_fp_fb1_content = $config->get('t1o_fp_fb1_content');
    $t1o_fp_fb2_title = $config->get('t1o_fp_fb2_title');
    $t1o_fp_fb2_subtitle = $config->get('t1o_fp_fb2_subtitle');
    $t1o_fp_fb2_content = $config->get('t1o_fp_fb2_content');
    $t1o_fp_fb3_title = $config->get('t1o_fp_fb3_title');
    $t1o_fp_fb3_subtitle = $config->get('t1o_fp_fb3_subtitle');
    $t1o_fp_fb3_content = $config->get('t1o_fp_fb3_content');
    $t1o_fp_fb4_title = $config->get('t1o_fp_fb4_title');  
    $t1o_fp_fb4_subtitle = $config->get('t1o_fp_fb4_subtitle');
    $t1o_fp_fb4_content = $config->get('t1o_fp_fb4_content');
?>

<?php if(($t1o_fp_fb1_title[$config->get('config_language_id')]) || ($t1o_fp_fb2_title[$config->get('config_language_id')]) || ($t1o_fp_fb3_title[$config->get('config_language_id')]) || ($t1o_fp_fb4_title[$config->get('config_language_id')])) { ?>
  <div id="features">
  <div class="container">
    <div class="row">

<?php if($t1o_fp_fb1_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal col-sm-6 col-md-3">
<a href="#" data-toggle="modal" data-target="#modal-fb1">
<div class="f-content">
      <span class="f-icon fi1">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_fp_fb1_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_fp_fb1_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_fp_fb1_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_fp_fb1_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="f-title"><?php echo $t1o_fp_fb1_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_fp_fb1_subtitle) { ?>
<span class="f-subtitle"><?php echo $t1o_fp_fb1_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-fb1" tabindex="-1" role="dialog" aria-labelledby="modal-fb1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-footer-fb">
        <h1><?php echo $t1o_fp_fb1_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_fp_fb1_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_fp_fb1_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>

<?php if($t1o_fp_fb2_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal col-sm-6 col-md-3">
<a href="#" data-toggle="modal" data-target="#modal-fb2">
<div class="f-content">
      <span class="f-icon fi2">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_fp_fb2_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_fp_fb2_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_fp_fb2_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_fp_fb2_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="f-title"><?php echo $t1o_fp_fb2_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_fp_fb2_subtitle) { ?>
<span class="f-subtitle"><?php echo $t1o_fp_fb2_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-fb2" tabindex="-1" role="dialog" aria-labelledby="modal-fb2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-footer-fb">
        <h1><?php echo $t1o_fp_fb2_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_fp_fb2_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_fp_fb2_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>

<?php if($t1o_fp_fb3_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal col-sm-6 col-md-3">
<a href="#" data-toggle="modal" data-target="#modal-fb3">
<div class="f-content">
      <span class="f-icon fi3">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_fp_fb3_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_fp_fb3_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_fp_fb3_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_fp_fb3_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="f-title"><?php echo $t1o_fp_fb3_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_fp_fb3_subtitle) { ?>
<span class="f-subtitle"><?php echo $t1o_fp_fb3_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-fb3" tabindex="-1" role="dialog" aria-labelledby="modal-fb3" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-footer-fb">
        <h1><?php echo $t1o_fp_fb3_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_fp_fb3_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_fp_fb3_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>

<?php if($t1o_fp_fb4_title[$config->get('config_language_id')]) { ?>
<div class="up-theme-modal col-sm-6 col-md-3">
<a href="#" data-toggle="modal" data-target="#modal-fb4">
<div class="f-content">
      <span class="f-icon fi4">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_fp_fb4_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $config->get('t1o_fp_fb4_icon') ?>" alt="+" title="+">
        <?php } else if($config->get('t1o_fp_fb4_awesome') !='') { ?>
        <i class="fa fa-<?php echo $config->get('t1o_fp_fb4_awesome'); ?>"></i>
        <?php } else { ?>
        <i class="fa fa-paper-plane"></i>
		<?php } ?>
      </span>
<span class="f-title"><?php echo $t1o_fp_fb4_title[$config->get('config_language_id')]; ?></span>
<?php if($t1o_fp_fb4_subtitle) { ?>
<span class="f-subtitle"><?php echo $t1o_fp_fb4_subtitle[$config->get('config_language_id')]; ?></span>
<?php } ?>
</div>
</a>
<div class="modal fade" id="modal-fb4" tabindex="-1" role="dialog" aria-labelledby="modal-fb4" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="content-footer-fb">
        <h1><?php echo $t1o_fp_fb4_title[$config->get('config_language_id')]; ?></h1>
        <p><?php echo $t1o_fp_fb4_subtitle[$config->get('config_language_id')]; ?></p>
        <?php echo html_entity_decode($t1o_fp_fb4_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php } ?>

    </div>
  </div>
  </div>  
<?php } ?> 

<?php if($config->get('t1o_information_column_1_status')== 1 || $config->get('t1o_information_column_2_status')== 1 || $config->get('t1o_information_column_3_status')== 1 || $config->get('t1o_custom_1_status')== 1) { ?>
  <div id="information" <?php if($config->get('t1d_bg_image_f2_parallax')== 1) { ?>data-stellar-background-ratio="0.5"<?php } ?>>
  <div class="container">
    <div class="row">
    <?php if($config->get('t1o_information_column_1_status')== 1) { ?>
      <div class="col-sm-<?php echo 12 / ($config->get('t1o_information_column_1_status') + $config->get('t1o_information_column_2_status') + $config->get('t1o_information_column_3_status') + $config->get('t1o_custom_1_status')) ; ?>">
        <h5><?php echo $text_information; ?></h5>
        <?php if ($informations) { ?>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
          <?php if($config->get('t1o_i_c_1_1_status')== 1) { ?><li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li><?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if($config->get('t1o_information_column_2_status')== 1) { ?>
      <div class="col-sm-<?php echo 12 / ($config->get('t1o_information_column_1_status') + $config->get('t1o_information_column_2_status') + $config->get('t1o_information_column_3_status') + $config->get('t1o_custom_1_status')) ; ?>">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <?php if($config->get('t1o_i_c_2_1_status')== 1) { ?><li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_2_2_status')== 1) { ?><li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_2_3_status')== 1) { ?><li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_2_4_status')== 1) { ?><li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_2_5_status')== 1) { ?><li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li><?php } ?>
        </ul>
      </div>
      <?php } ?>
      <?php if($config->get('t1o_information_column_3_status')== 1) { ?>
      <div class="col-sm-<?php echo 12 / ($config->get('t1o_information_column_1_status') + $config->get('t1o_information_column_2_status') + $config->get('t1o_information_column_3_status') + $config->get('t1o_custom_1_status')) ; ?>">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <?php if($config->get('t1o_i_c_3_1_status')== 1) { ?><li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_3_2_status')== 1) { ?><li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_3_3_status')== 1) { ?><li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_3_4_status')== 1) { ?><li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li><?php } ?>
          <?php if($config->get('t1o_i_c_3_5_status')== 1) { ?><li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li><?php } ?>
        </ul>
      </div>
      <?php } ?>
      <?php if($config->get('t1o_custom_1_status')== 1) {
        $t1o_custom_1_title = $config->get('t1o_custom_1_title');
        $t1o_custom_1_content = $config->get('t1o_custom_1_content');
      ?>
      <div class="col-sm-<?php echo 12 / ($config->get('t1o_information_column_1_status') + $config->get('t1o_information_column_2_status') + $config->get('t1o_information_column_3_status') + $config->get('t1o_custom_1_status')) ; ?>">
        <?php if($t1o_custom_1_title[$config->get('config_language_id')]) { ?>
        <h5><?php echo $t1o_custom_1_title[$config->get('config_language_id')]; ?></h5>
        <?php } ?>
        <?php echo html_entity_decode($t1o_custom_1_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
      </div>
      <?php } ?>
    </div>
  </div>
  </div>
  <?php } ?>
  
  <?php if($config->get('t1o_powered_status')== 1 || $config->get('t1o_news_status')== 1 || $config->get('t1o_follow_us_status')== 1 || $config->get('t1o_payment_block_status')== 1) { ?>
  <div id="powered">
  <div class="container">
    <div class="row">
    
      <?php if($config->get('t1o_powered_status')== 1) { ?>
      <?php $t1o_powered_content = $config->get('t1o_powered_content');  ?>
      <div class="col-sm-3">
      <?php echo html_entity_decode($t1o_powered_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>  
      </div>
      <?php } ?>
      
      
      <div class="col-sm-6">
      <?php if($config->get('t1o_news_status')== 1) { ?>
      <span id="footer-news"><?php echo $text_news; ?>:</span>
      <?php $t1o_news = $config->get('t1o_news');  ?>
      <ul id="ticker">
      <?php for ($i = 1; $i <= 10; $i++) { ?>
      <?php if($t1o_news[$i]['status'] == 1 && $t1o_news[$i][$config->get('config_language_id')]['title'] !='' || $t1o_news[$i]['url'] !='') { ?>                     
        <li>
		  <a href="<?php echo $t1o_news[$i]['url']; ?>">
          <?php echo $t1o_news[$i][$config->get('config_language_id')]['title']; ?>
          </a>
        </li>
      <?php } ?>
      <?php } ?> 
      </ul>  
      <?php } ?>
      </div>
      
      
      <div id="social-payment" class="col-sm-3">
      <ul class="list-inline">
          
        <?php if($config->get('t1o_follow_us_status')== 1) { ?>
        <li id="footer-social" class="dropup">
        <a href="#" title="<?php echo $text_social; ?>" class="dropdown-toggle" data-toggle="dropdown">
        <i data-toggle="tooltip" data-placement="left" title="<?php echo $text_social; ?>" class="fa fa-share-alt"></i>
        </a>
          <ul class="dropdown-menu dropdown-menu-right social-dropdown-menu">
            <?php if($config->get('t1o_facebook') != '') { ?>
            <li data-toggle="tooltip" title="Facebook" class="col-xs-3 col-sm-3 facebook"><a href="<?php echo $config->get('t1o_facebook'); ?>" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_twitter') != '') { ?>
            <li data-toggle="tooltip" title="Twitter" class="col-xs-3 col-sm-3 twitter"><a href="<?php echo $config->get('t1o_twitter'); ?>" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_googleplus') != '') { ?>
            <li data-toggle="tooltip" title="Google+" class="col-xs-3 col-sm-3 google"><a href="<?php echo $config->get('t1o_googleplus'); ?>" title="Google+" target="_blank"><i class="fa fa-google-plus"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_rss') != '') { ?>
            <li data-toggle="tooltip" title="RSS" class="col-xs-3 col-sm-3 rrs"><a href="<?php echo $config->get('t1o_rss'); ?>" title="RSS" target="_blank"><i class="fa fa-rss"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_pinterest') != '') { ?>
            <li data-toggle="tooltip" title="Pinterest" class="col-xs-3 col-sm-3 pinterest"><a href="<?php echo $config->get('t1o_pinterest'); ?>" title="Pinterest" target="_blank"><i class="fa fa-pinterest"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_vimeo') != '') { ?>
            <li data-toggle="tooltip" title="Vimeo" class="col-xs-3 col-sm-3 vimeo"><a href="<?php echo $config->get('t1o_vimeo'); ?>" title="Vimeo" target="_blank"><i class="fa fa-vimeo-square"></i></a></li>
            <?php } ?> 
	        <?php if($config->get('t1o_flickr') != '') { ?>
            <li data-toggle="tooltip" title="Flickr" class="col-xs-3 col-sm-3 flickr"><a href="<?php echo $config->get('t1o_flickr'); ?>" title="Flickr" target="_blank"><i class="fa fa-flickr"></i></a></li>
            <?php } ?>  
	        <?php if($config->get('t1o_linkedin') != '') { ?>
            <li data-toggle="tooltip" title="LinkedIn" class="col-xs-3 col-sm-3 linkedin"><a href="<?php echo $config->get('t1o_linkedin'); ?>" title="LinkedIn" target="_blank"><i class="fa fa-linkedin"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_youtube') != '') { ?>
           <li data-toggle="tooltip" title="YouTube" class="col-xs-3 col-sm-3 youtube"><a href="<?php echo $config->get('t1o_youtube'); ?>" title="YouTube" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
            <?php } ?>
	        <?php if($config->get('t1o_dribbble') != '') { ?>
            <li data-toggle="tooltip" title="Dribbble" class="col-xs-3 col-sm-3 dribbble"><a href="<?php echo $config->get('t1o_dribbble'); ?>" title="Dribbble" target="_blank"><i class="fa fa-dribbble"></i></a></li>
            <?php } ?>
            <?php if($config->get('t1o_instagram') != '') { ?>
            <li data-toggle="tooltip" title="Instagram" class="col-xs-3 col-sm-3 instagram"><a href="<?php echo $config->get('t1o_instagram'); ?>" title="Instagram" target="_blank"><i class="fa fa-instagram"></i></a></li>
            <?php } ?>   
            <?php if($config->get('t1o_behance') != '') { ?>
            <li data-toggle="tooltip" title="Behance" class="col-xs-3 col-sm-3 behance"><a href="<?php echo $config->get('t1o_behance'); ?>" title="Behance" target="_blank"><i class="fa fa-behance"></i></a></li>
            <?php } ?>   
            <?php if($config->get('t1o_skype') != '') { ?>
            <li data-toggle="tooltip" title="Skype" class="col-xs-3 col-sm-3 skype"><a href="skype:<?php echo $config->get('t1o_skype'); ?>" title="Skype" target="_blank"><i class="fa fa-skype"></i></a></li>
            <?php } ?>    
            <?php if($config->get('t1o_tumblr') != '') { ?>
            <li data-toggle="tooltip" title="Tumblr" class="col-xs-3 col-sm-3 tumblr"><a href="<?php echo $config->get('t1o_tumblr'); ?>" title="Tumblr" target="_blank"><i class="fa fa-tumblr"></i></a></li>
            <?php } ?>
            <?php if($config->get('t1o_reddit') != '') { ?>
            <li data-toggle="tooltip" title="Reddit" class="col-xs-3 col-sm-3 reddit"><a href="<?php echo $config->get('t1o_reddit'); ?>" title="Reddit" target="_blank"><i class="fa fa-reddit"></i></a></li>
            <?php } ?>
            <?php if($config->get('t1o_vk') != '') { ?>
            <li data-toggle="tooltip" title="VK" class="col-xs-3 col-sm-3 vk"><a href="<?php echo $config->get('t1o_vk'); ?>" title="VK" target="_blank"><i class="fa fa-vk"></i></a></li>
            <?php } ?>   
          </ul>
        </li>
        <?php } ?>
        
        <?php if($config->get('t1o_payment_block_status')== 1) { ?>
        <li id="footer-payment" class="dropup">
        <a href="#" title="<?php echo $text_social; ?>" class="dropdown-toggle" data-toggle="dropdown">
        <i data-toggle="tooltip" data-placement="left" title="<?php echo $text_payment; ?>" class="fa fa-credit-card"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-right payment-dropdown-menu">
            
        <?php if ($config->get('t1o_payment_block_custom_status') == "1"): ?>
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $config->get('config_url') . 'image/';
        }
        if ($config->get('t1o_payment_block_custom') != ''){ ?>   
        <?php if($config->get('t1o_payment_block_custom_url') != ''): ?> 
		<li class="col-xs-4 col-sm-4"><a href="<?php echo $config->get('t1o_payment_block_custom_url'); ?>" target="_blank">
			<img src="<?php echo $path_image . $config->get('t1o_payment_block_custom') ?>" alt="Payment" title="Payment"></a>
        </li>
        <?php else: ?>
        <li data-toggle="tooltip" title="Payment" class="col-xs-4 col-sm-4">       
			<img src="<?php echo $path_image . $config->get('t1o_payment_block_custom') ?>" alt="Payment" title="Payment">
        </li>
        <?php endif; ?>
		<?php } ?>
		<?php endif; ?>
        
        <?php if ($config->get('t1o_payment_paypal') == "1"): ?>
        <?php if($config->get('t1o_payment_paypal_url') != ''): ?>
		<li class="col-xs-4 col-sm-4">
        <a href="<?php echo $config->get('t1o_payment_paypal_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_paypal.png" alt="PayPal" title="PayPal"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_paypal.png" alt="PayPal" title="PayPal">
        </li>
        <?php endif; ?>
		<?php endif; ?>  
        
        <?php if ($config->get('t1o_payment_visa') == "1"): ?>
        <?php if($config->get('t1o_payment_visa_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_visa_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_visa.png" alt="Visa" title="Visa"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_visa.png" alt="Visa" title="Visa">
        </li>
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($config->get('t1o_payment_mastercard') == "1"): ?>
        <?php if($config->get('t1o_payment_mastercard_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_mastercard_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_mastercard.png" alt="MasterCard" title="MasterCard"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_mastercard.png" alt="MasterCard" title="MasterCard">
        </li>
        <?php endif; ?>
		<?php endif; ?> 
       
        <?php if ($config->get('t1o_payment_maestro') == "1"): ?>
        <?php if($config->get('t1o_payment_maestro_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_maestro_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_maestro.png" alt="Maestro" title="Maestro"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_maestro.png" alt="Maestro" title="Maestro">
        </li>
        <?php endif; ?>
		<?php endif; ?>
       
        <?php if ($config->get('t1o_payment_discover') == "1"): ?>
        <?php if($config->get('t1o_payment_discover_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_discover_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_discover.png" alt="Discover" title="Discover"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_discover.png" alt="Discover" title="Discover">
        </li>
        <?php endif; ?>
		<?php endif; ?>                   
        
        <?php if ($config->get('t1o_payment_skrill') == "1"): ?>
        <?php if($config->get('t1o_payment_skrill_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_skrill_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_skrill.png" alt="Skrill" title="Skrill"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_skrill.png" alt="Skrill" title="Skrill">
        </li>
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($config->get('t1o_payment_american_express') == "1"): ?>
        <?php if($config->get('t1o_payment_american_express_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_american_express_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_american_express.png" alt="American Express" title="American Express"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_american_express.png" alt="American Express" title="American Express">
        </li>
        <?php endif; ?>
		<?php endif; ?> 
                   
        <?php if ($config->get('t1o_payment_cirrus') == "1"): ?>
        <?php if($config->get('t1o_payment_cirrus_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_cirrus_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_cirrus.png" alt="Cirrus" title="Cirrus"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_cirrus.png" alt="Cirrus" title="Cirrus">
        </li>
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($config->get('t1o_payment_delta') == "1"): ?>
        <?php if($config->get('t1o_payment_delta_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_delta_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_delta.png" alt="Delta" title="Delta"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_delta.png" alt="Delta" title="Delta">
        </li>
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($config->get('t1o_payment_google') == "1"): ?>
        <?php if($config->get('t1o_payment_google_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_google_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_google.png" alt="Google Wallet" title="Google Wallet"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_google.png" alt="Google Wallet" title="Google Wallet">
        </li>
        <?php endif; ?>
		<?php endif; ?>
        
        <?php if ($config->get('t1o_payment_2co') == "1"): ?>
        <?php if($config->get('t1o_payment_2co_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_2co_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_2co.png" alt="2CheckOut" title="2CheckOut"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_2co.png" alt="2CheckOut" title="2CheckOut">
        </li>
        <?php endif; ?>
		<?php endif; ?> 
        
        <?php if ($config->get('t1o_payment_sage') == "1"): ?>
        <?php if($config->get('t1o_payment_sage_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_sage_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_sage.png" alt="Sage" title="Sage"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_sage.png" alt="Sage" title="Sage">
        </li>
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($config->get('t1o_payment_solo') == "1"): ?>
        <?php if($config->get('t1o_payment_solo_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_solo_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_solo.png" alt="Solo" title="Solo"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_solo.png" alt="Solo" title="Solo">
        </li>
        <?php endif; ?>
		<?php endif; ?> 
        
        <?php if ($config->get('t1o_payment_amazon') == "1"): ?>
        <?php if($config->get('t1o_payment_amazon_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_amazon_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_amazon.png" alt="Amazon Payments" title="Amazon Payments"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_amazon.png" alt="Amazon Payments" title="Amazon Payments">
        </li>
        <?php endif; ?>
		<?php endif; ?>
        
        <?php if ($config->get('t1o_payment_western_union') == "1"): ?>
        <?php if($config->get('t1o_payment_western_union_url') != ''): ?>
        <li class="col-xs-4 col-sm-4">
			<a href="<?php echo $config->get('t1o_payment_western_union_url'); ?>" target="_blank">
			<img src="catalog/view/theme/up-theme/image/payment/payment_image_western_union.png" alt="Western Union" title="Western Union"></a>
        </li>
        <?php else: ?>
        <li class="col-xs-4 col-sm-4">
            <img src="catalog/view/theme/up-theme/image/payment/payment_image_western_union.png" alt="Western Union" title="Western Union">
        </li>
        <?php endif; ?>
		<?php endif; ?>
            
          </ul>
        </li>
        <?php } ?>
 
      </ul>
      </div>
      
    </div>
  </div>
  </div>
  <?php } ?>
  
  <?php if($config->get('t1o_custom_2_status')== 1) { ?>
<?php $t1o_custom_2_content = $config->get('t1o_custom_2_content');  ?>
<div id="footer_custom">
<div class="container">
<div class="row">
<div id="footer_custom_bottom" class="col-sm-12 padd-t-b-30">
<?php echo html_entity_decode($t1o_custom_2_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
</div>
</div>
</div>
</div>
<?php } ?>

</footer>

<script src="catalog/view/theme/up-theme/js/jquery.visible.min.js" type="text/javascript"></script>
<script type="text/javascript">

var win = $(window);

var allMods = $("footer");

allMods.each(function(i, el) {
    
  if ($(el).visible(true)) {
    $(el).addClass("already-visible"); 
  }
  
});

win.scroll(function(event) {
  
  allMods.each(function(i, el) {
    
    var el = $(el);
    
    if (el.visible(true)) {
      el.addClass("come-in"); 
    } else {
      el.removeClass("come-in already-visible");
    }
    
  });
  
}); 
</script> 
<script src="catalog/view/theme/up-theme/js/tickerme.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$('#ticker').tickerme();
});
</script>
<script type="text/javascript" src="catalog/view/theme/up-theme/js/jquery.easing-1.3.min.js"></script>
<?php if($config->get('t1o_header_fixed_header_status') ==1) { ?>
<script type="text/javascript" src="catalog/view/theme/up-theme/js/jquery.sticky.js"></script>
<?php } ?>
<?php if($config->get('t1o_header_auto_suggest_status') ==1) { ?>
<link rel="stylesheet" property="stylesheet" type="text/css" href="catalog/view/theme/up-theme/stylesheet/livesearch.css" />
<script type="text/javascript" src="catalog/view/theme/up-theme/js/livesearch.js"></script>
<?php } ?>
<?php if($config->get('t1o_others_totop') =='1') { ?>	
<link rel="stylesheet" property="stylesheet" type="text/css" href="catalog/view/theme/up-theme/stylesheet/ui.totop.css" />
<script type="text/javascript" src="catalog/view/theme/up-theme/js/jquery.ui.totop.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {	
		$().UItoTop({ easingType: 'easeOutQuart' });	
	});
</script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/up-theme/js/quickview/quickview.js"></script>		
<link rel="stylesheet" property="stylesheet" href="catalog/view/theme/up-theme/js/quickview/fancybox/jquery.fancybox.css" />
<script src="catalog/view/theme/up-theme/js/quickview/fancybox/jquery.fancybox.pack.js"></script>
<script src="catalog/view/theme/up-theme/js/jquery.stellar.js" type="text/javascript"></script>
<?php if($config->get('t1o_eu_cookie_status')== 1) { 
  $t1o_eu_cookie_message = $config->get('t1o_eu_cookie_message');
  $t1o_eu_cookie_close = $config->get('t1o_eu_cookie_close');
?>
<script src="catalog/view/theme/up-theme/js/jquery.eucookiebar.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('.cookie-message').cookieBar({ closeButton : '.my-close-button' });
    });
</script>
<div class="cookie-message hidden-xs">
  <span class="cookie-img"><img src="catalog/view/theme/up-theme/image/321_cookie.png" alt="Cookie" title="Cookie"></span>
  <?php echo html_entity_decode($t1o_eu_cookie_message[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
  <a class="my-close-button btn btn-primary" href="#"><?php echo $t1o_eu_cookie_close[$config->get('config_language_id')]; ?></a>
</div>
<?php } ?>

<?php if($config->get('t1o_custom_js') !='') { ?>
<?php echo htmlspecialchars_decode( $config->get('t1o_custom_js'), ENT_QUOTES ); ?>
<?php } ?>

</div>
<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'bR5hfujqbm';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->


<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter39862010 = new Ya.Metrika({
                    id:39862010,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/39862010" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</body></html>