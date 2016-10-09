<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<?php global $config; ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/up-theme/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/up-theme/stylesheet/stylesheet-small-screens.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/up-theme/js/custom-theme.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/up-theme/stylesheet/cloud-zoom.css" />
<script type="text/javascript" src="catalog/view/theme/up-theme/js/cloud-zoom.js"></script>
<?php if($config->get('t1o_left_right_column_categories_type')== 0) { ?>
<link rel="stylesheet" property="stylesheet" type="text/css" href="catalog/view/theme/up-theme/stylesheet/dcaccordion.css" />	
<script type="text/javascript" src="catalog/view/theme/up-theme/js/jquery.dcjqaccordion.js"></script>
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<?php if($config->get('t1d_skin') =='skin1-default') { ?>
<style type="text/css">

/*  Body background color and pattern  */
body {
<?php if($config->get('t1d_body_bg_color') !='') { ?>
	background-color: <?php echo $config->get('t1d_body_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1d_bg_image_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_custom') ?>"); ?>;
<?php } else if($config->get('t1d_pattern_body') !='none') { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_body'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($config->get('t1d_bg_image_position') !='') || ($config->get('t1d_bg_image_repeat') !='') || ($config->get('t1d_bg_image_attachment') !='')) { ?>
	background-position: <?php echo $config->get('t1d_bg_image_position'); ?>;
	background-repeat: <?php echo $config->get('t1d_bg_image_repeat'); ?>;
	background-attachment: <?php echo $config->get('t1d_bg_image_attachment'); ?>;
<?php } ?>
}

/*  Headings color  */
h1, h2, h3, h4, h5, h6, .panel-default > .panel-heading, .product-thumb h4 a, #column-left .product-thumb h4 a, #column-right .product-thumb h4 a, .table > thead, .nav-tabs > li > a:hover, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, legend, #search .form-control, .product-right-sm-info span.p-title, .product-right-sm-related .name a {color: <?php echo $config->get('t1d_headings_color'); ?>;}
<?php if($config->get('t1d_headings_border_status') ==1) { ?>
#content h1::before, #content h2::before {border-bottom: 3px solid <?php echo $config->get('t1d_headings_border_color'); ?>;}
#content h1, #content h2 {padding-bottom: 25px;}
<?php } else { ?>
#content h1, #content h2 {padding-bottom: 0;}
<?php } ?>

/*  Body text color  */
body, #content .tab-content p, #content .product-right-sm-info .modal-body p, .product-buy ul.pf span {color: <?php echo $config->get('t1d_body_text_color'); ?>;}

/*  Light text color  */
small, #content p, .breadcrumb a, .cat-description, .product-thumb .product_box_brand a, .product-buy ul.pf li, .product-buy ul.pp, .prev-name, .next-name, .product-right-sm-info span.p-subtitle, .product-right-sm-related .product_box_brand a, .box-category-home .subcat a, #content .product-right-sm-info .modal-body h1 + p, #features .modal-body h1 + p, .cookie-message, .alert-success, .alert-info, .dropdown-highlight {color: <?php echo $config->get('t1d_light_text_color'); ?>;}

/*  Links color  */
a, a:focus, .list-group a {color: <?php echo $config->get('t1d_other_links_color'); ?>;}

/*  Links hover color  */
a:hover, .breadcrumb a:hover, .dropdown-highlight:hover, .dropdown-highlight:focus, .box-category-home .subcat li:hover a, .table .btn, .table .btn-primary, .table .btn-primary:hover, .table .btn-primary:focus, .list-group a.active, .list-group a.active:hover, .list-group a:hover, .category-list .image:hover, .save-percent {color: <?php echo $config->get('t1d_links_hover_color'); ?>;}

/*  Icons color  */
.dr-menu > div .dr-icon i, .category-list i, #menu_brands .image i, .box-manufacturers-home .image i, #search .input-group-addon .btn, .accordion li.dcjq-parent-li > a + .dcjq-icon {color: <?php echo $config->get('t1d_icons_color'); ?>;}
.owl-carousel .owl-buttons div {color: <?php echo $config->get('t1d_icons_color'); ?>!important;}

/*  Icons hover color  */
.dr-menu.dr-menu-open > div .dr-icon i, #search .input-group-addon .btn:hover, .up-theme-modal .modal-body .close, .product-right-sm-info span.p-icon i, .alert-success i, .alert-success .close, .alert-info i, .alert-info .close, .accordion li.dcjq-parent-li > a + .dcjq-icon:hover, .up-theme-gallery-content .gallery-hover-box i, .up-theme-modal-popup .modal-body .close {color: <?php echo $config->get('t1d_icons_hover_color'); ?>;}
.owl-carousel .owl-buttons div:hover, .mfp-close:hover {color: <?php echo $config->get('t1d_icons_hover_color'); ?>!important;}
#toTop {background-color: <?php echo $config->get('t1d_icons_hover_color'); ?>;}

/*  Wrapper Frame  */
.wrapper.framed {background-color: <?php echo $config->get('t1d_wrapper_frame_bg_color'); ?>;}
.wrapper.full-width-border {border: 34px solid <?php echo $config->get('t1d_wrapper_frame_bg_color'); ?>;}

/*  Content Column  */
#content, #content .panel-default > .panel-heading, #content .panel, .category-list + .panel-default > .panel-heading, #search .form-control, #search .input-group-addon, #search .input-group-addon .btn, #livesearch_search_results, .modal-content, .alert-success, .alert-info, .cookie-message, .custom_box {
	background-color: <?php echo $config->get('t1d_content_column_bg_color'); ?>;
}
.product-filter, .dropdown-highlight {
	background-color: <?php echo $config->get('t1d_content_column_hli_bg_color'); ?>;
}
<?php if($config->get('t1d_content_column_hli_buy_column') ==1) { ?>
.product-buy .product-buy-wrapper {
	background-color: <?php echo $config->get('t1d_content_column_hli_bg_color'); ?>;
	padding: 30px;
}
<?php } ?>
.product-filter, .pagination-box, #content .panel-default > .panel-heading, #product-tabs, #livesearch_search_results li, .modal-footer, .list-group a, .list-group a.active, .list-group a.active:hover, .list-group a:hover, a.list-group-item.active, a.list-group-item.active:hover, a.list-group-item.active:focus, .dr-menu ul li {
    border-top: 1px solid <?php echo $config->get('t1d_content_column_separator_color'); ?>;	
}	
.product-filter, .modal-header, .box-category-home .subcat li {
    border-bottom: 1px solid <?php echo $config->get('t1d_content_column_separator_color'); ?>;	
}
.well, .table-bordered, .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td, .contact-map, .img-thumbnail-theme {
    border: 1px solid <?php echo $config->get('t1d_content_column_separator_color'); ?>;	
}
hr, legend, #search .input-group-addon {
	border-color: <?php echo $config->get('t1d_content_column_separator_color'); ?>;
}
.nav-tabs > li > a:hover, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus {
    border-top: 1px solid <?php echo $config->get('t1d_content_column_active_tab_border_color'); ?>;	
}

/*  Left Column Heading  */
#column-left .panel-heading  {	
	background-color: <?php echo $config->get('t1d_left_column_head_bg_color'); ?>;
}
#column-left .panel-default > .panel-heading, #column-left .panel-default > .panel-heading h2 {color: <?php echo $config->get('t1d_left_column_head_title_color'); ?>;}
<?php if($config->get('t1d_left_column_head_border_status') ==1) { ?>	
#column-left .panel-default > .panel-heading, #column-left .dr-menu.dr-menu-open > .panel-heading {
	border-bottom: <?php echo $config->get('t1d_left_column_head_border_size'); ?>px solid <?php echo $config->get('t1d_left_column_head_border_color'); ?>;
}
<?php } ?>

/*  Left Column Box  */
#column-left .panel, #column-left .owl-carousel {
	background-color: <?php echo $config->get('t1d_left_column_box_bg_color'); ?>;
}
#column-left a {color: <?php echo $config->get('t1d_left_column_box_links_color'); ?>;}
#column-left a:hover {color: <?php echo $config->get('t1d_left_column_box_links_color_hover'); ?>;}
#column-left {color: <?php echo $config->get('t1d_left_column_box_text_color'); ?>;} 
#column-left .list-group a, #column-left .list-group a.active, #column-left .list-group a.active:hover, #column-left .list-group a:hover, #column-left .dr-menu ul li {border-top: 1px solid <?php echo $config->get('t1d_left_column_box_separator_color'); ?>;}
#column-left .panel, #column-left .owl-carousel.carousel-module, #column-left .owl-carousel.banner-module {border-bottom: 1px solid <?php echo $config->get('t1d_left_column_box_separator_color'); ?>!important;}
#column-left {border-right: 1px solid <?php echo $config->get('t1d_left_column_box_separator_color'); ?>;}


/*  Right Column Heading  */
#column-right .panel-heading  {
	background-color: <?php echo $config->get('t1d_right_column_head_bg_color'); ?>;
}
#column-right .panel-default > .panel-heading, #column-right .panel-default > .panel-heading h2 {color: <?php echo $config->get('t1d_right_column_head_title_color'); ?>;}
<?php if($config->get('t1d_right_column_head_border_status') ==1) { ?>	
#column-right .panel-default > .panel-heading, #column-right .dr-menu.dr-menu-open > .panel-heading  {
	border-bottom: <?php echo $config->get('t1d_right_column_head_border_size'); ?>px solid <?php echo $config->get('t1d_right_column_head_border_color'); ?>;
}
<?php } ?>

/*  Right Column Box  */
#column-right .panel, #column-right .owl-carousel {
	background-color: <?php echo $config->get('t1d_right_column_box_bg_color'); ?>;
}
#column-right a {color: <?php echo $config->get('t1d_right_column_box_links_color'); ?>;}
#column-right a:hover, #column-right .dr-menu > div .dr-icon i {color: <?php echo $config->get('t1d_right_column_box_links_color_hover'); ?>;}
#column-right {color: <?php echo $config->get('t1d_right_column_box_text_color'); ?>;}
#column-right .list-group a, #column-right .list-group a.active, #column-right .list-group a.active:hover, #column-right .list-group a:hover, #column-right .dr-menu ul li {border-top: 1px solid <?php echo $config->get('t1d_right_column_box_separator_color'); ?>;}
#column-right .panel, #column-right .owl-carousel.carousel-module, #column-right .owl-carousel.banner-module {border-bottom: 1px solid <?php echo $config->get('t1d_right_column_box_separator_color'); ?>!important;}
#column-right {border-left: 1px solid <?php echo $config->get('t1d_right_column_box_separator_color'); ?>;}


/*  Category Box Heading  */
#column-left .panel-default.panel-category > .panel-heading, #column-right .panel-default.panel-category > .panel-heading {
	background-color: <?php echo $config->get('t1d_category_box_head_bg_color'); ?>;
    color: <?php echo $config->get('t1d_category_box_head_title_color'); ?>;
