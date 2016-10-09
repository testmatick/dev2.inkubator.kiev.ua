<div id="popup-quickorder">
	<div class="popup-heading"><?php echo isset($config_title_popup_quickorder[$lang_id]) ? $config_title_popup_quickorder[$lang_id]['config_title_popup_quickorder'] : ''; ?></div>
	<div class="popup-center">
		<form id="fastorder_data" enctype="multipart/form-data" method="post">
			<div style="margin-top:10px;">
				<div id="quick_checkout_cart"></div> <!-- LOAD PRODUCTS -->		  
			</div>
			<?php if($on_off_fields_firstname == '1') { ?>
				<div class="col-sm-6 col-sm-12 form-group <?php echo $config_fields_firstname_requared == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
					<div class="input-group margin-bottom-sm">			
						 <input id="contact-name" class="form-control contact-name" type="text" placeholder="<?php echo $config_placeholder_fields_firstname[$lang_id]['config_placeholder_fields_firstname']; ?>" value="" name="name_fastorder">		
						<span class="input-group-addon"><i class="icon-append-1 fa fa-user fa-fw"></i></span>
					</div>					
				</div>
			<?php } ?>
			
			<?php if($on_off_fields_phone == '1') { ?>
				<div class="col-sm-6 col-sm-12 form-group <?php echo $config_fields_phone_requared == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
					<div class="input-group margin-bottom-sm">			
						 <input id="contact-phone" class="form-control contact-phone" type="text" placeholder="<?php echo $config_placeholder_fields_phone[$lang_id]['config_placeholder_fields_phone']; ?>" value="" name="phone">		
						<span class="input-group-addon"><i class="icon-append-1 fa fa-phone-square fa-fw"></i></span>
					</div>					
				</div>
			<?php } ?>
			<?php if($on_off_fields_email) { ?>
				<div class="col-sm-6 col-sm-12 form-group <?php echo $config_fields_email_requared == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
				<div class="input-group margin-bottom-sm">                         
					<input class="form-control contact-email" id="contact-email" type="text" placeholder="<?php echo $config_placeholder_fields_email[$lang_id]['config_placeholder_fields_email'];?>" value=""  name="email_buyer">
					<span class="input-group-addon"><i class="icon-append-1 fa fa-envelope fa-fw"></i></span>
				</div>				
			  </div>
			<?php } ?>
	  
			<?php if($on_off_fields_comment) { ?>
				<div class="col-sm-6 col-om-12 form-group <?php echo $config_fields_comment_requared == '1' ? 'sections_block_rquaired' : 'sections_block' ; ?>">
				<div class="input-group margin-bottom-sm">                          
					<input class="form-control contact-comment-buyer" name="comment_buyer" id="contact-comment" placeholder="<?php echo $config_placeholder_fields_comment[$lang_id]['config_placeholder_fields_comment'];?>"/>
					<span class="input-group-addon"><i class="icon-append-1 fa fa-comment fa-fw"></i></span>	
				</div>				
				</div>
			<?php } ?>
		</form>
		<div class="col-sm-12 form-group text-center"><?php echo isset($config_text_before_button_send[$lang_id]) ? $config_text_before_button_send[$lang_id]['config_text_before_button_send'] : ''; ?></div>
	</div>
	<div class="popup-footer">
		<style>
			#quickorder_btn .btn-quickorder{
				  background-color: #<?php echo $background_button_send_fastorder;?> !important;
				  border-color: #<?php echo $background_button_send_fastorder;?> !important;
			}
			#quickorder_btn .btn-quickorder:hover, #quickorder_btn .btn-quickorder:focus{
				background-color:#<?php echo $background_button_send_fastorder_hover;?> !important;
			}
		</style>
		<div id="quickorder_btn">
			<button type="button" class="btn btn-quickorder contact-send"><i class="<?php echo $icon_send_fastorder;?> fa-fw"></i><?php echo $button_send; ?></button>
		</div>
		<?php if($config_any_text_at_the_bottom[$lang_id]['config_any_text_at_the_bottom'] !='') { ?>
			<div class="col-sm-12 form-group text-center" style="margin-top:10px;"><span style="color:#<?php echo $any_text_at_the_bottom_color;?>"><?php echo isset($config_any_text_at_the_bottom[$lang_id]) ? $config_any_text_at_the_bottom[$lang_id]['config_any_text_at_the_bottom'] : ''; ?></span></div>
		<?php } ?>
		</div>
