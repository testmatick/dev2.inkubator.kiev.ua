<fieldset>
	<legend><?php echo $legend_license; ?></legend>
	<div class="form-group">
		<label class="col-sm-1 control-label" for="button-activate"><span data-toggle="tooltip" title="<?php echo $help_license; ?>"><?php echo $entry_license; ?></span></label>
		<div class="col-sm-3">
			<div class="input-group">
				<input type="text" name="<?php echo $extension; ?>_license" value="<?php echo $license; ?>" placeholder="<?php echo $entry_license; ?>" id="input-license" class="form-control"<?php if ($check_license) { ?> readonly=""<?php } ?>/>
				<span class="input-group-btn">
					<?php if (!$check_license) { ?>
						<a onclick="purchase('activate')" id="button-activate" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo $help_activate; ?>"><i class="fa fa-key"></i></a>
					<?php } else { ?>
						<a onclick="purchase('delete')" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="<?php echo $help_delete; ?>"><i class="fa fa-times"></i></a>
					<?php } ?>
				</span>
			</div>
		</div>
	</div>
	<?php if (!$check_license) { ?>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="input-email"><span data-toggle="tooltip" title="<?php echo $help_email; ?>"><?php echo $entry_email; ?></span></label>
			<div class="col-sm-1">
				<input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
			</div>
			<label class="col-sm-1 control-label" for="input-domain"><span data-toggle="tooltip" title="<?php echo $help_domain; ?>"><?php echo $entry_domain; ?></span></label>
			<div class="col-sm-1">
				<input type="text" name="domain" value="<?php echo str_replace('www.', '', $_SERVER['SERVER_NAME']); ?>" id="input-domain" class="form-control" disabled/>
			</div>
			<label class="col-sm-1 control-label" for="input-market"><span data-toggle="tooltip" title="<?php echo $help_market; ?>"><?php echo $entry_market; ?></span></label>
			<div class="col-sm-2">
				<select name="market" id="input-market" class="form-control">
					<option value="oc-max.com">oc-max.com</option>
					<option value="oc-max.com">opencart.com</option>
					<option value="opencartforum.com">opencartforum.com</option>
             	</select>
        	</div>
        	<label class="col-sm-1 control-label" for="input-check"><span data-toggle="tooltip" title="<?php echo $help_check; ?>"><?php echo $entry_check; ?></span></label>
        	<div class="col-sm-2">
        		<input type="text" name="check" value="" placeholder="<?php echo $entry_check; ?>" id="input-check" class="form-control" />
       		</div>
        	<div class="col-sm-1">
        		<a onclick="purchase('send')" id="button-send-purchase" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="<?php echo $help_send; ?>"><i class="fa fa-envelope-o"></i></a>
        	</div>
    	</div>
    	<div class="form-group">
    		<div class="col-sm-10">
    			<?php echo $text_about_license; ?>
    		</div>
    	</div> 
    <?php } ?>
    <legend><?php echo $legend_support; ?></legend>
    	<address>
    		<?php echo $text_about_support; ?>
    	</address>
</fieldset>

<script type="text/javascript"><!--
function purchase(action) {
	switch(action) {
		case 'send':
			sUrl = '&email=' + encodeURIComponent($('#input-email').val()) + '&domain=' + encodeURIComponent($('#input-domain').val()) +'&market=' + encodeURIComponent($('#input-market').val()) +'&check=' + encodeURIComponent($('#input-check').val());        		
        break;
        case 'activate':
        	sUrl = '&license=' + $('#input-license').val();
        break;
        case 'delete':
        	$('#input-license').val('');
        	sUrl = '';
        break;
    }
    
    $.ajax({
    	url: 'index.php?route=tool/ocmax/purchase&action=' + action + '&extension=<?php echo $extension; ?>&token=<?php echo $token; ?>' + sUrl,
    	dataType: 'json',
    	success: function (json) {
    		if (json['error']) {
    			$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}
    		
    		if (json['success']) {
    			$('.container-fluid:eq(1)').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}
    	},
    	error: function (jqXHR, textStatus, errorThrown) {
    		console.log(textStatus);
      	}
    });
}
//--></script>