<?php if($config->get('t1d_category_box_head_border_status') ==1) { ?>	
	border-bottom: <?php echo $config->get('t1d_category_box_head_border_size'); ?>px solid <?php echo $config->get('t1d_category_box_head_border_color'); ?>;
<?php } ?>
}

/*  Category Box Content  */
#column-left .panel-default.panel-category, #column-right .panel-default.panel-category {
	background-color: <?php echo $config->get('t1d_category_box_box_bg_color'); ?>;
    border-bottom: 1px solid <?php echo $config->get('t1d_category_box_box_separator_color'); ?>!important;	
}
#column-left .panel-default.panel-category a.list-group-item, #column-right .panel-default.panel-category a.list-group-item, .accordion li {
	border-top: 1px solid <?php echo $config->get('t1d_category_box_box_separator_color'); ?>;	
}
#column-left .panel-default.panel-category a, #column-right .panel-default.panel-category a {color: <?php echo $config->get('t1d_category_box_box_links_color'); ?>;}
#column-left .panel-default.panel-category a:hover, #column-right .panel-default.panel-category a:hover, #column-left .panel-default.panel-category .cat-mod-child a:hover, #column-right .panel-default.panel-category .cat-mod-child a:hover, #column-left .panel-default.panel-category a.list-group-item.active, #column-right .panel-default.panel-category a.list-group-item.active {color: <?php echo $config->get('t1d_category_box_box_links_color_hover'); ?>;}
#column-left .panel-default.panel-category .cat-mod-child a, #column-right .panel-default.panel-category .cat-mod-child a, #column-left .accordion li ul li a.list-group-item {color: <?php echo $config->get('t1d_category_box_box_subcat_color'); ?>;}


/*  Filter Box Heading  */
#column-left .panel-default.filters > .panel-heading, #column-right .panel-default.filters > .panel-heading  {
	background-color: <?php echo $config->get('t1d_filter_box_head_bg_color'); ?>;
    color: <?php echo $config->get('t1d_filter_box_head_title_color'); ?>;
<?php if($config->get('t1d_filter_box_head_border_status') ==1) { ?>	
	border-bottom: <?php echo $config->get('t1d_filter_box_head_border_size'); ?>px solid <?php echo $config->get('t1d_filter_box_head_border_color'); ?>;
<?php } ?>
}

/*  Filter Box Content  */
#column-left .panel-default.filters, #column-right .panel-default.filters {
	background-color: <?php echo $config->get('t1d_filter_box_box_bg_color'); ?>;
    border-bottom: 1px solid <?php echo $config->get('t1d_filter_box_box_separator_color'); ?>!important;
}
#column-left .panel-default.filters a, #column-right .panel-default.filters a {color: <?php echo $config->get('t1d_filter_box_box_filter_title_color'); ?>;}
#column-left .panel-default.filters label, #column-right .panel-default.filters label {color: <?php echo $config->get('t1d_filter_box_box_filter_name_color'); ?>;}
#column-left .panel-default.filters label:hover, #column-right .panel-default.filters label:hover {color: <?php echo $config->get('t1d_filter_box_box_filter_name_color_hover'); ?>;}

/*  Text Logo  */
#logo h1 a, #logo-menu h1 a {color: <?php echo $config->get('t1o_text_logo_color'); ?>;}

/*  Top Promo Message Slider  */
#top-custom-block-content {
	display:none;
}
#top-custom-block-wrapper {
<?php if($config->get('t1o_top_custom_block_bg_color') !='') { ?>
	background-color: <?php echo $config->get('t1o_top_custom_block_bg_color'); ?>;
	color: <?php echo $config->get('t1o_top_custom_block_text_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1o_top_custom_block_bg') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1o_top_custom_block_bg') ?>"); ?>;
<?php } else { ?>
	background-image: none;
<?php } ?>
<?php if($config->get('t1o_top_custom_block_bg_animation') =='1') { ?>
    animation: animatedBackground 40s linear infinite;
<?php } ?>
}

/*  Layout  */

<?php if($config->get('t1o_layout_l') =='2') { ?>
.wrapper.framed {
    max-width: 940px;
}
<?php } ?>
<?php if($config->get('t1o_layout_catalog_mode') =='1') { ?>
#top #top-links, #top #currency, #cart, .price, .price-new, .price-old, .product-buy ul.pp, .flybar-cart, .cart, .product-buy #product, .wishlist, .compare, #compare-total, span.badge.sale, .alert, .quickview-success {
    display: none;
}
.product-grid .info, #content .box-product .info, .product-box-slider-flexslider .info, .product-bottom-related-flexslider .info {
	top: 10px;
}
.product-list .list-quickview {
	margin-top: 20px;
}
.product-grid > div:hover .flybar, .product-gallery > div:hover .flybar, #content .box-product > div:hover .flybar, .product-box-slider-flexslider ul > li:hover .flybar, .product-bottom-related-flexslider ul > li:hover .flybar {
	bottom: -10px;
}
@media (max-width: 767px) {
.buttons-header {width: 50%;}
#search-block {border-left: none!important;}
}
<?php } ?>

/*  HEADER  */

header {
<?php if(($config->get('t1d_top_area_bg_color') !='') && ($config->get('t1d_top_area_status') ==1)) { ?>
	background-color: <?php echo $config->get('t1d_top_area_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1d_bg_image_ta_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_ta_custom') ?>"); ?>;
<?php } else if($config->get('t1d_pattern_k_ta') !='none') { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_k_ta'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($config->get('t1d_bg_image_ta_position') !='') || ($config->get('t1d_bg_image_ta_repeat') !='') || ($config->get('t1d_bg_image_ta_attachment') !='')) { ?>
	background-position: <?php echo $config->get('t1d_bg_image_ta_position'); ?>;
	background-repeat: <?php echo $config->get('t1d_bg_image_ta_repeat'); ?>;
	background-attachment: <?php echo $config->get('t1d_bg_image_ta_attachment'); ?>;
<?php } ?>
}
.is-sticky #menu {
	background-color: <?php echo $config->get('t1d_top_area_mini_bg_color'); ?>;
}
.button-i {color: <?php echo $config->get('t1d_top_area_icons_color'); ?>;}
.buttons-header:hover .button-i {color: <?php echo $config->get('t1d_top_area_icons_color_hover'); ?>;}
.buttons-header button, .buttons-header span.button-text {color: <?php echo $config->get('t1d_top_area_link_color'); ?>;}
.buttons-header:hover, .buttons-header:hover button, .buttons-header:hover span.button-text {color: <?php echo $config->get('t1d_top_area_link_color_hover'); ?>;}
<?php if($config->get('t1d_top_area_separator_status') ==1) { ?>
.col-sm-8 #information-block, .col-sm-8 #contact-block, #search-block, #cart, #menu-mobile-block {
	border-left: 1px solid <?php echo $config->get('t1d_top_area_separator_color'); ?>;
}
#information-block, #contact-block {
	border-right: 1px solid <?php echo $config->get('t1d_top_area_separator_color'); ?>;
}
@media (max-width: 767px) {
#search-block, #cart, #menu-mobile-block {
	border-top: 1px solid <?php echo $config->get('t1d_top_area_separator_color'); ?>;
}
}
<?php } ?>

/*  Top Bar  */
#top, #open-top-custom-block {
<?php if($config->get('t1o_top_bar_status') =='0') { ?>
    display: none;
<?php } ?>
<?php if($config->get('t1d_top_area_tb_bg_status') ==1) { ?>
	background-color: <?php echo $config->get('t1d_top_area_tb_bg_color'); ?>;
<?php } ?>
}
#top, #top-links li {
	color: <?php echo $config->get('t1d_top_area_tb_text_color'); ?>;
}
#top a, #top .btn-link, #top-links a {
	color: <?php echo $config->get('t1d_top_area_tb_link_color'); ?>;
}
#top a:hover, #top .btn-link:hover, #top .btn-link:hover i, #top-links a:hover, #top-links a:hover i, #open-top-custom-block i {
	color: <?php echo $config->get('t1d_top_area_tb_link_color_hover'); ?>;
}
<?php if($config->get('t1d_top_area_separator_status') ==1) { ?>
#open-top-custom-block {
	border-left: 1px solid <?php echo $config->get('t1d_top_area_tb_separator_color'); ?>;
}
<?php } ?>
#open-top-custom-block.open i, #top-links i, #top .btn-link i {
	color: <?php echo $config->get('t1d_top_area_tb_icons_color'); ?>;
} 
<?php if($config->get('t1d_top_area_tb_bottom_border_status') ==1) { ?>
#top {
	border-bottom: 1px solid <?php echo $config->get('t1d_top_area_tb_bottom_border_color'); ?>;
}
<?php } ?>

<?php if($config->get('t1o_logo_position') =='left') { ?>
#logo {text-align: left;}
#menu-mobile-block {float: left;}
<?php } else { ?>
#menu-mobile-block {float: right;}
<?php } ?>

/*  Fixed Header  */
<?php if($config->get('t1o_header_fixed_header_style') ==0) { ?>
.is-sticky #logo-menu-container {
	display: none;
}
<?php } else { ?>
.is-sticky .navbar {
	text-align: left;
}
<?php } ?>

/*  MAIN MENU */

/*  Main Menu Bar  */
#menu {
<?php if(($config->get('t1d_mm_bg_color') !='') && ($config->get('t1d_mm_bg_color_status') ==1)) { ?>	
	background-color: <?php echo $config->get('t1d_mm_bg_color'); ?>;
<?php }
if(($config->get('t1d_mm_border_top_color') !='') && ($config->get('t1d_mm_border_top_status') ==1)) { ?>	
    border-top: <?php echo $config->get('t1d_mm_border_top_size'); ?>px solid <?php echo $config->get('t1d_mm_border_top_color'); ?>;	
<?php }
if(($config->get('t1d_mm_border_bottom_color') !='') && ($config->get('t1d_mm_border_bottom_status') ==1)) { ?>	
    border-bottom: <?php echo $config->get('t1d_mm_border_bottom_size'); ?>px solid <?php echo $config->get('t1d_mm_border_bottom_color'); ?>;	
<?php }
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if(($config->get('t1d_bg_image_mm_custom') !='') && ($config->get('t1d_mm_bg_color_status') ==1)) { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_mm_custom') ?>"); ?>;
<?php } else if(($config->get('t1d_pattern_k_mm') !='none') && ($config->get('t1d_mm_bg_color_status') ==1)) { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_k_mm'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if($config->get('t1d_bg_image_mm_repeat') !='') { ?>
	background-repeat: <?php echo $config->get('t1d_bg_image_mm_repeat'); ?>;
<?php } ?>
}
<?php if($config->get('t1d_mm_separator_status') ==1) { ?>
#homepage, .menu_oc, #menu_ver, #menu_hor, #menu_brands, .menu_links, #menu_custom_menu, .menu_custom_block {
	border-left: <?php echo $config->get('t1d_mm_separator_size'); ?>px solid <?php echo $config->get('t1d_mm_separator_color'); ?>;
}
.navbar .main-menu > li:last-child {
	border-right: <?php echo $config->get('t1d_mm_separator_size'); ?>px solid <?php echo $config->get('t1d_mm_separator_color'); ?>;
}
<?php } ?>
<?php if(($config->get('t1d_mm_hover_border_top_color') !='') && ($config->get('t1d_mm_border_top_status') ==1)) { ?>
#menu .main-menu > li > a:hover, #menu .main-menu > li.open > a {
	border-top: <?php echo $config->get('t1d_mm_border_top_size'); ?>px solid <?php echo $config->get('t1d_mm_hover_border_top_color'); ?>;
}
#menu .main-menu > li > a {
	border-top: <?php echo $config->get('t1d_mm_border_top_size'); ?>px solid transparent;
	margin-top: -<?php echo $config->get('t1d_mm_border_top_size'); ?>px;
}
<?php } ?>

