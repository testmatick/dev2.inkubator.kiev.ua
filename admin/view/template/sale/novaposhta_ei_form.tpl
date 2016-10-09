<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
    	<div class="container-fluid">
      		<div class="pull-right">
      			<a href="<?php echo $ei_list; ?>" data-toggle="tooltip" title="<?php echo $button_ei_list; ?>" class="btn btn-danger"><i class="fa fa-list-ul"></i></a>
      			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      		</div>
      		<h1><?php echo $heading_title; ?></h1>
      		<ul class="breadcrumb">
        		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
        			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        		<?php } ?>
      		</ul>
    	</div>
  	</div>
  	<div class="container-fluid">
    	<div class="panel panel-default">
      		<div class="panel-heading">
        		<h3 class="panel-title"><i class="fa fa-file-text-o"></i> <?php echo $text_form; ?></h3>
      		</div>
      		<div class="panel-body">
        		<form class="form-horizontal">
        			<div class="well">
        			<div class="col-sm-6" style="border: inherit;padding: inherit">
        				<h3><?php echo $text_sender; ?></h3><hr/>
        				<fieldset>
        					<div class="form-group">
        						<label class="col-sm-4 control-label" for="input-sender"><?php echo $entry_sender; ?></label>
        						<div class="col-sm-8">
        							<select name="sender" id="input-sender" class="form-control">
                						<option value="0"><?php echo $text_select; ?></option>
                						<?php foreach ($ei['senders'] as $sender) { ?>
                							<?php if ($sender['Ref'] == $novaposhta_sender) { ?>
                								<option value="<?php echo $sender['Ref']; ?>" selected="selected"><?php echo $sender['Description']; ?>, <?php echo $sender['CityDescription']; ?></option>
                							<?php } else { ?>
                								<option value="<?php echo $sender['Ref']; ?>"><?php echo $sender['Description']; ?>, <?php echo $sender['CityDescription']; ?></option>
               								<?php } ?>
                						<?php } ?>
                					</select>	
            					</div>
          					</div>
			          		<div class="form-group">
			          			<label class="col-sm-4 control-label" for="input-sender_city"><?php echo $entry_city; ?></label>
			            		<div class="col-sm-8">
			              			<input type="text" name="sender_city" value="<?php echo $ei['senders'][$novaposhta_sender]['CityDescription']; ?>" placeholder="<?php echo $entry_city; ?>" id="input-sender_city" class="form-control" />
			            		</div>
			          		</div>
			          		<div class="form-group">
			        			<label class="col-sm-4 control-label" for="input-sender_address"><?php echo $entry_address; ?></label>
			        			<div class="col-sm-8">
			        				<select name="sender_address" id="input-sender_address" class="form-control">
			                		</select>	
			            		</div>
			          		</div>
			          		<div class="form-group">
			        			<label class="col-sm-4 control-label" for="input-sender_contact_person"><?php echo $entry_contact_person; ?></label>
			        			<div class="col-sm-8">
			        				<select name="sender_contact_person" id="input-sender_contact_person" class="form-control">
			                		</select>	
			            		</div>
			          		</div>
			          		<div class="form-group">
			          			<label class="col-sm-4 control-label" for="input-sender_contact_person_phone"><?php echo $entry_phone; ?></label>
			            		<div class="col-sm-8">
			              			<input type="text" name="sender_contact_person_phone" value="<?php echo $ei['sender_contact_person'][$novaposhta_sender][$novaposhta_sender_contact_person]['Phones']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-sender_contact_person_phone" class="form-control" />
			            		</div>
			          		</div>
        				</fieldset>	
        			</div>
        			<div class="col-sm-6" style="border: inherit;padding: inherit">
        				<h3><?php echo $text_recipient; ?></h3><hr/>
        				<div class="form-group">
          					<label class="col-sm-4 control-label" for="input-recipient"><?php echo $entry_recipient; ?></label>
            				<div class="col-sm-8">
              					<input type="text" name="recipient" value="<?php echo $recipient; ?>" placeholder="<?php echo $entry_recipient; ?>" id="input-recipient" class="form-control" />
              				</div>
          				</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-recipient_city"><?php echo $entry_city; ?></label>
		            		<div class="col-sm-8">
		              			<input type="text" name="recipient_city" value="<?php echo $recipient_city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-recipient_city" class="form-control" />
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-recipient_address"><?php echo $entry_address; ?></label>
		            		<div class="col-sm-8">
		              			<input type="text" name="recipient_address" value="<?php echo $recipient_address; ?>" placeholder="<?php echo $entry_address; ?>" id="input-recipient_address" class="form-control" />
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-recipient_contact_person"><?php echo $entry_contact_person; ?></label>
		            		<div class="col-sm-8">
		              			<input type="text" name="recipient_contact_person" value="<?php echo $recipient_contact_person; ?>" placeholder="<?php echo $entry_contact_person; ?>" id="input-recipient_contact_person" class="form-control" />
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-recipient_contact_person_phone"><?php echo $entry_phone; ?></label>
		            		<div class="col-sm-8">
		              			<input type="text" name="recipient_contact_person_phone" value="<?php echo $recipient_contact_person_phone; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-recipient_contact_person_phone" class="form-control" />
		            		</div>
		          		</div>
        			</div>
        			<div class="col-sm-6" style="border: inherit;padding: inherit">
        				<h3><?php echo $text_shipment; ?></h3><hr/>
		        		<div class="form-group">
		        			<label class="col-sm-4 control-label" for="input-cargo_type"><?php echo $entry_cargo_type; ?></label>
		        			<div class="col-sm-8">
		        				<select name="cargo_type" id="input-cargo_type" class="form-control">
		                			<?php foreach ($ei['cargo_types'] as $cargo_type) { ?> 
		                				<?php if ($cargo_type['Ref'] == 'Cargo') { ?>
		                					<option value="<?php echo $cargo_type['Ref']; ?>" selected="selected"><?php echo $cargo_type['Description']; ?></option>
		                				<?php } else { ?>
											<option value="<?php echo $cargo_type['Ref']; ?>"><?php echo $cargo_type['Description']; ?></option>
		                				<?php } ?>
		                			<?php } ?>
		                		</select>	
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-width"><?php echo $entry_width; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
		              				<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
		              				<span class="input-group-addon"><?php echo $text_cm; ?></span>
		              			</div>	
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-length"><?php echo $entry_length; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
			              			<input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_cm; ?></span>
		              			</div>
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-height"><?php echo $entry_height; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
			              			<input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_cm; ?></span>
		              			</div>
		            		</div>
		          		</div>
		        		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
			              			<input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_kg; ?></span>
		              			</div>
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-volume_weight"><?php echo $entry_volume_weight; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
		              				<input type="text" name="volume_weight" value="<?php echo $volume_weight; ?>" placeholder="<?php echo $entry_volume_weight; ?>" id="input-volume_weight" class="form-control" readonly/>
		              				<span class="input-group-addon"><?php echo $text_kg; ?></span>
		              			</div>
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-volume_general"><?php echo $entry_volume_general; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
			              			<input type="text" name="volume_general" value="<?php echo $volume_general; ?>" placeholder="<?php echo $entry_volume_general; ?>" id="input-volume_general" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_cubic_meter; ?></span>
		              			</div>
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-seats_amount"><?php echo $entry_seats_amount; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
		            				<span class="input-group-btn">
		                  				<button type="button" id="button-options-seat" data-toggle="modal" data-target="#optionsSeat" data-tooltip="true" title="<?php echo $button_options_seat; ?>" class="btn btn-default"><i class="fa fa-cubes"></i></button>
		                  			</span>
		                			<input type="text" name="seats_amount" value="<?php echo $seats_amount; ?>" placeholder="<?php echo $entry_seats_amount; ?>" id="input-seats_amount" class="form-control" />
		                  			<span class="input-group-addon"><?php echo $text_pc; ?></span>
		              			</div>
		              			
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-announced_price"><?php echo $entry_announced_price; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
			              			<input type="text" name="announced_price" value="<?php echo $announced_price; ?>" placeholder="<?php echo $entry_announced_price; ?>" id="input-announced_price" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_grn; ?></span>
		              			</div>
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-4 control-label" for="input-cargo_description"><?php echo $entry_cargo_description; ?></label>
		            		<div class="col-sm-8">
		              			<input type="text" name="cargo_description" value="<?php echo $cargo_description; ?>" placeholder="<?php echo $entry_cargo_description; ?>" id="input-cargo_description" class="form-control" />
		            		</div>
		          		</div>
        			</div>
		        	<div class="col-sm-6" style="border: inherit;padding: inherit">
		        		<h3><?php echo $text_payment; ?></h3><hr/>
		        		<div class="form-group">
		        			<label class="col-sm-4 control-label" for="input-payer"><?php echo $entry_payer; ?></label>
		        			<div class="col-sm-8">
		        				<select name="payer" id="input-payer" class="form-control">
		                			<?php foreach ($ei['payer_types'] as $payer_type) { ?>
		                				<?php if ($payer_type['Ref'] == $payer) { ?>
		                					<option value="<?php echo $payer_type['Ref']; ?>" selected="selected"><?php echo $payer_type['Description']; ?></option>
		                				<?php } else { ?>
		                					<option value="<?php echo $payer_type['Ref']; ?>"><?php echo $payer_type['Description']; ?></option>
		               					<?php } ?>
		                			<?php } ?>
		                		</select>	
		            		</div>
		          		</div>
		          		<div class="form-group" style="display: none">
		        			<label class="col-sm-4 control-label" for="input-third_person"><?php echo $entry_third_person; ?></label>
		        			<div class="col-sm-8">
		        				<select name="third_person" id="input-third_person" class="form-control">
                					<option value=""><?php echo $text_select; ?></option>
                					<?php foreach ($ei['third_persons'] as $third_person) { ?>
                						<option value="<?php echo $third_person['Ref']; ?>"><?php echo $third_person['Description']; ?>, <?php echo $third_person['CityDescription']; ?></option>
                					<?php } ?>
                				</select>
		            		</div>
		          		</div>
		          		<div class="form-group">
		        			<label class="col-sm-4 control-label" for="input-payment_type"><?php echo $entry_payment_type; ?></label>
		        			<div class="col-sm-8">
		        				<select name="payment_type" id="input-payment_type" class="form-control">
		                			<?php foreach ($ei['payment_types'] as $payment_type) { ?>
		                				<?php if ($payment_type['Ref'] == 'Cash') { ?>
		                					<option value="<?php echo $payment_type['Ref']; ?>" selected="selected"><?php echo $payment_type['Description']; ?></option>
		                				<?php } else { ?>
		                					<option value="<?php echo $payment_type['Ref']; ?>"><?php echo $payment_type['Description']; ?></option>
		               					<?php } ?>
		                			<?php } ?>
		                		</select>	
		            		</div>
		          		</div>
		          		<div class="form-group">
		        			<label class="col-sm-4 control-label" for="input-backward_delivery"><?php echo $entry_backward_delivery; ?></label>
		        			<div class="col-sm-8">
		        				<select name="backward_delivery" id="input-backward_delivery" class="form-control">
		        					<option value="0"><?php echo $text_no_backward_delivery; ?></option>
		                			<?php foreach ($ei['backward_delivery_types'] as $backward_delivery_type) { ?>
			                			<?php if ($backward_delivery_type['Ref'] == $cod) { ?>
			                				<option value="<?php echo $backward_delivery_type['Ref']; ?>" selected="selected"><?php echo $backward_delivery_type['Description']; ?></option>
			                			<?php } else { ?>
			                				<option value="<?php echo $backward_delivery_type['Ref']; ?>"><?php echo $backward_delivery_type['Description']; ?></option>
			               				<?php } ?>
		                			<?php } ?>
		                		</select>	
		            		</div>
		          		</div>
		          		<div class="form-group"<?php echo (!$cod) ? ' style="display: none"' : ''; ?>>
		          			<label class="col-sm-4 control-label" for="input-backward_delivery_total"><?php echo $entry_backward_delivery_total; ?></label>
		            		<div class="col-sm-8">
		            			<div class="input-group">
			              			<input type="text" name="backward_delivery_total" value="<?php echo $backward_delivery_total; ?>" placeholder="<?php echo $entry_backward_delivery_total; ?>" id="input-backward_delivery_total" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_grn; ?></span>
		              			</div>
		            		</div>
		          		</div>
		          		<div class="form-group"<?php echo (!$cod) ? ' style="display: none"' : ''; ?>>
		        			<label class="col-sm-4 control-label" for="input-backward_delivery_payer"><?php echo $entry_backward_delivery_payer; ?></label>
		        			<div class="col-sm-8">
		        				<select name="backward_delivery_payer" id="input-backward_delivery_payer" class="form-control">
		                			<?php foreach ($ei['backward_delivery_payers'] as $backward_delivery_payer) { ?>
		                				<?php if ($backward_delivery_payer['Ref'] == $cod_payer) { ?>
		                					<option value="<?php echo $backward_delivery_payer['Ref']; ?>" selected="selected"><?php echo $backward_delivery_payer['Description']; ?></option>
		                				<?php } else { ?>
		                					<option value="<?php echo $backward_delivery_payer['Ref']; ?>"><?php echo $backward_delivery_payer['Description']; ?></option>
		               					<?php } ?>
		                			<?php } ?>
		                		</select>	
		            		</div>
		          		</div>
		        	</div>
		        	
		        	<div class="col-sm-12" style="border: inherit;padding: inherit">
		        		<h3><?php echo $text_additionally; ?></h3><hr/>
		        		<div class="form-group">
		          			<label class="col-sm-2 control-label" for="input-shipment_date"><?php echo $entry_shipment_date; ?></label>
		            		<div class="col-sm-4">
		            			<div class="input-group date">
		                			<input type="text" name="shipment_date" value="<?php echo $shipment_date; ?>" placeholder="<?php echo $entry_shipment_date; ?>" data-date-format="DD.MM.YYYY" id="input-shipment_date" class="form-control">
		                  			<span class="input-group-btn">
		                  				<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
		                  			</span>
		              			</div>
		            		</div>
		            	</div>	
						<div class="form-group">
		        			<label class="col-sm-2 control-label" for="input-service_type"><?php echo $entry_service_type; ?></label>
		        			<div class="col-sm-4">
		        				<select name="service_type" id="input-service_type" class="form-control">
		                			<?php foreach ($ei['service_types'] as $service_type) { ?>
		                				<?php if ($service_type['Ref'] == $novaposhta_service_type) { ?>
		                					<option value="<?php echo $service_type['Ref']; ?>" selected="selected"><?php echo $service_type['Description']; ?></option>
		                				<?php } else { ?>
		                					<option value="<?php echo $service_type['Ref']; ?>"><?php echo $service_type['Description']; ?></option>
		               					<?php } ?>
		                			<?php } ?>
		                		</select>	
		            		</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-2 control-label" for="input-sales_order_number"><?php echo $entry_sales_order_number; ?></label>
		            		<div class="col-sm-4">
		              			<input type="text" name="sales_order_number" value="<?php echo $sales_order_number; ?>" placeholder="<?php echo $entry_sales_order_number; ?>" id="input-sales_order_number" class="form-control" />
		          			</div>
		          		</div>
		          		<div class="form-group">
		          			<label class="col-sm-2 control-label" for="input-payment_control"><?php echo $entry_payment_control; ?></label>
		            		<div class="col-sm-4">
		            			<div class="input-group">
			              			<input type="text" name="payment_control" value="" placeholder="<?php echo $entry_payment_control; ?>" id="input-payment_control" class="form-control" />
			              			<span class="input-group-addon"><?php echo $text_grn; ?></span>
		              			</div>
		          			</div>
		          		</div>	
		          		<div class="form-group">	
		          			<label class="col-sm-2 control-label" for="input-additional_information"><?php echo $entry_additional_information; ?></label>
		            		<div class="col-sm-4">
		            			<textarea name="additional_information" rows="2" id="input-additional_information" class="form-control"></textarea>
		          			</div>
		          		</div>
		        	</div>
		        	<div class="clearfix"></div>
		        	</div>
        			<button type="button" class="btn btn-primary btn-lg btn-block" id="button-create"><?php echo $button_create; ?></button>
        			<!-- Modal -->
					<div class="modal fade" id="optionsSeat" tabindex="-1" role="dialog" aria-labelledby="optionSeatLabel">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="optionsSeatLabel"><?php echo $heading_options_seat; ?></h4>
								</div>
								<div class="modal-body">
									<div class="table-responsive">
										<table class="table table-striped" id="table-seats">
											<thead>
												<tr>
													<td class="text-center"><?php echo $column_number_order; ?></td>
													<td class="text-center"><?php echo $column_volume; ?></td>
													<td class="text-center"></td>
													<td class="text-center"><?php echo $column_width; ?></td>
													<td class="text-center"><?php echo $column_length; ?></td>
													<td class="text-center"><?php echo $column_height; ?></td>
													<td class="text-center"><?php echo $column_actual_weight; ?></td>
													<td class="text-center"><?php echo $column_volume_weight; ?></td>
							                  		<td class="text-center"><?php echo $column_action; ?></td>
							                  	</tr>
							                </thead>
							                <tbody>
							                	<tfoot>
							                  		<tr>
							                  			<td colspan="8"></td>
							                  			<td class="text-center">
							                  				<button type="button" onclick="addSeat()" data-toggle="modal"  data-tooltip=true title="<?php echo $button_add_seat; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
							                  				</td>
							                  		</tr>
							                  	</tfoot>
							                </tbody>
							            </table>
							        </div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i></button>
									<button type="button" onclick="saveSeats()" class="btn btn-primary"><i class="fa fa-check"></i></button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal end-->
        		</form>
      		</div>
    	</div>
  	</div>
