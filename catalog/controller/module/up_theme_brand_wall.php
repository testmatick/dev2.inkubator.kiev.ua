<?php
class ControllerModuleUPThemeBrandWall extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$data['brand_wall'] = $setting['brand_wall'][$this->config->get('config_language_id')];

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$data['ca_id'] = $setting['ca_id'];
		$data['cw_brands_display_style'] = $setting['brands_display_style'];

		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		$results = $this->model_catalog_manufacturer->getManufacturers();
		foreach ($results as $result) {	
			if ($result['image']) {
						$image = $result['image'];
					} else {
						$image = '';
					}			
			$data['manufacturers'][] = array(
				'name' => $result['name'],
				'image' => $this->model_tool_image->resize($image, 170, 100),
				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
			);
		}		

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/up_theme_brand_wall.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/up_theme_brand_wall.tpl', $data);
		} else {
			return $this->load->view('default/template/module/up_theme_brand_wall.tpl', $data);
		}
	}
}