/*  Home Page Link  */
<?php if(($config->get('t1d_mm1_bg_color') !='') && ($config->get('t1d_mm1_bg_color_status') ==1)) { ?> 
#menu #homepage {
	background-color: <?php echo $config->get('t1d_mm1_bg_color'); ?>;
}
<?php }
if($config->get('t1d_mm1_bg_hover_color') !='') { ?> 
#menu #homepage:hover {
	background-color: <?php echo $config->get('t1d_mm1_bg_hover_color'); ?>;
}	
<?php }
if(($config->get('t1d_mm1_link_color') !='') || ($config->get('t1d_mm1_link_hover_color') !='')) { ?> 
#menu #homepage a {
	color: <?php echo $config->get('t1d_mm1_link_color'); ?>;
}	
#menu #homepage:hover a {
	color: <?php echo $config->get('t1d_mm1_link_hover_color'); ?>;
}
<?php } ?>

/*  Categories Section  */
<?php if(($config->get('t1d_mm2_bg_color') !='') && ($config->get('t1d_mm2_bg_color_status') ==1)) { ?> 
.menu_oc, #menu_ver, #menu_hor  {
	background-color: <?php echo $config->get('t1d_mm2_bg_color'); ?>;
}
<?php }
if($config->get('t1d_mm2_bg_hover_color') !='') { ?> 
.menu_oc:hover, #menu_ver:hover, #menu_hor:hover  {
	background-color: <?php echo $config->get('t1d_mm2_bg_hover_color'); ?>;
}
<?php }
if(($config->get('t1d_mm2_link_color') !='') || ($config->get('t1d_mm2_link_hover_color') !='')) { ?> 
.menu_oc > a, #menu_ver > a, #menu_hor > a {
	color: <?php echo $config->get('t1d_mm2_link_color'); ?>;
}	
.menu_oc:hover > a, #menu_ver:hover > a, #menu_hor:hover > a {
	color: <?php echo $config->get('t1d_mm2_link_hover_color'); ?>;
}
<?php } ?>

/*  Brands Section  */
<?php if(($config->get('t1d_mm3_bg_color') !='') && ($config->get('t1d_mm3_bg_color_status') ==1)) { ?> 
#menu_brands {
	background-color: <?php echo $config->get('t1d_mm3_bg_color'); ?>;
}
<?php }
if($config->get('t1d_mm3_bg_hover_color') !='') { ?> 
#menu_brands:hover {
	background-color: <?php echo $config->get('t1d_mm3_bg_hover_color'); ?>;
}
<?php }
if(($config->get('t1d_mm3_link_color') !='') || ($config->get('t1d_mm3_link_hover_color') !='')) { ?> 
#menu_brands > a {
	color: <?php echo $config->get('t1d_mm3_link_color'); ?>;
}	
#menu_brands:hover > a {
	color: <?php echo $config->get('t1d_mm3_link_hover_color'); ?>;
}
<?php } ?>

/*  Custom Links Section  */
<?php if(($config->get('t1d_mm4_bg_color') !='') && ($config->get('t1d_mm4_bg_color_status') ==1)) { ?> 
.menu_links {
	background-color: <?php echo $config->get('t1d_mm4_bg_color'); ?>;
}	
<?php }
if($config->get('t1d_mm4_bg_hover_color') !='') { ?> 
.menu_links:hover {
	background-color: <?php echo $config->get('t1d_mm4_bg_hover_color'); ?>;
}	
<?php }
if(($config->get('t1d_mm4_link_color') !='') || ($config->get('t1d_mm4_link_hover_color') !='')) { ?> 
.menu_links a {
	color: <?php echo $config->get('t1d_mm4_link_color'); ?>;
}	
.menu_links:hover a {
	color: <?php echo $config->get('t1d_mm4_link_hover_color'); ?>;
}
<?php } ?>

/*  Custom Menu Section  */
<?php if(($config->get('t1d_mm5_bg_color') !='') && ($config->get('t1d_mm5_bg_color_status') ==1)) { ?> 
#menu_custom_menu {
	background-color: <?php echo $config->get('t1d_mm5_bg_color'); ?>;
}
<?php }
if($config->get('t1d_mm5_bg_hover_color') !='') { ?> 
#menu_custom_menu:hover {
	background-color: <?php echo $config->get('t1d_mm5_bg_hover_color'); ?>;
}
<?php }
if(($config->get('t1d_mm5_link_color') !='') || ($config->get('t1d_mm5_link_hover_color') !='')) { ?> 
#menu_custom_menu > a {
	color: <?php echo $config->get('t1d_mm5_link_color'); ?>;
}	
#menu_custom_menu:hover > a {
	color: <?php echo $config->get('t1d_mm5_link_hover_color'); ?>;
}
<?php } ?>

/*  Custom Blocks Section  */
<?php if(($config->get('t1d_mm6_bg_color') !='') && ($config->get('t1d_mm6_bg_color_status') ==1)) { ?> 
.menu_custom_block {
	background-color: <?php echo $config->get('t1d_mm6_bg_color'); ?>;
}
<?php }
if($config->get('t1d_mm6_bg_hover_color') !='') { ?> 
.menu_custom_block:hover {
	background-color: <?php echo $config->get('t1d_mm6_bg_hover_color'); ?>;
}	
<?php }
if(($config->get('t1d_mm6_link_color') !='') || ($config->get('t1d_mm6_link_hover_color') !='')) { ?> 
.menu_custom_block > a {
	color: <?php echo $config->get('t1d_mm6_link_color'); ?>;
}	
.menu_custom_block:hover > a {
	color: <?php echo $config->get('t1d_mm6_link_hover_color'); ?>;
}
<?php } ?>

/*  Sub-Menu  */
#menu .dropdown-menu, #menu .dropdown-menus {
	background-color: <?php echo $config->get('t1d_mm_sub_bg_color'); ?>;
	color: <?php echo $config->get('t1d_mm_sub_text_color'); ?>;
}
#menu .dropdown-highlight {
	background-color: <?php echo $config->get('t1d_mm_sub_titles_bg_color'); ?>;
}
#menu .dropdown-menus a, #menu_brands .brand-item .name {
	color: <?php echo $config->get('t1d_mm_sub_link_color'); ?>;
}	
#menu .dropdown-menus a:hover, #menu .dropdown-menus li a:hover, #menu #menu_hor .dropdown-menus li.sub-cat:hover > a, #menu #menu_hor .dropdown-menus li.main-cat > a:hover, #menu_brands .brand-item .name:hover {
	color: <?php echo $config->get('t1d_mm_sub_link_hover_color'); ?>;
}
.menu_oc ul > li, #menu_ver ul > li, #menu_custom_menu ul > li, .menu_custom_block table ul > li, #menu .dropdown-menu li, #menu .dropdown-menus li {
	border-bottom: 1px solid <?php echo $config->get('t1d_mm_sub_separator_color'); ?>;
}
#menu_hor .dropdown-menus ul > li ul > li {
<?php if($config->get('t1o_menu_main_category_icon_status') == 0) { ?>
    border-bottom: 1px solid <?php echo $config->get('t1d_mm_sub_separator_color'); ?>;
	<?php } else { ?>
	border-bottom: none;
<?php } ?>	
}
#menu .dropdown-menus a.see-all {
	border-top: 1px solid <?php echo $config->get('t1d_mm_sub_separator_color'); ?>;
}
#menu .dropdown-menu, #menu .dropdown-menus {
<?php if($config->get('t1d_mm_sub_box_shadow') == 1) { ?>
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2);
<?php } else { ?>
	box-shadow: none;
<?php } ?>
}

/*  Main Menu Labels  */
<?php $t1o_menu_labels_color = $config->get('t1o_menu_labels_color');  ?>
<?php for ($i = 1; $i <= 15; $i++) { ?>
#menu_label<?php echo $i; ?>:after { background-color:<?php echo $t1o_menu_labels_color[$i]; ?>; }
<?php } ?> 
#menu .cat-img img {margin-right: <?php echo $config->get('t1o_menu_main_category_icon_margin'); ?>px;}
.navbar {text-align: <?php echo $config->get('t1o_menu_align'); ?>;}

/*  Custom Bar below Main Menu  */
#custom-bar-wrapper {
<?php if($config->get('t1o_custom_bar_below_menu_bg_color') !='') { ?>
	background-color: <?php echo $config->get('t1o_custom_bar_below_menu_bg_color'); ?>;
	color: <?php echo $config->get('t1o_custom_bar_below_menu_text_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1o_custom_bar_below_menu_bg') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1o_custom_bar_below_menu_bg') ?>"); ?>;
<?php } else { ?>
	background-image: none;
<?php } ?>
<?php if($config->get('t1o_custom_bar_below_menu_bg_animation') =='1') { ?>
    animation: animatedBackground 40s linear infinite;
<?php } ?>
}

/*  Slider Controls */
.owl-controls .owl-page span {background: <?php echo $config->get('t1d_mid_slider_control_color'); ?>;}
.owl-controls .owl-page.active span {background: <?php echo $config->get('t1d_mid_slider_control_color_active'); ?>;}

/*  Category Page  */
.category_top_title h1 {color: <?php echo $config->get('t1o_category_title_above_color'); ?>;}

