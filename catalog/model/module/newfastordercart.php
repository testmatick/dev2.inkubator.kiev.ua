<?php
class ModelModuleNewfastordercart extends Model {	
	public function addOrder($data) {	
	
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
				total = '" . (float)$data['total_order'] . "',
				order_status_id = '". $this->config->get('config_order_status_id')."',
				ip = '" . $this->db->escape($data['ip']) . "',
				forwarded_ip = '" .  $this->db->escape($data['forwarded_ip']) . "',
				user_agent = '" . $this->db->escape($data['user_agent']) . "',
				accept_language = '" . $this->db->escape($data['accept_language']) . "',
				date_added = NOW(),
				date_modified = NOW()");
			
			
			
			
				$order_id = $this->db->getLastId();						
				if (isset($data['products'])) {
					foreach ($data['products'] as $product) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$product['product_id'] . "', name = '" . $this->db->escape($product['name']) . "', model = '" . $this->db->escape($product['model']) . "', quantity = '" . (int)$product['quantity'] . "', price = '" . (float)$product['price'] . "', total = '" . (float)$product['total'] . "', tax = '" . (float)$product['tax'] . "', reward = '" . (int)$product['reward'] . "'");

						$order_product_id = $this->db->getLastId();

						foreach ($product['option'] as $option) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$option['product_option_id'] . "', product_option_value_id = '" . (int)$option['product_option_value_id'] . "', name = '" . $this->db->escape($option['name']) . "', `value` = '" . $this->db->escape($option['value']) . "', `type` = '" . $this->db->escape($option['type']) . "'");
						}
					}
				}				
				if (isset($data['total']['totals'])) {
					foreach ($data['total']['totals'] as $total) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = '" . $this->db->escape($total['code']) . "', title = '" . $this->db->escape($total['title']) . "', `value` = '" . (float)$total['value'] . "', sort_order = '" . (int)$total['sort_order'] . "'");
					}
				}				
			/*FAST ADD*/
			if (isset($data['products'])) {
					foreach ($data['products'] as $product) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "newfastorder_product SET 
						product_name = '" . $this->db->escape($product['name']) . "',	
						order_id = '" . (int)$order_id . "',
						product_id = '" . (int)$product['product_id'] . "',
						price = '" . (float)$product['price'] . "',
						model = '" . $this->db->escape($product['model']) . "',
						product_image = '" . $product['thumb']  . "',												
						quantity = '" . (int)$product['quantity'] . "',						
						total = '" . (float)$product['total'] . "'");
					}
				}
			
		
			$query = $this->db->query("INSERT INTO " . DB_PREFIX . "newfastorder SET 
				name = '" . $data['name_fastorder']  . "',
				email_buyer = '" . $data['email_buyer']  . "',
				newfastorder_url = '" . $data['url_site']  . "',
				comment_buyer = '" . $data['comment_buyer']  . "',
				telephone = '" . $data['phone'] . "',
				total = '" . $this->currency->format($data['total_order']) . "',
				order_id = '" . (int)$order_id . "',
				date_added = NOW(),
				date_modified = NOW(),
				status_id = '0',
				comment = ''");
			
		
	}
}
?>
