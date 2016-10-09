<?php
class ModelModuleShippingData extends Model {	
	public function getNovaPoshtaCities($area, $search = '') {
		$description = ($this->language->get('code') == 'uk') ? 'Description' : 'DescriptionRu';
		$area = $this->db->escape($area);
		$search = $this->db->escape($search);
				
		$sql ="SELECT `" . $description . "` as `Description` FROM `" . DB_PREFIX . "novaposhta_cities` WHERE `Area` = '" . $area . "'";
		
		if ($search) {
			$sql .= " AND  `" . $description . "` LIKE '" . $search . "%'";
		}
		
		$sql .= " ORDER BY  `" . $description . "`";
		
		return $this->db->query($sql)->rows;
	}
	
	public function getNovaPoshtaWarehouses($city, $search = '') {
		$description = ($this->language->get('code') == 'uk') ? 'Description' : 'DescriptionRu';
		$city_description = ($this->language->get('code') == 'uk') ? 'CityDescription' : 'CityDescriptionRu';
		$city = $this->db->escape($city);
		$search = $this->db->escape($search);
				
		if (ctype_digit($search)) {
			$sql = "SELECT `" . $description . "` as `Description` FROM `" . DB_PREFIX . "novaposhta_warehouses` WHERE `" . $city_description . "` = '" . $city . "'";
			
			if ($search) {
				$sql .= " AND `Number` LIKE '" . $search . "%'";
			}
		} else {
			$sql = "SELECT `" . $description . "` as `Description` FROM `" . DB_PREFIX . "novaposhta_warehouses` WHERE `" . $city_description . "` = '" . $city . "'";
			
			if ($search) {
				$sql .= " AND `" . $description . "` LIKE '%" . $search . "%'";
			}
		}
		
		if ($this->config->get('novaposhta_warehouse_types')) {
			$sql .= " AND `TypeOfWarehouse` = '" . $this->config->get('novaposhta_warehouse_types') . "'";
		}
		
		if ($this->config->get('novaposhta_warehouses_filter_weight')) {
			$sql .= " AND (`TotalMaxWeightAllowed` >= " . $this->session->data['shippingdata']['cart_weight'] . " OR (`TotalMaxWeightAllowed` = 0 AND (`PlaceMaxWeightAllowed` >= " . $this->session->data['shippingdata']['cart_weight'] . " OR `PlaceMaxWeightAllowed` = 0)))";
		}
		
		$sql .= " ORDER BY `Number`+0";
				
		return $this->db->query($sql)->rows;	
	}
}