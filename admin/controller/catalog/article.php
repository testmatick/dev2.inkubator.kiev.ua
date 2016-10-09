<?php 
class ControllerCatalogArticle extends Controller { 
	private $error = array();
	private $article_id = 0;
	private $path = array();
 
	public function index() {
		$this->load->language('catalog/article');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/article');
		 
		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/article');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/article');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$article_id = $this->model_catalog_article->addArticle($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->post['apply'])) { 
	
			if (isset($this->request->get['article_id'])) {	
				$this->response->redirect($this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=' . $this->request->get['article_id'], 'SSL')); 
			} else {
				$this->response->redirect($this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=' . $article_id, 'SSL')); 
			} 
			} else {
				$this->response->redirect($this->url->link('catalog/article', 'token=' . $this->session->data['token'], 'SSL'));
			}

		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/article');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/article');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_article->editArticle($this->request->get['article_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->post['apply']) && isset($this->request->get['article_id'])) {	
				$this->response->redirect($this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=' . $this->request->get['article_id'], 'SSL')); 
			} else {
				$this->response->redirect($this->url->link('catalog/article', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/article');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/article');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $article_id) {
				$this->model_catalog_article->deleteArticle($article_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}


			$this->response->redirect($this->url->link('catalog/article', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$this->document->addStyle('view/stylesheet/articles.css');

   		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/article', 'token=' . $this->session->data['token'] . '&path=', 'SSL')
   		);
									
		$data['add'] = $this->url->link('catalog/article/add', 'token=' . $this->session->data['token'], 'SSL');
		$data['delete'] = $this->url->link('catalog/article/delete', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['path'])) {
			if ($this->request->get['path'] != '') {
				$this->path = explode('_', $this->request->get['path']);
				$this->article_id = end($this->path);
				$this->session->data['path'] = $this->request->get['path'];
			} else {
				unset($this->session->data['path']);
			}
		} elseif (isset($this->session->data['path'])) {
			$this->path = explode('_', $this->session->data['path']);
			$this->article_id = end($this->path);
		}

		$data['articles'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order
		);

		$article_total = $this->model_catalog_article->getTotalArticles();

		$results = $this->model_catalog_article->getArticles($filter_data);

		foreach ($results as $result) {
			$data['articles'][] = array(
				'article_id' => $result['article_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=' . $result['article_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('catalog/article/delete', 'token=' . $this->session->data['token'] . '&article_id=' . $result['article_id'] . $url, 'SSL')
			);
		}

		$data['articles'] = $this->getArticles(0);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
 
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}


		$data['sort_name'] = $this->url->link('catalog/article', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/article', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}


		$data['results'] = sprintf($this->language->get('text_total'), $article_total);

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/article_list.tpl', $data));
	}

	protected function getForm() {
	    //CKEditor
	    if ($this->config->get('config_editor_default')) {
	        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
	        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
	    }

		$this->document->addStyle('view/stylesheet/articles.css');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['article_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');		
		$data['text_enabled'] = $this->language->get('text_enabled');
    	$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');
				
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_alternative_link'] = $this->language->get('entry_alternative_link');
		$data['entry_short_description'] = $this->language->get('entry_short_description');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_related_title'] = $this->language->get('entry_related_title');
		$data['entry_related'] = $this->language->get('entry_related');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_image'] = $this->language->get('entry_image');	
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_viewed'] = $this->language->get('entry_viewed');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_seo_title'] = $this->language->get('entry_seo_title');
		$data['entry_seo_h1'] = $this->language->get('entry_seo_h1');

		$data['help_short_description'] = $this->language->get('help_short_description');
		$data['help_parent'] = $this->language->get('help_parent');
		$data['help_related_title'] = $this->language->get('help_related_title');
		$data['help_related'] = $this->language->get('help_related');
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_alternative_link'] = $this->language->get('help_alternative_link');
		$data['help_image'] = $this->language->get('help_image');
		$data['help_sort_order'] = $this->language->get('help_sort_order');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');

    		$data['tab_general'] = $this->language->get('tab_general');
    		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}


  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/article', 'token=' . $this->session->data['token'], 'SSL')
   		);
		
		if (!isset($this->request->get['article_id'])) {
			$data['action'] = $this->url->link('catalog/article/add', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=' . $this->request->get['article_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('catalog/article', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['article_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$article_info = $this->model_catalog_article->getArticle($this->request->get['article_id']);
    	}
		
		$data['token'] = $this->session->data['token'];
		$data['ckeditor'] = $this->config->get('config_editor_default');
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if ($this->language->get('lang') != 'lang') {
			$data['lang'] = $this->language->get('lang');
		} else {
			$data['lang'] = '';
		}

		if (isset($this->request->post['article_description'])) {
			$data['article_description'] = $this->request->post['article_description'];
		} elseif (isset($this->request->get['article_id'])) {
			$data['article_description'] = $this->model_catalog_article->getArticleDescriptions($this->request->get['article_id']);
		} else {
			$data['article_description'] = array();
		}

		$articles = $this->model_catalog_article->getAllArticles();

		$data['articles'] = $this->getAllArticles($articles);


		if (isset($article_info)) {
			unset($data['articles'][$article_info['article_id']]);
		}

		if (isset($this->request->post['path'])) {
			$data['path'] = $this->request->post['path'];
		} elseif (!empty($article_info)) {
			$data['path'] = $article_info['path'];
		} else {
			$data['path'] = '';
		}

		if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($article_info)) {
			$data['parent_id'] = $article_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}
						
		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['article_store'])) {
			$data['article_store'] = $this->request->post['article_store'];
		} elseif (isset($this->request->get['article_id'])) {
			$data['article_store'] = $this->model_catalog_article->getArticleStores($this->request->get['article_id']);
		} else {
			$data['article_store'] = array(0);
		}

		$this->load->model('catalog/product');

		$data['products'] = array();

		if (isset($this->request->post['product'])) {
			$products = $this->request->post['product'];
		} elseif (isset($this->request->get['article_id'])) {
			$products = $this->model_catalog_article->getProductRelated($this->request->get['article_id']);
		} else {
			$products = array();
		}

		if ($products) {
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		    }	
		}		
		
		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($article_info)) {
			$data['keyword'] = $article_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['alternative_link'])) {
			$data['alternative_link'] = $this->request->post['alternative_link'];
		} elseif (!empty($article_info)) {
			$data['alternative_link'] = $article_info['alternative_link'];
		} else {
			$data['alternative_link'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($article_info)) {
			$data['image'] = $article_info['image'];
		} else {
			$data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($article_info) && is_file(DIR_IMAGE . $article_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($article_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
				
		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($article_info)) {
			$data['sort_order'] = $article_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['date_added'])) {
       			$data['date_added'] = $this->request->post['date_added'];
		} elseif (!empty($article_info)) {
			$data['date_added'] = date('Y-m-d', strtotime($article_info['date_added']));
		} else {
			$data['date_added'] = date('Y-m-d', time());
		}

		if (isset($this->request->post['viewed'])) {
			$data['viewed'] = $this->request->post['viewed'];
		} elseif (!empty($article_info)) {
			$data['viewed'] = $article_info['viewed'];
		} else {
			$data['viewed'] = 0;
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($article_info)) {
			$data['status'] = $article_info['status'];
		} else {
			$data['status'] = 1;
		}
				
		if (isset($this->request->post['article_layout'])) {
			$data['article_layout'] = $this->request->post['article_layout'];
		} elseif (isset($this->request->get['article_id'])) {
			$data['article_layout'] = $this->model_catalog_article->getArticleLayouts($this->request->get['article_id']);
		} else {
			$data['article_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
						
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/article_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/article')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['article_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		
		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);
		
			if ($url_alias_info && isset($this->request->get['article_id']) && $url_alias_info['query'] != 'article_id=' . $this->request->get['article_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['article_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

		}

			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/article')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('catalog/article');

		foreach ($this->request->post['selected'] as $article_id) {

		$article_parent = $this->model_catalog_article->getTotalArticlesByParent($article_id);

		if ($article_parent) {
			$this->error['warning'] = sprintf($this->language->get('error_delete'), $article_parent);
		}

		}
 
		return !$this->error;
	}

	private function getArticles($parent_id, $parent_path = '', $indent = '') {
		$article_id = array_shift($this->path);

		$output = array();

		static $href_article = null;
		static $href_action = null;

		if ($href_article === null) {
			$href_article = $this->url->link('catalog/article', 'token=' . $this->session->data['token'] . '&path=', 'SSL');
			$href_action = $this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=', 'SSL');
		}

		$results = $this->model_catalog_article->getArticlesByParentId($parent_id);

		foreach ($results as $result) {
			$path = $parent_path . $result['article_id'];

			$href = ($result['children']) ? $href_article . $path : '';

			$name = $result['name'];

			if ($article_id == $result['article_id']) {
				$name = '<b>' . $name . '</b> <i class="fa fa-angle-down"></i>';

				$data['breadcrumbs'][] = array(
					'text'      => $result['name'],
					'href'      => $href,
					'separator' => ' :: '
				);

				$href = '';
			}

			$selected = isset($this->request->post['selected']) && in_array($result['article_id'], $this->request->post['selected']);

			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $href_action . $result['article_id']
			);

			$output[$result['article_id']] = array(
				'article_id' => $result['article_id'],
				'name'        => $name,
				'sort_order'  => $result['sort_order'],
				'selected'    => $selected,
				'action'      => $action,
				'href'        => $href,
				'edit'        => $this->url->link('catalog/article/edit', 'token=' . $this->session->data['token'] . '&article_id=' . $result['article_id'], 'SSL'),
				'indent'      => $indent
			);

			if ($article_id == $result['article_id']) {
				$output += $this->getArticles($result['article_id'], $path . '_', $indent . '&emsp;&emsp;');
			}
		}

		return $output;
	}

	private function getAllArticles($articles, $parent_id = 0, $parent_name = '') {
		$output = array();

		if (array_key_exists($parent_id, $articles)) {
			if ($parent_name != '') {
				$parent_name .= $this->language->get('text_separator');
			}

			foreach ($articles[$parent_id] as $article) {
				$output[$article['article_id']] = array(
					'article_id' => $article['article_id'],
					'name'        => $parent_name . $article['name']
				);

				$output += $this->getAllArticles($articles, $article['article_id'], $parent_name . $article['name']);
			}
		}

		return $output;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/article');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_article->getArticles($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'article_id' => $result['article_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>