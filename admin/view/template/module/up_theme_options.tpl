<?php echo $header; ?>
                    
<?php 

if(empty($t1o_text_logo_color)) $t1o_text_logo_color ="4C5867";
if(empty($t1o_top_custom_block_bg_color)) $t1o_top_custom_block_bg_color ="222222";
if(empty($t1o_top_custom_block_text_color)) $t1o_top_custom_block_text_color ="FFFFFF";
if(empty($t1o_custom_bar_below_menu_bg_color)) $t1o_custom_bar_below_menu_bg_color ="5AC7C0";
if(empty($t1o_custom_bar_below_menu_text_color)) $t1o_custom_bar_below_menu_text_color ="FFFFFF";
if(empty($t1o_category_title_above_color)) $t1o_category_title_above_color ="4C5867";
if(empty($t1o_fp_fb1_color)) $t1o_fp_fb1_color ="5AC7C0";
if(empty($t1o_fp_fb2_color)) $t1o_fp_fb2_color ="5AC7C0";
if(empty($t1o_fp_fb3_color)) $t1o_fp_fb3_color ="5AC7C0";
if(empty($t1o_fp_fb4_color)) $t1o_fp_fb4_color ="5AC7C0";
if(empty($t1o_video_box_bg)) $t1o_video_box_bg ="5AC7C0";
if(empty($t1o_custom_box_bg)) $t1o_custom_box_bg ="5AC7C0";

    $menu_link_target = array(
		'_self' => 'in the same frame',
		'_blank' => 'in a new tab'
	);    
?>
<?php for ($i = 1; $i <= 15; $i++) { ?>
<?php if(empty($t1o_menu_labels_color[$i])) $t1o_menu_labels_color[$i] ="E55E5E"; ?>
<?php } ?>