</div>
<script type="text/javascript"><!--
function getNPData(type) {
	var method, checked, filter = $('#input-sender').val();
		
	switch(type) {
		case 'sender_address':
			method = 'getAddress';
			checked = '<?php echo $novaposhta_sender_address; ?>';
		break;
		case 'sender_contact_person':
			method = 'getContactPerson';
			checked = '<?php echo $novaposhta_sender_contact_person; ?>';
		break;
	}
		
	if (filter && method) {
		$.ajax( {
			url: 'index.php?route=shipping/novaposhta/getNPData&method=' + method + '&filter=' + filter + '&token=<?php echo $token; ?>',
			dataType: 'json',
			success: function (json) {
				var html = '<option value=""><?php echo $text_select; ?></option>';
				for (var i in json) {
					if (json[i]['Ref'] == checked) {
						html += '<option value="' + json[i]['Ref'] + '" selected="selected">' + json[i]['Description'] + '</option>';
					} else {
						html += '<option value="' + json[i]['Ref'] + '">' + json[i]['Description'] + '</option>';
					}
				}
				$('#input-' + type).html(html);
			}
		} );
	}	
}

function validateForm(element) {
	var v =element.name + '=' + encodeURIComponent(element.value);
		
	if (element.name == 'sender_address') {
		v += '&filter=' + encodeURIComponent($('input[name = sender_city]').val());
	}
	
	if (element.name == 'sender_contact_person') {
		v += '&sender=' + encodeURIComponent($('select[name = sender]').val());
	}
	
	if (element.name == 'recipient_address') {
		v += '&filter=' + encodeURIComponent($('input[name = recipient_city]').val());
	}
		
	if (element.name == 'backward_delivery_total') {
		v += '&backward_delivery=' + encodeURIComponent($('select[name = backward_delivery]').val());
	}
	
	$.ajax( {
		url: 'index.php?route=sale/novaposhta_ei/getForm&token=<?php echo $token; ?>',
	   	type: 'POST',
	   	data: v,
	   	dataType: 'json',
	  	success: function(json) {
	  			checkErrors(json);
	   	},
	   	error: function (jqXHR, textStatus, errorThrown) {
	   		console.log(textStatus);
	     }
	} );
}		