/*  Product Box  */
span.badge.sale {background-color: <?php echo $config->get('t1d_mid_prod_box_sale_icon_color'); ?>;}
span.badge.new {background-color: <?php echo $config->get('t1d_mid_prod_box_new_icon_color'); ?>;}
.rating .fa-star {color: <?php echo $config->get('t1d_mid_prod_stars_color'); ?>;}
<?php if($config->get('t1o_category_prod_name_status') == 0) { ?>	
.product-grid .name, .product-gallery .name, #content .box-product .name, .product-bottom-related .name, .product-box-slider .name, .product-right-sm-related .name {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_brand_status') == 0) { ?>	
.product_box_brand {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_price_status') == 0) { ?>	
.product-grid .price, #content .box-product .price, .product-list .price, .product-gallery .price, .product-bottom-related .price, .product-box-slider .price, .product-right-sm-related p.price {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_quickview_status') == 0) { ?>	
a.quickview, .image a.quickview {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_cart_status') == 0) { ?>	
.product-grid .cart, #content .box-product .cart, .product-list .cart, .product-box-slider .cart, .product-grid .flybar .flybar-cart button, .product-gallery .flybar .flybar-cart button {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_ratings_status') == 0) { ?>	
.product-grid .rating, .product-list .rating, .product-gallery .rating, #content .box-product .rating, #column-left .box-product .rating, #column-right .box-product .rating, .product-box-slider .rating, .product-right-sm-related .rating {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_wis_com_status') == 0) { ?>	
.product-list .wishlist, .product-grid .wishlist, .product-list .compare, .product-grid .compare, .product-grid .info {display: none;}
<?php } ?>
<?php if($config->get('t1o_category_prod_zoom_status') == 1) { ?>	
#content .product-grid div:hover .image a img, #content .box-product div:hover .image a img {
	transform: scale(1.1);
    -moz-transform: scale(1.1);
    -webkit-transform: scale(1.1);
    -o-transform: scale(1.1);
    -ms-transform: scale(1.1);
}
<?php } ?>
<?php if($config->get('t1o_category_prod_swap_status') ==0) { ?>
.thumb_swap {display:none}
<?php } ?>
.product-grid .name, #content .box-product .name, #content .box-product .product_box_brand, .product-bottom-related .name, .product-box-slider .name, .product-grid .product_box_brand, .product-box-slider .product_box_brand, .product-bottom-related-flexslider .product_box_brand, .product-bottom-related-flexslider .rating, .tab-content-products .product_box_brand, .product-grid .price, #content .box-product .price, .product-box-slider .price, .product-bottom-related .price, .product-grid .rating, #content .box-product .rating, .product-box-slider .rating, .product-grid .cart, #content .box-product .cart, .product-box-slider .cart, .product-bottom-related .cart, .product-right-sm-related .name, .product-right-sm-related .product_box_brand, .product-right-sm-related .rating, .product-right-sm-related p.price {
<?php if($config->get('t1o_category_prod_align') ==1) { ?>	
	text-align: left;
	<?php } else { ?>
	text-align: center;
<?php } ?>
}
<?php if(($config->get('t1o_category_prod_name_status') == 0) && ($config->get('t1o_category_prod_brand_status') == 0) && ($config->get('t1o_category_prod_price_status') == 0) && ($config->get('t1o_category_prod_ratings_status') == 0)) { ?>
.product-grid .product-thumb { padding-bottom: 0; }
<?php } ?>
<?php if($config->get('t1o_layout_h_align') == 0) { ?>	
h1, h2, h3, h1 + p, h2 + p, #column-left .panel-heading, #column-right .panel-heading, .cat-description, .product-right-sm-related .panel-heading {
	text-align: center;
}
#content h1:before, #content h2:before {
  margin-left: 40%;
  margin-right: 40%;
}
<?php } ?>

/*  Product Page  */
<?php if($config->get('t1o_product_prev_next_status')== 0) { ?>  
.prev, .next {display: none;}
<?php } ?>

<?php if(($config->get('t1o_layout_product_page')== 11) || ($config->get('t1o_layout_product_page')== 12)) { ?>
@media (min-width: 768px) {
.product-buy {
	float: left;
}
.product-left {
	float: right;
}
}
<?php } ?>
<?php if($config->get('t1o_product_align') == 0) { ?>
.product-buy h1, .product-buy ul.pf, .product-buy ul.pp, #content .product-buy h2, .product-buy .rating, .product-buy-custom-block, #product legend {
	text-align: center;
}
#content .product-buy h1:before, #content .product-buy h2:before {
    margin-left: 40%;
    margin-right: 40%;
}
div.qty, .product-buy .form-group .btn-default.wcs {
	text-align: left;
}
<?php } ?>


/*  Video Box  */
.video_box_left #video_box_icon, .video_box_right #video_box_icon {
    background-color: <?php echo $config->get('t1o_video_box_bg'); ?>;
}
.video_box_right .video_box, .video_box_left .video_box {
    border: 4px solid <?php echo $config->get('t1o_video_box_bg'); ?>;
}
 
/*  Custom Box  */
.custom_box_left #custom_box_icon, .custom_box_right #custom_box_icon {
    background-color: <?php echo $config->get('t1o_custom_box_bg'); ?>;
}
.custom_box_right .custom_box, .custom_box_left .custom_box {
    border: 4px solid <?php echo $config->get('t1o_custom_box_bg'); ?>;
}


/*  FOOTER  */
<?php if($config->get('t1d_footer_fade_in') ==1) { ?>
footer {opacity: 0;}
footer.come-in {opacity: 1;}
<?php } else { ?>
footer {opacity: 1;}
<?php } ?>

/*  Features Block  */
#features {
<?php if($config->get('t1d_f1_bg_color_status') ==1) { ?>
	background-color: <?php echo $config->get('t1d_f1_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1d_bg_image_f1_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_f1_custom') ?>"); ?>;
<?php } else if($config->get('t1d_pattern_k_f1') !='none') { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_k_f1'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($config->get('t1d_bg_image_f1_position') !='') || ($config->get('t1d_bg_image_f1_repeat') !='')) { ?>
	background-position: <?php echo $config->get('t1d_bg_image_f1_position'); ?>;
	background-repeat: <?php echo $config->get('t1d_bg_image_f1_repeat'); ?>;
<?php }
if($config->get('t1d_f1_border_top_status') ==1) { ?>
	border-top: <?php echo $config->get('t1d_f1_border_top_size'); ?>px solid <?php echo $config->get('t1d_f1_border_top_color'); ?>;	
<?php } ?>
}
#features span.f-icon.fi1 i {color: <?php echo $config->get('t1o_fp_fb1_color'); ?>;}
#features span.f-icon.fi2 i {color: <?php echo $config->get('t1o_fp_fb2_color'); ?>;}
#features span.f-icon.fi3 i {color: <?php echo $config->get('t1o_fp_fb3_color'); ?>;}
#features span.f-icon.fi4 i {color: <?php echo $config->get('t1o_fp_fb4_color'); ?>;}
#features .f-title {color: <?php echo $config->get('t1d_f1_title_color'); ?>;}
#features span.f-subtitle {color: <?php echo $config->get('t1d_f1_subtitle_color'); ?>;}

/*  Information, Custom Column  */
#information {
	color: <?php echo $config->get('t1d_f2_text_color'); ?>;
<?php if($config->get('t1d_f2_bg_color_status') ==1) { ?>
	background-color: <?php echo $config->get('t1d_f2_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1d_bg_image_f2_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_f2_custom') ?>"); ?>;
<?php } else if($config->get('t1d_pattern_k_f2') !='none') { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_k_f2'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($config->get('t1d_bg_image_f2_position') !='') || ($config->get('t1d_bg_image_f2_repeat') !='')) { ?>
	background-position: <?php echo $config->get('t1d_bg_image_f2_position'); ?>;
	background-repeat: <?php echo $config->get('t1d_bg_image_f2_repeat'); ?>;
<?php } 
if($config->get('t1d_f2_border_top_status') ==1) { ?>
	border-top: <?php echo $config->get('t1d_f2_border_top_size'); ?>px solid <?php echo $config->get('t1d_f2_border_top_color'); ?>;
<?php } ?>
}
#information h5 {color: <?php echo $config->get('t1d_f2_titles_color'); ?>;}
#information a {color: <?php echo $config->get('t1d_f2_link_color'); ?>;}
#information a:hover {color: <?php echo $config->get('t1d_f2_link_hover_color'); ?>;}
#information li {color: <?php echo $config->get('t1d_f2_disc_color'); ?>;}

/*  Powered by, News, Payment Images, Follow Us  */
#powered {
	color: <?php echo $config->get('t1d_f3_text_color'); ?>;
<?php if($config->get('t1d_f3_bg_color_status') ==1) { ?>
	background-color: <?php echo $config->get('t1d_f3_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1d_bg_image_f3_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_f3_custom') ?>"); ?>;
<?php } else if($config->get('t1d_pattern_k_f3') !='none') { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_k_f3'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($config->get('t1d_bg_image_f3_position') !='') || ($config->get('t1d_bg_image_f3_repeat') !='')) { ?>
	background-position: <?php echo $config->get('t1d_bg_image_f3_position'); ?>;
	background-repeat: <?php echo $config->get('t1d_bg_image_f3_repeat'); ?>;
<?php } 
if($config->get('t1d_f3_border_top_status') ==1) { ?>
	border-top: <?php echo $config->get('t1d_f3_border_top_size'); ?>px solid <?php echo $config->get('t1d_f3_border_top_color'); ?>;
<?php } ?>
}
#powered a {color: <?php echo $config->get('t1d_f3_link_color'); ?>;}
#powered a:hover, #powered i:hover {color: <?php echo $config->get('t1d_f3_link_hover_color'); ?>;}
#powered span#footer-news {color: <?php echo $config->get('t1d_f3_news_word_color'); ?>;}
#powered #news a {color: <?php echo $config->get('t1d_f3_news_color'); ?>;}
#powered #news a:hover {color: <?php echo $config->get('t1d_f3_news_hover_color'); ?>;}
#powered i {color: <?php echo $config->get('t1d_f3_icons_color'); ?>;}

/*  Bottom Custom Block  */
#footer_custom {
	color: <?php echo $config->get('t1d_f4_text_color'); ?>;
