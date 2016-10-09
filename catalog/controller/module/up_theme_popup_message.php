<?php
class ControllerModuleUPThemePopupMessage extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['up_theme_popup_message'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/up_theme_popup_message.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/up_theme_popup_message.tpl', $data);
			} else {
				return $this->load->view('default/template/module/up_theme_popup_message.tpl', $data);
			}
		}
	}
}