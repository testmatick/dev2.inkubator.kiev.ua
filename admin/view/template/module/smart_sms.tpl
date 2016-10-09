<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
    <div class="container-fluid">
        
        <div id="message"<?php if (!$success && !$error){ ?> style="display: none;"<?php } ?>>
            <?php foreach($success as $item) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i><?php echo $item; ?> <button type="button" class="close" data-dismiss="alert">×</button></div>
            <?php } ?>
            <?php foreach($error as $item) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $item; ?> <button type="button" class="close" data-dismiss="alert">×</button></div>
            <?php } ?>
        </div>
        
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
                <div class="pull-right btn-group" role="group">
                    <a onclick="jQuery('#form').submit()" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_save; ?></a>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-power-off"></i> <?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-addist" data-toggle="tab"><i class="fa fa-wrench"></i> <?php echo $tab_addist; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <div class="col-sm-6">
                                <div class="panel-heading"><h4 class="panel-title"><?php echo $heading_general; ?></h4></div><br />
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[status]" id="input-status" class="form-control radio">
                                            <option value="0"<?php if (!$status) { ?> selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                                            <option value="1"<?php if ($status) { ?> selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-debug"><?php echo $entry_debug; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[debug]" id="input-debug" class="form-control radio">
                                            <option value="0"<?php if (!$debug) { ?> selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                                            <option value="1"<?php if ($debug) { ?> selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-notify_admin"><?php echo $entry_notify_admin; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[notify_admin]" id="input-notify_admin" class="form-control radio">
                                            <option value="0"<?php if (!$notify_admin) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
                                            <option value="1"<?php if ($notify_admin) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-notify_signup"><?php echo $entry_notify_signup; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[notify_signup]" id="input-notify_signup" class="form-control radio">
                                            <option value="0"<?php if (!$notify_signup) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
                                            <option value="1"<?php if ($notify_signup) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-notify_customer"><?php echo $entry_notify_customer; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[notify_customer]" id="input-notify_customer" class="form-control radio">
                                            <option value="0"<?php if (!$notify_customer) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
                                            <option value="1"<?php if ($notify_customer) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-notify_update"><?php echo $entry_notify_update; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[notify_update]" id="input-notify_update" class="form-control radio">
                                            <option value="0"<?php if (!$notify_update) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
                                            <option value="1"<?php if ($notify_update) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-use_checkbox"><?php echo $entry_use_checkbox; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[use_checkbox]" id="input-use_checkbox" class="form-control radio">
                                            <option value="0"<?php if (!$use_checkbox) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
                                            <option value="1"<?php if ($use_checkbox) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-statuses"><?php echo $entry_statuses; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[statuses][]" id="input-statuses" multiple="true" class="form-control multiselect no-select-all">
                                            <?php foreach($order_statuses as $order_status) { ?>
                                            <option value="<?php echo $order_status['order_status_id']; ?>"<?php if (in_array($order_status['order_status_id'],$statuses)) { ?> selected="selected"<?php } ?>><?php echo $order_status['name']; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-message_admin"><span data-original-title="<?php echo $help_order_variables; ?>" data-toggle="tooltip"><?php echo $entry_message_admin; ?></span></label>
                                    <div class="col-sm-8"><textarea name="smart_sms[message_admin]" id="input-message_admin" class="form-control" rows="4"><?php echo $message_admin ? $message_admin : $default_message_admin; ?></textarea></div>
                                </div>
                                <div class="col-sm-12">
                                    <ul class="nav nav-tabs">
                                    <?php $i = 0; foreach ($languages as $language) { $i++; ?>
                                        <li class="<?php if ($i==1) echo 'active'; ?>"><a href="#tab-language-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                    <?php } ?>
                                    </ul>
                                    <div class="tab-content">
                                        <?php $i = 0; foreach ($languages as $language) { $i++; ?>
                                        <div class="tab-pane <?php if ($i==1) echo 'active'; ?>" id="tab-language-<?php echo $language['language_id']; ?>">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input-message_customer-<?php echo $language['language_id']; ?>"><span data-original-title="<?php echo $help_order_variables; ?>" data-toggle="tooltip"><?php echo $entry_message_customer; ?></span></label>
                                                <div class="col-sm-8"><textarea name="smart_sms[message_customer][<?php echo $language['language_id']; ?>]" id="input-message_customer-<?php echo $language['language_id']; ?>" class="form-control" rows="4"><?php echo !empty($message_customer[$language['language_id']]) ? $message_customer[$language['language_id']] : $default_message_customer; ?></textarea></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input-message_update-<?php echo $language['language_id']; ?>"><span data-original-title="<?php echo $help_order_variables; ?>" data-toggle="tooltip"><?php echo $entry_message_update; ?></span></label>
                                                <div class="col-sm-8"><textarea name="smart_sms[message_update][<?php echo $language['language_id']; ?>]" id="input-message_update-<?php echo $language['language_id']; ?>" class="form-control" rows="4"><?php echo !empty($message_update[$language['language_id']]) ? $message_update[$language['language_id']] : $default_message_update; ?></textarea></div>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="panel-heading"><h4 class="panel-title"><?php echo $heading_provider; ?></h4></div><br />
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-admin_phone"><?php echo $entry_admin_phone; ?></label>
                                    <div class="col-sm-8 input-group">
                                        <input type="text" name="smart_sms[admin_phone]" id="input-admin_phone" value="<?php echo $admin_phone; ?>" class="form-control" />
                                        <span class="input-group-btn"><a onclick="testProvider()" id="button-test" class="btn btn-success"><i class="fa fa-check"></i> <?php echo $button_test; ?></a></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-provider"><?php echo $entry_provider; ?></label>
                                    <div class="col-sm-8">
                                        <select name="smart_sms[provider]" id="input-provider" onchange="changeProvider();" class="form-control">
                                            <?php foreach($providers as $code=>$item){ ?>
                                            <option value="<?php echo $code; ?>"<?php if ($code == $provider) { ?> selected="selected"<?php } ?>><?php echo $item['name']; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                
                                <div id="gateway-config"><?php echo $gateway_form; ?></div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-log"><?php echo $entry_log; ?></label>
                                    <div class="col-sm-8">
                                        <textarea id="input-log" class="form-control" readonly="true" rows="4"><?php echo $log; ?></textarea><br />
                                        <a onclick="if (confirm('<?php echo $text_confirm; ?>')) { clearLog(); }" class="btn btn-warning pull-right clearfix"><i class="fa fa-eraser"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-addist"><?php echo $addist_tab; ?></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
function changeProvider()
{
	$.ajax({
		url: 'index.php?route=module/smart_sms/provider&token=<?php echo $token; ?>&code=' +  jQuery('#input-provider').val(),
		dataType: 'html',
        beforeSend: function() {
        	jQuery('#gateway-config').find('input, select, textarea').prop('disabled',true);
		},
        complete: function() {
			jQuery('#gateway-config').find('input, select, textarea').prop('disabled',false);
        },
		success: function(html) {
			jQuery('#gateway-config').html(html);
		}
	});
}

function testProvider()
{
    if (confirm('<?php echo $text_confirm; ?>'))
    {
    	$.ajax({
    		url: 'index.php?route=module/smart_sms/test&token=<?php echo $token; ?>&code=' +  jQuery('#input-provider').val() + '&phone=' + jQuery('#input-admin_phone').val(),
    		dataType: 'json',
            beforeSend: function() {
            	jQuery('#button-test').button('loading');
    		},
            complete: function() {
    			jQuery('#button-test').button('reset');
            },
    		success: function(json) {
                jQuery('#input-log').html(json['description']+'\n'+jQuery('#input-log').html());
    			alert(json['description']);
    		}
    	});
     }
}

function clearLog()
{
	$.ajax({
		url: 'index.php?route=module/smart_sms/clear_log&token=<?php echo $token; ?>',
		dataType: 'html',
		success: function(html) {
			jQuery('#input-log').html('');
		}
	});
}
//--></script>
<?php echo $footer; ?>