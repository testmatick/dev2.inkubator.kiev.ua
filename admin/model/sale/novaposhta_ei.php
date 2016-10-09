<?php
class ModelSaleNovaPoshtaEI extends Model {
	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT op.quantity, op.product_id, p.weight, p.weight_class_id, p.length, p.width, p.height FROM " . DB_PREFIX . "order_product AS op INNER JOIN " . DB_PREFIX . "product AS p ON op.product_id=p.product_id AND op.order_id=" . $order_id);

		return $query->rows;
	}
	
	public function getCitiesAndAreas($filter) {
		$select = ($this->language->get('code') == 'uk') ? 'Description' : 'DescriptionRu';
		$filter = $this->db->escape($filter);
		$data = array();
		
		$results = $this->db->query("SELECT `" . $select . "`, `Area` FROM `" . DB_PREFIX . "novaposhta_cities` WHERE " . $select . " LIKE '" . $filter . "%'")->rows;
		
		foreach($results as $result) {
			$data[] = array(
					'Ref' => $result[$select],
					'Description' => $result[$select] . ', ' . $this->novaposhta->getAreas($result['Area'], 'Descr') . ' обл.'
				);
		}
		
		return $data;
	}
	
	public function getAddress($address, $city) {
		$address = $this->db->escape($address);
		$city = $this->db->escape($city);
				
		$result = $this->db->query("SELECT `Ref` FROM `" . DB_PREFIX . "novaposhta_warehouses` WHERE (`Ref` = '" . $address . "' OR `Description` = '" . $address . "' OR `DescriptionRu` = '" . $address . "') AND (`CityRef` = '" . $city . "' OR `CityDescription` = '" . $city . "' OR `CityDescriptionRu` = '" . $city . "')")->row;

		return (isset($result['Ref'])) ? $result['Ref'] : false;
	}
}