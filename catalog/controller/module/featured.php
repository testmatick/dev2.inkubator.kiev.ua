<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_new_prod'] = $this->language->get('text_new_prod');
		$data['text_quickview'] = $this->language->get('text_quickview');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

      if (!empty($setting['product'])) {
		$products = array_slice($setting['product'], 0, (int)$setting['limit']);

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}
				
				$swapimages = $this->model_catalog_product->getProductImages($product_info['product_id']);
			    if ($swapimages) {
			    	$swapimage = $this->model_tool_image->resize($swapimages[0]['image'], $setting['width'], $setting['height']);
			    } else {
			    	$swapimage = false;
		    	}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'thumb_swap'  => $swapimage,
					'newstart'    => $product_info['date_added'],
					'quickview'   => $this->url->link('product/quickview', 'product_id=' . $product_info['product_id']),
					'name'        => $product_info['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'brand'       => $product_info['manufacturer'],
					'brand_url'   => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id'])
				);
			}
		}
	  }

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}