<?php if($config->get('t1d_f4_bg_color_status') ==1) { ?>
	background-color: <?php echo $config->get('t1d_f4_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $config->get('config_ssl') . 'image/';
} else {
	$path_image = $config->get('config_url') . 'image/';
}
if($config->get('t1d_bg_image_f4_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $config->get('t1d_bg_image_f4_custom') ?>"); ?>;
<?php } else if($config->get('t1d_pattern_k_f4') !='none') { ?>
	background-image: url("catalog/view/theme/up-theme/image/patterns/p<?php echo $config->get('t1d_pattern_k_f4'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($config->get('t1d_bg_image_f4_position') !='') || ($config->get('t1d_bg_image_f4_repeat') !='')) { ?>
	background-position: <?php echo $config->get('t1d_bg_image_f4_position'); ?>;
	background-repeat: <?php echo $config->get('t1d_bg_image_f4_repeat'); ?>;
<?php } 
if($config->get('t1d_f4_border_top_status') ==1) { ?>
	border-top: <?php echo $config->get('t1d_f4_border_top_size'); ?>px solid <?php echo $config->get('t1d_f4_border_top_color'); ?>;
<?php } ?>
}
#footer_custom a {color: <?php echo $config->get('t1d_f4_link_color'); ?>;}
#footer_custom a:hover {color: <?php echo $config->get('t1d_f4_link_hover_color'); ?>;}


/*  Product Slider on Home Page  */
.ei-slider, .ei-slider-large li {
<?php if($config->get('t1d_mid_prod_slider_bg_color') !='') { ?>
	background-color: <?php echo $config->get('t1d_mid_prod_slider_bg_color'); ?>;
<?php } ?>
}
.ei-title h2 a{color: <?php echo $config->get('t1d_mid_prod_slider_name_color'); ?>;}
.ei-title h3 a, .ei-title h4 a .price-old{color: <?php echo $config->get('t1d_mid_prod_slider_desc_color'); ?>;}
.ei-title h4 a{color: <?php echo $config->get('t1d_mid_prod_slider_price_color'); ?>;}
.ei-slider-thumbs li a{background: <?php echo $config->get('t1d_mid_prod_slider_bottom_bar_bg_color') ?>;}
.ei-slider-thumbs li.ei-slider-element{background: <?php echo $config->get('t1d_mid_prod_slider_bottom_bar_bg_color_active'); ?>;}

/*  Prices */
#content .product-thumb p.price, #cart span.price, #column-left .product-items .price, #column-right .product-items .price, .product-buy .price-reg, #content .product-right-sm-related p.price {color: <?php echo $config->get('t1d_price_color'); ?>;}
.price-old, .product-thumb .price-tax {color: <?php echo $config->get('t1d_price_old_color'); ?>;}
.price-new {color: <?php echo $config->get('t1d_price_new_color'); ?>;}

/*  Buttons */
.btn-default, button.wishlist, button.compare, button.info, .pagination > li > a, .pagination > li > span, #cart .btn-default, .box-category-home .name, .box-manufacturers-home .name, input#input-quantity, input.dec, input.inc, #menu #menu_hor .dropdown-menus li.main-cat > a, #menu_brands .brand-item .name, #sidebar-wrapper-contact a.btn-default {
	<?php if($config->get('t1d_button_bg_status')== 1) { ?> 
	background-color: <?php echo $config->get('t1d_button_bg_color'); ?>;
	<?php } else { ?>
	background-color: transparent;
	<?php } ?>
	color: <?php echo $config->get('t1d_button_text_color'); ?>;
	border: 3px solid <?php echo $config->get('t1d_button_bg_color'); ?>;
}
.btn-default:hover, #column-left .btn-default:hover, #column-right .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .btn-default.disabled, .btn-default[disabled], button.wishlist:hover, button.compare:hover, button.info:hover, .pagination > li > a:hover, .pagination > li > a:focus, .pagination > li > a:active, .pagination > li > span:hover, #cart .btn-default:hover, .box-category-home .name:hover, .box-manufacturers-home .name:hover, input.dec:hover, input.inc:hover, #menu #menu_hor .dropdown-menus li.main-cat > a:hover, #menu_brands .brand-item a:hover .name, #sidebar-wrapper-contact a.btn-default:hover {
	background-color: <?php echo $config->get('t1d_button_bg_hover_color'); ?>;
    color: <?php echo $config->get('t1d_button_text_hover_color'); ?>;
	border: 3px solid <?php echo $config->get('t1d_button_bg_hover_color'); ?>;	
}

.btn-primary, .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus, #information a.btn-primary, #cart .btn-primary, #sidebar-wrapper-contact a.btn-primary {
	<?php if($config->get('t1d_button_exclusive_bg_status')== 1) { ?> 
	background-color: <?php echo $config->get('t1d_button_exclusive_bg_color'); ?>;
	<?php } else { ?>
	background-color: transparent;
	<?php } ?>
	color: <?php echo $config->get('t1d_button_exclusive_text_color'); ?>;
	border: 3px solid <?php echo $config->get('t1d_button_exclusive_bg_color'); ?>;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled], #information a.btn-primary:hover, #cart .btn-primary:hover, #sidebar-wrapper-contact a.btn-primary:hover {
	background-color: <?php echo $config->get('t1d_button_exclusive_bg_hover_color'); ?>;
    color: <?php echo $config->get('t1d_button_exclusive_text_hover_color'); ?>;
	border: 3px solid <?php echo $config->get('t1d_button_exclusive_bg_hover_color'); ?>;	
}
.btn, .pagination > li > a, .pagination > li > span, .product-grid .wishlist, .product-grid .compare, .product-grid .info, .product-list .wishlist, .product-list .compare, #content .box-product .wishlist, #content .box-product .compare, #content .box-product .info, .product-box-slider-flexslider .wishlist, .product-box-slider-flexslider .compare, .product-box-slider-flexslider .info, .product-bottom-related-flexslider .wishlist, .product-bottom-related-flexslider .compare, .product-bottom-related-flexslider .info, .up-theme-gallery-content .gallery-hover-box, .up-theme-modal-popup .modal-body .close, .box-category-home .name, .box-manufacturers-home .name, #menu #menu_hor .dropdown-menus li.main-cat > a, #menu_brands .brand-item .name {
	border-radius: <?php echo $config->get('t1d_button_border_radius'); ?>px!important;
}

/*  Dropdowns  */
.dropdown-menu, .dropdown-menus, .my-account-dropdown-menu li, #cart .dropdown-menu, #sidebar-wrapper, #sidebar-wrapper-contact, #menu-mobile, .prev, .next {background-color: <?php echo $config->get('t1d_dd_bg_color'); ?>;}
#cart span.name a, #cart span.quantity, .sidebar-nav > .sidebar-title, .sidebar-nav h5 {color: <?php echo $config->get('t1d_dd_headings_color'); ?>;}
#cart .table.cart-total > tbody > tr > td, .dropdown-menu .datepicker {color: <?php echo $config->get('t1d_dd_text_color'); ?>;}
#cart .table.cart-total > tbody > tr > td:first-child, #cart .dropdown-menu li p, #cart .dropdown-menu small, #cart span.price, .sidebar-nav li a, #sidebar-wrapper-contact div {color: <?php echo $config->get('t1d_dd_light_text_color'); ?>;}
.dropdown-menu a, #top .dropdown-menu a, #top .dropdown-menu .btn-link, .prev-name, .next-name, .bootstrap-datetimepicker-widget td.old, .bootstrap-datetimepicker-widget td.new {color: <?php echo $config->get('t1d_dd_links_color'); ?>;}
.dropdown-menu a:hover, #top .dropdown-menu a:hover, .my-account-dropdown-menu li.logout a:hover, #top .dropdown-menu li:hover .btn-link, .sidebar-nav li a:hover, .prev-name:hover, .next-name:hover {color: <?php echo $config->get('t1d_dd_links_hover_color'); ?>;}
#top-links .my-account-dropdown-menu i, #cart button.item-remove, .prev-arrow i, .next-arrow i {color: <?php echo $config->get('t1d_dd_icons_color'); ?>;}
#top-links .my-account-dropdown-menu li a:hover i, #cart button.item-remove:hover, #menu-toggle-close span, #contact-toggle-close span, #menu-mobile-toggle-close span {color: <?php echo $config->get('t1d_dd_icons_hover_color'); ?>;}
.my-account-dropdown-menu li.logout, #cart .checkout, .prev-name, .next-name {background-color: <?php echo $config->get('t1d_dd_hli_bg_color'); ?>;}
#cart .table > tbody > tr > td, #cart .checkout, .prev-name, .next-name {border-top: 1px solid <?php echo $config->get('t1d_dd_separator_color'); ?>;}
.dropdown-menu li, .dropdown-menus li, .sidebar-nav.list-group li {border-bottom: 1px solid <?php echo $config->get('t1d_dd_separator_color'); ?>;}
.my-account-dropdown-menu li:nth-child(2n) {border-left: 1px solid <?php echo $config->get('t1d_dd_separator_color'); ?>;}
.dropdown-menu, .dropdown-menus, .modal-body #search, #livesearch_search_results, .modal-content {
<?php if($config->get('t1d_dd_shadow')== 1) { ?>
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2);
<?php } else { ?>
    box-shadow: none;
<?php } ?>
}
.prev, .next {
<?php if($config->get('t1d_dd_shadow')== 1) { ?>
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
<?php } else { ?>
    box-shadow: none;
<?php } ?>
}

/*  Modal  */
.up-theme-modal .modal-content, .fancybox-overlay {
<?php if($config->get('t1d_modal_bg_style')== 'light') { ?>	
	background-color: rgba(245, 245, 245, 0);
<?php } else { ?>
    background-color: rgba(0, 0, 0, 0.7);
<?php } ?>
}
.modal-backdrop {
<?php if($config->get('t1d_modal_bg_style')== 'light') { ?>	
	background-color: rgba(245, 245, 245, 0.95);
<?php } else { ?>
    background-color: rgba(0, 0, 0, 0.7);
<?php } ?>
}

/*  Fonts  */

/*  Body  */
<?php if ($config->get('t1d_body_font') =='') { ?>
body, button, select, .form-control, .menu_label, .tooltip-inner { 
    font-family: 'ABeeZee',Arial,Helvetica,sans-serif; 
}
<?php }
if ($config->get('t1d_body_font') !='') {
$fontgoogle = $config->get('t1d_body_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
body, button, select, .form-control, .menu_label { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php }
if($config->get('t1d_body_font_size') !='') { ?>
body, button, select, .form-control, #cart .table > tbody > tr > td, #menu .dropdown-menus, #menu .dropdown-menus a, .box-category-home .subcat a { 
	font-size: <?php echo $config->get('t1d_body_font_size'); ?>px;
}
<?php }
if ($config->get('t1d_body_font_uppercase') ==1) { ?>
body, input, button, select, .form-control, .tooltip-inner { 
    text-transform: uppercase;
}
<?php } ?>

/*  Small Text  */
<?php if($config->get('t1d_small_font_size') !='') { ?>
small, .small, label, #top, #top #currency .currency-select, #top .btn-group > .btn, .buttons-header, #cart > .btn, .btn-group > .dropdown-menu, .dropdown-menu, .dropdown-menus, #menu .dropdown-menus a.see-all, .menu_label, .breadcrumb a, .category-list > div, .product-thumb .product_box_brand a, .product-right-sm-related .product_box_brand a, .tooltip { 
	font-size: <?php echo $config->get('t1d_small_font_size'); ?>px;
}
<?php } ?>

