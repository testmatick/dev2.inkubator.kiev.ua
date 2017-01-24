<?php  
class ControllerModuleCatalog extends Controller {
	protected function index($setting) {

		$this->document->addStyle('catalog/view/theme/default/stylesheet/catalog.css');
	
		$this->language->load('module/catalog');
		
    	$this->data['heading_title']	= $this->language->get('heading_title');
		$this->data['text_special'] 	= $this->language->get('text_special');
		$this->data['text_other']  		= $this->language->get('text_other');
		$this->data['uptop']  			= $setting['uptop'];
		
		if (isset($this->request->get['product_id'])) {
		
		$product_id = (int)$this->request->get['product_id'];
			
		$this->data['product_id'] = $product_id;
	
		$this->load->model('catalog/product');
		
		$this->load->model('catalog/manufacturer');
		
		$this->load->model('tool/image');

		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		$this->data['active_manufacturer'] = $product_info['manufacturer_id'];
		
		$categories = '';
		
		$categories = implode(', ' , $this->getCategories($product_id));
		
		
		$products = array();
		
	
		$products = $this->getProducts($categories, $setting['cache']);
	
		

	
		$manufacturers = array();
		
		if (is_array($products)) {
		
		foreach ($products as $product) {
		
		if (!isset($product['manufacturer_id'])) {
		
			$product['manufacturer_id'] = 0;
			$product['manufacturer_name'] = $this->data['text_other'];
			
			}
		
		
			if (($product['product_id'] != $product_id) || $setting['active_product']) {
			
			
				$manufacturers[$product['manufacturer_id']]['name'] = $product['manufacturer_name'];
				$manufacturers[$product['manufacturer_id']]['manufacturer_id'] = $product['manufacturer_id'];
			
				$manufacturers[$product['manufacturer_id']]['products'][]= array(
				
					'product_id' 		=> $product['product_id'],
					'name' 				=> $product['product_name'],
					'special' 			=> (isset($product['special']) && $setting['special']) ? true : false,
					'qty' 			    => (int)$product['quantity'] == 0 ? false : true,
					'image'             => $product['image'] ? $image = $this->model_tool_image->resize($product['image'], $setting['image_width'], $setting['image_height']) : false,
					'href'   			=> $this->url->link('product/product', 'product_id=' . $product['product_id'])
				
				);
			
			}
		
		};
		
		}
		
		
	
		foreach ($manufacturers as $manufacturer) {
		
			$count = (count($manufacturers[$manufacturer['manufacturer_id']]['products']));
			$manufacturers[$manufacturer['manufacturer_id']]['name'] = $manufacturers[$manufacturer['manufacturer_id']]['name'] . '<span class="total"> ('. $count. ')</span>';
		
		}
	
		
		$this->data['manufactureres'] = $manufacturers;
		
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/catalog.tpl')) {
		
				$this->template = $this->config->get('config_template') . '/template/module/catalog.tpl';
				
			} else {
			
				$this->template = 'default/template/module/catalog.tpl';
				
			}
		
			$this->render();
			
		} else {
		
			die;
	
		}	
			
  	}
	
	
	public function getProducts($category, $cache) {
			
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
		$this->load->model('catalog/category');
		
		$catinfo = $this->model_catalog_category->getCategory($category);
		
		$product_data = array();
		
		if (!empty($catinfo)) {
		
		
	
		if ($cache) {
			$product_data = $this->cache->get('catalog.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $category);
			} else {
			$product_data = array();
			}
		
		
		if (empty($product_data)) {
		
			$price_sql = "(SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special,";
		
			$sql = "SELECT p.product_id, pd.name as product_name, p.image, p.quantity, ". $price_sql ." m.name as manufacturer_name, m.manufacturer_id  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)"; 
			
		    $sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";		

			$sql .= " LEFT JOIN " . DB_PREFIX . "manufacturer m ON (m.manufacturer_id = p.manufacturer_id)";						
					
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
			
			$sql .= " AND p2c.category_id IN (" . (int)$category . ")";
			
			$sql .= " ORDER BY m.name ASC, product_name";	
					
			$query = $this->db->query($sql);
			
			$product_data = $query->rows;
					
			$this->cache->set('catalog.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $category, $product_data);
			
			}
		
		
		}
		
	
		return $product_data;
		
		
	}
	
	public function getCategories($product_id) {
	
		
		$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
		
		$categories = array();
		
		foreach($query->rows as $category) {
			$categories[] =  $category['category_id'];
		};
		
		

		return $categories;
		
	}	
	
	

}
?>