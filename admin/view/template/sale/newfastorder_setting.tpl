<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
 <div class="page-header">
    <div class="container-fluid">
       <div class="pull-right">
      <div class="buttons">
		  <a class="btn btn-primary" onclick="$('#form').submit();" class="button"><span  data-toggle="tooltip" title="<?php echo $button_save; ?>" ><i class="fa fa-save"></i></span></a>
		  <a class="btn btn-default" onclick="location = '<?php echo $cancel; ?>';" class="button"><span  data-toggle="tooltip" title="<?php echo $button_cancel; ?>" ><i class="fa fa-reply"></i></span></a>
	  </div>
    </div>
      <h1><?php echo $heading_title_setting; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_setting_module; ?></h3>
		</div>
	</div>
	<div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
			
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-fields-setting" data-toggle="tab"><?php echo $tab_fields_setting; ?></a></li>
				<li><a href="#tab-general-setting" data-toggle="tab"><?php echo $tab_general_setting; ?></a></li>
				<li><a href="#tab-design-setting" data-toggle="tab"><?php echo $tab_design_setting; ?></a></li>
				<li><a href="#tab-sms-setting" data-toggle="tab"><?php echo $tab_sms_setting; ?></a></li>
				<li><a href="#tab-email-setting" data-toggle="tab"><?php echo $tab_email_setting; ?></a></li>
			</ul>	
			 <div class="tab-content">
				
				<div class="tab-pane active" id="tab-fields-setting">
				<?php 
					if(!isset($config_on_off_fields_firstname)) $config_on_off_fields_firstname = '1';
					if(!isset($config_fields_firstname_requared)) $config_fields_firstname_requared = '1';
					if(!isset($config_on_off_fields_phone)) $config_on_off_fields_phone = '1';
					if(!isset($config_fields_phone_requared)) $config_fields_phone_requared = '1';		
				?>	
					<!--ПОЛЕ FIRST-->
						<div class="form-group">					
							<div class="col-sm-2 title-fields"><?php echo $text_on_off_fields_firstname;?></div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_status_fields;?></label>
							<div class="col-sm-10">
								<div class="onoffswitch">
									<input value="1" type="checkbox" name="config_on_off_fields_firstname" class="onoffswitch-checkbox" id="config_on_off_fields_firstname" <?php echo $config_on_off_fields_firstname == '1' ? 'checked' : '' ; ?>>
									<label class="onoffswitch-label" for="config_on_off_fields_firstname">
										<span class="onoffswitch-inner"></span>
										<span class="onoffswitch-switch"></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_requared_fields;?></label>
							<div class="col-sm-10">
								<div class="onoffswitch">
									<input value="1" type="checkbox" name="config_fields_firstname_requared" class="onoffswitch-checkbox" id="config_fields_firstname_requared" <?php echo $config_fields_firstname_requared == '1' ? 'checked' : '' ; ?>>
									<label class="onoffswitch-label" for="config_fields_firstname_requared">
										<span class="onoffswitch-inner"></span>
										<span class="onoffswitch-switch"></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_placeholder_fields; ?></label>
							<div class="col-sm-3">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input name="config_placeholder_fields_firstname[<?php echo $language['language_id']; ?>][config_placeholder_fields_firstname]" rows="5" class="form-control" value="<?php echo isset($config_placeholder_fields_firstname[$language['language_id']]) ? $config_placeholder_fields_firstname[$language['language_id']]['config_placeholder_fields_firstname'] : ''; ?>"></input>
									</div>
								<?php } ?>
							</div>
						</div>
					<div class="clearfix"></div>
					<!--ПОЛЕ PHONE-->
					<div class="form-group">					
						<div class="col-sm-2 title-fields"><?php echo $text_on_off_fields_phone;?></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_status_fields;?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
								<input value="1" type="checkbox" name="config_on_off_fields_phone" class="onoffswitch-checkbox" id="config_on_off_fields_phone" <?php echo $config_on_off_fields_phone == '1' ? 'checked' : '' ; ?>>
								<label class="onoffswitch-label" for="config_on_off_fields_phone">
									<span class="onoffswitch-inner"></span>
									<span class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_requared_fields;?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
							<input value="1" type="checkbox" name="config_fields_phone_requared" class="onoffswitch-checkbox" id="config_fields_phone_requared" <?php echo $config_fields_phone_requared == '1' ? 'checked' : '' ; ?>>
							<label class="onoffswitch-label" for="config_fields_phone_requared">
								<span class="onoffswitch-inner"></span>
								<span class="onoffswitch-switch"></span>
							</label>
							</div>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_placeholder_fields; ?></label>
							<div class="col-sm-3">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input name="config_placeholder_fields_phone[<?php echo $language['language_id']; ?>][config_placeholder_fields_phone]" rows="5" class="form-control" value="<?php echo isset($config_placeholder_fields_phone[$language['language_id']]) ? $config_placeholder_fields_phone[$language['language_id']]['config_placeholder_fields_phone'] : ''; ?>"></input>
									</div>
								<?php } ?>
							</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_mask_phone_number?></label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="config_mask_phone_number" value="<?php echo $config_mask_phone_number; ?>" />
						</div>
					</div>
					
					<!--ПОЛЕ COMMENT-->
					<div class="form-group">					
						<div class="col-sm-2 title-fields"><?php echo $text_on_off_fields_comment;?></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_status_fields;?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
							<input value="1" type="checkbox" name="config_on_off_fields_comment" class="onoffswitch-checkbox" id="config_on_off_fields_comment" <?php echo $config_on_off_fields_comment == '1' ? 'checked' : '' ; ?>>
							<label class="onoffswitch-label" for="config_on_off_fields_comment">
								<span class="onoffswitch-inner"></span>
								<span class="onoffswitch-switch"></span>
							</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_requared_fields;?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
							<input value="1" type="checkbox" name="config_fields_comment_requared" class="onoffswitch-checkbox" id="config_fields_comment_requared" <?php echo $config_fields_comment_requared == '1' ? 'checked' : '' ; ?>>
							<label class="onoffswitch-label" for="config_fields_comment_requared">
								<span class="onoffswitch-inner"></span>
								<span class="onoffswitch-switch"></span>
							</label>
							</div>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_placeholder_fields; ?></label>
							<div class="col-sm-3">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input name="config_placeholder_fields_comment[<?php echo $language['language_id']; ?>][config_placeholder_fields_comment]" rows="5" class="form-control" value="<?php echo isset($config_placeholder_fields_comment[$language['language_id']]) ? $config_placeholder_fields_comment[$language['language_id']]['config_placeholder_fields_comment'] : ''; ?>"></input>
									</div>
								<?php } ?>
							</div>
					</div>
					<div class="clearfix"></div>	
					<!--ПОЛЕ EMAIL-->
					<div class="form-group">					
						<div class="col-sm-2 title-fields"><?php echo $text_on_off_fields_email;?></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_status_fields;?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
							<input value="1" type="checkbox" name="config_on_off_fields_email" class="onoffswitch-checkbox" id="config_on_off_fields_email" <?php echo $config_on_off_fields_email == '1' ? 'checked' : '' ; ?>>
							<label class="onoffswitch-label" for="config_on_off_fields_email">
								<span class="onoffswitch-inner"></span>
								<span class="onoffswitch-switch"></span>
							</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_requared_fields;?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
							<input value="1" type="checkbox" name="config_fields_email_requared" class="onoffswitch-checkbox" id="config_fields_email_requared" <?php echo $config_fields_email_requared == '1' ? 'checked' : '' ; ?>>
							<label class="onoffswitch-label" for="config_fields_email_requared">
								<span class="onoffswitch-inner"></span>
								<span class="onoffswitch-switch"></span>
							</label>
							</div>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_placeholder_fields; ?></label>
							<div class="col-sm-3">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
										<input name="config_placeholder_fields_email[<?php echo $language['language_id']; ?>][config_placeholder_fields_email]" rows="5" class="form-control" value="<?php echo isset($config_placeholder_fields_email[$language['language_id']]) ? $config_placeholder_fields_email[$language['language_id']]['config_placeholder_fields_email'] : ''; ?>"></input>
									</div>
								<?php } ?>
							</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-general-setting">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_title_popup_quickorder; ?></label>
						<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<input name="config_title_popup_quickorder[<?php echo $language['language_id']; ?>][config_title_popup_quickorder]" rows="5" class="form-control" value="<?php echo isset($config_title_popup_quickorder[$language['language_id']]) ? $config_title_popup_quickorder[$language['language_id']]['config_title_popup_quickorder'] : ''; ?>"></input>
								</div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12"><?php echo $entry_instruction_icon_change_fastorder?></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_icon_send_fastorder?></label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="config_icon_send_fastorder" value="<?php echo $config_icon_send_fastorder ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_background_button_send_fastorder?></label>
						<div class="col-sm-3">
							<input class="form-control jpicker-csseditor-fastorder_20" type="text" name="config_background_button_send_fastorder" value="<?php echo $config_background_button_send_fastorder ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_background_button_send_fastorder_hover?></label>
						<div class="col-sm-3">
							<input class="form-control jpicker-csseditor-fastorder_20" type="text" name="config_background_button_send_fastorder_hover" value="<?php echo $config_background_button_send_fastorder_hover ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_background_button_open_form_send_order?></label>
						<div class="col-sm-3">
							<input class="form-control jpicker-csseditor-fastorder_20" type="text" name="config_background_button_open_form_send_order" value="<?php echo $config_background_button_open_form_send_order ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_background_button_open_form_send_order_hover?></label>
						<div class="col-sm-3">
							<input class="form-control jpicker-csseditor-fastorder_20" type="text" name="config_background_button_open_form_send_order_hover" value="<?php echo $config_background_button_open_form_send_order_hover ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_icon_open_form_send_order?></label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="config_icon_open_form_send_order" value="<?php echo $config_icon_open_form_send_order ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_color_button_open_form_send_order?></label>
						<div class="col-sm-3">
							<input class="form-control jpicker-csseditor-fastorder_20" type="text" name="config_color_button_open_form_send_order" value="<?php echo $config_color_button_open_form_send_order ?>"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_text_open_form_send_order; ?></label>
						<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<input name="config_text_open_form_send_order[<?php echo $language['language_id']; ?>][config_text_open_form_send_order]" rows="5" class="form-control" value="<?php echo isset($config_text_open_form_send_order[$language['language_id']]) ? $config_text_open_form_send_order[$language['language_id']]['config_text_open_form_send_order'] : ''; ?>"></input>
								</div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_before_button_send; ?></label>
						<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<textarea name="config_text_before_button_send[<?php echo $language['language_id']; ?>][config_text_before_button_send]" rows="5" class="form-control"><?php echo isset($config_text_before_button_send[$language['language_id']]) ? $config_text_before_button_send[$language['language_id']]['config_text_before_button_send'] : ''; ?></textarea>
								</div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_any_text_at_the_bottom; ?></label>
						<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<textarea name="config_any_text_at_the_bottom[<?php echo $language['language_id']; ?>][config_any_text_at_the_bottom]" rows="5" class="form-control"><?php echo isset($config_any_text_at_the_bottom[$language['language_id']]) ? $config_any_text_at_the_bottom[$language['language_id']]['config_any_text_at_the_bottom'] : ''; ?></textarea>
								</div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_any_text_at_the_bottom_color?></label>
						<div class="col-sm-3">
							<input class="form-control jpicker-csseditor-fastorder_20" type="text" name="config_any_text_at_the_bottom_color" value="<?php echo $config_any_text_at_the_bottom_color ?>"/>
						</div>
					</div>	
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_complete_quickorder; ?></label>
						<div class="col-sm-3">
							<?php foreach ($languages as $language) { ?>
								<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<textarea name="config_complete_quickorder[<?php echo $language['language_id']; ?>][config_complete_quickorder]" rows="5" class="form-control"><?php echo isset($config_complete_quickorder[$language['language_id']]) ? $config_complete_quickorder[$language['language_id']]['config_complete_quickorder'] : ''; ?></textarea>
								</div>
							<?php } ?>
						</div>
					</div>		
				</div>
			
				<div class="tab-pane" id="tab-design-setting">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $text_select_design_fastorder;?></label>
						<div class="col-sm-2">
							<select name="config_select_design_fastorder" class="form-control">
								<option  <?php if ($config_select_design_fastorder == 1 ) echo 'selected' ; ?> value="1"><?php echo $text_theme1;?></option>
								<option  <?php if ($config_select_design_fastorder == 2 ) echo 'selected' ; ?> value="2"><?php echo $text_theme2;?></option>
								<option  <?php if ($config_select_design_fastorder == 3 ) echo 'selected' ; ?> value="3"><?php echo $text_theme3;?></option>
								<option  <?php if ($config_select_design_fastorder == 4 ) echo 'selected' ; ?> value="4"><?php echo $text_theme4;?></option>
							</select>			
						</div>
					</div>	
					<div class="form-group">
						<div class="col-sm-3"><?php echo "№ - 1";?></br><img src="view/image/fastorder_theme1.png" style="max-width:261px;"></div>					
						<div class="col-sm-3"><?php echo "№ - 2";?></br><img src="view/image/fastorder_theme2.png" style="max-width:307px;"></div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-sms-setting">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="register_site_fastorder"><?php echo $register_site_fastorder; ?></label>
						<div class="col-sm-10">
							<div><a href="http://my.smscab.ru/"><?php echo "http://my.smscab.ru/";?></a></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $on_off_sms_fastorder ; ?></label>
						<div class="col-sm-10">
							<div class="onoffswitch">
								<input value="1" type="checkbox" name="config_send_sms_on_off_fastorder" class="onoffswitch-checkbox" id="config_send_sms_on_off_fastorder" <?php echo $config_send_sms_on_off_fastorder == '1' ? 'checked' : '' ; ?>>
								<label class="onoffswitch-label" for="config_send_sms_on_off_fastorder">
									<span class="onoffswitch-inner"></span>
									<span class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_phone_number_send_sms_fastorder ?></label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="config_phone_number_send_sms_fastorder" value="<?php echo $config_phone_number_send_sms_fastorder ?>"  />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_login_send_sms_fastorder ?></label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="config_login_send_sms_fastorder" value="<?php echo $config_login_send_sms_fastorder ?>"  />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_pass_send_sms_fastorder ?></label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="config_pass_send_sms_fastorder" value="<?php echo $config_pass_send_sms_fastorder ?>"  />
						</div>
					</div>				
				</div>
				<div class="tab-pane" id="tab-email-setting">
					<div class="form-group">					
							<div class="col-sm-2 title-fields"><?php echo $form_latter_from_buyer;?></div>
					</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_on_off_send_buyer_mail;?></label>
							<div class="col-sm-10">
								<div class="onoffswitch">
									<input value="1" type="checkbox" name="config_on_off_send_buyer_mail" class="onoffswitch-checkbox" id="config_on_off_send_buyer_mail" <?php echo $config_on_off_send_buyer_mail == '1' ? 'checked' : '' ; ?>>
									<label class="onoffswitch-label" for="config_on_off_send_buyer_mail">
										<span class="onoffswitch-inner"></span>
										<span class="onoffswitch-switch"></span>
									</label>
								</div>
							</div>
						</div>
					<div>
						 <ul class="nav nav-tabs" id="language">
							<?php foreach ($languages as $language) { ?>
							<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
							<?php } ?>
						</ul>
						<div class="tab-content">
							<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="quickorder_subject<?php echo $language['language_id']; ?>"><?php echo $quickorder_subject_buyer;?><br /><?php echo $subject_text_variables;?></label>
										<div class="col-sm-10">
											<textarea name="quickorder_subject<?php echo $language['language_id'] ?>" id="quickorder_subject<?php echo $language['language_id'] ?>" cols="50" rows="3"><?php echo isset(${'quickorder_subject' . $language['language_id']}) ? ${'quickorder_subject' . $language['language_id']} : ''; ?></textarea>   
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="quickorder_description<?php echo $language['language_id']; ?>"><?php echo $quickorder_description_buyer;?><br /><?php echo $subject_text_variables;?><br /><?php echo $list_of_variables_entry;?></label>
										<div class="col-sm-10">
											<textarea name="quickorder_description<?php echo $language['language_id'] ?>" id="quickorder_description<?php echo $language['language_id'] ?>" cols="50" rows="3"><?php echo isset(${'quickorder_description' . $language['language_id']}) ? ${'quickorder_description' . $language['language_id']} : ''; ?></textarea>
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_form_latter_products;?></label>
							<div class="col-sm-10">
								<div class="onoffswitch">
									<input value="1" type="checkbox" name="config_buyer_html_products" class="onoffswitch-checkbox" id="config_buyer_html_products" <?php echo $config_buyer_html_products == '1' ? 'checked' : '' ; ?>>
									<label class="onoffswitch-label" for="config_buyer_html_products">
										<span class="onoffswitch-inner"></span>
										<span class="onoffswitch-switch"></span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="form-group">					
								<div class="col-sm-2 title-fields"><?php echo $form_latter_from_me;?></div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_on_off_send_me_mail;?></label>
							<div class="col-sm-10">
								<div class="onoffswitch">
									<input value="1" type="checkbox" name="config_on_off_send_me_mail" class="onoffswitch-checkbox" id="config_on_off_send_me_mail" <?php echo $config_on_off_send_me_mail == '1' ? 'checked' : '' ; ?>>
									<label class="onoffswitch-label" for="config_on_off_send_me_mail">
										<span class="onoffswitch-inner"></span>
										<span class="onoffswitch-switch"></span>
									</label>
								</div>
							</div>
						</div>
						<ul class="nav nav-tabs" id="language_me">
							<?php foreach ($languages as $language) { ?>
							<li><a href="#language_me<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
							<?php } ?>
						</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
									<div class="tab-pane" id="language_me<?php echo $language['language_id']; ?>">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="quickorder_subject_me<?php echo $language['language_id']; ?>"><?php echo $quickorder_subject_buyer;?><br /><?php echo $subject_text_variables;?></label>
											<div class="col-sm-10">
												<textarea name="quickorder_subject_me<?php echo $language['language_id'] ?>" id="quickorder_subject_me<?php echo $language['language_id'] ?>" cols="50" rows="3"><?php echo isset(${'quickorder_subject_me' . $language['language_id']}) ? ${'quickorder_subject_me' . $language['language_id']} : ''; ?></textarea>   
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="quickorder_description_me<?php echo $language['language_id']; ?>"><?php echo $quickorder_description_buyer;?><br /><?php echo $subject_text_variables;?><br /><?php echo $list_of_variables_entry;?></label>
											<div class="col-sm-10">
												<textarea name="quickorder_description_me<?php echo $language['language_id'] ?>" id="quickorder_description_me<?php echo $language['language_id'] ?>" cols="50" rows="3"><?php echo isset(${'quickorder_description_me' . $language['language_id']}) ? ${'quickorder_description_me' . $language['language_id']} : ''; ?></textarea>
											</div>
										</div>
									</div>
								<?php } ?>
							</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_form_latter_products;?></label>
							<div class="col-sm-10">
								<div class="onoffswitch">
									<input value="1" type="checkbox" name="config_me_html_products" class="onoffswitch-checkbox" id="config_me_html_products" <?php echo $config_me_html_products == '1' ? 'checked' : '' ; ?>>
									<label class="onoffswitch-label" for="config_me_html_products">
										<span class="onoffswitch-inner"></span>
										<span class="onoffswitch-switch"></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_you_email_quickorder?></label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="config_you_email_quickorder" value="<?php echo $config_you_email_quickorder; ?>" />
						</div>
					</div>
					</div>
				</div>
 <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#quickorder_description<?php echo $language['language_id'] ?>').summernote({height: 300});