function checkErrors(array) {
	if (array['warnings']) {
		for(var w in array['warnings']) {			
			$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + array['warnings'][w] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		}
	} else {
		$('.alert').remove();
	}	
		
	for(var field in array['errors']) {
		if (field == 'recipient_address_list') {
			var select = '<select name="recipient_address" id="input-recipient_address" class="form-control"><option value=""><?php echo $text_select; ?></option>';
			
			for(var i in array['errors'][field]) {
				select += '<option value="' + array['errors'][field][i]['Description'] + '">' + array['errors'][field][i]['Description'] + '</option>';
			}
			
			select += '</select>';
			
			$('#input-recipient_address').replaceWith(select);
			field = 'input-recipient_address';	
		}				
		$('div.form-group').has('label[for = input-' + field + ']').removeClass('has-success').addClass('has-error');
		$('span#input-' + field).remove('.help-block');
		$('div.form-group > div[class ^= col-sm]').has('#input-' + field).append('<span id="input-' + field + '" class="help-block">' + array['errors'][field] + '</span>');
	}
	
	for(var field in array['success']) {			
		$('div.form-group').has('label[for = input-' + field + ']').removeClass('has-error').addClass('has-success');
		$('span#input-' + field).remove('.help-block');
	}
}

function addSeat() {
	var row = '<tr>';
	
	row += '<td>' + ($('#table-seats tbody tr').length + 1) + '</td>';	
	row += '<td><div class="input-group"><input type="text" name="volume" value="" id="seat-volume" class="form-control" /><span class="input-group-addon"><?php echo $text_cubic_meter; ?></span></div></td>';
	row += '<td><label class="col-sm-12 control-label" for="seat-volume"><?php echo $text_or; ?></label></td>';
	row += '<td><div class="input-group"><input type="text" name="width" value="" id="seat-width" class="form-control" /><span class="input-group-addon"><?php echo $text_cm; ?></span></div></td>';
	row += '<td><div class="input-group"><input type="text" name="length" value="" id="seat-length" class="form-control" /><span class="input-group-addon"><?php echo $text_cm; ?></span></div></td>';
	row += '<td><div class="input-group"><input type="text" name="height" value="" id="seat-height" class="form-control" /><span class="input-group-addon"><?php echo $text_cm; ?></span></div></td>';
	row += '<td><div class="input-group"><input type="text" name="actual_weight" value="" id="seat-actual-weight" class="form-control" /><span class="input-group-addon"><?php echo $text_kg; ?></span></div></td>';
	row += '<td><div class="input-group"><input type="text" name="volume_weight" value="" id="seat-volume-weight" class="form-control" readonly/><span class="input-group-addon"><?php echo $text_kg; ?></span></div></td>';
	row += '<td><div class="btn-group" role="group"><button type="button" onclick="$(this).parents(\'tr\').find(\'input\').val(\'\')" data-tooltip="true" title="<?php echo $text_clear; ?>" class="btn btn-default"><i class="fa fa-eraser"></i></button><button type="button" onclick="$(this).parents(\'tr\').remove()" data-tooltip="true" title="<?php echo $text_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div></td>';
	row += '</tr>';
		
	$('#table-seats tbody').append(row);
}

