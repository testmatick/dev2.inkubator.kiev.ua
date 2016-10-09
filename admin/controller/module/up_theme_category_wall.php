<?php
class ControllerModuleUPThemeCategoryWall extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/up_theme_category_wall');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$languages = $this->model_localisation_language->getLanguages();
		
		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('up_theme_category_wall', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_categories_per_row'] = $this->language->get('entry_categories_per_row');
		$data['entry_status_subcategories'] = $this->language->get('entry_status_subcategories');
		$data['entry_status_caticons'] = $this->language->get('entry_status_caticons');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
			
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/up_theme_category_wall', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/up_theme_category_wall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/up_theme_category_wall', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/up_theme_category_wall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['category_wall'])) {
			$data['category_wall'] = $this->request->post['category_wall'];
		} elseif (!empty($module_info)) {
			$data['category_wall'] = $module_info['category_wall'];
		} else {
			$data['category_wall'] = '';
		}		
		
		if (isset($this->request->post['ca_id'])) {
			$data['ca_id'] = $this->request->post['ca_id'];
		} elseif (!empty($module_info)) {
			$data['ca_id'] = $module_info['ca_id'];
		} else {
			$data['ca_id'] = 'ca4';
		}	
		
		if (isset($this->request->post['status_caticons'])) {
			$data['status_caticons'] = $this->request->post['status_caticons'];
		} elseif (!empty($module_info)) {
			$data['status_caticons'] = $module_info['status_caticons'];
		} else {
			$data['status_caticons'] = 0;
		}
		
		if (isset($this->request->post['status_subcategories'])) {
			$data['status_subcategories'] = $this->request->post['status_subcategories'];
		} elseif (!empty($module_info)) {
			$data['status_subcategories'] = $module_info['status_subcategories'];
		} else {
			$data['status_subcategories'] = 1;
		}		
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/up_theme_category_wall.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/up_theme_category_wall')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}	

		return !$this->error;
	}
}