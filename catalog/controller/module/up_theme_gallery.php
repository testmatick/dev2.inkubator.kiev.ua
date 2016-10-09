<?php
class ControllerModuleUPThemeGallery extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$data['gallery'] = $setting['gallery'][$this->config->get('config_language_id')];
		
		$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

		$this->load->model('design/banner');
		$this->load->model('tool/image');
				
		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		$data['pr_id'] = $setting['pr_id'];

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/up_theme_gallery.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/up_theme_gallery.tpl', $data);
		} else {
			return $this->load->view('default/template/module/up_theme_gallery.tpl', $data);
		}
	}
}