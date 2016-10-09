<?php
class ModelShippingNovaPoshta extends Model {
	function getQuote($address) {
		$this->load->language('shipping/novaposhta');
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('novaposhta_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('novaposhta_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$cost = 0;
			$period = 0;
			$recipient = '';
									
			// Cart weight
			$weight = $this->weight->convert($this->cart->getWeight(), $this->config->get('config_weight_class_id'), 'kg');
				
			if (!$weight && $this->config->get('novaposhta_weight')) {
				$weight = $this->config->get('novaposhta_weight');
			}
					
			$this->session->data['shippingdata']['cart_weight'] = $weight;
			
			// Load Novaposhta class
			if ($this->config->get('novaposhta_cost') ||  $this->config->get('novaposhta_delivery_period')) {
				$this->load->helper('novaposhta');
				$novaposhta = new NovaPoshta($this->registry);
				
				if (!empty($address['city'])) {
					$recipient = $novaposhta->getCities($address['city'], 'Ref');
				}
			}
			
			// Cost of delivery	
			if ($this->config->get('novaposhta_cost') && $recipient) {
				$sub_total = $this->currency->convert($this->cart->getSubTotal(), $this->config->get('config_currency'), 'UAH');
				
				if (!$this->config->get('novaposhta_free_shipping') || ($this->config->get('novaposhta_free_shipping') > 0 && $sub_total < $this->config->get('novaposhta_free_shipping')) && $weight) {
					
					$properties = array (
						'CitySender'	=> $this->config->get('novaposhta_sender_city'),
						'CityRecipient'	=> $recipient,
						'ServiceType'	=> $this->config->get('novaposhta_service_type'),
						'Weight'		=> $weight,
						'Cost'			=> $sub_total,
						'DateTime' 		=> date('d.m.Y')
					);
										
					$cost = $novaposhta->getDocumentPrice($properties);
						
					if (!$cost && $this->config->get('novaposhta_tariff_calculation')) {
						$cost = $novaposhta->tariffCalculation($this->config->get('novaposhta_service_type'), $weight, $sub_total);
					}
						
					$currency_value = $this->currency->getValue('UAH');
					if($currency_value != 1) {
						$cost /= $currency_value;
					}
				}
			}

			// Period of delivery
			if ($this->config->get('novaposhta_delivery_period') && $recipient) {				
				$properties = array (
					'CitySender'	=> $this->config->get('novaposhta_sender_city'),
					'CityRecipient'	=> $recipient,
					'ServiceType'	=> $this->config->get('novaposhta_service_type')
				);
				
				$period = $novaposhta->getDocumentDeliveryDate($properties);
			}
			
			$quote_data = array();
			
			$quote_data['novaposhta'] = array(
				'code'         => 'novaposhta.novaposhta',
				'title'        => $this->language->get('text_description'),
				'cost'         => $cost,
				'tax_class_id' => $this->config->get('novaposhta_tax_class_id'),
				'text'         => ($cost) ? $this->currency->format($this->tax->calculate($cost, $this->config->get('novaposhta_tax_class_id'), $this->config->get('config_tax'))) : '',
				'text_period'  => $this->language->get('text_period'),
				'period'  	   => $period
			);

			$method_data = array(
				'code'       => 'novaposhta',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('novaposhta_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}