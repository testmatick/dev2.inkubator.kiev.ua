<?php
class ControllerModuleShippingData extends Controller {
	public function getShippingData() {
		$json = array();

		if (isset($this->request->post['shipping'])) {
			$shipping = $this->request->post['shipping'];
		}
		
		if (isset($this->request->post['method'])) {
			$method = $this->request->post['method'];
		}
		
		if (isset($this->request->post['filter'])) {
			$filter = $this->request->post['filter'];
		}
		
		if (isset($this->request->post['search'])) {
			$search = $this->request->post['search'];
		}
		
		switch($shipping) {
			case 'novaposhta.novaposhta':
				$this->load->model('module/shippingdata');
				
				if ($method == 'getCities') {
					$this->load->helper('novaposhta');
					$novaposhta = new NovaPoshta($this->registry);
					
					$this->load->model('localisation/zone');
					
					$zone_info = $this->model_localisation_zone->getZone($filter);
					
					if ($zone_info) {
						$filter = $novaposhta->getAreas($zone_info['name'], 'Ref');
					}
					
					$json = $this->model_module_shippingdata->getNovaPoshtaCities($filter, $search);
				} elseif ($method == 'getWarehouses') {
					$json = $this->model_module_shippingdata->getNovaPoshtaWarehouses($filter, $search);
				}
			break;
		}
				
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}