<script src="catalog/view/javascript/jquery/maskedinput.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				<?php if ($mask_phone_number != '') { ?>
				$("#contact-phone").mask("<?php echo $mask_phone_number;?>");
				<?php } ?>
			});
		</script>
<script type="text/javascript">
$( "#quick_checkout_cart" ).load( 'index.php?route=checkout/quick_checkout_cart');
function updateQuantity(prod_id){
		$.ajax({
			type: 'post',
			data: $('#htop_fastorder'+prod_id).serialize(),
			url: 'index.php?route=checkout/quick_checkout_cart',
			dataType: 'html',
			beforeSend: function() {			
				$('#fastorder_data').after('<span class="loading_quick_order"><i class="fa fa-spinner fa-pulse"></i></span>');
			},		
			complete: function() {			
				$('.loading_quick_order').remove();
			},
			success: function(data) {
				$( "#quick_checkout_cart" ).load( 'index.php?route=checkout/quick_checkout_cart');
				$('#cart').load('index.php?route=common/cart/info');
			}
		});
	return false;
};	

$('.contact-send').bind('click',function() {
	$('#quickorder_url').val(window.location.href);
		var success = 'false';
		$.ajax({
			url: 'index.php?route=module/newfastordercart',
			type: 'post',
			data: $('#fastorder_data').serialize() + '&action=send',
			dataType: 'json',			
			success: function(json) {
				$('#contact-name').attr('placeholder','<?php echo $config_placeholder_fields_firstname[$lang_id]['config_placeholder_fields_firstname']; ?>');
				$('#contact-name').removeClass('error_input');
				$('#contact-phone').attr('placeholder','<?php echo $config_placeholder_fields_phone[$lang_id]['config_placeholder_fields_phone']; ?>');
				$('#contact-phone').removeClass('error_input');
				$('#contact-comment').attr('placeholder','<?php echo $config_placeholder_fields_comment[$lang_id]['config_placeholder_fields_comment']; ?>');
				$('#contact-comment').removeClass('error_input');
				$('#contact-email').attr('placeholder','<?php echo $config_placeholder_fields_email[$lang_id]['config_placeholder_fields_email']; ?>');
				$('#contact-email').removeClass('error_input');
				if (json['error']) {
					if (json['error']['name_fastorder']) {						
						$('#contact-name').attr('placeholder',json['error']['name_fastorder']);
						$('#contact-name').addClass('error_input');							
					}										
					if (json['error']['phone']) {						
						$('#contact-phone').attr('placeholder',json['error']['phone']);
						$('#contact-phone').addClass('error_input');									
					}											
					if (json['error']['comment_buyer']) {
						$('#contact-comment').attr('placeholder',json['error']['comment_buyer']);
						$('#contact-comment').addClass('error_input');				
					}						
					if (json['error']['email_error']) {						
						$('#contact-email').attr('placeholder',json['error']['email_error']);
						$('#contact-email').addClass('error_input');						
					}	
					if (json['error']['comment_buyer']) {
						$('#error_comment_buyer').html(json['error']['comment_buyer']);
					}												
				}
				
				if (json['success']){ 	
				$('#cart').load('index.php?route=common/cart/info');
						$.magnificPopup.close();
					html  = '<div id="modal-addquickorder" class="modal fade">';
				html += '  <div class="modal-dialog">';
				html += '    <div class="modal-content">';
				html += '      <div class="modal-body alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></div>';
				html += '    </div>';
				html += '  </div>';
				html += '</div>';

					$('body').append(html);

					$('#modal-addquickorder').modal('show');
				}	
			}

		});

});
</script>
</div>
</div>