<div class="col-sm-12 text-center">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td class="image"><?php echo $text_column_photo_product;?></td>
				<td class="name"><?php echo $text_column_name_product;?></td>				
				<td class="quantity"><?php echo $text_column_quantity_product;?></td>
				<td class="price"><?php echo $text_column_price_product;?></td>
				<td class="total"><?php echo $text_column_total_product;?></td>
			</tr>
		</thead>
		<tbody>
			<?php foreach($products as $product) { ?>
					<tr>
						<td class="image"><?php if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
							<?php } ?>
						</td>
						<td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<div>							
							<?php foreach ($product['option'] as $option) { ?>
							- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />																	
							<?php } ?>							
							</div>
						</td>	
						<td>
						<div class="price-quantity-quickorder text-center">		
							<div class="quantity_quickorder">
								<input type="button" id="decrease_quickorder"  value="-" onclick="btnminus_<?php echo $product['cart_id']; ?>('1');updateQuantity('<?php echo $product['cart_id']; ?>');" />
								<input size="2" name="quantity[<?php echo $product['cart_id']; ?>]" type="text" class="qty_fastorder" onchange="updateQuantity('<?php echo $product['cart_id']; ?>');" id="htop_fastorder<?php echo $product['cart_id']; ?>" value="<?php echo $product['quantity']; ?>" />		
								<input type="button" id="increase_quickorder"  value="+" onclick="btnplus_<?php echo $product['cart_id']; ?>();updateQuantity('<?php echo $product['cart_id']; ?>');" />
							</div>	
						</div>	
						<script type="text/javascript"><!--
									function btnminus_<?php echo $product['cart_id']; ?>(a){									
									document.getElementById("htop_fastorder<?php echo $product['cart_id']; ?>").value>a?document.getElementById("htop_fastorder<?php echo $product['cart_id']; ?>").value--:document.getElementById("htop_fastorder<?php echo $product['cart_id']; ?>").value=a;															
									}									
									function btnplus_<?php echo $product['cart_id']; ?>(){
									document.getElementById("htop_fastorder<?php echo $product['cart_id']; ?>").value++;									
									};							
						//--></script>
						</td>
						<td class="price left"><?php echo $product['price']; ?></td>
						<td class="total"><?php echo $product['total']; ?></td>
					</tr>
					
			<?php } ?>	
		</tbody>		
	</table>
</div>
<div class="col-xs-12 col-sm-6 col-md-6"></div>
<div class="col-xs-12 col-sm-6 col-md-6 form-group">	
    <table class="table table-bordered">
        <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
        <?php } ?>
		<input type="hidden" value="<?php echo $total_order; ?>" name="total_order" />
		<input type="hidden" id="quickorder_url" value="" name="url_site"  />
    </table>
</div>

