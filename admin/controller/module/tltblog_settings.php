<?php
class ControllerModuleTltBlogSettings extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/tltblog_settings');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		$this->load->model('tltblog/url_alias');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tltblog', $this->request->post);

			$this->model_tltblog_url_alias->deleteUrlAlias('tltpath=');

			$this->model_tltblog_url_alias->saveUrlAlias($this->db->escape($this->request->post['tltblog_path']), 'tltpath=' . $this->db->escape($this->request->post['tltblog_path']));
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_copyright'] = '&copy; 2016, <a href="http://taiwanleaftea.com" target="_blank" class="alert-link" title="Authentic tea from Taiwan">Taiwanleaftea.com</a>';
		$data['text_donation'] = 'If you find this software usefull and to support further development please buy me a cup of <a href="http://taiwanleaftea.com" class="alert-link" target="_blank" title="Authentic tea from Taiwan">tea</a> or like us on <a href="https://www.facebook.com/taiwanleaftea" class="alert-link" target="_blank" title="Taiwanleaftea on Facebook">Facebook</a>. You can also buy <a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=25345" class="alert-link" target="_blank" title="TLT Blog Pro">TLT Blog Pro</a>, which is a professional version of this extension.';

		$data['entry_path'] = $this->language->get('entry_path');
		$data['entry_path_title'] = $this->language->get('entry_path_title');
		$data['entry_show_path'] = $this->language->get('entry_show_path');
		$data['entry_num_columns'] = $this->language->get('entry_num_columns');
		$data['entry_show_image'] = $this->language->get('entry_show_image');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_seo'] = $this->language->get('entry_seo');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_path'] = $this->language->get('help_path');
		$data['help_path_title'] = $this->language->get('help_path_title');
		$data['help_show_path'] = $this->language->get('help_show_path');
		$data['help_show_image'] = $this->language->get('help_show_image');
		$data['help_num_columns'] = $this->language->get('help_num_columns');
		$data['help_seo'] = $this->language->get('help_seo');
		$data['help_status'] = $this->language->get('help_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['error_seo_disabled'] = $this->language->get('error_seo_disabled');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['tltblog_path'])) {
			$data['error_path'] = $this->error['tltblog_path'];
		} else {
			$data['error_path'] = '';
		}

		if (isset($this->error['tltblog_path_title'])) {
			$data['error_path_title'] = $this->error['tltblog_path_title'];
		} else {
			$data['error_path_title'] = array();
		}

		if (isset($this->error['tltblog_width'])) {
			$data['error_width'] = $this->error['tltblog_width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['tltblog_height'])) {
			$data['error_height'] = $this->error['tltblog_height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/tltblog_settings', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/tltblog_settings', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['tltblog_status'])) {
			$data['tltblog_status'] = $this->request->post['tltblog_status'];
		} else {
			$data['tltblog_status'] = $this->config->get('tltblog_status');
		}

		if (isset($this->request->post['tltblog_path'])) {
			$data['tltblog_path'] = preg_replace('/\s/', '', $this->request->post['tltblog_path']);
		} elseif ($this->config->has('tltblog_path')) {
			$data['tltblog_path'] = $this->config->get('tltblog_path');
		} else {
			$data['tltblog_path'] = 'blogs';
		}

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['tltblog_path_title'])) {
			$data['tltblog_path_title'] = $this->request->post['tltblog_path_title'];
		} elseif ($this->config->has('tltblog_path_title')) {
			$data['tltblog_path_title'] = $this->config->get('tltblog_path_title');
		} else {
			$data['tltblog_path_title'] = array();
		}

		if (isset($this->request->post['tltblog_show_path'])) {
			$data['tltblog_show_path'] = $this->request->post['tltblog_show_path'];
		} elseif ($this->config->has('tltblog_show_path')) {
			$data['tltblog_show_path'] = $this->config->get('tltblog_show_path');
		} else {
			$data['tltblog_show_path'] = '1';
		}

		if (isset($this->request->post['tltblog_num_columns'])) {
			$data['tltblog_num_columns'] = $this->request->post['tltblog_num_columns'];
		} elseif ($this->config->has('tltblog_num_columns')) {
			$data['tltblog_num_columns'] = $this->config->get('tltblog_num_columns');
		} else {
			$data['tltblog_num_columns'] = '1';
		}

		if (isset($this->request->post['tltblog_show_image'])) {
			$data['tltblog_show_image'] = $this->request->post['tltblog_show_image'];
		} elseif ($this->config->has('tltblog_show_image')) {
			$data['tltblog_show_image'] = $this->config->get('tltblog_show_image');
		} else {
			$data['tltblog_show_image'] = '1';
		}

		if (isset($this->request->post['tltblog_width'])) {
			$data['tltblog_width'] = $this->request->post['tltblog_width'];
		} elseif ($this->config->has('tltblog_width')) {
			$data['tltblog_width'] = (int)$this->config->get('tltblog_width');
		} else {
			$data['tltblog_width'] = 200;
		}

		if (isset($this->request->post['tltblog_height'])) {
			$data['tltblog_height'] = $this->request->post['tltblog_height'];
		} elseif ($this->config->has('tltblog_height')) {
			$data['tltblog_height'] = (int)$this->config->get('tltblog_height');
		} else {
			$data['tltblog_height'] = 200;
		}

		if (isset($this->request->post['tltblog_seo'])) {
			$data['tltblog_seo'] = $this->request->post['tltblog_seo'];
		} else {
			$data['tltblog_seo'] = $this->config->get('tltblog_seo');
		}

		// If you have non-standard SEO module, which doesn't use config_seo_url setting simple replace this if ... else contruction with 
		// $data['tltblog_global_seo_off'] = false;
		// <--begin-->
		if ($this->config->get('config_seo_url')) {
			$data['global_seo_off'] = false;
		} else {
			$data['global_seo_off'] = true;
		} 
		// <---end--->

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/tltblog_settings.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tltblog_settings')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['tltblog_path']) < 3) || (utf8_strlen($this->request->post['tltblog_path']) > 64)) {
			$this->error['tltblog_path'] = $this->language->get('error_path');
		}

		$this->load->model('tltblog/url_alias');

		if (!$this->model_tltblog_url_alias->checkUrlAliasIsFree($this->request->post['tltblog_path'], 'tltpath=' . $this->request->post['tltblog_path'])) {
			$this->error['tltblog_path'] = sprintf($this->language->get('error_path_exist'));
		}

		if ($this->request->post['tltblog_show_path']) {
			foreach ($this->request->post['tltblog_path_title'] as $language_id => $value) {
				if ((utf8_strlen($value['path_title']) < 3) || (utf8_strlen($value['path_title']) > 64)) {
					$this->error['tltblog_path_title'][$language_id] = $this->language->get('error_path_title');
				}
			}
		}

		if ($this->request->post['tltblog_show_image']) {
			if (!$this->request->post['tltblog_width'] || ((int)$this->request->post['tltblog_width'] < 1)) {
				$this->error['tltblog_width'] = $this->language->get('error_width');
			}
	
			if (!$this->request->post['tltblog_height'] || ((int)$this->request->post['tltblog_height'] < 1)) {
				$this->error['tltblog_height'] = $this->language->get('error_height');
			}
		}

		return !$this->error;
	}

    public function uninstall() {
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('tltblog');
		$this->cache->delete('tltblog');
    }
}