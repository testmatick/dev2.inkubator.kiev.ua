<?php
class ControllerModuleTltBlog extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/tltblog');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		$this->load->model('localisation/language');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('tltblog', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				$cache_id = md5(http_build_query($this->model_extension_module->getModule($this->request->get['module_id'])));
				$this->cache->delete('tltblog.' . $cache_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_sortorder'] = $this->language->get('text_sortorder');
		$data['text_random'] = $this->language->get('text_random');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_show_title'] = $this->language->get('entry_show_title');
		$data['entry_show_blogs'] = $this->language->get('entry_show_blogs');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_sort'] = $this->language->get('entry_sort');
		$data['entry_num_columns'] = $this->language->get('entry_num_columns');
		$data['entry_show_image'] = $this->language->get('entry_show_image');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_tags_to_show'] = $this->language->get('entry_tags_to_show');
		$data['entry_template'] = $this->language->get('entry_template');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_sort'] = $this->language->get('help_sort');
		$data['help_show_blogs'] = $this->language->get('help_show_blogs');
		$data['help_limit'] = $this->language->get('help_limit');
		$data['help_tags_to_show'] = $this->language->get('help_tags_to_show');
		$data['help_template'] = $this->language->get('help_template');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];

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

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		if (isset($this->error['template'])) {
			$data['error_template'] = $this->error['template'];
		} else {
			$data['error_template'] = '';
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
				'href' => $this->url->link('module/tltblog', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/tltblog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/tltblog', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/tltblog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
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

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}

		if (isset($this->request->post['show_title'])) {
			$data['show_title'] = $this->request->post['show_title'];
		} elseif (!empty($module_info)) {
			$data['show_title'] = $module_info['show_title'];
		} else {
			$data['show_title'] = '1';
		}

		if (isset($this->request->post['show_blogs'])) {
			$data['show_blogs'] = $this->request->post['show_blogs'];
		} elseif (!empty($module_info)) {
			$data['show_blogs'] = $module_info['show_blogs'];
		} else {
			$data['show_blogs'] = '1';
		}

		if (isset($this->request->post['num_columns'])) {
			$data['num_columns'] = $this->request->post['num_columns'];
		} elseif (!empty($module_info)) {
			$data['num_columns'] = $module_info['num_columns'];
		} else {
			$data['num_columns'] = 1;
		}

		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = (int)$module_info['limit'];
		} else {
			$data['limit'] = 6;
		}

		if (isset($this->request->post['sort'])) {
			$data['sort'] = $this->request->post['sort'];
		} elseif (!empty($module_info)) {
			$data['sort'] = $module_info['sort'];
		} else {
			$data['sort'] = 'sortorder';
		}

		if (isset($this->request->post['show_image'])) {
			$data['show_image'] = $this->request->post['show_image'];
		} elseif (!empty($module_info)) {
			$data['show_image'] = $module_info['show_image'];
		} else {
			$data['show_image'] = '1';
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = (int)$module_info['width'];
		} else {
			$data['width'] = 200;
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = (int)$module_info['height'];
		} else {
			$data['height'] = 200;
		}

		$this->load->model('tltblog/tlttag');

		if (isset($this->request->post['tags_to_show'])) {
			$tags_to_show = $this->request->post['tags_to_show'];
		} elseif (!empty($module_info) && isset($module_info['tags_to_show'])) {
			$tags_to_show = $module_info['tags_to_show'];
		} else {
			$tags_to_show = array();
		}
		
		$data['tags_to_show'] = array();
		
		foreach ($tags_to_show as $tlttag_id) {
			$tag_info = $this->model_tltblog_tlttag->getTltTag($tlttag_id);

			if ($tag_info) {
				$data['tags_to_show'][] = array(
					'tlttag_id' => $tag_info['tlttag_id'],
					'title' => $tag_info['title']
				);
			}
		}		

		if (isset($this->request->post['template'])) {
			$data['template'] = $this->request->post['template'];
		} elseif (!empty($module_info) && isset($module_info['template'])) {
			$data['template'] = $module_info['template'];
		} else {
			$data['template'] = 'tltblog.tpl';
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

		$this->response->setOutput($this->load->view('module/tltblog.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tltblog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		foreach ($this->request->post['module_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		}

		if (!$this->request->post['limit'] || ((int)$this->request->post['limit'] < 1)) {
			$this->error['limit'] = $this->language->get('error_limit');
		}

		if ($this->request->post['show_image']) {
			if (!$this->request->post['width'] || ((int)$this->request->post['width'] < 1)) {
				$this->error['width'] = $this->language->get('error_width');
			}
	
			if (!$this->request->post['height'] || ((int)$this->request->post['height'] < 1)) {
				$this->error['height'] = $this->language->get('error_height');
			}
		}

		if ((utf8_strlen($this->request->post['template']) < 3) || (utf8_strlen($this->request->post['template']) > 64)) {
			$this->error['template'] = $this->language->get('error_template');
		}

		return !$this->error;
	}
}