<?php } ?>
<?php foreach ($languages as $language) { ?>
$('#quickorder_description_me<?php echo $language['language_id'] ?>').summernote({height: 300});
<?php } ?>
//--></script>
 <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#language_me a:first').tab('show');
//--></script>
			</div>
		</form>
	</div>
</div>
<style>
	    .onoffswitch {
        position: relative; width: 70px;
        -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
    }
    .onoffswitch-checkbox {
        display: none;
    }
    .onoffswitch-label {
        display: block; overflow: hidden; cursor: pointer;
        border: 2px solid #FFFFFF; border-radius: 6px;
    }
    .onoffswitch-inner {
        display: block; width: 200%; margin-left: -100%;
        transition: margin 0.3s ease-in 0s;
    }
    .onoffswitch-inner:before, .onoffswitch-inner:after {
        display: block; float: left; width: 50%; height: 29px; padding: 0; line-height: 29px;
        font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
        box-sizing: border-box;
    }
    .onoffswitch-inner:before {
        content: "ON";
        padding-left: 10px;
        background-color: #DBDBDB; color: #3D9602;
    }
    .onoffswitch-inner:after {
        content: "OFF";
        padding-right: 7px;
        background-color: #DBDBDB; color: #E01010;
        text-align: right;
    }
    .onoffswitch-switch {
        display: block; width: 22px; margin: 4.5px;
        background: #E01010;
        position: absolute; top: 0; bottom: 0;
        right: 37px;
        border: 2px solid #FFFFFF; border-radius: 6px;
        transition: all 0.3s ease-in 0s; 
    }
    .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
        margin-left: 0;
    }
    .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
        right: 0px; 
        background-color: #3D9602; 
    }

</style>
<script type="text/javascript"><!--
//--></script> 
<?php echo $footer; ?>