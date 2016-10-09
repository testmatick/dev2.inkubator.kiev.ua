<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$data['base'] = HTTPS_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}

		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$this->load->language('common/header');


			$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description WHERE field = 'custom_alt'");
			$exists = 0;
			foreach ($query->rows as $index) {$exists++;}
			if (!$exists) {$this->db->query("ALTER TABLE " . DB_PREFIX . "product_description ADD COLUMN `custom_alt` varchar(255) NULL DEFAULT '';");}
			

			$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description WHERE field = 'custom_h1'");
			$exists = 0;
			foreach ($query->rows as $index) {$exists++;}
			if (!$exists) {$this->db->query("ALTER TABLE " . DB_PREFIX . "product_description ADD COLUMN `custom_h1` varchar(255) NULL DEFAULT '';");}
			

			$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description WHERE field = 'custom_h2'");
			$exists = 0;
			foreach ($query->rows as $index) {$exists++;}
			if (!$exists) {$this->db->query("ALTER TABLE " . DB_PREFIX . "product_description ADD COLUMN `custom_h2` varchar(255) NULL DEFAULT '';");}
			

			$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description WHERE field = 'custom_imgtitle'");
			$exists = 0;
			foreach ($query->rows as $index) {$exists++;}
			if (!$exists) {$this->db->query("ALTER TABLE " . DB_PREFIX . "product_description ADD COLUMN `custom_imgtitle` varchar(255) NULL DEFAULT '';");}
			
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_order'] = $this->language->get('text_order');
		$data['text_processing_status'] = $this->language->get('text_processing_status');
		$data['text_complete_status'] = $this->language->get('text_complete_status');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_customer'] = $this->language->get('text_customer');
		$data['text_online'] = $this->language->get('text_online');
		$data['text_approval'] = $this->language->get('text_approval');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_review'] = $this->language->get('text_review');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_front'] = $this->language->get('text_front');
		$data['text_help'] = $this->language->get('text_help');
		$data['text_homepage'] = $this->language->get('text_homepage');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
		$data['text_logout'] = $this->language->get('text_logout');

		if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
			$data['logged'] = '';

			$data['home'] = $this->url->link('common/dashboard', '', 'SSL');
		} else {
			$data['logged'] = true;

			$data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');
			$data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], 'SSL');

					/**/
					$this->load->model('sale/newfastorder');
					$data['countfastorder'] = $this->model_sale_newfastorder->countTotalNewFastorder();
					$data['newfastorder'] = $this->url->link('sale/newfastorder', 'token=' . $this->session->data['token'], 'SSL');//!
					$data['text_fastorder'] = $this->language->get('text_fastorder');//!
					/**/
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS  " . DB_PREFIX . "newfastorder (fast_id int(11) NOT NULL primary key AUTO_INCREMENT,
		name varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		order_id text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		total text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		telephone varchar(30) NOT NULL,
		email_buyer varchar(90) NOT NULL,
		date_added datetime NOT NULL,
		date_modified datetime NOT NULL,
		status_id int(11) NOT NULL,
		comment text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		newfastorder_url text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		comment_buyer text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		username text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL)");
		
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS  " . DB_PREFIX . "newfastorder_product (id int(11) NOT NULL primary key AUTO_INCREMENT,
		order_id text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		product_id text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		product_name text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		product_image text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		model text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		quantity text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		total text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
		price text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL)");
	
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS  ". DB_PREFIX ."key_newfastorder (`key` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, license_key text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL)");
		$license_key = $this->db->query("SELECT `key` FROM ". DB_PREFIX ."key_newfastorder WHERE `key`='local_key' LIMIT 1");
		if ($license_key->num_rows <= 0) { $this->db->query("INSERT INTO ". DB_PREFIX ."key_newfastorder (`key`, `license_key`) VALUES('local_key', '');"); }
		 
				$query = $this->db->query("DESC `".DB_PREFIX."newfastorder` email_buyer");
				 if (!$query->num_rows) { 
				     $this->db->query("ALTER TABLE `" . DB_PREFIX . "newfastorder` ADD `email_buyer` varchar(90) NOT NULL");
				 }
			

			// Orders
			$this->load->model('sale/order');

			// Processing Orders
			$data['processing_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_processing_status'))));
			$data['processing_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_processing_status')), 'SSL');

			// Complete Orders
			$data['complete_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_complete_status'))));
			$data['complete_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_complete_status')), 'SSL');

			// Returns
			$this->load->model('sale/return');

			$return_total = $this->model_sale_return->getTotalReturns(array('filter_return_status_id' => $this->config->get('config_return_status_id')));

			$data['return_total'] = $return_total;

			$data['return'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], 'SSL');

			// Customers
			$this->load->model('report/customer');

			$data['online_total'] = $this->model_report_customer->getTotalCustomersOnline();

			$data['online'] = $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], 'SSL');

			$this->load->model('customer/customer');

			$customer_total = $this->model_customer_customer->getTotalCustomers(array('filter_approved' => false));

			$data['customer_total'] = $customer_total;
			$data['customer_approval'] = $this->url->link('customer/customer', 'token=' . $this->session->data['token'] . '&filter_approved=0', 'SSL');

			// Products
			$this->load->model('catalog/product');

			$product_total = $this->model_catalog_product->getTotalProducts(array('filter_quantity' => 0));

			$data['product_total'] = $product_total;

			$data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&filter_quantity=0', 'SSL');

			// Reviews
			$this->load->model('catalog/review');

			$review_total = $this->model_catalog_review->getTotalReviews(array('filter_status' => false));

			$data['review_total'] = $review_total;

			$data['review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . '&filter_status=0', 'SSL');

			// Affliate
			$this->load->model('marketing/affiliate');

			$affiliate_total = $this->model_marketing_affiliate->getTotalAffiliates(array('filter_approved' => false));

			$data['affiliate_total'] = $affiliate_total;
			$data['affiliate_approval'] = $this->url->link('marketing/affiliate', 'token=' . $this->session->data['token'] . '&filter_approved=1', 'SSL');

			$data['alerts'] = $customer_total + $product_total + $review_total + $return_total + $affiliate_total;

			// Online Stores
			$data['stores'] = array();

			$data['stores'][] = array(
				'name' => $this->config->get('config_name'),
				'href' => HTTP_CATALOG
			);

			$this->load->model('setting/store');

			$results = $this->model_setting_store->getStores();

			foreach ($results as $result) {
				$data['stores'][] = array(
					'name' => $result['name'],
					'href' => $result['url']
				);
			}
		}

		return $this->load->view('common/header.tpl', $data);
	}
}
