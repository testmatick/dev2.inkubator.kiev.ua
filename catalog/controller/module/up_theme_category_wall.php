<?php
class ControllerModuleUPThemeCategoryWall extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$data['category_wall'] = $setting['category_wall'][$this->config->get('config_language_id')];

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$data['ca_id'] = $setting['ca_id'];
		$data['cw_status_caticons'] = $setting['status_caticons'];
		$data['cw_status_subcategories'] = $setting['status_subcategories'];

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
	
		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				
				$image = $category['image'];
                $thumb = $this->model_tool_image->resize($image, 165, 150);
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'thumb'    => $thumb,	
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
		}
		
		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/up_theme_category_wall.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/up_theme_category_wall.tpl', $data);
		} else {
			return $this->load->view('default/template/module/up_theme_category_wall.tpl', $data);
		}
	}
}