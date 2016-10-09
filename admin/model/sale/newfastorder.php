<?php
class ModelSaleNewfastorder extends Model {

	public function editNewfastorder($newfastorder_id,$data) {
      	$this->db->query("UPDATE " . DB_PREFIX . "newfastorder SET comment = '" . $this->db->escape($data['comment']) . "', username = '" . $this->db->escape($data['username']) . "', status_id = '" . (int)$data['status_id'] . "', date_modified = NOW() WHERE fast_id = '" . (int)$newfastorder_id . "'");	
	}

	
	public function editNewfastorders($newfastorder_id) {
      	$this->db->query("UPDATE " . DB_PREFIX . "newfastorder SET status_id = '1', date_modified = NOW() WHERE fast_id = '" . (int)$newfastorder_id . "'");


	}
	
	public function deleteNewfastorder($newfastorder_id) {
	$del_prod_fast = $this->db->query("SELECT order_id FROM ". DB_PREFIX ."newfastorder WHERE fast_id = '". $newfastorder_id ."'");
			foreach($del_prod_fast->rows as $del_prod){
				$this->db->query("DELETE FROM " . DB_PREFIX . "newfastorder_product WHERE order_id = '" . $del_prod['order_id'] . "'");
			}
		$this->db->query("DELETE FROM " . DB_PREFIX . "newfastorder WHERE fast_id = '" . (int)$newfastorder_id . "'");
		
			
		$this->cache->delete('newfastorder');
	}	
	
	public function getNewfastorder($newfastorder_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newfastorder WHERE fast_id = '" . (int)$newfastorder_id . "'");
		
		return $query->row;
	}
	
	public function getNewfastorders($data = array()) {

		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "newfastorder";
			
			$sort_data = array(
				'fast_id',
				'name',
				'telephone'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY fast_id";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
			
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}					

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}				
			
			$query = $this->db->query($sql);
		
			return $query->rows;
		} else {
			$newfastorder_data = $this->cache->get('newfastorder');
		
			if (!$newfastorder_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newfastorder ORDER BY fast_id");
	
				$newfastorder_data = $query->rows;
			
				$this->cache->set('newfastorder', $newfastorder_data);
			}
		 
			return $newfastorder_data;
		}
	}
	
	public function getFastOrderProducts() {
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."newfastorder_product");
		
		return $query->rows;
	}
	public function countTotalNewFastorder() {
		$query = $this->db->query("SELECT COUNT(status_id) AS countfastorder FROM `".DB_PREFIX."newfastorder` WHERE status_id = '0'");
		
		return $query->row['countfastorder'];
	}

	public function getTotalNewfastorders() {

		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "newfastorder"); 
		
		return $query->row['total'];
	}
public function addDbQuickorder() {
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
		$query = $this->db->query("DESC `".DB_PREFIX."newfastorder` email_buyer");
			if (!$query->num_rows) { 
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "newfastorder` ADD `email_buyer` varchar(90) NOT NULL");
			}
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS  ". DB_PREFIX ."key_newfastorder (`key` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, license_key text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL)");
		$license_key = $this->db->query("SELECT `key` FROM ". DB_PREFIX ."key_newfastorder WHERE `key`='local_key' LIMIT 1");
		if ($license_key->num_rows <= 0) { $this->db->query("INSERT INTO ". DB_PREFIX ."key_newfastorder (`key`, `license_key`) VALUES('local_key', '');"); }
		   

	}	
}
?>
