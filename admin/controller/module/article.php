<?php
class ControllerModuleArticle extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/article');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('article', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

     	    //CKEditor
     	    if ($this->config->get('config_editor_default')) {
     	        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
     	        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
     	    }
		$data['ckeditor'] = $this->config->get('config_editor_default');
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_heading'] = $this->language->get('entry_heading');
		$data['entry_articles_title'] = $this->language->get('entry_articles_title');
		$data['entry_articles_metadescription'] = $this->language->get('entry_articles_metadescription');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_article_thumb_category'] = $this->language->get('entry_article_thumb_category');	
		$data['entry_article_thumb'] = $this->language->get('entry_article_thumb');
		$data['entry_article_image'] = $this->language->get('entry_article_image');
		$data['entry_show_date'] = $this->language->get('entry_show_date');
		$data['entry_show_views'] = $this->language->get('entry_show_views');
		$data['entry_show_readmore'] = $this->language->get('entry_show_readmore');
		$data['entry_show_latest'] = $this->language->get('entry_show_latest');
		$data['entry_show_root'] = $this->language->get('entry_show_root');
		$data['entry_article_limit'] = $this->language->get('entry_article_limit');
		$data['entry_social'] = $this->language->get('entry_social');	
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_width'] = $this->language->get('help_width');	
		$data['help_height'] = $this->language->get('help_height');
		$data['help_articles_title'] = $this->language->get('help_articles_title');	
		$data['help_articles_metadescription'] = $this->language->get('help_articles_metadescription');
		$data['help_description'] = $this->language->get('help_description');
		$data['help_article_thumb_category'] = $this->language->get('help_article_thumb_category');	
		$data['help_article_thumb'] = $this->language->get('help_article_thumb');
		$data['help_article_image'] = $this->language->get('help_article_image');
		$data['help_show_latest'] = $this->language->get('help_show_latest');
		$data['help_show_root'] = $this->language->get('help_show_root');
		$data['help_social'] = $this->language->get('help_social');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['image'])) {
			$data['error_image'] = $this->error['image'];
		} else {
			$data['error_image'] = array();
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/article', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/article', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['article_module'])) {
			$data['modules'] = $this->request->post['article_module'];
		} elseif ($this->config->get('article_module')) { 
			$data['modules'] = $this->config->get('article_module');
		}

		$this->load->model('localisation/language');
		
		$languages = $this->model_localisation_language->getLanguages();

		if ($this->language->get('lang') != 'lang') {
			$data['lang'] = $this->language->get('lang');
		} else {
			$data['lang'] = '';
		}

		foreach ($languages as $language) {

		if (isset($this->request->post['article_module_heading' . $language['language_id']])) {
			$data['article_module_heading' . $language['language_id']] = $this->request->post['article_module_heading' . $language['language_id']];
		} else {
			$data['article_module_heading' . $language['language_id']] = $this->config->get('article_module_heading' . $language['language_id']);
		}

		if (isset($this->request->post['article_module_title' . $language['language_id']])) {
			$data['article_module_title' . $language['language_id']] = $this->request->post['article_module_title' . $language['language_id']];
		} else {
			$data['article_module_title' . $language['language_id']] = $this->config->get('article_module_title' . $language['language_id']);
		}

		if (isset($this->request->post['article_module_metadescription' . $language['language_id']])) {
			$data['article_module_metadescription' . $language['language_id']] = $this->request->post['article_module_metadescription' . $language['language_id']];
		} else {
			$data['article_module_metadescription' . $language['language_id']] = $this->config->get('article_module_metadescription' . $language['language_id']);
		}

		if (isset($this->request->post['articles_description' . $language['language_id']])) {
			$data['articles_description' . $language['language_id']] = $this->request->post['articles_description' . $language['language_id']];
		} else {
			$data['articles_description' . $language['language_id']] = $this->config->get('articles_description' . $language['language_id']);
		}

		}
		
		$data['languages'] = $languages;

		if (isset($this->request->post['article_thumb_category_width'])) {
			$data['article_thumb_category_width'] = $this->request->post['article_thumb_category_width'];
		} elseif ($this->config->get('article_thumb_category_width')) { 
			$data['article_thumb_category_width'] = $this->config->get('article_thumb_category_width');
		} else {
			$data['article_thumb_category_width'] = '';
		}

		if (isset($this->request->post['article_thumb_category_height'])) {
			$data['article_thumb_category_height'] = $this->request->post['article_thumb_category_height'];
		} elseif ($this->config->get('article_thumb_category_height')) { 
			$data['article_thumb_category_height'] = $this->config->get('article_thumb_category_height');
		} else {
			$data['article_thumb_category_height'] = '';
		}

		if (isset($this->request->post['article_thumb_width'])) {
			$data['article_thumb_width'] = $this->request->post['article_thumb_width'];
		} elseif ($this->config->get('article_thumb_width')) { 
			$data['article_thumb_width'] = $this->config->get('article_thumb_width');
		} else {
			$data['article_thumb_width'] = '';
		}

		if (isset($this->request->post['article_thumb_height'])) {
			$data['article_thumb_height'] = $this->request->post['article_thumb_height'];
		} elseif ($this->config->get('article_thumb_height')) { 
			$data['article_thumb_height'] = $this->config->get('article_thumb_height');
		} else {
			$data['article_thumb_height'] = '';
		}

		if (isset($this->request->post['article_image_width'])) {
			$data['article_image_width'] = $this->request->post['article_image_width'];
		} elseif ($this->config->get('article_image_width')) { 
			$data['article_image_width'] = $this->config->get('article_image_width');
		} else {
			$data['article_image_width'] = '';
		}

		if (isset($this->request->post['article_image_height'])) {
			$data['article_image_height'] = $this->request->post['article_image_height'];
		} elseif ($this->config->get('article_image_height')) { 
			$data['article_image_height'] = $this->config->get('article_image_height');
		} else {
			$data['article_image_height'] = '';
		}

		if (isset($this->request->post['article_show_date'])) {
			$data['article_show_date'] = $this->request->post['article_show_date'];
		} elseif ($this->config->get('article_show_date')) { 
			$data['article_show_date'] = $this->config->get('article_show_date');
		} else {
			$data['article_show_date'] = 0;
		}

		if (isset($this->request->post['article_show_views'])) {
			$data['article_show_views'] = $this->request->post['article_show_views'];
		} elseif ($this->config->get('article_show_views')) { 
			$data['article_show_views'] = $this->config->get('article_show_views');
		} else {
			$data['article_show_views'] = 0;
		}

		if (isset($this->request->post['article_show_readmore'])) {
			$data['article_show_readmore'] = $this->request->post['article_show_readmore'];
		} elseif ($this->config->get('article_show_readmore')) { 
			$data['article_show_readmore'] = $this->config->get('article_show_readmore');
		} else {
			$data['article_show_readmore'] = 0;
		}

		if (isset($this->request->post['article_show_latest'])) {
			$data['article_show_latest'] = $this->request->post['article_show_latest'];
		} elseif ($this->config->get('article_show_latest')) { 
			$data['article_show_latest'] = $this->config->get('article_show_latest');
		} else {
			$data['article_show_latest'] = 0;
		}

		$data['articles_root_types'] = array(
			"1" => $this->language->get('text_root_type_1'), 
			"2" => $this->language->get('text_root_type_2'), 
			"3" => $this->language->get('text_root_type_3')
		);

		if (isset($this->request->post['article_show_root'])) {
			$data['article_show_root'] = $this->request->post['article_show_root'];
		} else {
			$data['article_show_root'] = $this->config->get('article_show_root');		
		}

		if (isset($this->request->post['article_page_limit'])) {
			$data['article_page_limit'] = $this->request->post['article_page_limit'];
		} elseif ($this->config->get('article_page_limit')) {
			$data['article_page_limit'] = $this->config->get('article_page_limit');
		} else {
			$data['article_page_limit'] = 10;
		}

		if (isset($this->request->post['article_social'])) {
			$data['article_social'] = $this->request->post['article_social'];
		} elseif ($this->config->get('article_social')) {
			$data['article_social'] = $this->config->get('article_social');
		} else {
			$data['article_social'] = '';
		}

		if (isset($this->request->post['article_status'])) {
			$data['article_status'] = $this->request->post['article_status'];
		} else {
			$data['article_status'] = $this->config->get('article_status');
		}	

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/article.tpl', $data));

	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/article')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;	
	}

	public function install() {
		$this->load->model('catalog/article');
		$this->model_catalog_article->createArticles();
	}

	public function uninstall() {
		$this->load->model('catalog/article');
		$this->model_catalog_article->dropArticles();
	}

}