function saveSeats() {
	var trs = $('#table-seats tbody tr');
	var seats = trs.length, weight = 0, volume = 0, volume_weight = 0;	
		
	trs.each(function(i, element){
		tr = $(element);	
			
		weight += +tr.find('#seat-actual-weight').val();
		volume += +tr.find('#seat-volume').val();
		volume_weight += +tr.find('#seat-volume-weight').val();
	});
		
	$('#input-seats_amount').val(seats);
	$('#input-weight').val(weight);
	$('#input-volume_general').val(volume);
	$('#input-volume_weight').val(volume_weight);
		
	$('#optionsSeat').modal('hide');
}

$( function () {
	// Plugins
	$('[data-tooltip=true]').tooltip();
	$('div.modal-dialog').css('width', '85%');
	$('.date').datetimepicker({pickTime: false});
	
	// Set vars after DOOM load
	getNPData('sender_address');
	getNPData('sender_contact_person');
	
	var recipient_address = $('#input-recipient_address').val();
	var cargo_type = $('#input-cargo_type').val();
	var backward_delivery = $('#input-backward_delivery').val();
	
	if (!recipient_address.match(/почтомат|поштомат/i)) {
		$('[for = input-width], [for = input-length], [for = input-height]').parent().hide();
	} else {
		$('#input-cargo_type > option[value = TiresWheels], #input-cargo_type > option[value = Pallet], #input-seats_amount').attr('disabled', true);
		$('#input-seats_amount').val(1);
		$('button#button-options-seat').attr('disabled', true);
	}
	
	// Change handler
	$('form').on('change', 'input, select, textarea', function(e) {
		switch (this.id) {
			case 'input-sender':
				var city = this.selectedOptions[0].label.substr(this.selectedOptions[0].label.indexOf(', ') + 2);

				$('#input-sender_city').val(city);
				
				getNPData('sender_address');
				getNPData('sender_contact_person');
			break;
			
			case 'input-sender_contact_person':
				var phone = this.selectedOptions[0].label.substr(this.selectedOptions[0].label.indexOf(', ') + 2);

				$('#input-sender_contact_person_phone').val(phone);
			break;
			
			case  'input-recipient_address':
				if (!recipient_address.match(/почтомат|поштомат/i) && this.value.match(/почтомат|поштомат/i)) {
					if (cargo_type == 'Cargo') {
						$('[for = input-width], [for = input-length], [for = input-height]').parent().show();
					}
					$('#input-cargo_type > option[value = TiresWheels], #input-cargo_type > option[value = Pallet], #input-seats_amount').attr('disabled', true);
					$('#input-seats_amount').val(1);
					$('button#button-options-seat').attr('disabled', true);
				} else if (recipient_address.match(/почтомат|поштомат/i) && !this.value.match(/почтомат|поштомат/i)) {
					if (cargo_type == 'Cargo') {
						$('[for = input-width], [for = input-length], [for = input-height]').parent().hide();
					}
					$('#input-cargo_type > option[value = TiresWheels], #input-cargo_type > option[value = Pallet], #input-seats_amount').removeAttr('disabled');
					$('button#button-options-seat').removeAttr('disabled');
				}
				recipient_address = this.value;
			break;
			
			case 'input-payer':
				if (this.value == 'ThirdPerson') {
					$('[for = input-third_person]').parent().show();
					$('#input-payment_type > option[value = Cash]').attr('disabled', true);
					$('#input-payment_type > option[value = NonCash]').attr('selected', true);
				} else {
					$('[for = input-third_person]').parent().hide();
					$('#input-payment_type > option[value = Cash]').removeAttr('disabled').attr('selected', true);
				}
			break;
			
			case 'input-cargo_type':
				if (this.value == 'Cargo') {
		    		if (cargo_type == 'Documents') {
		    			if (recipient_address.match(/почтомат|поштомат/i)) {
							$('[for = input-width], [for = input-length], [for = input-height]').parent().show();
						}
						$('[for = input-volume_weight], [for = input-volume_general]').parent().show();
					} else if (cargo_type == 'TiresWheels') {
						$('[for = input-weight], [for = input-volume_weight], [for = input-volume_general]').parent().show();							}	
					
					$('#input-cargo_description').removeAttr('disabled').val('');
		    		
		   		} else if (this.value == 'Documents') {
		    		if (cargo_type == 'Cargo' || cargo_type == 'Pallet') {
		    			if (recipient_address.match(/почтомат|поштомат/i)) {
							$('[for = input-width], [for = input-length], [for = input-height]').parent().hide();
						}
						
						$('[for = input-volume_weight], [for = input-volume_general]').parent().hide();
					} else if (cargo_type == 'TiresWheels') {
						$('[for = input-weight]').parent().show();
					}
					$('#input-cargo_description').attr('disabled', true).val('Документи');
		   		}
				cargo_type = this.value;
			break;
			
			case 'input-backward_delivery':
				if (this.value == 'Money') {
					$('[for = input-backward_delivery_total], [for = input-backward_delivery_payer]').parent().show();
				} else if (backward_delivery == 'Money' && this.value != 'Money') {
					$('[for = input-backward_delivery_total], [for = input-backward_delivery_payer]').parent().hide();
				}
				backward_delivery = this.value;
			break;
			
			case 'input-volume_general':
				$('#input-volume_weight').val((this.value * 250).toFixed(3));
			break;
			
			case 'seat-volume':
				$(this).parents('tr').find('#seat-volume-weight').val((this.value * 250).toFixed(3));
			break;
			
			case 'input-width':
			case 'input-length':
			case 'input-height':
				$('#input-volume_general').val(($('#input-width').val() * $('#input-length').val() * $('#input-height').val() / 1000000).toFixed(3)).trigger('change');
			break;
			
			case 'seat-width':
			case 'seat-length':
			case 'seat-height':
				var row = $(this).parents('tr'), width = row.find('#seat-width').val(), length = row.find('#seat-length').val(), height = row.find('#seat-height').val();
				row.find('#seat-volume').val((width * length * height / 1000000).toFixed(3)).trigger('change');	
			break;
		}
		
		validateForm(this);
	});
	
	// Creat EI
	$('form').on('click', '#button-create', function () {
		var button = $('#button-create');
		
		$.ajax( {
			url: 'index.php?route=sale/novaposhta_ei/addEI&token=<?php echo $token; ?>',
	   		type: 'POST',
	   		data: $('input, select, textarea').filter(':visible'),
	   		dataType: 'json',
	   		beforeSend: function() {
	   			button.replaceWith('<div class="progress" id="button-create"><div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%"><span class="sr-only">100% Complete</span></div></div>');
	   		},
	  		success: function(json) {
	  				if (json['redirect']) {
						$(location).attr('href', json['redirect'].replace(/&amp;/g, '&'));
					} else {
						checkErrors(json);
					}
	   		},
	   		error: function (jqXHR, textStatus, errorThrown) {
	   			console.log(textStatus);
	      	},
	      	complete: function(json){
				$('#button-create').replaceWith(button);
				
				if (json['errors'] != 'undefined' || json['warnings'] != 'undefined') {
					$('body').animate({ scrollTop: $('.has-error, .alert').offset().top }, 1000); 
				}
			}
	   	} );
	});
	
	// Autocomplete
	$('input[name = recipient_city], input[name = cargo_description]').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=sale/novaposhta_ei/autocomplete&token=<?php echo $token; ?>&' + this.name + '=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['Description'],
							value: item['Ref']
						}
					}));
				}
			});
		},
		select: function(item) {
			$(this).val(item['value']).trigger('change');
		}
	});
});	
//--></script>
<?php echo $footer; ?>