<style type="text/css">
.color {border:1px solid #CCC;border-radius:2px;margin-top:5px;padding:3px 4px 4px;}
.k_help {color:#999999;font-size:12px;padding-left:5px;}
span.k_help_tip {margin-left:8px;padding:4px 9px 3px;border-radius:100%;background-color:#add472;color:#FFF;font-weight:bold;}
span.k_help_tip a {color:#FFF;font-size:12px;font-weight:bold;text-decoration:none;}
span.k_tooltip {cursor:pointer;}
.k_sep {background-color:#F7F7F7;}
.ptn {position:relative;width:40px;height:40px;float:left;margin-right:5px;margin-bottom:5px;}
.ptn_nr {position:absolute;bottom:0px;right:3px;}
.prod_l {position:relative;width:81px;height:63px;float:left;margin-right:25px;margin-bottom:20px;}
.prod_l_nr {position:absolute;bottom:-17px;right:0px;}
table.form {margin-bottom:0;}
table.form div {text-align:left}
table.form b {color:#003A88;font-size:13px}
table.form > tbody > tr > td:first-child {text-align:right}
a.link {text-decoration:none; margin-left:15px; margin-right:15px;}
.htabs {margin-top:15px;}
a.button-up-theme {background:#4BB8E2;color:#FFFFFF;padding:4px 12px;margin-left:5px;text-decoration:none;border-radius:3px;cursor:pointer;}
a.button-up-theme:hover {background:#ED5053;}
table.form {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}
table.form > tbody > tr > td:first-child {
	width: 200px;
}
table.form > tbody > tr > td {
	padding: 10px;
	color: #000000;
	border-bottom: 1px dotted #CCCCCC;
}
label.control-label span:after {
	display: none;
}
fieldset legend {
	padding: 20px 0 15px;
}
legend.bn {
	border-color: #FFFFFF;
	padding: 0;
}
legend span {
	font-size: 12px;
}
</style>    

<?php echo $column_left; ?>




<div id="content">


  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-up-theme" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
	</div>
    <div class="panel-body">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-up-theme">
    


        <div style="margin-top:10px; margin-bottom:25px;">
            <span style="margin-left:50px;">Useful links:</span> 
            <a href="http://321cart.com/up/documentation/" class="link" target="_blank">UP Documentation</a> | 
            <a href="http://321cart.com/up/" class="link" target="_blank">UP Demos</a> | 
            <a href="http://321cart.com/support/up-theme/" class="link" target="_blank">UP Support</a>
            <span class="k_help_tip k_tooltip" title="If you need help, please contact us. We provide support only through our UP Theme Support System." data-toggle="tooltip">?</span>

		</div>

    
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-options" data-toggle="tab">General Options</a></li>
          <li><a href="#tab-header" data-toggle="tab">Header</a></li>
          <li><a href="#tab-menu" data-toggle="tab">Main Menu</a></li>
          <li><a href="#tab-midsection" data-toggle="tab">Midsection</a></li>
          <li><a href="#tab-footer" data-toggle="tab">Footer</a></li>
          <li><a href="#tab-widgets" data-toggle="tab">Widgets</a></li>
          <li><a href="#tab-css" data-toggle="tab">Custom CSS/JavaScript</a></li>
        </ul>
        
        <div class="tab-content">
        <!-- -->
        
        <div class="tab-pane active" id="tab-options"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-2">    
        <ul id="store_features_tabs" class="nav nav-pills nav-stacked">
             <li class="active"><a href="#tab-options-layout" data-toggle="tab">Layout</a></li>
             <li><a href="#tab-options-sliders" data-toggle="tab">Sliders</a></li>
             <li><a href="#tab-options-others" data-toggle="tab">Others</a></li>                                       
        </ul> 
        </div>
        
        <div class="col-sm-10">
        <div class="tab-content">
        
        <div id="tab-options-layout" class="tab-pane fade in active"> 
        
                    <fieldset>

						<div class="form-group">
							<label class="col-sm-2 control-label">Layout style: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_01.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_layout_style" id="t1o_layout_style" class="form-control">
                                    <option value="boxed"<?php if($t1o_layout_style == 'boxed') echo ' selected="selected"';?>>Boxed</option>
									<option value="framed"<?php if($t1o_layout_style == 'framed') echo ' selected="selected"';?>>Framed</option>
                                    <option value="full-width"<?php if($t1o_layout_style == 'full-width') echo ' selected="selected"';?>>Full Width</option>
                                    <option value="full-width-border"<?php if($t1o_layout_style == 'full-width-border') echo ' selected="selected"';?>>Full Width + Border</option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Maximum width:<br /><span class="k_help">(only for "Framed" layout style)</span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_layout_l" id="t1o_layout_l" class="form-control">
									<option value="1"<?php if($t1o_layout_l == '1') echo ' selected="selected"';?>>1170px</option>
                                    <option value="2"<?php if($t1o_layout_l == '2') echo ' selected="selected"';?>>980px</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Align Headings to:</label>
							<div class="col-sm-10">
								<select name="t1o_layout_h_align" id="t1o_layout_h_align" class="form-control">
									<option value="1"<?php if($t1o_layout_h_align == '1') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                                    <option value="0"<?php if($t1o_layout_h_align == '0') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Catalog Mode:<br /><span class="k_help">(excludes purchase options)</span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_layout_catalog_mode" class="form-control">
								    <option value="1"<?php if($t1o_layout_catalog_mode == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_layout_catalog_mode == '0') echo ' selected="selected"';?><?php if($t1o_layout_catalog_mode == '') echo ' selected="selected"';?>>No</option>
								</select>  
							    </select>
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-options-sliders" class="tab-pane">  
        
                    <fieldset>

						<legend>Bestseller / Featured / Latest / Specials / Most Viewed / Product Tabs / Carousel <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_02.jpg" target="_blank">?</a></span></legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Bestseller style:</label>
							<div class="col-sm-10">
								<select name="t1o_bestseller_style" id="t1o_bestseller_style" class="form-control">
									<option value="1"<?php if($t1o_bestseller_style == '1') echo ' selected="selected"';?>>Slider</option>
                                    <option value="0"<?php if($t1o_bestseller_style == '0') echo ' selected="selected"';?>>Grid</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Bestsellers per row:<br /><span class="k_help">(only Slider style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_bestseller_per_row" id="t1o_bestseller_per_row" class="form-control">
									<option value="1"<?php if($t1o_bestseller_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_bestseller_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_bestseller_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_bestseller_per_row == '4') echo ' selected="selected"';?><?php if($t1o_bestseller_per_row == '') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_bestseller_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_bestseller_per_row == '6') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Featured style:</label>
							<div class="col-sm-10">
								<select name="t1o_featured_style" id="t1o_featured_style" class="form-control">
									<option value="1"<?php if($t1o_featured_style == '1') echo ' selected="selected"';?>>Slider</option>
                                    <option value="0"<?php if($t1o_featured_style == '0') echo ' selected="selected"';?>>Grid</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Featured per row:<br /><span class="k_help">(only Slider style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_featured_per_row" id="t1o_featured_per_row" class="form-control">
									<option value="1"<?php if($t1o_featured_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_featured_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_featured_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_featured_per_row == '4') echo ' selected="selected"';?><?php if($t1o_featured_per_row == '') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_featured_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_featured_per_row == '6') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Latest style:</label>
							<div class="col-sm-10">
								<select name="t1o_latest_style" id="t1o_latest_style" class="form-control">
									<option value="1"<?php if($t1o_latest_style == '1') echo ' selected="selected"';?>>Slider</option>
                                    <option value="0"<?php if($t1o_latest_style == '0') echo ' selected="selected"';?>>Grid</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Latest per row:<br /><span class="k_help">(only Slider style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_latest_per_row" id="t1o_latest_per_row" class="form-control">
									<option value="1"<?php if($t1o_latest_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_latest_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_latest_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_latest_per_row == '4') echo ' selected="selected"';?><?php if($t1o_latest_per_row == '') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_latest_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_latest_per_row == '6') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Specials style:</label>
							<div class="col-sm-10">
								<select name="t1o_specials_style" id="t1o_specials_style" class="form-control">
									<option value="1"<?php if($t1o_specials_style == '1') echo ' selected="selected"';?>>Slider</option>
                                    <option value="0"<?php if($t1o_specials_style == '0') echo ' selected="selected"';?>>Grid</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Specials per row:<br /><span class="k_help">(only Slider style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_specials_per_row" id="t1o_specials_per_row" class="form-control">
									<option value="1"<?php if($t1o_specials_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_specials_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_specials_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_specials_per_row == '4') echo ' selected="selected"';?><?php if($t1o_specials_per_row == '') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_specials_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_specials_per_row == '6') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">UP Theme Most Viewed style:</label>
							<div class="col-sm-10">
								<select name="t1o_most_viewed_style" id="t1o_most_viewed_style" class="form-control">
									<option value="1"<?php if($t1o_most_viewed_style == '1') echo ' selected="selected"';?>>Slider</option>
                                    <option value="0"<?php if($t1o_most_viewed_style == '0') echo ' selected="selected"';?>>Grid</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">UP Theme Most Viewed per row:<br /><span class="k_help">(only Slider style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_most_viewed_per_row" id="t1o_most_viewed_per_row" class="form-control">
									<option value="1"<?php if($t1o_most_viewed_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_most_viewed_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_most_viewed_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_most_viewed_per_row == '4') echo ' selected="selected"';?><?php if($t1o_most_viewed_per_row == '') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_most_viewed_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_most_viewed_per_row == '6') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">UP Theme Product Tabs style:</label>
							<div class="col-sm-10">
								<select name="t1o_product_tabs_style" id="t1o_product_tabs_style" class="form-control">
									<option value="1"<?php if($t1o_product_tabs_style == '1') echo ' selected="selected"';?>>Slider</option>
                                    <option value="0"<?php if($t1o_product_tabs_style == '0') echo ' selected="selected"';?>>Grid</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Products per row:<br /><span class="k_help">(only Slider style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_product_tabs_per_row" id="t1o_product_tabs_per_row" class="form-control">
									<option value="1"<?php if($t1o_product_tabs_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_product_tabs_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_product_tabs_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_product_tabs_per_row == '4') echo ' selected="selected"';?><?php if($t1o_product_tabs_per_row == '') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_product_tabs_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_product_tabs_per_row == '6') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Carousel Items per row:</label>
							<div class="col-sm-10">
								<select name="t1o_carousel_items_per_row" id="t1o_carousel_items_per_row" class="form-control">
									<option value="1"<?php if($t1o_carousel_items_per_row == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_carousel_items_per_row == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_carousel_items_per_row == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_carousel_items_per_row == '4') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_carousel_items_per_row == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_carousel_items_per_row == '6') echo ' selected="selected"';?><?php if($t1o_carousel_items_per_row == '') echo ' selected="selected"';?>>6</option>
								</select>  
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-options-others" class="tab-pane">  
        
                    <fieldset>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show "Scroll To Top" button:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_03.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_others_totop" class="form-control">
								    <option value="1"<?php if($t1o_others_totop == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_others_totop == '0') echo ' selected="selected"';?>>No</option>      
							    </select>
							</div>
						</div>

					</fieldset>        
        
        </div>
 
     
        </div>
        </div>
        
        </div>
        </div>
        
        
        
        
        <div class="tab-pane" id="tab-header"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-12">
        <div class="tab-content">
        
                    <fieldset>
                    
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Top Bar: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_04.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_top_bar_status" id="t1o_top_bar_status" class="form-control">
									<option value="1"<?php if($t1o_top_bar_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_top_bar_status == '0') echo ' selected="selected"';?>>No</option>  
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Logo position:</label>
							<div class="col-sm-10">
								<select name="t1o_logo_position" id="t1o_logo_position" class="form-control">
									<option value="center"<?php if($t1o_logo_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                                    <option value="left"<?php if($t1o_logo_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                          
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text Logo color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_text_logo_color" id="t1o_text_logo_color" value="<?php echo $t1o_text_logo_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Fixed Header (Mini Header): 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_05.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_header_fixed_header_status" id="t1o_header_fixed_header_status" class="form-control">
									<option value="1"<?php if($t1o_header_fixed_header_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_header_fixed_header_status == '0') echo ' selected="selected"';?>>No</option>  
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Fixed Header style:</label>
							<div class="col-sm-10">
								<select name="t1o_header_fixed_header_style" id="t1o_header_fixed_header_style" class="form-control">
									<option value="1"<?php if($t1o_header_fixed_header_style == '1') echo ' selected="selected"';?>>Logo + Menu</option>
                                    <option value="0"<?php if($t1o_header_fixed_header_style == '0') echo ' selected="selected"';?>>Only Menu</option> 
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Quick Search Auto-Suggest:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_06.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_header_auto_suggest_status" id="t1o_header_auto_suggest_status" class="form-control">
									<option value="1"<?php if($t1o_header_auto_suggest_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_header_auto_suggest_status == '0') echo ' selected="selected"';?>>No</option>   
								</select>
							</div>
						</div>
                        
                        <legend>Top Promo Message Slider <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_07.jpg" target="_blank">?</a></span></legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Promo Message Slider:</label>
							<div class="col-sm-10">
								<select name="t1o_top_custom_block_status" id="t1o_top_custom_block_status" class="form-control">
									<option value="1"<?php if($t1o_top_custom_block_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_top_custom_block_status == '0') echo ' selected="selected"';?><?php if($t1o_top_custom_block_status == '') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_top_custom_block_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_top_custom_block_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_top_custom_block_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_top_custom_block_content[<?php echo $language_id; ?>]" id="t1o_top_custom_block_content-<?php echo $language_id; ?>"><?php if(isset($t1o_top_custom_block_content[$language_id])) echo $t1o_top_custom_block_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Background Image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_top_custom_block_bg_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_top_custom_block_bg_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_top_custom_block_bg" value="<?php echo $t1o_top_custom_block_bg; ?>" id="t1o_top_custom_block_bg" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background Image Animation:</label>
							<div class="col-sm-10">
								<select name="t1o_top_custom_block_bg_animation" id="t1o_top_custom_block_bg_animation" class="form-control">
									<option value="1"<?php if($t1o_top_custom_block_bg_animation == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_top_custom_block_bg_animation == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_top_custom_block_bg_color" id="t1o_top_custom_block_bg_color" value="<?php echo $t1o_top_custom_block_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_top_custom_block_text_color" id="t1o_top_custom_block_text_color" value="<?php echo $t1o_top_custom_block_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        

					</fieldset>   
     
        </div>
        </div>
        
        </div>
        </div>

        
        
        

        <div class="tab-pane" id="tab-menu"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-12">
        <div class="tab-content">
        
                    <fieldset>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Align Menu Items to:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_align" id="t1o_menu_align" class="form-control">
                                    <option value="center"<?php if($t1o_menu_align == 'center') echo ' selected="selected"';?>>Center</option>
									<option value="left"<?php if($t1o_menu_align == 'left') echo ' selected="selected"';?>>Left</option> 
								</select>
							</div>
						</div>
                    
                        <legend>Home Page Link</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Home Page Link style:
                            </label>
							<div class="col-sm-10">
								<select name="t1o_menu_homepage" id="t1o_menu_homepage" class="form-control">
                                    <option value="text"<?php if($t1o_menu_homepage == 'text') echo ' selected="selected"';?>>Text</option>
									<option value="icon"<?php if($t1o_menu_homepage == 'icon') echo ' selected="selected"';?>>Icon</option> 
                                    <option value="icontext"<?php if($t1o_menu_homepage == 'icontext') echo ' selected="selected"';?>>Icon + Text</option>          
                                    <option value="dontshow"<?php if($t1o_menu_homepage == 'dontshow') echo ' selected="selected"';?>>Don't show</option> 
								</select>
							</div>
						</div>
                        
                        <legend>Categories</legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Categories:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_categories_status" id="t1o_menu_categories_status" class="form-control">
									<option value="1"<?php if($t1o_menu_categories_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_menu_categories_status == '0') echo ' selected="selected"';?>>No</option>    
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Categories display style:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_08.jpg" target="_blank">?</a></span>  
                            </label>
							<div class="col-sm-10">
								<select name="t1o_menu_categories_style" id="t1o_menu_categories_style" class="form-control">
									<option value="1"<?php if($t1o_menu_categories_style == '1') echo ' selected="selected"';?>><?php echo $text_opencart; ?></option>
                                    <option value="2"<?php if($t1o_menu_categories_style == '2') echo ' selected="selected"';?>><?php echo $text_vertical; ?></option>
                                    <option value="3"<?php if($t1o_menu_categories_style == '3') echo ' selected="selected"';?><?php if($t1o_menu_categories_style == '') echo ' selected="selected"';?>><?php echo $text_horizontal; ?></option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show category images:<br /><span class="k_help">(only horizontal and OpenCart styles)</span></label>
							<div class="col-sm-10">
								<select name="t1o_menu_main_category_icon_status" id="t1o_menu_main_category_icon_status" class="form-control">
									<option value="1"<?php if($t1o_menu_main_category_icon_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_menu_main_category_icon_status == '0') echo ' selected="selected"';?><?php if($t1o_menu_main_category_icon_status == '') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Category images margin:<br /><span class="k_help">(only OpenCart style)</span>
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_09.jpg" target="_blank">?</a></span>  
                            </label>
							<div class="col-sm-10">
								<select name="t1o_menu_main_category_icon_margin" id="t1o_menu_main_category_icon_margin" class="form-control">
									<option value="0"<?php if($t1o_menu_main_category_icon_margin == '0') echo ' selected="selected"';?>>0px</option>
                                    <option value="-30"<?php if($t1o_menu_main_category_icon_margin == '-30') echo ' selected="selected"';?>>-30px</option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Categories per row:<br /><span class="k_help">(only horizontal style)</span></label>
							<div class="col-sm-10">
								<select name="t1o_menu_categories_per_row" id="t1o_menu_categories_per_row" class="form-control">
									<option value="col-sm-4"<?php if($t1o_menu_categories_per_row == 'col-sm-4') echo ' selected="selected"';?>>3</option>
                                    <option value="col-sm-3"<?php if($t1o_menu_categories_per_row == 'col-sm-3') echo ' selected="selected"';?><?php if($t1o_menu_categories_per_row == '') echo ' selected="selected"';?>>4</option>
                                    <option value="col-sm-5-pr"<?php if($t1o_menu_categories_per_row == 'col-sm-5-pr') echo ' selected="selected"';?>>5</option>
                                    <option value="col-sm-2"<?php if($t1o_menu_categories_per_row == 'col-sm-2') echo ' selected="selected"';?>>6</option>
                                    <option value="col-sm-7-pr"<?php if($t1o_menu_categories_per_row == 'col-sm-7-pr') echo ' selected="selected"';?>>7</option>
                                    <option value="col-sm-8-pr"<?php if($t1o_menu_categories_per_row == 'col-sm-8-pr') echo ' selected="selected"';?>>8</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show 3 level category:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_categories_3_level" id="t1o_menu_categories_3_level" class="form-control">
									<option value="1"<?php if($t1o_menu_categories_3_level == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_menu_categories_3_level == '0') echo ' selected="selected"';?><?php if($t1o_menu_categories_3_level == '') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Categories Custom Block:<br /><span class="k_help">(only Horizontal style)</span>
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_10.jpg" target="_blank">?</a></span>  
                            </label>
							<div class="col-sm-10">
								<select name="t1o_menu_categories_custom_block_status" id="t1o_menu_categories_custom_block_status" class="form-control">
									<option value="1"<?php if($t1o_menu_categories_custom_block_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_menu_categories_custom_block_status == '0') echo ' selected="selected"';?><?php if($t1o_menu_categories_custom_block_status == '') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Categories Custom Block Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_menu_categories_custom_block_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_menu_categories_custom_block_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_menu_categories_custom_block_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_menu_categories_custom_block_content[<?php echo $language_id; ?>]" id="t1o_menu_categories_custom_block_content-<?php echo $language_id; ?>"><?php if(isset($t1o_menu_categories_custom_block_content[$language_id])) echo $t1o_menu_categories_custom_block_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <legend>Brands</legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Brands:
                            <span class="k_help_tip k_tooltip" title="Before you turn on this option, add at least one manufacturer." data-toggle="tooltip">?</span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_menu_brands_status" id="t1o_menu_brands_status" class="form-control">
									<option value="1"<?php if($t1o_menu_brands_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_menu_brands_status == '0') echo ' selected="selected"';?>>No</option>     
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Brands display style:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_brands_style" id="t1o_menu_brands_style" class="form-control">
									<option value="logoname"<?php if($t1o_menu_brands_style == 'logoname') echo ' selected="selected"';?>><?php echo $text_brand_logo_name; ?></option>  
                                    <option value="logo"<?php if($t1o_menu_brands_style == 'logo') echo ' selected="selected"';?>><?php echo $text_brand_logo; ?></option>
                                    <option value="name"<?php if($t1o_menu_brands_style == 'name') echo ' selected="selected"';?>><?php echo $text_brand_name; ?></option>
                                             
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Brands per row:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_brands_per_row" id="t1o_menu_brands_per_row" class="form-control">
									<option value="4"<?php if($t1o_menu_brands_per_row == '4') echo ' selected="selected"';?>>3</option>
                                    <option value="3"<?php if($t1o_menu_brands_per_row == '3') echo ' selected="selected"';?>>4</option>
                                    <option value="2"<?php if($t1o_menu_brands_per_row == '2') echo ' selected="selected"';?><?php if($t1o_menu_brands_per_row == '') echo ' selected="selected"';?>>6</option>
                                    <option value="1"<?php if($t1o_menu_brands_per_row == '1') echo ' selected="selected"';?>>12</option>         
								</select>
							</div>
						</div>
                        
                        <legend>Custom Links <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_11.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="table-responsive">
                        
							<table class="table table-hover">
								<thead>
									<tr>
                                    <th class="left" width="10%">Link</th>
									<th class="left" width="10%">Show</th>
									<th class="left" width="30%">Title</th>
									<th class="left" width="30%">URL</th>
									<th class="left" width="20%">Open</th>
									</tr>
								</thead>
                                <tbody>
									<?php for ($i = 1; $i <= 10; $i++) { ?>
                                    <tr>
									<td>Link <?php echo $i; ?>:</td>
									<td>
                                    <select name="t1o_menu_link[<?php echo $i; ?>][status]" class="form-control">
									    <option value="0"<?php if($t1o_menu_link[$i]['status'] == '0') echo ' selected="selected"';?>>No</option> 
                                        <option value="1"<?php if($t1o_menu_link[$i]['status'] == '1') echo ' selected="selected"';?>>Yes</option>      
							    	</select>
                                    </td>
                                    <td>
                                    <?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_menu_link[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="t1o_menu_link_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php if(isset($t1o_menu_link[$i][$language_id]['title'])) echo $t1o_menu_link[$i][$language_id]['title']; ?>" placeholder="Title" class="form-control" /> 
										</div>
									<?php } ?>
                                    </td>
                                    <td>
                                    <input type="text" name="t1o_menu_link[<?php echo $i; ?>][url]" value="<?php echo $t1o_menu_link[$i]['url']; ?>" class="form-control" />
                                    </td>
                                    <td>
                                    
                                    <select name="t1o_menu_link[<?php echo $i; ?>][target]" class="form-control">
										<?php foreach ($menu_link_target as $fv => $fc) { ?>
											<?php ($fv ==  $t1o_menu_link[$i]['target']) ? $current = 'selected' : $current=''; ?>
											<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
										<?php } ?>
									</select>
                                    
                                    </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
							</table>
                        
                        </div>
                        
                        <legend>Custom Dropdown Menu <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_12.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Menu:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_cm_status" id="t1o_menu_cm_status" class="form-control">
									<option value="0"<?php if($t1o_menu_cm_status == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_menu_cm_status == '1') echo ' selected="selected"';?>>Yes</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
						    <label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
								<?php $language_id=$language['language_id']; ?>
									<div class="input-group">
										<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                        <input type="text" name="t1o_menu_cm_title[<?php echo $language_id; ?>]" id="t1o_menu_cm_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_menu_cm_title[$language_id])) echo $t1o_menu_cm_title[$language_id]; ?>" placeholder="Title" class="form-control" />  
									</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="table-responsive">
                        
							<table class="table table-hover">
								<thead>
									<tr>
                                    <th class="left" width="10%">Link</th>
									<th class="left" width="10%">Show</th>
									<th class="left" width="30%">Title</th>
									<th class="left" width="30%">URL</th>
									<th class="left" width="20%">Open</th>
									</tr>
								</thead>
                                <tbody>
									<?php for ($i = 1; $i <= 10; $i++) { ?>
                                    <tr>
									<td>Link <?php echo $i; ?>:</td>
									<td>
    
                                    <select name="t1o_menu_cm_link[<?php echo $i; ?>][status]" class="form-control">
									    <option value="0"<?php if($t1o_menu_cm_link[$i]['status'] == '0') echo ' selected="selected"';?>>No</option> 
                                        <option value="1"<?php if($t1o_menu_cm_link[$i]['status'] == '1') echo ' selected="selected"';?>>Yes</option>      
							    	</select>

                                    </td>
                                    <td>
                                    
                                    <?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_menu_cm_link[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="t1o_menu_cm_link_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php if(isset($t1o_menu_cm_link[$i][$language_id]['title'])) echo $t1o_menu_cm_link[$i][$language_id]['title']; ?>" placeholder="Title" class="form-control" />
										</div>
									<?php } ?>
                                    
                                    </td>
                                    <td>
                                    
                                    <input type="text" name="t1o_menu_cm_link[<?php echo $i; ?>][url]" value="<?php echo $t1o_menu_cm_link[$i]['url']; ?>" class="form-control" />
                                    
                                    </td>
                                    <td>
                                    
                                    <select name="t1o_menu_cm_link[<?php echo $i; ?>][target]" class="form-control">
										<?php foreach ($menu_link_target as $fv => $fc) { ?>
											<?php ($fv ==  $t1o_menu_cm_link[$i]['target']) ? $current = 'selected' : $current=''; ?>
											<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option>	
										<?php } ?>
									</select>
                                    
                                    </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
							</table>
                        
                        </div>
                        
                        
                        <?php for ($i = 1; $i <= 3; $i++) { ?>
                        
                        <legend>Custom Block <?php echo $i; ?><span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_13.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Block <?php echo $i; ?>:</label>
							<div class="col-sm-10">
								<select name="t1o_menu_custom_block[<?php echo $i; ?>][status]" class="form-control">
								    <option value="0"<?php if($t1o_menu_custom_block[$i]['status'] == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_menu_custom_block[$i]['status'] == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_menu_custom_block[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="t1o_menu_custom_block_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php if(isset($t1o_menu_custom_block[$i][$language_id]['title'])) echo $t1o_menu_custom_block[$i][$language_id]['title']; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_menu_custom_block_<?php echo $i; ?>" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_menu_custom_block_<?php echo $i; ?>_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_menu_custom_block_<?php echo $i; ?>_<?php echo $language_id; ?>" class="tab-pane">
                                            <textarea name="t1o_menu_custom_block[<?php echo $i ?>][<?php echo $language_id; ?>][content]" id="t1o_menu_custom_block_<?php echo $i ?>_<?php echo $language_id; ?>_content"><?php if(isset($t1o_menu_custom_block[$i][$language_id]['content'])) echo $t1o_menu_custom_block[$i][$language_id]['content']; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <?php } ?>
                        
                        <legend>Menu Labels <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_14.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="table-responsive">
                        
							<table class="table table-hover">
									<?php for ($i = 1; $i <= 15; $i++) { ?>
                                    <tr>
									<td width="15%" style="text-align:right;">Menu Label <?php echo $i; ?>:</td>
									<td width="35%">
                                    <?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>	
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_menu_labels[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="t1o_menu_labels_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php if(isset($t1o_menu_labels[$i][$language_id]['title'])) echo $t1o_menu_labels[$i][$language_id]['title']; ?>" placeholder="Label" class="form-control" />
										</div>
									<?php } ?>
                                    </td>
                                    <td width="15%" style="text-align:right;">Background color:</td>
                                    <td width="35%">
                                    <input type="text" name="t1o_menu_labels_color[<?php echo $i; ?>]" id="t1o_menu_labels_color_[<?php echo $i; ?>]" value="<?php echo $t1o_menu_labels_color[$i]; ?>" class="color {required:false,hash:true}" size="7" />
                                    </td>
                                    </tr>
                                    <?php } ?>
							</table>
                        
                        </div>
                        
                        <legend>Custom Bar below Main Menu <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_15.jpg" target="_blank">?</a></span></legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Bar:</label>
							<div class="col-sm-10">
								<select name="t1o_custom_bar_below_menu_status" id="t1o_custom_bar_below_menu_status" class="form-control">
									<option value="1"<?php if($t1o_custom_bar_below_menu_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_custom_bar_below_menu_status == '0') echo ' selected="selected"';?><?php if($t1o_custom_bar_below_menu_status == '') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_custom_bar_below_menu_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_custom_bar_below_menu_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_custom_bar_below_menu_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_custom_bar_below_menu_content[<?php echo $language_id; ?>]" id="t1o_custom_bar_below_menu_content-<?php echo $language_id; ?>"><?php if(isset($t1o_custom_bar_below_menu_content[$language_id])) echo $t1o_custom_bar_below_menu_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Background Image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_custom_bar_below_menu_bg_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_custom_bar_below_menu_bg_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_custom_bar_below_menu_bg" value="<?php echo $t1o_custom_bar_below_menu_bg; ?>" id="t1o_custom_bar_below_menu_bg" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background Image Animation:</label>
							<div class="col-sm-10">
								<select name="t1o_custom_bar_below_menu_bg_animation" id="t1o_custom_bar_below_menu_bg_animation" class="form-control">
									<option value="1"<?php if($t1o_custom_bar_below_menu_bg_animation == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_custom_bar_below_menu_bg_animation == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_custom_bar_below_menu_bg_color" id="t1o_custom_bar_below_menu_bg_color" value="<?php echo $t1o_custom_bar_below_menu_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_custom_bar_below_menu_text_color" id="t1o_custom_bar_below_menu_text_color" value="<?php echo $t1o_custom_bar_below_menu_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>

					</fieldset> 
     
        </div>
        </div>
        
        </div>
        </div>




        <div class="tab-pane" id="tab-midsection"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-2">    
        <ul id="midsection_tabs" class="nav nav-pills nav-stacked">
             <li class="active"><a href="#tab-midsection-category" data-toggle="tab">Category Page</a></li>
             <li><a href="#tab-midsection-product" data-toggle="tab">Product Page</a></li>
             <li><a href="#tab-midsection-contact" data-toggle="tab">Contact Page</a></li>
             <li><a href="#tab-midsection-lf" data-toggle="tab">Left/Right Column</a></li>                                      
        </ul> 
        </div>
        
        <div class="col-sm-10">
        <div class="tab-content">
        
        <div id="tab-midsection-category" class="tab-pane fade in active">  
        
                    <fieldset>
                    
                        <legend>Category Title <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_16.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Category Title position:</label>
							<div class="col-sm-10">
								<select name="t1o_category_title_position" id="t1o_category_title_position" class="form-control">
									<option value="1"<?php if($t1o_category_title_position == '1') echo ' selected="selected"';?>>Content Column</option>
                                    <option value="0"<?php if($t1o_category_title_position == '0') echo ' selected="selected"';?>>Above Content Column</option> 
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Category Title color:<br /><span class="k_help">(only "Above Content Column" position)</span></label>
							<div class="col-sm-10">
								<input type="text" name="t1o_category_title_above_color" id="t1o_category_title_above_color" value="<?php echo $t1o_category_title_above_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Category Info <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_17.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show category description:</label>
							<div class="col-sm-10">
								<select name="t1o_category_desc_status" id="t1o_category_desc_status" class="form-control">
									<option value="1"<?php if($t1o_category_desc_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_desc_status == '0') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show category image:</label>
							<div class="col-sm-10">
								<select name="t1o_category_img_status" id="t1o_category_img_status" class="form-control">
									<option value="1"<?php if($t1o_category_img_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_img_status == '0') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Parallax scrolling effect:<br /><span class="k_help">(only if Category Title is in "Above Content Column" position)</span><span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_18.jpg" target="_blank">?</a></span></label>
                            <div class="col-sm-10">
								<select name="t1o_category_img_parallax" id="t1o_category_img_parallax" class="form-control">
									<option value="1"<?php if($t1o_category_img_parallax == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_img_parallax == '0') echo ' selected="selected"';?><?php if($t1o_category_img_parallax == '') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
				        </div>
                        
                        <legend>Subcategories <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_19.jpg" target="_blank">?</a></span></legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show subcategories:</label>
							<div class="col-sm-10">
								<select name="t1o_category_subcategories_status" id="t1o_category_subcategories_status" class="form-control">
									<option value="1"<?php if($t1o_category_subcategories_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_subcategories_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subcategories style:</label>
							<div class="col-sm-10">
								<select name="t1o_category_subcategories_style" id="t1o_category_subcategories_style" class="form-control">
									<option value="0"<?php if($t1o_category_subcategories_style == '0') echo ' selected="selected"';?>>UP Theme</option>
                                    <option value="1"<?php if($t1o_category_subcategories_style == '1') echo ' selected="selected"';?>>OpenCart</option>
								</select>
							</div>
						</div>

						<legend>Product Box <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_20.jpg" target="_blank">?</a></span></legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show sale badge:</label>
							<div class="col-sm-10">
								<select name="t1o_sale_badge_status" id="t1o_sale_badge_status" class="form-control">
									<option value="1"<?php if($t1o_sale_badge_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_sale_badge_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Sale badge type:</label>
							<div class="col-sm-10">
								<select name="t1o_sale_badge_type" id="t1o_sale_badge_type" class="form-control">
									<option value="1"<?php if($t1o_sale_badge_type == '1') echo ' selected="selected"';?>>Percent</option>
                                    <option value="0"<?php if($t1o_sale_badge_type == '0') echo ' selected="selected"';?>>SALE text</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show new product badge:</label>
							<div class="col-sm-10">
								<select name="t1o_new_badge_status" id="t1o_new_badge_status" class="form-control">
									<option value="1"<?php if($t1o_new_badge_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_new_badge_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show product name:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_name_status" id="t1o_category_prod_name_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_name_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_name_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show product brand:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_brand_status" id="t1o_category_prod_brand_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_brand_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_brand_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show product price:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_price_status" id="t1o_category_prod_price_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_price_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_price_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show "Quick View" button:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_quickview_status" id="t1o_category_prod_quickview_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_quickview_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_quickview_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show "Add to Cart" button:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_cart_status" id="t1o_category_prod_cart_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_cart_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_cart_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show rating stars:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_ratings_status" id="t1o_category_prod_ratings_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_ratings_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_ratings_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show "Add to Wishlist", "Add to Compare" and "Info" buttons:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_wis_com_status" id="t1o_category_prod_wis_com_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_wis_com_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_wis_com_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show zoom image effect:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_zoom_status" id="t1o_category_prod_zoom_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_zoom_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_zoom_status == '0') echo ' selected="selected"';?><?php if($t1o_category_prod_zoom_status == '') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show swap image effect:</label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_swap_status" id="t1o_category_prod_swap_status" class="form-control">
									<option value="1"<?php if($t1o_category_prod_swap_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_category_prod_swap_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Align items to:<br /><span class="k_help">(only grid view)</span></label>
							<div class="col-sm-10">
								<select name="t1o_category_prod_align" id="t1o_category_prod_align" class="form-control">
                                    <option value="1"<?php if($t1o_category_prod_align == '1') echo ' selected="selected"';?>>Left</option>
                                    <option value="0"<?php if($t1o_category_prod_align == '0') echo ' selected="selected"';?>>Center</option>
								</select>
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-midsection-product" class="tab-pane">  
        
                    <fieldset>
                        
                        <legend class="bn"></legend> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Prev/Next products: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_21.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_prev_next_status" id="t1o_product_prev_next_status" class="form-control">
									<option value="1"<?php if($t1o_product_prev_next_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_prev_next_status == '0') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        
                        <legend>Product Page Layout</legend> 
                        
                        <div class="form-group">
                            <div class="col-sm-12">
                                <?php for ($ppl = 1; $ppl <= 6; $ppl++) { ?>
                                <div class="prod_l"><img src="view/image/321cart_img/pl_<?php echo $ppl; ?>.png"><span class="t1o_help prod_l_nr"><?php echo $ppl; ?></span></div> 
						        <?php } ?>	
						    </div>   
                            <div class="col-sm-12">
                                <?php for ($ppl = 7; $ppl <= 12; $ppl++) { ?>
                                <div class="prod_l"><img src="view/image/321cart_img/pl_<?php echo $ppl; ?>.png"><span class="t1o_help prod_l_nr"><?php echo $ppl; ?></span></div> 
						        <?php } ?>	
						    </div>
                        </div>
          
                        <div class="form-group">
							<label class="col-sm-2 control-label">Product Page Layout:</label>
							<div class="col-sm-10">
								<select name="t1o_layout_product_page" id="t1o_layout_product_page" class="form-control">
									<option value="1"<?php if($t1o_layout_product_page == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_layout_product_page == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_layout_product_page == '3') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_layout_product_page == '4') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_layout_product_page == '5') echo ' selected="selected"';?><?php if($t1o_layout_product_page == '') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_layout_product_page == '6') echo ' selected="selected"';?>>6</option>
                           			<option value="7"<?php if($t1o_layout_product_page == '7') echo ' selected="selected"';?>>7</option>    
                           			<option value="8"<?php if($t1o_layout_product_page == '8') echo ' selected="selected"';?>>8</option>
                           			<option value="9"<?php if($t1o_layout_product_page == '9') echo ' selected="selected"';?>>9</option>
                           			<option value="10"<?php if($t1o_layout_product_page == '10') echo ' selected="selected"';?>>10</option>
                                    <option value="11"<?php if($t1o_layout_product_page == '11') echo ' selected="selected"';?>>11</option>
                                    <option value="12"<?php if($t1o_layout_product_page == '12') echo ' selected="selected"';?>>12</option>
								</select>  
							</div>
						</div>

						<legend>Product Name <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_22.jpg" target="_blank">?</a></span></legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1o_product_name_position" id="t1o_product_name_position" class="form-control">
                                    <option value="0"<?php if($t1o_product_name_position == '0') echo ' selected="selected"';?>>Buy Column</option>
									<option value="1"<?php if($t1o_product_name_position == '1') echo ' selected="selected"';?>>Content Column</option>
                                    <option value="2"<?php if($t1o_product_name_position == '2') echo ' selected="selected"';?>>Above Content Column</option>
								</select>
							</div>
						</div>
                        
                        <legend>Product Images</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Additional Images in a row:</label>
							<div class="col-sm-10">
								<select name="t1o_additional_images" id="t1o_additional_images" class="form-control">
									<option value="1"<?php if($t1o_additional_images == '1') echo ' selected="selected"';?>>1</option>
                           			<option value="2"<?php if($t1o_additional_images == '2') echo ' selected="selected"';?>>2</option>
                           			<option value="3"<?php if($t1o_additional_images == '3') echo ' selected="selected"';?><?php if($t1o_additional_images == '') echo ' selected="selected"';?>>3</option>
                           			<option value="4"<?php if($t1o_additional_images == '4') echo ' selected="selected"';?>>4</option> 
                           			<option value="5"<?php if($t1o_additional_images == '5') echo ' selected="selected"';?>>5</option>
                           			<option value="6"<?php if($t1o_additional_images == '6') echo ' selected="selected"';?>>6</option>
                           			<option value="7"<?php if($t1o_additional_images == '7') echo ' selected="selected"';?>>7</option>    
                           			<option value="8"<?php if($t1o_additional_images == '8') echo ' selected="selected"';?>>8</option>
                           			<option value="9"<?php if($t1o_additional_images == '9') echo ' selected="selected"';?>>9</option>
                           			<option value="10"<?php if($t1o_additional_images == '10') echo ' selected="selected"';?>>10</option>
								</select>  
							</div>
						</div>
                        
                        <legend>Buy Section</legend>
		                    
                        <div class="form-group">
							<label class="col-sm-2 control-label">Align items to:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_23.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_align" id="t1o_product_align" class="form-control">
                                    <option value="1"<?php if($t1o_product_align == '1') echo ' selected="selected"';?>>Left</option>
                                    <option value="0"<?php if($t1o_product_align == '0') echo ' selected="selected"';?>>Center</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show manufacturer logo: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_24.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_manufacturer_logo_status" id="t1o_product_manufacturer_logo_status" class="form-control">
									<option value="1"<?php if($t1o_product_manufacturer_logo_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_manufacturer_logo_status == '0') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Save Percent: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_25.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_save_percent_status" id="t1o_product_save_percent_status" class="form-control">
									<option value="1"<?php if($t1o_product_save_percent_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_save_percent_status == '0') echo ' selected="selected"';?>>No</option>  
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Tax: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_26.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_tax_status" id="t1o_product_tax_status" class="form-control">
									<option value="1"<?php if($t1o_product_tax_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_tax_status == '0') echo ' selected="selected"';?>>No</option>  
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show product viewed: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_27.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_viewed_status" id="t1o_product_viewed_status" class="form-control">
									<option value="1"<?php if($t1o_product_viewed_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_viewed_status == '0') echo ' selected="selected"';?>>No</option>
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Increment/Decrement a Quantity: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_28.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_i_c_status" id="t1o_product_i_c_status" class="form-control">
									<option value="1"<?php if($t1o_product_i_c_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_i_c_status == '0') echo ' selected="selected"';?>>No</option>  
								</select>
							</div>
						</div>
                        
                        <legend>Related Products</legend>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show related products:</label>
							<div class="col-sm-10">
								<select name="t1o_product_related_status" id="t1o_product_related_status" class="form-control">
									<option value="1"<?php if($t1o_product_related_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_product_related_status == '0') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Related products position:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_29.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_product_related_position" id="t1o_product_related_position" class="form-control">
									<option value="1"<?php if($t1o_product_related_position == '1') echo ' selected="selected"';?>>Bottom</option>
                                    <option value="0"<?php if($t1o_product_related_position == '0') echo ' selected="selected"';?><?php if($t1o_product_related_position == '') echo ' selected="selected"';?>>Right</option>  
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Related products style:<br /><span class="k_help">(only bottom position)</span></label>
							<div class="col-sm-10">
								<select name="t1o_product_related_style" id="t1o_product_related_style" class="form-control">
									<option value="0"<?php if($t1o_product_related_style == '0') echo ' selected="selected"';?>>Grid</option>  
                                    <option value="1"<?php if($t1o_product_related_style == '1') echo ' selected="selected"';?>>Slider</option>   
								</select>
							</div>
						</div>
                        
                        <legend>Feature Box 1<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_30.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>38 x 38px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_product_fb1_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_product_fb1_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_product_fb1_icon" value="<?php echo $t1o_product_fb1_icon; ?>" id="t1o_product_fb1_icon" />
					        </div>
				        </div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_product_fb1_awesome" value="<?php echo $t1o_product_fb1_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_fb1_title[<?php echo $language_id; ?>]" id="t1o_product_fb1_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_fb1_title[$language_id])) echo $t1o_product_fb1_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_fb1_subtitle[<?php echo $language_id; ?>]" id="t1o_product_fb1_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_fb1_subtitle[$language_id])) echo $t1o_product_fb1_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_fb1_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_fb1_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_fb1_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_product_fb1_content[<?php echo $language_id; ?>]" id="t1o_product_fb1_content-<?php echo $language_id; ?>"><?php if(isset($t1o_product_fb1_content[$language_id])) echo $t1o_product_fb1_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <legend>Feature Box 2</legend>
 
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>38 x 38px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_product_fb2_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_product_fb2_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_product_fb2_icon" value="<?php echo $t1o_product_fb2_icon; ?>" id="t1o_product_fb2_icon" />
					        </div>
				        </div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_product_fb2_awesome" value="<?php echo $t1o_product_fb2_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_fb2_title[<?php echo $language_id; ?>]" id="t1o_product_fb2_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_fb2_title[$language_id])) echo $t1o_product_fb2_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_fb2_subtitle[<?php echo $language_id; ?>]" id="t1o_product_fb2_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_fb2_subtitle[$language_id])) echo $t1o_product_fb2_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_fb2_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_fb2_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_fb2_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_product_fb2_content[<?php echo $language_id; ?>]" id="t1o_product_fb2_content-<?php echo $language_id; ?>"><?php if(isset($t1o_product_fb2_content[$language_id])) echo $t1o_product_fb2_content[$language_id]; ?></textarea>
										</div>			
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <legend>Feature Box 3</legend>

                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>38 x 38px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_product_fb3_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_product_fb3_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_product_fb3_icon" value="<?php echo $t1o_product_fb3_icon; ?>" id="t1o_product_fb3_icon" />
					        </div>
				        </div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_product_fb3_awesome" value="<?php echo $t1o_product_fb3_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_fb3_title[<?php echo $language_id; ?>]" id="t1o_product_fb3_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_fb3_title[$language_id])) echo $t1o_product_fb3_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_fb3_subtitle[<?php echo $language_id; ?>]" id="t1o_product_fb3_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_fb3_subtitle[$language_id])) echo $t1o_product_fb3_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_fb3_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_fb3_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>

								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_fb3_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_product_fb3_content[<?php echo $language_id; ?>]" id="t1o_product_fb3_content-<?php echo $language_id; ?>"><?php if(isset($t1o_product_fb3_content[$language_id])) echo $t1o_product_fb3_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
          
							</div>
						</div>
                        
                        <legend>Custom Block - Under Main Image<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_31.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Block:</label>
							<div class="col-sm-10">
								<select name="t1o_product_custom_block_1_status" class="form-control">
								    <option value="0"<?php if($t1o_product_custom_block_1_status == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_product_custom_block_1_status == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
						</div>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_custom_block_1_title[<?php echo $language_id; ?>]" id="t1o_product_custom_block_1_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_custom_block_1_title[$language_id])) echo $t1o_product_custom_block_1_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_custom_block_1_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_custom_block_1_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_custom_block_1_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_product_custom_block_1_content[<?php echo $language_id; ?>]" id="t1o_product_custom_block_1_content-<?php echo $language_id; ?>"><?php if(isset($t1o_product_custom_block_1_content[$language_id])) echo $t1o_product_custom_block_1_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <legend>Custom Block - Buy Section<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_32.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Block:</label>
							<div class="col-sm-10">
								<select name="t1o_product_custom_block_2_status" class="form-control">
								    <option value="0"<?php if($t1o_product_custom_block_2_status == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_product_custom_block_2_status == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
						</div>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_custom_block_2_title[<?php echo $language_id; ?>]" id="t1o_product_custom_block_2_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_custom_block_2_title[$language_id])) echo $t1o_product_custom_block_2_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_custom_block_2_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_custom_block_2_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_custom_block_2_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_product_custom_block_2_content[<?php echo $language_id; ?>]" id="t1o_product_custom_block_2_content-<?php echo $language_id; ?>"><?php if(isset($t1o_product_custom_block_2_content[$language_id])) echo $t1o_product_custom_block_2_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
          
							</div>
						</div>  
                        
                        <legend>Custom Block - Right Sidebar<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_33.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Block:</label>
							<div class="col-sm-10">
								<select name="t1o_product_custom_block_3_status" class="form-control">
								    <option value="0"<?php if($t1o_product_custom_block_3_status == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_product_custom_block_3_status == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
						</div>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_custom_block_3_title[<?php echo $language_id; ?>]" id="t1o_product_custom_block_3_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_product_custom_block_3_title[$language_id])) echo $t1o_product_custom_block_3_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_custom_block_3_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_custom_block_3_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_custom_block_3_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_product_custom_block_3_content[<?php echo $language_id; ?>]" id="t1o_product_custom_block_3_content-<?php echo $language_id; ?>"><?php if(isset($t1o_product_custom_block_3_content[$language_id])) echo $t1o_product_custom_block_3_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <?php for ($i = 1; $i <= 3; $i++) { ?>
                        
                        <legend>Custom Tab <?php echo $i; ?><span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_34.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Tab <?php echo $i; ?>:</label>
							<div class="col-sm-10">
								<select name="t1o_product_custom_tab[<?php echo $i; ?>][status]" class="form-control">
								    <option value="0"<?php if($t1o_product_custom_tab[$i]['status'] == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_product_custom_tab[$i]['status'] == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_product_custom_tab[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="t1o_product_custom_tab_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php if(isset($t1o_product_custom_tab[$i][$language_id]['title'])) echo $t1o_product_custom_tab[$i][$language_id]['title']; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_product_custom_tab_<?php echo $i; ?>" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_product_custom_tab_<?php echo $i; ?>_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_product_custom_tab_<?php echo $i; ?>_<?php echo $language_id; ?>" class="tab-pane">
                                            <textarea name="t1o_product_custom_tab[<?php echo $i ?>][<?php echo $language_id; ?>][content]" id="t1o_product_custom_tab_<?php echo $i ?>_<?php echo $language_id; ?>_content"><?php if(isset($t1o_product_custom_tab[$i][$language_id]['content'])) echo $t1o_product_custom_tab[$i][$language_id]['content']; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <?php } ?>

					</fieldset>        
        
        </div>
        
        <div id="tab-midsection-contact" class="tab-pane">  
        
                    <fieldset>
                        
                        <legend>Google Map <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_35.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Google Map:</label>
							<div class="col-sm-10">
								<select name="t1o_contact_map_status" id="t1o_contact_map_status" class="form-control">
									<option value="1"<?php if($t1o_contact_map_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_contact_map_status == '0') echo ' selected="selected"';?><?php if($t1o_contact_map_status == '') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Latitude, Longitude:<br /><span class="k_help">For example:<br />53.5569238,13.258543</span></label>
							<div class="col-sm-10">
								<input type="text" name="t1o_contact_map_ll" value="<?php echo $t1o_contact_map_ll; ?>" class="form-control" />
                                <a href="http://itouchmap.com/latlong.html" target="_blank" class="link">How to find Latitude and Longitude?</a>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Map type:</label>
							<div class="col-sm-10">
								<select name="t1o_contact_map_type" id="t1o_contact_map_type" class="form-control">
									<option value="ROADMAP"<?php if($t1o_contact_map_type == 'ROADMAP') echo ' selected="selected"';?>>ROADMAP</option>
                            		<option value="SATELLITE"<?php if($t1o_contact_map_type == 'SATELLITE') echo ' selected="selected"';?>>SATELLITE</option>
                            		<option value="HYBRID"<?php if($t1o_contact_map_type == 'HYBRID') echo ' selected="selected"';?>>HYBRID</option>
                            		<option value="TERRAIN"<?php if($t1o_contact_map_type == 'TERRAIN') echo ' selected="selected"';?>>TERRAIN</option> 
								</select>
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-midsection-lf" class="tab-pane">  
        
                    <fieldset> 
        
                        <legend>Categories</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Categories display type:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_36.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_left_right_column_categories_type" class="form-control">
								    <option value="0"<?php if($t1o_left_right_column_categories_type == '0') echo ' selected="selected"';?>><?php echo $text_accordion; ?></option> 
                                    <option value="1"<?php if($t1o_left_right_column_categories_type == '1') echo ' selected="selected"';?>><?php echo $text_opencart; ?></option>   
							    </select>
							</div>
						</div>
        
                    </fieldset>      
        
        </div>
 
     
        </div>
        </div>
        
        </div>
        </div>
        
        
        
        
        <div class="tab-pane" id="tab-footer"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-2">    
        <ul id="footer_tabs" class="nav nav-pills nav-stacked">
             <li class="active"><a href="#tab-footer-features" data-toggle="tab">Features Block</a></li>
             <li><a href="#tab-footer-information" data-toggle="tab">Information Block</a></li>
             <li><a href="#tab-footer-custom-column" data-toggle="tab">Custom Column</a></li>
             <li><a href="#tab-footer-powered" data-toggle="tab">Powered by</a></li>
             <li><a href="#tab-footer-news" data-toggle="tab">News</a></li>
             <li><a href="#tab-footer-follow" data-toggle="tab">Follow us</a></li>
             <li><a href="#tab-footer-payment" data-toggle="tab">Payment Images</a></li>
             <li><a href="#tab-footer-bottom-custom" data-toggle="tab">Bottom Custom Block</a></li>                                    
        </ul> 
        </div>
        
        <div class="col-sm-10">
        <div class="tab-content">
        
        <div id="tab-footer-features" class="tab-pane fade in active">  
        
                    <fieldset>

						<legend>Feature Box 1 <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_37.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>64 x 64px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_fp_fb1_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_fp_fb1_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_fp_fb1_icon" value="<?php echo $t1o_fp_fb1_icon; ?>" id="t1o_fp_fb1_icon" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_fp_fb1_awesome" value="<?php echo $t1o_fp_fb1_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icon background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_fp_fb1_color" id="t1o_fp_fb1_color" value="<?php echo $t1o_fp_fb1_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_fp_fb1_title[<?php echo $language_id; ?>]" id="t1o_fp_fb1_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb1_title[$language_id])) echo $t1o_fp_fb1_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="t1o_fp_fb1_subtitle[<?php echo $language_id; ?>]" id="t1o_fp_fb1_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb1_subtitle[$language_id])) echo $t1o_fp_fb1_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_fp_fb1_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_fp_fb1_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_fp_fb1_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_fp_fb1_content[<?php echo $language_id; ?>]" id="t1o_fp_fb1_content-<?php echo $language_id; ?>"><?php if(isset($t1o_fp_fb1_content[$language_id])) echo $t1o_fp_fb1_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
          
                                
							</div>
						</div>
                        
                        <legend>Feature Box 2</legend>
                        
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>64 x 64px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_fp_fb2_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_fp_fb2_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_fp_fb2_icon" value="<?php echo $t1o_fp_fb2_icon; ?>" id="t1o_fp_fb2_icon" />
					        </div>
				        </div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_fp_fb2_awesome" value="<?php echo $t1o_fp_fb2_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icon background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_fp_fb2_color" id="t1o_fp_fb2_color" value="<?php echo $t1o_fp_fb2_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_fp_fb2_title[<?php echo $language_id; ?>]" id="t1o_fp_fb2_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb2_title[$language_id])) echo $t1o_fp_fb2_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_fp_fb2_subtitle[<?php echo $language_id; ?>]" id="t1o_fp_fb2_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb2_subtitle[$language_id])) echo $t1o_fp_fb2_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_fp_fb2_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_fp_fb2_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_fp_fb2_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_fp_fb2_content[<?php echo $language_id; ?>]" id="t1o_fp_fb2_content-<?php echo $language_id; ?>"><?php if(isset($t1o_fp_fb2_content[$language_id])) echo $t1o_fp_fb2_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
          
                                
							</div>
						</div>
                        
                        <legend>Feature Box 3</legend>
                        
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>64 x 64px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_fp_fb3_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_fp_fb3_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_fp_fb3_icon" value="<?php echo $t1o_fp_fb3_icon; ?>" id="t1o_fp_fb3_icon" />
					        </div>
				        </div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_fp_fb3_awesome" value="<?php echo $t1o_fp_fb3_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icon background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_fp_fb3_color" id="t1o_fp_fb3_color" value="<?php echo $t1o_fp_fb3_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_fp_fb3_title[<?php echo $language_id; ?>]" id="t1o_fp_fb3_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb3_title[$language_id])) echo $t1o_fp_fb3_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="t1o_fp_fb3_subtitle[<?php echo $language_id; ?>]" id="t1o_fp_fb3_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb3_subtitle[$language_id])) echo $t1o_fp_fb3_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_fp_fb3_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_fp_fb3_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_fp_fb3_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_fp_fb3_content[<?php echo $language_id; ?>]" id="t1o_fp_fb3_content-<?php echo $language_id; ?>"><?php if(isset($t1o_fp_fb3_content[$language_id])) echo $t1o_fp_fb3_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
          
                                
							</div>
						</div>
                        
                        <legend>Feature Box 4</legend>
                        
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Custom Icon:<br /><span class="k_help">Recommended dimensions<br>64 x 64px</span></label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1o_fp_fb4_icon_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_fp_fb4_icon_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_fp_fb4_icon" value="<?php echo $t1o_fp_fb4_icon; ?>" id="t1o_fp_fb4_icon" />
					        </div>
				        </div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Font Awesome Icon:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1o_fp_fb4_awesome" value="<?php echo $t1o_fp_fb4_awesome; ?>" class="form-control" />
                                <span class="k_help">Enter the name of an icon, for example: <b>car</b></span><br />
                                <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank" class="link" style="margin-left:5px">Font Awesome Icon Collection &raquo;</a>
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icon background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_fp_fb4_color" id="t1o_fp_fb4_color" value="<?php echo $t1o_fp_fb4_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">    
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_fp_fb4_title[<?php echo $language_id; ?>]" id="t1o_fp_fb4_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb4_title[$language_id])) echo $t1o_fp_fb4_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitle:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="t1o_fp_fb4_subtitle[<?php echo $language_id; ?>]" id="t1o_fp_fb4_subtitle_<?php echo $language_id; ?>" value="<?php if(isset($t1o_fp_fb4_subtitle[$language_id])) echo $t1o_fp_fb4_subtitle[$language_id]; ?>" placeholder="Subtitle" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_fp_fb4_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_fp_fb4_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_fp_fb4_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_fp_fb4_content[<?php echo $language_id; ?>]" id="t1o_fp_fb4_content-<?php echo $language_id; ?>"><?php if(isset($t1o_fp_fb4_content[$language_id])) echo $t1o_fp_fb4_content[$language_id]; ?></textarea>
										</div>				
									<?php } ?>
								</div>
                                
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-information" class="tab-pane">  
        
                    <fieldset>

						<legend>Information Column<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_38.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Information Column:</label>
							<div class="col-sm-10">
								<select name="t1o_information_column_1_status" id="t1o_information_column_1_status" class="form-control">
								    <option value="1"<?php if($t1o_information_column_1_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_information_column_1_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Site Map link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_1_1_status" id="t1o_i_c_1_1_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_1_1_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_1_1_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
                        <span class="k_help">To disable the default OpenCart links, like <b>About Us</b>, <b>Delivery Information</b> or <b>Privacy Policy</b>, go to OpenCart Admin > Catalog > Information.</span>
                        </div>
                        
                        <legend>Customer Service Column<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_39.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Customer Service Column:</label>
							<div class="col-sm-10">
								<select name="t1o_information_column_2_status" id="t1o_information_column_2_status" class="form-control">
								    <option value="1"<?php if($t1o_information_column_2_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_information_column_2_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Contact Us link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_2_1_status" id="t1o_i_c_2_1_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_2_1_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_2_1_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">My Account link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_2_2_status" id="t1o_i_c_2_2_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_2_2_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_2_2_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Returns link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_2_3_status" id="t1o_i_c_2_3_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_2_3_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_2_3_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Order History link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_2_4_status" id="t1o_i_c_2_4_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_2_4_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_2_4_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Wish List link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_2_5_status" id="t1o_i_c_2_5_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_2_5_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_2_5_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        
                        <legend>Extras Column<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_40.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Extras Column:</label>
							<div class="col-sm-10">
								<select name="t1o_information_column_3_status" id="t1o_information_column_3_status" class="form-control">
								    <option value="1"<?php if($t1o_information_column_3_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_information_column_3_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Brands link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_3_1_status" id="t1o_i_c_3_1_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_3_1_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_3_1_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Gift Vouchers link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_3_2_status" id="t1o_i_c_3_2_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_3_2_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_3_2_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Affiliates link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_3_3_status" id="t1o_i_c_3_3_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_3_3_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_3_3_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Specials link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_3_4_status" id="t1o_i_c_3_4_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_3_4_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_3_4_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Newsletter link:</label>
							<div class="col-sm-10">
								<select name="t1o_i_c_3_5_status" id="t1o_i_c_3_5_status" class="form-control">
								    <option value="1"<?php if($t1o_i_c_3_5_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_i_c_3_5_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-custom-column" class="tab-pane">  
        
                    <fieldset>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Column:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_41.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_custom_1_status" id="t1o_custom_1_status" class="form-control">
								    <option value="1"<?php if($t1o_custom_1_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_custom_1_status == '0') echo ' selected="selected"';?><?php if($t1o_custom_1_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_custom_1_title[<?php echo $language_id; ?>]" id="t1o_custom_1_title_<?php echo $language_id; ?>" value="<?php if(isset($t1o_custom_1_title[$language_id])) echo $t1o_custom_1_title[$language_id]; ?>" placeholder="Title" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_custom_1_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_custom_1_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_custom_1_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_custom_1_content[<?php echo $language_id; ?>]" id="t1o_custom_1_content-<?php echo $language_id; ?>"><?php if(isset($t1o_custom_1_content[$language_id])) echo $t1o_custom_1_content[$language_id]; ?></textarea>
										</div>			
									<?php } ?>
								</div>
                                
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-powered" class="tab-pane">  
        
                    <fieldset>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show powered by:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_42.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_powered_status" id="t1o_powered_status" class="form-control">
								    <option value="1"<?php if($t1o_powered_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_powered_status == '0') echo ' selected="selected"';?><?php if($t1o_powered_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_powered_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_powered_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_powered_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_powered_content[<?php echo $language_id; ?>]" id="t1o_powered_content-<?php echo $language_id; ?>"><?php if(isset($t1o_powered_content[$language_id])) echo $t1o_powered_content[$language_id]; ?></textarea>
										</div>		
									<?php } ?>
								</div>
                                
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-news" class="tab-pane">  
        
                    <fieldset>

						<legend>News <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_43.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show News Block:</label>
							<div class="col-sm-10">
								<select name="t1o_news_status" id="t1o_news_status" class="form-control">
									<option value="1"<?php if($t1o_news_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_news_status == '0') echo ' selected="selected"';?><?php if($t1o_news_status == '') echo ' selected="selected"';?>>No</option>    
								</select>
							</div>
						</div>
                        
                        <div class="table-responsive">
                        
							<table class="table table-hover">
								<thead>
									<tr>
                                    <th class="left" width="10%">News</th>
									<th class="left" width="10%">Show</th>
									<th class="left" width="40%">Title</th>
									<th class="left" width="40%">URL</th>
									</tr>
								</thead>
                                <tbody>
									<?php for ($i = 1; $i <= 10; $i++) { ?>
                                    <tr>
									<td>News <?php echo $i; ?>:</td>
									<td>
                                    <select name="t1o_news[<?php echo $i; ?>][status]" class="form-control">
									    <option value="0"<?php if($t1o_news[$i]['status'] == '0') echo ' selected="selected"';?>>No</option> 
                                        <option value="1"<?php if($t1o_news[$i]['status'] == '1') echo ' selected="selected"';?>>Yes</option>      
							    	</select>
                                    </td>
                                    <td>
                                    <?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_news[<?php echo $i; ?>][<?php echo $language_id; ?>][title]" id="t1o_news_<?php echo $i; ?>_<?php echo $language_id; ?>_title" value="<?php if(isset($t1o_news[$i][$language_id]['title'])) echo $t1o_news[$i][$language_id]['title']; ?>" placeholder="Title" class="form-control" /> 
										</div>
									<?php } ?>
                                    </td>
                                    <td>
                                    <input type="text" name="t1o_news[<?php echo $i; ?>][url]" value="<?php echo $t1o_news[$i]['url']; ?>" class="form-control" />
                                    </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
							</table>
                        
                        </div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-follow" class="tab-pane">  
        
                    <fieldset>

						<legend>Follow Us</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Follow Us Block: <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_44.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_follow_us_status" id="t1o_follow_us_status" class="form-control">
								    <option value="1"<?php if($t1o_follow_us_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_follow_us_status == '0') echo ' selected="selected"';?><?php if($t1o_follow_us_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Facebook:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_facebook" value="<?php echo $t1o_facebook; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Twitter:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_twitter" value="<?php echo $t1o_twitter; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Google+:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_googleplus" value="<?php echo $t1o_googleplus; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">RSS:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_rss" value="<?php echo $t1o_rss; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Pinterest:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_pinterest" value="<?php echo $t1o_pinterest; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Vimeo:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_vimeo" value="<?php echo $t1o_vimeo; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Flickr:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_flickr" value="<?php echo $t1o_flickr; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">LinkedIn:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_linkedin" value="<?php echo $t1o_linkedin; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">YouTube:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_youtube" value="<?php echo $t1o_youtube; ?>" class="form-control" />

							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Dribbble:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_dribbble" value="<?php echo $t1o_dribbble; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Instagram:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_instagram" value="<?php echo $t1o_instagram; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Behance:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_behance" value="<?php echo $t1o_behance; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Skype username:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_skype" value="<?php echo $t1o_skype; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Tumblr:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_tumblr" value="<?php echo $t1o_tumblr; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Reddit:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_reddit" value="<?php echo $t1o_reddit; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">VK:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_vk" value="<?php echo $t1o_vk; ?>" class="form-control" />
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-payment" class="tab-pane">  
        
                    <fieldset>

						<legend class="bn"></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Show payment images:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_45.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_payment_block_status" id="t1o_payment_block_status" class="form-control">
								    <option value="1"<?php if($t1o_payment_block_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_payment_block_status == '0') echo ' selected="selected"';?><?php if($t1o_payment_block_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        
                        <legend>Custom payment image</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show:</label>
							<div class="col-sm-10">
								<select name="t1o_payment_block_custom_status" class="form-control">
								    <option value="0"<?php if($t1o_payment_block_custom_status == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_block_custom_status == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Upload your payment image:<br /><span class="k_help">Recommended dimensions<br>80 x 80px</span></label>
							<div class="col-sm-10">
								<a href="" id="t1o_payment_block_custom_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1o_payment_block_custom_thumb; ?>" /></a>
                                <input type="hidden" name="t1o_payment_block_custom" value="<?php echo $t1o_payment_block_custom; ?>" id="t1o_payment_block_custom" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">url:</label>
							<div class="col-sm-10">
                                <input type="text" name="t1o_payment_block_custom_url" value="<?php echo $t1o_payment_block_custom_url; ?>" class="form-control" />
							</div>
						</div>  
                        
                        <legend>UP Theme payment images:</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">PayPal:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_paypal" class="form-control">
								    <option value="0"<?php if($t1o_payment_paypal == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_paypal == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_paypal.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_paypal_url" value="<?php echo $t1o_payment_paypal_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Visa:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_visa" class="form-control">
								    <option value="0"<?php if($t1o_payment_visa == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_visa == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_visa.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_visa_url" value="<?php echo $t1o_payment_visa_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">MasterCard:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_mastercard" class="form-control">
								    <option value="0"<?php if($t1o_payment_mastercard == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_mastercard == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_mastercard.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_mastercard_url" value="<?php echo $t1o_payment_mastercard_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Maestro:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_maestro" class="form-control">
								    <option value="0"<?php if($t1o_payment_maestro == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_maestro == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_maestro.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_maestro_url" value="<?php echo $t1o_payment_maestro_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Discover:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_discover" class="form-control">
								    <option value="0"<?php if($t1o_payment_discover == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_discover == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_discover.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_discover_url" value="<?php echo $t1o_payment_discover_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Skrill:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_skrill" class="form-control">
								    <option value="0"<?php if($t1o_payment_skrill == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_skrill == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_skrill.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_skrill_url" value="<?php echo $t1o_payment_skrill_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">American Express:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_american_express" class="form-control">
								    <option value="0"<?php if($t1o_payment_american_express == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_american_express == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_american_express.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_american_express_url" value="<?php echo $t1o_payment_american_express_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Cirrus:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_cirrus" class="form-control">
								    <option value="0"<?php if($t1o_payment_cirrus == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_cirrus == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_cirrus.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_cirrus_url" value="<?php echo $t1o_payment_cirrus_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Delta:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_delta" class="form-control">
								    <option value="0"<?php if($t1o_payment_delta == '0') echo ' selected="selected"';?>>No</option> 

                                    <option value="1"<?php if($t1o_payment_delta == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_delta.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_delta_url" value="<?php echo $t1o_payment_delta_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Google:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_google" class="form-control">
								    <option value="0"<?php if($t1o_payment_google == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_google == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_google.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_google_url" value="<?php echo $t1o_payment_google_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">2CheckOut:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_2co" class="form-control">
								    <option value="0"<?php if($t1o_payment_2co == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_2co == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_2co.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_2co_url" value="<?php echo $t1o_payment_2co_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Sage:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_sage" class="form-control">
								    <option value="0"<?php if($t1o_payment_sage == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_sage == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_sage.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_sage_url" value="<?php echo $t1o_payment_sage_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Solo:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_solo" class="form-control">
								    <option value="0"<?php if($t1o_payment_solo == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_solo == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_solo.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_solo_url" value="<?php echo $t1o_payment_solo_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Amazon Payments:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_amazon" class="form-control">
								    <option value="0"<?php if($t1o_payment_amazon == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_amazon == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_amazon.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_amazon_url" value="<?php echo $t1o_payment_amazon_url; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Western Union:</label>
							<div class="col-sm-2">
								<select name="t1o_payment_western_union" class="form-control">
								    <option value="0"<?php if($t1o_payment_western_union == '0') echo ' selected="selected"';?>>No</option> 
                                    <option value="1"<?php if($t1o_payment_western_union == '1') echo ' selected="selected"';?>>Yes</option>      
							    </select>
							</div>
                            <div class="col-sm-1"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/payment/payment_image_western_union.png"></div>
                            <div class="col-sm-1 control-label">url:</div>
                            <div class="col-sm-6">
								<input type="text" name="t1o_payment_western_union_url" value="<?php echo $t1o_payment_western_union_url; ?>" class="form-control" />
							</div>
						</div>

					</fieldset>        
        
        </div>
        
        <div id="tab-footer-bottom-custom" class="tab-pane">
        
                    <fieldset>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Bottom Custom Block:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/go_46.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1o_custom_2_status" id="t1o_custom_2_status" class="form-control">
								    <option value="1"<?php if($t1o_custom_2_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_custom_2_status == '0') echo ' selected="selected"';?><?php if($t1o_custom_2_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_custom_2_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_custom_2_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_custom_2_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_custom_2_content[<?php echo $language_id; ?>]" id="t1o_custom_2_content-<?php echo $language_id; ?>"><?php if(isset($t1o_custom_2_content[$language_id])) echo $t1o_custom_2_content[$language_id]; ?></textarea>
										</div>			
									<?php } ?>
								</div>
                                
							</div>
						</div>
                    
                    </fieldset>        
        
        </div>
 
     
        </div>
        </div>
        
        </div>
        </div>
        
        
        
        
        <div class="tab-pane" id="tab-widgets"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-2">    
        <ul id="widgets_tabs" class="nav nav-pills nav-stacked">
             <li class="active"><a href="#tab-widgets-facebook" data-toggle="tab">Facebook Widget</a></li>
             <li><a href="#tab-widgets-twitter" data-toggle="tab">Twitter Widget</a></li>
             <li><a href="#tab-widgets-video-box" data-toggle="tab">Video Box</a></li>
             <li><a href="#tab-widgets-custom-box" data-toggle="tab">Custom Content Box</a></li>
             <li><a href="#tab-widgets-cookie" data-toggle="tab">EU Cookie Message Widget</a></li>
        </ul> 
        </div>
        
        <div class="col-sm-10">
        <div class="tab-content">
        
        <div id="tab-widgets-facebook" class="tab-pane fade in active">
        
                    <fieldset>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Facebook Box:</label>
							<div class="col-sm-10">
								<select name="t1o_facebook_likebox_status" id="t1o_facebook_likebox_status" class="form-control">
								    <option value="1"<?php if($t1o_facebook_likebox_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_facebook_likebox_status == '0') echo ' selected="selected"';?><?php if($t1o_facebook_likebox_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Facebook FanPage ID:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_facebook_likebox_id" value="<?php echo $t1o_facebook_likebox_id; ?>" class="form-control" />
                                <a href="http://findmyfacebookid.com/" target="_blank" class="link">Find your Facebook ID &raquo;</a>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1o_facebook_likebox_position" id="t1o_facebook_likebox_position" class="form-control">
								    <option value="right"<?php if($t1o_facebook_likebox_position == 'right') echo ' selected="selected"';?>>Right</option>
                                    <option value="left"<?php if($t1o_facebook_likebox_position == 'left') echo ' selected="selected"';?>>Left</option> 
							    </select>
							</div>
						</div>

                    </fieldset>          

        </div>
 
        <div id="tab-widgets-twitter" class="tab-pane"> 
        
                    <fieldset>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Twitter Box:</label>
							<div class="col-sm-10">
								<select name="t1o_twitter_block_status" id="t1o_twitter_block_status" class="form-control">
								    <option value="1"<?php if($t1o_twitter_block_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_twitter_block_status == '0') echo ' selected="selected"';?><?php if($t1o_twitter_block_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Twitter username:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_twitter_block_user" value="<?php echo $t1o_twitter_block_user; ?>" class="form-control" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Widget ID:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_twitter_block_widget_id" value="<?php echo $t1o_twitter_block_widget_id; ?>" class="form-control" />
                                <a href="http://321cart.com/oxy/documentation/assets/images/screen_14.png" target="_blank" class="link">Find your Widget ID &raquo;</a>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Tweet limit:</label>
							<div class="col-sm-10">
								<select name="t1o_twitter_block_tweets" id="t1o_twitter_block_tweets" class="form-control">
								    <option value="1"<?php if($t1o_twitter_block_tweets == '1') echo ' selected="selected"';?>>1</option>
                                    <option value="2"<?php if($t1o_twitter_block_tweets == '2') echo ' selected="selected"';?>>2</option>
                                    <option value="3"<?php if($t1o_twitter_block_tweets == '3') echo ' selected="selected"';?><?php if($t1o_twitter_block_tweets == '') echo ' selected="selected"';?>>3</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1o_twitter_block_position" id="t1o_twitter_block_position" class="form-control">
								    <option value="right"<?php if($t1o_twitter_block_position == 'right') echo ' selected="selected"';?>>Right</option>
                                    <option value="left"<?php if($t1o_twitter_block_position == 'left') echo ' selected="selected"';?>>Left</option>  
							    </select>
							</div>
						</div>

                    </fieldset>         

        </div>
  
        <div id="tab-widgets-video-box" class="tab-pane">
        
                    <fieldset>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Video Box:</label>
							<div class="col-sm-10">
								<select name="t1o_video_box_status" id="t1o_video_box_status" class="form-control">
								    <option value="1"<?php if($t1o_video_box_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_video_box_status == '0') echo ' selected="selected"';?><?php if($t1o_video_box_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_video_box_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_video_box_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_video_box_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_video_box_content[<?php echo $language_id; ?>]" id="t1o_video_box_content-<?php echo $language_id; ?>"><?php if(isset($t1o_video_box_content[$language_id])) echo $t1o_video_box_content[$language_id]; ?></textarea>
										</div>
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1o_video_box_position" id="t1o_video_box_position" class="form-control">
								    <option value="right"<?php if($t1o_video_box_position == 'right') echo ' selected="selected"';?>>Right</option>
                                    <option value="left"<?php if($t1o_video_box_position == 'left') echo ' selected="selected"';?>>Left</option>  
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_video_box_bg" id="t1o_video_box_bg" value="<?php echo $t1o_video_box_bg; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>

                    </fieldset>          

        </div>
        
        <div id="tab-widgets-custom-box" class="tab-pane"> 
        
                    <fieldset>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Show Custom Content Box:</label>
							<div class="col-sm-10">
								<select name="t1o_custom_box_status" id="t1o_custom_box_status" class="form-control">
								    <option value="1"<?php if($t1o_custom_box_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_custom_box_status == '0') echo ' selected="selected"';?><?php if($t1o_custom_box_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Content:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_custom_box_content" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_custom_box_content_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_custom_box_content_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_custom_box_content[<?php echo $language_id; ?>]" id="t1o_custom_box_content-<?php echo $language_id; ?>"><?php if(isset($t1o_custom_box_content[$language_id])) echo $t1o_custom_box_content[$language_id]; ?></textarea>
										</div>			
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1o_custom_box_position" id="t1o_custom_box_position" class="form-control">
								    <option value="right"<?php if($t1o_custom_box_position == 'right') echo ' selected="selected"';?>>Right</option>
                                    <option value="left"<?php if($t1o_custom_box_position == 'left') echo ' selected="selected"';?>>Left</option>  
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1o_custom_box_bg" id="t1o_custom_box_bg" value="<?php echo $t1o_custom_box_bg; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>

                    </fieldset>              

        </div>
        
        
        <div id="tab-widgets-cookie" class="tab-pane">  
        
                    <fieldset>

						<div class="form-group">
							<label class="col-sm-2 control-label">Show EU Cookie Message Widget:</label>
							<div class="col-sm-10">
								<select name="t1o_eu_cookie_status" id="t1o_eu_cookie_status" class="form-control">
								    <option value="1"<?php if($t1o_eu_cookie_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1o_eu_cookie_status == '0') echo ' selected="selected"';?><?php if($t1o_eu_cookie_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">EU Cookie Message:</label>
							<div class="col-sm-10">
								
                                <ul id="t1o_eu_cookie_message" class="nav nav-tabs">
									<?php foreach ($languages as $language) { ?>
										<li><a href="#t1o_eu_cookie_message_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="../image/flags/<?php echo $language['image'] ?>" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
								</ul>

								<div class="tab-content">					
									<?php foreach ($languages as $language) { ?>
										<?php $language_id = $language['language_id']; ?>				
										<div id="t1o_eu_cookie_message_<?php echo $language_id; ?>" class="tab-pane">
											<textarea name="t1o_eu_cookie_message[<?php echo $language_id; ?>]" id="t1o_eu_cookie_message-<?php echo $language_id; ?>"><?php if(isset($t1o_eu_cookie_message[$language_id])) echo $t1o_eu_cookie_message[$language_id]; ?></textarea>
										</div>			
									<?php } ?>
								</div>
                                
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">"Close" text:</label>
							<div class="col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<?php $language_id = $language['language_id']; ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="t1o_eu_cookie_close[<?php echo $language_id; ?>]" id="t1o_eu_cookie_close_<?php echo $language_id; ?>" value="<?php if(isset($t1o_eu_cookie_close[$language_id])) echo $t1o_eu_cookie_close[$language_id]; ?>" placeholder="Close" class="form-control" />
										</div>
								<?php } ?>
							</div>
						</div>

					</fieldset>        
        
        </div>
 
     
        </div>
        </div>
        
        </div>
        </div>
       

 
 
        
        
        <div class="tab-pane" id="tab-css"> 
        <div class="row form-horizontal">  

        
        <div class="col-sm-12">
        <div class="tab-content">
        
                    <fieldset>         
        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Custom CSS:</label>
							<div class="col-sm-10">
                                <textarea name="t1o_custom_css" rows="10" class="form-control" /><?php echo $t1o_custom_css; ?></textarea>
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Custom JavaScript:</label>
							<div class="col-sm-10">
                                <textarea name="t1o_custom_js" rows="10" class="form-control" /><?php echo $t1o_custom_js; ?></textarea>
							</div>
						</div> 
 
                    </fieldset>                          
     
        </div>
        </div>
        
        </div>
        </div> 


        <!-- -->         
        </div>  
        
        
    </form>
    </div>
  </div>
</div>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script>
<script type="text/javascript" src="view/javascript/poshytip/jquery.poshytip.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/poshytip/tip-twitter/tip-twitter.css" />

<script type="text/javascript"><!--					
<?php foreach ($languages as $language) { ?>
$('#t1o_top_custom_block_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_custom_bar_below_menu_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_menu_categories_custom_block_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_menu_custom_block_1_<?php echo $language['language_id']; ?>_content').summernote({height: 300});
$('#t1o_menu_custom_block_2_<?php echo $language['language_id']; ?>_content').summernote({height: 300});
$('#t1o_menu_custom_block_3_<?php echo $language['language_id']; ?>_content').summernote({height: 300});
$('#t1o_product_fb1_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_product_fb2_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_product_fb3_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_product_custom_block_1_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_product_custom_block_2_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_product_custom_block_3_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_product_custom_tab_1_<?php echo $language['language_id']; ?>_content').summernote({height: 300});
$('#t1o_product_custom_tab_2_<?php echo $language['language_id']; ?>_content').summernote({height: 300});
$('#t1o_product_custom_tab_3_<?php echo $language['language_id']; ?>_content').summernote({height: 300});
$('#t1o_contact_custom_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_fp_fb1_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_fp_fb2_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_fp_fb3_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_fp_fb4_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_custom_1_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_custom_2_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_powered_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_video_box_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_custom_box_content-<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#t1o_eu_cookie_message-<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
$('#t1o_top_custom_block_content li:first-child a').tab('show');
$('#t1o_custom_bar_below_menu_content li:first-child a').tab('show');
$('#t1o_menu_categories_custom_block_content li:first-child a').tab('show');
$('#t1o_menu_custom_block_1 li:first-child a').tab('show');
$('#t1o_menu_custom_block_2 li:first-child a').tab('show');
$('#t1o_menu_custom_block_3 li:first-child a').tab('show');
$('#t1o_product_fb1_content li:first-child a').tab('show');
$('#t1o_product_fb2_content li:first-child a').tab('show');
$('#t1o_product_fb3_content li:first-child a').tab('show');
$('#t1o_product_custom_block_1_content li:first-child a').tab('show');
$('#t1o_product_custom_block_2_content li:first-child a').tab('show');
$('#t1o_product_custom_block_3_content li:first-child a').tab('show');
$('#t1o_product_custom_tab_1 li:first-child a').tab('show');
$('#t1o_product_custom_tab_2 li:first-child a').tab('show');
$('#t1o_product_custom_tab_3 li:first-child a').tab('show');
$('#t1o_contact_custom_content li:first-child a').tab('show');
$('#t1o_fp_fb1_content li:first-child a').tab('show');
$('#t1o_fp_fb2_content li:first-child a').tab('show');
$('#t1o_fp_fb3_content li:first-child a').tab('show');
$('#t1o_fp_fb4_content li:first-child a').tab('show');
$('#t1o_custom_1_content li:first-child a').tab('show');
$('#t1o_custom_2_content li:first-child a').tab('show');
$('#t1o_powered_content li:first-child a').tab('show');
$('#t1o_video_box_content li:first-child a').tab('show');
$('#t1o_custom_box_content li:first-child a').tab('show');
$('#t1o_eu_cookie_message li:first-child a').tab('show');
//--></script>
</div>

<?php echo $footer; ?>