/*  Headings and Product Name  */
<?php if ($config->get('t1d_title_font') =='') { ?>
h1, h2, h3, h4, h5, h6, .panel-heading, .product-right-sm-info span.p-title, #features .f-title, .nav-tabs > li > a, legend, .sidebar-nav > .sidebar-title, #menu #menu_hor .dropdown-menus li.main-cat > a, .box-category-home .name { 
    font-family: 'ABeeZee',Arial,Helvetica,sans-serif; 
}
<?php }
if ($config->get('t1d_title_font_weight') !='') { ?>
h1, h2, h3, h4, h5, h6, .panel-heading, .product-right-sm-info span.p-title, #features .f-title, .nav-tabs > li > a, legend, .sidebar-nav > .sidebar-title, #menu #menu_hor .dropdown-menus li.main-cat > a, .box-category-home .name { 
    font-weight: <?php echo $config->get('t1d_title_font_weight'); ?>; 
}
<?php }
if ($config->get('t1d_title_font') !='') {
$fontgoogle = $config->get('t1d_title_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
h1, h2, h3, h4, h5, h6, .panel-heading, .product-right-sm-info span.p-title, #features .f-title, .nav-tabs > li > a, legend, .sidebar-nav > .sidebar-title, #menu #menu_hor .dropdown-menus li.main-cat > a, .box-category-home .name { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } ?>
h1, h2, h3, h4, h5, h6, .panel-heading, .product-right-sm-info span.p-title, #features .f-title, .nav-tabs > li > a, legend, .sidebar-nav > .sidebar-title, #menu #menu_hor .dropdown-menus li.main-cat > a, .box-category-home .name { 
<?php if ($config->get('t1d_title_font_uppercase') ==1) { ?>
    text-transform: uppercase;
<?php } else { ?>
    text-transform: none;
<?php } ?>
}

/*  Price  */
<?php if ($config->get('t1d_price_font') =='') { ?>
.price, .price-new, .price-old, .price-reg { 
    font-family: 'ABeeZee',Arial,Helvetica,sans-serif; 
}
<?php }
if ($config->get('t1d_price_font') !='') {
$fontgoogle = $config->get('t1d_price_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
.price, .price-new, .price-old, .price-reg { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } 
if ($config->get('t1d_price_font_weight') !='') { ?>
.price, .price-new, .price-old, .price-reg { 
    font-weight: <?php echo $config->get('t1d_price_font_weight'); ?>; 
}
<?php } ?>

/*  Buttons  */
<?php if ($config->get('t1d_button_font') =='') { ?>
.btn-default, .btn-primary, .box-manufacturers-home .name { 
    font-family: 'ABeeZee',Arial,Helvetica,sans-serif; 
}
<?php }
if ($config->get('t1d_button_font') !='') {
$fontgoogle = $config->get('t1d_button_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
.btn-default, .btn-primary, .box-manufacturers-home .name { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } 
if(($config->get('t1d_button_font_size') !='') || ($config->get('t1d_button_font_weight') !='')) { ?>
.btn-default, .btn-primary, .box-manufacturers-home .name { 
    font-size: <?php echo $config->get('t1d_button_font_size'); ?>px;
    font-weight: <?php echo $config->get('t1d_button_font_weight'); ?>; 
}
<?php } ?>

/*  Main Menu Bar  */
<?php if ($config->get('t1d_main_menu_font') =='') { ?>
#menu #homepage a, #menu .main-menu > li > a { 
    font-family: 'ABeeZee',Arial,Helvetica,sans-serif; 
}
<?php }
if ($config->get('t1d_main_menu_font') !='') {
$fontgoogle = $config->get('t1d_main_menu_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
#menu #homepage a, #menu .main-menu > li > a { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php }
if(($config->get('t1d_mm_font_size') !='') || ($config->get('t1d_mm_font_weight') !='')) { ?>
#menu #homepage a, #menu .main-menu > li > a {
	font-size: <?php echo $config->get('t1d_mm_font_size'); ?>px;
    font-weight: <?php echo $config->get('t1d_mm_font_weight'); ?>;
<?php } ?>
}
#menu #homepage a, #menu .main-menu > li > a { 
<?php if ($config->get('t1d_mm_font_uppercase') ==1) { ?>
    text-transform: uppercase;
<?php } else { ?>
    text-transform: none;
<?php } ?>
}

<?php if($config->get('t1o_custom_css') !='') { ?>
/*  Custom CSS */
<?php echo htmlspecialchars_decode( $config->get('t1o_custom_css'), ENT_QUOTES ); ?>
<?php } ?>

</style>
<?php } else { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/up-theme/stylesheet/up-theme-<?php echo $config->get('t1d_skin'); ?>.css" />
<?php } ?>

<?php if(($config->get('t1d_skin') =='skin2-accessories') || ($config->get('t1d_skin') =='skin4-bicycle') || ($config->get('t1d_skin') =='skin8-electronics') || ($config->get('t1d_skin') =='skin11-gadgets') || ($config->get('t1d_skin') =='skin24-tools') || ($config->get('t1d_skin') =='skin27-tuning')) { ?>	
<link href='//fonts.googleapis.com/css?family=Lato:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if(($config->get('t1d_skin') =='skin3-baby') || ($config->get('t1d_skin') =='skin20-petsupplies') || ($config->get('t1d_skin') =='skin26-tshirts')) { ?>	
<link href='//fonts.googleapis.com/css?family=Signika:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin6-books') { ?>	
<link href='//fonts.googleapis.com/css?family=Domine:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin7-cosmetics') { ?>	
<link href='//fonts.googleapis.com/css?family=Ubuntu:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin13-garden') { ?>	
<link href='//fonts.googleapis.com/css?family=Donegal+One:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Bree+Serif:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Bitter:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if(($config->get('t1d_skin') =='skin14-luxury') || ($config->get('t1d_skin') =='skin19-perfume')) { ?>	
<link href='//fonts.googleapis.com/css?family=Marcellus:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin15-market') { ?>	
<link href='//fonts.googleapis.com/css?family=Lato:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin21-restaurant') { ?>	
<link href='//fonts.googleapis.com/css?family=Signika:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Bitter:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin22-sport') { ?>	
<link href='//fonts.googleapis.com/css?family=Lato:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Armata:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin25-toys') { ?>	
<link href='//fonts.googleapis.com/css?family=Salsa:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin28-vintage') { ?>	
<link href='//fonts.googleapis.com/css?family=Donegal+One:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin29-watches') { ?>	
<link href='//fonts.googleapis.com/css?family=Lora:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if($config->get('t1d_skin') =='skin30-wines') { ?>	
<link href='//fonts.googleapis.com/css?family=Donegal+One:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Marcellus:400,400i,300,700,900&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php } ?>


<link href="//fonts.googleapis.com/css?family=ABeeZee:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Dosis:400,400i,300,700" rel="stylesheet" type="text/css" />
<?php 
if($config->get('t1d_body_font')!='') {
    $opfonts = array('ABeeZee','Arial','Helvetica'); 
		if (in_array($config->get('t1d_body_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $config->get('t1d_body_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }                                       
   }  
?>
<?php 
if($config->get('t1d_title_font')!='') {
    $opfonts = array('ABeeZee','Arial','Helvetica'); 
		if (in_array($config->get('t1d_title_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $config->get('t1d_title_font') ?>:<?php echo $config->get('t1d_title_font_weight'); ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }                                       
   }  
?>
<?php 
if($config->get('t1d_price_font')!='') {
    $opfonts = array('ABeeZee','Arial','Helvetica'); 
		if (in_array($config->get('t1d_price_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $config->get('t1d_price_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }                                       
   }  
?>
<?php 
if($config->get('t1d_button_font')!='') {
    $opfonts = array('ABeeZee','Arial','Helvetica'); 
		if (in_array($config->get('t1d_button_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $config->get('t1d_button_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }                                       
   }  
?>
<?php 
if($config->get('t1d_main_menu_font')!='') {
    $opfonts = array('ABeeZee','Arial','Helvetica'); 
		if (in_array($config->get('t1d_main_menu_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $config->get('t1d_main_menu_font') ?>:<?php echo $config->get('t1d_mm_font_weight'); ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }                                       
   }  
?>
<script>
$(function(){
  $.stellar({
    horizontalScrolling: false,
	verticalOffset: 0
  });
});
</script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<?php if($config->get('t1o_facebook_likebox_status')== 1) { ?>  
<?php if($config->get('t1o_facebook_likebox_id') != '') { ?>
<div class="facebook_<?php echo $config->get('t1o_facebook_likebox_position'); ?> hidden-xs">
<div id="facebook_icon"><i class="fa fa-facebook"></i></div>
<div class="facebook_box">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-like-box" data-href="https://www.facebook.com/<?php echo $config->get('t1o_facebook_likebox_id'); ?>" data-width="237" data-height="389" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div>
  <script type="text/javascript">    
  $(function(){        
        $(".facebook_right").hover(function(){            
        $(".facebook_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".facebook_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });
  $(function(){        
        $(".facebook_left").hover(function(){            
        $(".facebook_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".facebook_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>

<?php if($config->get('t1o_twitter_block_status')== 1) { ?>  
<?php if($config->get('t1o_twitter_block_user') != '') { ?>
<div class="twitter_<?php echo $config->get('t1o_twitter_block_position'); ?> hidden-xs">
<div id="twitter_icon"><i class="fa fa-twitter"></i></div>
<div class="twitter_box">
  <?php if($config->get('t1o_twitter_block_user') != '') { ?>
  <p><a class="twitter-timeline"  href="https://twitter.com/<?php echo $config->get('t1o_twitter_block_user'); ?>" data-chrome="noheader nofooter noborders noscrollbar transparent" data-tweet-limit="<?php echo $config->get('t1o_twitter_block_tweets'); ?>"  data-widget-id="<?php echo $config->get('t1o_twitter_block_widget_id'); ?>" data-theme="light" data-related="twitterapi,twitter" data-aria-polite="assertive">Tweets by <?php echo $config->get('t1o_twitter_block_user'); ?></a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script></p>
		<?php } ?>
  <script type="text/javascript">    
  $(function(){        
        $(".twitter_right").hover(function(){            
        $(".twitter_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".twitter_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });
  $(function(){        
        $(".twitter_left").hover(function(){            
        $(".twitter_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".twitter_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>


<?php if($config->get('t1o_video_box_status')== 1) {
    $t1o_video_box_content = $config->get('t1o_video_box_content');
?>  
<?php if ($t1o_video_box_content) { ?>
<div class="video_box_<?php echo $config->get('t1o_video_box_position'); ?> hidden-xs">
<div id="video_box_icon"><i class="fa fa-youtube-play"></i></div>
<div class="video_box">
<?php echo html_entity_decode($t1o_video_box_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
  <script type="text/javascript">    
  $(function(){        
        $(".video_box_right").hover(function(){            
        $(".video_box_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".video_box_right").stop(true, false).animate({right: "-588" }, 800, 'easeInQuint' );      
        },1000);    
  });
  $(function(){        
        $(".video_box_left").hover(function(){            
        $(".video_box_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".video_box_left").stop(true, false).animate({left: "-588" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>


<?php if($config->get('t1o_custom_box_status')== 1) {
    $t1o_custom_box_content = $config->get('t1o_custom_box_content');
?> 
<?php if ($t1o_custom_box_content) { ?>
<div class="custom_box_<?php echo $config->get('t1o_custom_box_position'); ?> hidden-xs">
<div id="custom_box_icon">
<?php if($config->get('t1o_custom_box_position')=='right') { ?>
<i class="fa fa-chevron-left"></i>
<?php } else { ?>
<i class="fa fa-chevron-right"></i>
<?php } ?>
</div>
<div class="custom_box">
<?php echo html_entity_decode($t1o_custom_box_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
  <script type="text/javascript">    
  $(function(){        
        $(".custom_box_right").hover(function(){            
        $(".custom_box_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".custom_box_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );      
        },1000);    
  });
  $(function(){        
        $(".custom_box_left").hover(function(){            
        $(".custom_box_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".custom_box_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>


<?php if($config->get('t1o_top_custom_block_status')== 1) { ?> 
<?php $t1o_top_custom_block_content = $config->get('t1o_top_custom_block_content'); ?>
<div id="top-custom-block-wrapper">
   <div id="top-custom-block-content">
   <?php echo html_entity_decode($t1o_top_custom_block_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
   </div>
   <a id="open-top-custom-block" href="#"><i class="fa fa-tags"></i></a>  
</div>
<script type="text/javascript">
$('#open-top-custom-block').click(function() {
  $(this).toggleClass('open');
    $('#top-custom-block-content').slideToggle('fast');
	return false;
  });
</script>
<?php } ?>
<div class="sidebar-opacity"></div>
<div id="wrapper" class="wrapper <?php echo $config->get('t1o_layout_style'); ?>">
<div id="sidebar-wrapper">
  <ul class="sidebar-nav list-group">
    <li class="sidebar-title">
      <a href="#menu-toggle-close" id="menu-toggle-close"><span aria-hidden="true">&times;</span></a><?php echo $text_information; ?>
      <script>
      $("#menu-toggle-close").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
		$(".sidebar-opacity").toggleClass("toggled");
      });
      </script>
    </li>
    <?php foreach ($informations as $information) { ?>
    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
    <?php } ?>
    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
  </ul>
</div>

<div id="sidebar-wrapper-contact">
  <ul class="sidebar-nav list-group">
    <li class="sidebar-title">
      <a href="#contact-toggle-close" id="contact-toggle-close"><span aria-hidden="true">&times;</span></a><?php echo $text_contact; ?>
      <script>
      $("#contact-toggle-close").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("contact-toggled");
		$(".sidebar-opacity").toggleClass("contact-toggled");
      });
      </script>
    </li>
    <li>
    <div>
    <h5><?php echo $text_menu_contact_address; ?> <?php if ($geocode) { ?>&nbsp;&nbsp;&nbsp;<a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank"><i data-toggle="tooltip" title="<?php echo $button_map; ?>" class="fa fa-map-marker"></i></a><?php } ?></h5>
    <?php echo $address; ?>
    </div>
    </li>
    <!--new field-->
    <li>
    <div>
    <h5><?php echo $text_menu_contact_tel; ?></h5>
    <div class="side_phone">
    <p><div class="operator mts"></div><?php echo $telephone; ?></p>
    <p><div class="operator kievstar"></div><?php echo $telephone2; ?></p>
    <p><div class="operator life"></div><?php echo $telephone3; ?></p>

    </div>
    </div>
    </li>
    <?php if ($fax) { ?>
    <li>
    <div>
    <h5><?php echo $text_menu_contact_fax; ?></h5>
    <?php echo $fax; ?>
    </div>
    </li>
    <?php } ?>
    <?php if ($open) { ?>
    <li>
    <div>
    <h5><?php echo $text_menu_contact_hours; ?></h5>
    <?php echo $open; ?>
    </div>
    </li>
    <?php } ?>
    <?php if ($comment) { ?>
    <li>
    <div class="comment">
    <?php echo $comment; ?>
    </div>
    </li>
    <?php } ?>
    <li>
    <div>
    <a href="<?php echo $contact; ?>" class="btn btn-primary"><?php echo $text_menu_contact_form; ?></a>
    </div>
    </li>
  </ul>
</div>

<nav id="top">
  <div class="container"> 
    <div id="top-links" class="nav pull-left">
      <ul class="list-inline">
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span> <i class="fa fa-angle-down"></i></a>
          <ul class="dropdown-menu my-account-dropdown-menu">
            <?php if ($logged) { ?>
            <li class="col-xs-6"><a href="<?php echo $account; ?>"><i class="fa fa-cog"></i><br><?php echo $text_account; ?></a></li>
            <li class="col-xs-6"><a href="<?php echo $order; ?>"><i class="fa fa-inbox"></i><br><?php echo $text_order; ?></a></li>
            <li class="col-xs-6"><a href="<?php echo $transaction; ?>"><i class="fa fa-credit-card"></i><br><?php echo $text_transaction; ?></a></li>
            <li class="col-xs-6"><a href="<?php echo $download; ?>"><i class="fa fa-download"></i><br><?php echo $text_download; ?></a></li>
            <li class="logout"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li class="col-xs-6 register"><a href="<?php echo $register; ?>"><i class="fa fa-pencil"></i><br><?php echo $text_register; ?></a></li>
            <li class="col-xs-6"><a href="<?php echo $login; ?>"><i class="fa fa-user"></i><br><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_checkout; ?></span></a></li>
        <li><a href="tel:<?php echo $telephone; ?>"><div class="operator mts"></div></a> <span class="hidden-xs hidden-sm"><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></span></li>
         <li><a href="tel:<?php echo $telephone2; ?>"><div class="operator kievstar"></div></a> <span class="hidden-xs hidden-sm"><a href="tel:<?php echo $telephone2; ?>"><?php echo $telephone2; ?></a></span></li>
          <li><a href="tel:<?php echo $telephon3; ?>"><div class="operator life"></div></a> <span class="hidden-xs hidden-sm"><a href="tel:<?php echo $telephone3; ?>"><?php echo $telephone3; ?></a></span></li>
      </ul>
    </div>
    <?php echo $currency; ?>
    <?php echo $language; ?>
    </div>
</nav>
<header>
  <div class="container">
    <div class="row">
    
      <?php if($config->get('t1o_logo_position') =='center') { ?>
      <div class="col-sm-4 header-information hidden-xs">
      <a href="#menu-toggle" class="" id="menu-toggle">
      <div id="information-block" class="buttons-header">
        <div class="button-i"><i class="fa fa-bars"></i></div>
        <span class="button-text"><?php echo $text_information; ?></span>
      </div>
      </a>
      <script>
        $("#menu-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("toggled");
		  $(".sidebar-opacity").toggleClass("toggled");
        });
      </script>
      <a href="#contact-toggle" class="" id="contact-toggle">
      <div id="contact-block" class="buttons-header">
        <div class="button-i"><i class="fa fa-envelope"></i></div>
        <span class="button-text"><?php echo $text_contact_us; ?></span>
      </div>
      </a>
      <script>
        $("#contact-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("contact-toggled");
		  $(".sidebar-opacity").toggleClass("contact-toggled");
        });
      </script>
      </div>
      <?php } ?>
      
      <div class="col-xs-12 col-sm-4 header-logo">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      
      <?php if($config->get('t1o_logo_position') =='center') { ?>
      <div class="col-sm-4">
      <?php } else { ?>
      <div class="col-xs-12 col-sm-8">
      <?php } ?>
      <?php if($config->get('t1o_logo_position') =='left') { ?>	
      <a href="#menu-toggle" class="" id="menu-toggle">
      <div id="information-block" class="buttons-header hidden-xs">
        <div class="button-i"><i class="fa fa-bars"></i></div>
        <span class="button-text"><?php echo $text_information; ?></span>
      </div>
      </a>
      <script>
        $("#menu-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("toggled");
		  $(".sidebar-opacity").toggleClass("toggled");
        });
      </script>
      <a href="#contact-toggle" class="" id="contact-toggle">
      <div id="contact-block" class="buttons-header hidden-xs">
        <div class="button-i"><i class="fa fa-envelope"></i></div>
        <span class="button-text"><?php echo $text_contact_us; ?></span>
      </div>
      </a>
      <script>
        $("#contact-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("contact-toggled");
		  $(".sidebar-opacity").toggleClass("contact-toggled");
        });
      </script>
      <?php } ?>

      <a href="#menu-mobile-toggle" class="" id="menu-mobile-toggle">
      <div id="menu-mobile-block" class="buttons-header hidden-sm hidden-md hidden-lg">
        <div class="button-i"><i class="fa fa-bars"></i></div>
        <span class="button-text"><?php echo $text_menu_menu; ?></span>
      </div>
      </a>
      <script>
        $("#menu-mobile-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("menu-toggled");
		  $(".sidebar-opacity").toggleClass("menu-toggled");
        });
      </script>
      
      <?php echo $search; ?>
      <?php echo $cart; ?>
      
      </div>
      
    </div>
  </div>
</header>

<?php if ($categories) { ?>
<script>
  $(window).load(function(){
    $("#menu").sticky({ topSpacing: 0 });
  });
</script>

<nav id="menu" class="navbar">
      
  <div class="container">
    <!-- 
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_menu_menu; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
    
      <div id="logo-menu-container">
        <div id="logo-menu">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      
      <ul class="main-menu">

        <!-- Home Page Link -->
        <li id="homepage" class="homepage-<?php echo $config->get('t1o_menu_homepage'); ?>"><a href="<?php echo $home; ?>"><i class="fa fa-home"></i> <span><?php echo $text_home; ?></span></a></li>   
        
        <?php if($config->get('t1o_menu_categories_status')== 1) { ?>
        <?php if($config->get('t1o_menu_categories_style')== 1) { ?>      
        <!-- Categories OpenCart Style -->    
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="menu_oc">
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <div class="dropdown-menus">
              <?php for ($i = 0; $i < count($category['children']);) { ?>
              <ul class="list-unstyled">
                <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                <?php for (; $i < $j; $i++) { ?>
                <?php if (isset($category['children'][$i])) { ?>
			      	<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                    <?php if($config->get('t1o_menu_categories_3_level') ==1) { ?>
			      	<?php if ($category['children'][$i]['children_level_2']) { ?>
			      	<div class="dropdown-menus">
			          <ul class="list-unstyled">
			      	    <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
				        <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
				        <?php } ?>
				      </ul>
			        </div>
			        <?php } ?>		 
                    <?php } ?>		 
			        </li>
                <?php } ?>
                <?php } ?>
              </ul>
              <?php } ?>
              <?php if(($config->get('t1o_menu_main_category_icon_status') == 1) && ($category['thumbbg'])) { ?>
              <ul class="list-unstyled cat-img">
                <li>
                <img src="<?php echo $category['thumbbg']; ?>" alt="<?php echo $category['name']; ?>" />
                </li>
              </ul>
              <?php } ?>
            <a href="<?php echo $category['href']; ?>" class="see-all dropdown-highlight"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> 
          </div>
        </li>
        <?php } else { ?>
        <li class="menu_oc"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <!-- Categories OpenCart Style - END -->  
        <?php } ?>
        
        <?php if($config->get('t1o_menu_categories_style')== 2) { ?>      
        <!-- Categories Vertical Style -->    
        <li id="menu_ver">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_category; ?></a>
        <div class="dropdown-menus">
        <ul class="list-unstyled">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li>
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <div class="dropdown-menus">  
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul class="list-unstyled">
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                <?php if($config->get('t1o_menu_categories_3_level') ==1) { ?>
				<?php if ($category['children'][$i]['children_level_2']) { ?>
				<div class="dropdown-menus">
			      <ul class="list-unstyled">
				    <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
					   <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
				    <?php } ?>
				  </ul>
			    </div>
			    <?php } ?>		
                <?php } ?>	  
		  </li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
        </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
        
        </ul>
        </div>
        </li>
        <!-- Categories Vertical Style - END -->  
        <?php } ?>
        
        <?php if($config->get('t1o_menu_categories_style')== 3) { ?>      
        <!-- Categories Horizontal Style -->
        <li id="menu_hor">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_category; ?></a>
        <div class="dropdown-menus col-sm-12">
        <?php foreach ($categories as $category) { ?>
        <ul class="list-unstyled <?php echo $config->get('t1o_menu_categories_per_row'); ?>">
        <?php if ($category['children']) { ?>
        <li class="main-cat">
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <div>   
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul class="list-unstyled" <?php if($config->get('t1o_menu_main_category_icon_status') == 1) { ?> style="background-image:url(<?php echo $category['thumbhorizmenubg']; ?>);"<?php } ?>>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li class="sub-cat"><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>       
		  </li>
            <?php if($config->get('t1o_menu_categories_3_level') ==1) { ?>
			<?php if ($category['children'][$i]['children_level_2']) { ?>
			  <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
			    <li class="sub-cat sub-sub-cat"><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
			  <?php } ?>
			<?php } ?>		
            <?php } ?>	
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
          </div>
        </li>
        <?php } else { ?>
        <li class="main-cat"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        </ul>
        <?php } ?>

        <?php if($config->get('t1o_menu_categories_custom_block_status')== 1) { ?> 
        <?php $t1o_menu_categories_custom_block_content = $config->get('t1o_menu_categories_custom_block_content'); ?>
        <div id="menu-categories-custom-block-wrapper" class="col-sm-12">
           <div id="menu-categories-custom-block-content">
           <?php echo html_entity_decode($t1o_menu_categories_custom_block_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
           </div>
        </div>
        <?php } ?>

        </div>
        </li>
        <!-- Categories Horizontal Style - END -->  
        <?php } ?>
        
        <?php } ?>

        <!-- Brands -->
        <?php if($config->get('t1o_menu_brands_status')== 1) { ?>
        <li id="menu_brands">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_menu_brands; ?></a>
          <?php if ($manufacturers) { ?>
          <div class="dropdown-menus col-sm-12 <?php echo $config->get('t1o_menu_brands_style'); ?>">  
              <?php foreach ($manufacturers as $manufacturer) { ?>
              <div class="brand-item col-sm-<?php echo $config->get('t1o_menu_brands_per_row'); ?>">
                <a href="<?php echo $manufacturer['href']; ?>">
                <?php if ($manufacturer['image']) { ?>
                <div class="image"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></div>
                <?php } else { ?>
                <div class="image"><i class="fa fa-camera"></i></div>
                <?php } ?>
                <div class="name dropdown-highlight"><?php echo $manufacturer['name']; ?></div>
                </a>  
              </div>
              <?php } ?>
          </div>
          <?php } ?>  
        </li>
        <?php } ?>
        
        <!-- Custom Links -->
        <?php $t1o_menu_link = $config->get('t1o_menu_link');  ?>
        <?php for ($i = 1; $i <= 10; $i++) { ?>
        <?php if($t1o_menu_link[$i]['status'] == 1 && $t1o_menu_link[$i][$config->get('config_language_id')]['title'] !='' && $t1o_menu_link[$i]['url'] !='') { ?>                        
        <li class="menu_links">
          <a href="<?php echo $t1o_menu_link[$i]['url']; ?>" target="<?php echo $t1o_menu_link[$i]['target']; ?>">
            <?php echo $t1o_menu_link[$i][$config->get('config_language_id')]['title']; ?>
          </a>
        </li>                             
        <?php } ?>
        <?php } ?> 
        
        <!-- Custom Menu --> 
        <?php 
            $t1o_menu_cm_title = $config->get('t1o_menu_cm_title');
            $t1o_menu_cm_link = $config->get('t1o_menu_cm_link');
        ?>
        <?php if($config->get('t1o_menu_cm_status')== 1 && $t1o_menu_cm_title[$config->get('config_language_id')]) { ?>   
        <li id="menu_custom_menu">       
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $t1o_menu_cm_title[$config->get('config_language_id')]; ?></a>
          <div class="dropdown-menus">
            <ul class="list-unstyled">
              <?php for ($i = 1; $i <= 10; $i++) { ?>
              <?php if($t1o_menu_cm_link[$i]['status'] == 1 && $t1o_menu_cm_link[$i]['url'] !='') { ?>
                <li>
                  <a href="<?php echo $t1o_menu_cm_link[$i]['url']; ?>" target="<?php echo $t1o_menu_cm_link[$i]['target']; ?>">
		      	  <?php echo $t1o_menu_cm_link[$i][$config->get('config_language_id')]['title']; ?>
                  </a>
                </li>
              <?php } ?>
              <?php } ?>
            </ul>       
          </div>
        </li>         
        <?php } ?> 

        <!-- Custom Blocks -->
        <?php for ($i = 1; $i <= 3; $i++) { ?>
        <?php $t1o_menu_custom_block = $config->get('t1o_menu_custom_block');  ?>
        <?php if($t1o_menu_custom_block[$i]['status'] == 1 && $t1o_menu_custom_block[$i][$config->get('config_language_id')]['title'] !='') { ?>                        
        <li class="menu_custom_block">        
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $t1o_menu_custom_block[$i][$config->get('config_language_id')]['title']; ?></a> 
          <div class="dropdown-menus col-sm-12">  
                <?php echo html_entity_decode($t1o_menu_custom_block[$i][$config->get('config_language_id')]['content'], ENT_QUOTES, 'UTF-8');?>        
          </div>  
        </li>                              
        <?php } ?>
        <?php } ?> 
        
      </ul>
    </div>
  </div>
<?php if($config->get('t1o_custom_bar_below_menu_status')== 1) { ?> 
<?php $t1o_custom_bar_below_menu_content = $config->get('t1o_custom_bar_below_menu_content'); ?>
<div id="custom-bar-wrapper">
   <div id="custom-bar-content">
   <?php echo html_entity_decode($t1o_custom_bar_below_menu_content[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
   </div>
</div>
<?php } ?>
</nav>

<script type="text/javascript">
$(document).ready(function() {
	$('#accordion-mobile').dcAccordion({
		disableLink: false,	
		menuClose: false,
		autoClose: true,
		autoExpand: true,		
		saveState: false
	});
});
</script> 
<div id="menu-mobile" class="hidden-sm hidden-md hidden-lg">
<ul class="accordion sidebar-nav list-group" id="accordion-mobile">  
      <li class="sidebar-title">
      <a href="#menu-mobile-toggle-close" id="menu-mobile-toggle-close"><span aria-hidden="true">&times;</span></a><?php echo $text_menu_menu; ?>
      <script>
      $("#menu-mobile-toggle-close").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("menu-toggled");
		$(".sidebar-opacity").toggleClass("menu-toggled");
      });
      </script>
    </li> 
    <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
    <?php foreach ($categories as $category) { ?>
    <li>
        <?php if($category['children']) { ?>
          <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a><div class="dcjq-icon"><i class="fa fa-plus"></i></div>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <a href="<?php echo $child['href']; ?>" class="list-group-item"><?php echo $child['name']; ?></a>
            </li>
            <?php } ?>
          </ul>
        <?php } ?>
    </li>
    <?php } ?>  
    <?php $t1o_menu_link = $config->get('t1o_menu_link');  ?>
    <?php for ($i = 1; $i <= 10; $i++) { ?>
    <?php if($t1o_menu_link[$i]['status'] == 1 && $t1o_menu_link[$i][$config->get('config_language_id')]['title'] !='' && $t1o_menu_link[$i]['url'] !='') { ?>                        
    <li>
      <a href="<?php echo $t1o_menu_link[$i]['url']; ?>" target="<?php echo $t1o_menu_link[$i]['target']; ?>">
        <?php echo $t1o_menu_link[$i][$config->get('config_language_id')]['title']; ?>
      </a>
    </li>                             
    <?php } ?>
    <?php } ?>
    <?php 
        $t1o_menu_cm_title = $config->get('t1o_menu_cm_title');
        $t1o_menu_cm_link = $config->get('t1o_menu_cm_link');
    ?>
    <?php if($config->get('t1o_menu_cm_status')== 1 && $t1o_menu_cm_title[$config->get('config_language_id')]) { ?>   
    <li>       
      <a href="#" class="dropdown-toggle list-group-item" data-toggle="dropdown"><?php echo $t1o_menu_cm_title[$config->get('config_language_id')]; ?></a><div class="dcjq-icon"><i class="fa fa-plus"></i></div>
      <ul class="list-unstyled">
        <?php for ($i = 1; $i <= 10; $i++) { ?>
        <?php if($t1o_menu_cm_link[$i]['status'] == 1 && $t1o_menu_cm_link[$i]['url'] !='') { ?>
        <li>
          <a href="<?php echo $t1o_menu_cm_link[$i]['url']; ?>" target="<?php echo $t1o_menu_cm_link[$i]['target']; ?>">
		  <?php echo $t1o_menu_cm_link[$i][$config->get('config_language_id')]['title']; ?>
          </a>
        </li>
        <?php } ?>
        <?php } ?>
      </ul>       
    </li>         
    <?php } ?>
    <li>
      <a href="#" class="dropdown-toggle list-group-item" data-toggle="dropdown"><?php echo $text_information; ?></a><div class="dcjq-icon"><i class="fa fa-plus"></i></div>
      <ul class="list-unstyled">
        <?php foreach ($informations as $information) { ?>
        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
      </ul>
    </li>   
    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact_us; ?></a></li> 
</ul>
</div>
<?php } ?>

<?php 
  $t1o_menu_labels = $config->get('t1o_menu_labels');
  $t1o_menu_labels_color = $config->get('t1o_menu_labels_color'); 
?>
<?php for ($i = 1; $i <= 15; $i++) { ?>
<?php if($t1o_menu_labels[$i][$config->get('config_language_id')]['title']) { ?>                       
<span id="menu_label<?php echo $i; ?>" class="menu_label" style="background-color:<?php echo $t1o_menu_labels_color[$i]; ?>;">
    <?php echo $t1o_menu_labels[$i][$config->get('config_language_id')]['title']; ?>
</span> 
<script type="text/javascript">
$(document).ready(function(){
     $('#menu_label<?php echo $i; ?>').prependTo("ul.main-menu > li:nth-child(<?php echo $i; ?>) > a");
});	
</script>  
<?php } ?> 
<?php } ?>
