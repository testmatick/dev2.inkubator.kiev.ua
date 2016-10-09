<?php
class ModelModuleNewfastorder extends Model {	

	public function addOrder($data, $product_options) {	
		if($data['config_tax'] =='1'){
		$tax_rates_f_p = $this->tax->getRates($data['price_no_tax'], $data['tax_class_id_total']);	
		}
		/*Вычитывать товар со склада*/
		$this_product = $this->db->query("SELECT * FROM ". DB_PREFIX ."product WHERE product_id = '". $data['this_prod_id'] ."'");
		$this_product_info = $this_product->row;		
		if($this_product_info['subtract'] =='1'){
			$quantity_new = $this_product_info['quantity'] - $data['quantity'];
			$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = '". $quantity_new ."' WHERE product_id = '". $data['this_prod_id'] ."'");
		}
		/*--------------------------*/
		
			$this->db->query("INSERT INTO `" . DB_PREFIX . "order` SET 
				invoice_prefix = 'fastorder-',
				store_id = '" . (int)$data['store_id'] . "',
				store_name = '" . $this->db->escape($data['store_name']) . "',
				customer_id = '" . (int)$data['customer_id'] . "',
				customer_group_id = '" . (int)$data['customer_group_id'] . "',
				firstname = '" . $this->db->escape($data['name_fastorder']) . "',
				email = '" . $data['email_buyer'] . "',
				language_id = '" . (int)$data['language_id'] . "',
				currency_code = '" . $data['currency_code'] . "',
				currency_value = '" . $data['currency_value'] . "',
				currency_id = '" . $data['currency_id'] . "',
				payment_method = '" . $data['payment_title'] . "',
				payment_code = '" . $data['payment_code_quickorder'] . "',
				shipping_method = '" . $data['shipping_title'] . "',
				shipping_code = '" . $data['shipping_code_quickorder'] . "',
				store_url = '" . $data['store_url'] . "',
				telephone = '" . $this->db->escape($data['phone']) . "',
				payment_firstname = '" . $this->db->escape($data['name_fastorder']) . "',
				shipping_firstname = '" . $this->db->escape($data['name_fastorder']) . "',
				comment = '" . $this->db->escape($data['comment_buyer']) . "',
				total = '" . (float)$data['total_fast'] . "',
				order_status_id = '". $this->config->get('config_order_status_id')."',
				ip = '" . $this->db->escape($data['ip']) . "',
				forwarded_ip = '" .  $this->db->escape($data['forwarded_ip']) . "',
				user_agent = '" . $this->db->escape($data['user_agent']) . "',
				accept_language = '" . $this->db->escape($data['accept_language']) . "',
				date_added = NOW(),
				date_modified = NOW()");

				$order_id = $this->db->getLastId();						
				
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET 
				order_id = '" . (int)$order_id . "',
				product_id = '" . (int)$data['this_prod_id'] . "',
				name = '" . $this->db->escape($data['prod_name']) . "',
				model = '" . $this->db->escape($this_product_info['model']) . "',
				quantity = '" . (int)$data['quantity'] . "',
				price = '" . (float)$data['price_no_tax'] . "',
				total = '" . (float)$data['price_no_tax']*$data['quantity']. "',
				tax = '" . (float)$this->tax->getTax($data['price_no_tax'], $data['tax_class_id_total']) . "',
				reward = ''");	

				
				$order_product_id = $this->db->getLastId();
			
			foreach($product_options as $product_option){
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET 
					order_id = '". $order_id."',
					order_product_id = '".$order_product_id."',
					product_option_id = '" . $product_option['product_option_id'] . "',
					product_option_value_id = '" . (int)$product_option['product_option_value_id'] . "',
					type = '". $product_option['type'] ."',
					name = '". $product_option['name'] ."',
					`value` = '" . $product_option['value'] . "'");
			}
			
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET
			order_id = '" . (int)$order_id . "',
			code = 'sub_total',
			title = 'Sub-Total',
			`value` = '" . (float)$data['price_no_tax']*$data['quantity'] . "',
			sort_order = '1'");
			
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET
			order_id = '" . (int)$order_id . "',
			code = 'shipping',
			title = '" . $data['shipping_title'] . "',
			`value` = '" . (float)$data['price_shipping_value'] . "',
			sort_order = '3'");
			
			if($data['config_tax'] =='1'){
				foreach($tax_rates_f_p as $tax_rate){
					$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET 
					order_id = '" . (int)$order_id . "',
					code = 'tax',
					title = '". $tax_rate['name'] ."',
					`value` = '". (float)$tax_rate['amount']*$data['quantity'] ."',
					sort_order = '5'");
				}	
			}
			
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET 
				order_id = '" . (int)$order_id . "',
				code = 'total',
				title = 'Total',
				`value` = '" . (float)$data['total_fast'] . "',
				sort_order = '9'");

			/*FAST ADD*/
			
			$query = $this->db->query("INSERT INTO " . DB_PREFIX . "newfastorder_product SET product_name = '" . $data['prod_name']  . "',
				order_id = '" . (int)$order_id . "',
				product_id = '". $data['this_prod_id'] ."',
				price = '". $data['price_no_tax'] ."',
				total = '" . (float)$data['total_fast'] . "',
				product_image = '" . $data['prod_image']  . "',
				model = '" . $this->db->escape($this_product_info['model']) . "',
				quantity = '". $data['quantity'] ."'");	
			
		
			$query = $this->db->query("INSERT INTO " . DB_PREFIX . "newfastorder SET 
				name = '" . $data['name_fastorder']  . "',
				email_buyer = '" . $data['email_buyer']  . "',
				newfastorder_url = '" . $data['url_site']  . "',
				comment_buyer = '" . $data['comment_buyer']  . "',
				telephone = '" . $data['phone'] . "',
				total = '" .$this->currency->format($data['total_fast']) . "',
				order_id = '" . (int)$order_id . "',
				date_added = NOW(),
				date_modified = NOW(),
				status_id = '0',
				comment = ''");
			
			
	}
}
?>
