<?php
class ControllerModuleiBlog extends Controller {
	
	private $moduleName = 'iBlog';
	private $moduleNameSmall = 'iblog';
	private $moduleData_module = 'iblog_module';
	private $moduleModel = 'model_module_iblog';
	
	public function index($setting) {

  	}

	private function getStore($store_id) {    
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL();
        }
        return $store;
    }
	
	private function getCatalogURL(){
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTP_SERVER;
        } else {
            $storeURL = HTTPS_SERVER;
        } 
        return $storeURL;
    }
	
	public function post() {

		$this->language->load('module/'.$this->moduleNameSmall);
		$this->load->model('module/'.$this->moduleNameSmall);
		$this->load->model('setting/setting');

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),			
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);
		
		if (isset($this->request->get['post_id'])) {
			$post_id = (int)$this->request->get['post_id'];
		} else {
			$post_id = 0;
		}
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();
		$post_info							= $this->{$this->moduleModel}->getPost($post_id);
		
		if ($post_info) {												
			$data['breadcrumbs'][] = array(
				'text'      => $post_info['title'],
				'href'      => $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $this->request->get['post_id']),
				'separator' => $this->language->get('text_separator')
			);			
			
			$this->document->setTitle($post_info['title']);
			$this->document->setDescription($post_info['meta_description']);
			$this->document->setKeywords($post_info['meta_keyword']);

			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			
			$data['heading_title'] = $post_info['title'];
			
			$this->load->model('tool/image');

			if ($post_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($post_info['image'], $this->getImageConfigs('config_image_popup_width'), $this->getImageConfigs('config_image_popup_height'));
			} else {
				$data['popup'] = '';
			}
			
			if ($post_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($post_info['image'], $data['moduleData']['MainImageWidth'], $data['moduleData']['MainImageHeight']);
			} else {
				$data['thumb'] = '';
			}
			
			$data['iblog_keywords'] = $this->language->get('iblog_keywords');	
			
			if(isset($post_info['meta_keyword'])) {
				 $data['keywords'] = array();
				 
				 $keywords = explode(',',  trim($post_info['meta_keyword'], ","));
				 
				 foreach($keywords as $keyword) {
					
				 	$data['keywords'][] = array(
						'name' => $keyword,
						'href' => $this->url->link('module/iblog/tag', 'tag=' .  $keyword),
					);
				 }
				
			} else {
				$data['keywords'] = $this->language->get('no_keywords');	
			}

			$categories = unserialize($post_info['categories']);
			$data['categories'] = array();
			
			if(!empty($categories)) {
				foreach($categories as $category) {
					$category_info = $this->{$this->moduleModel}->getCategory($category, $this->config->get('config_store_id'));
			
					$data['categories'][] = array (
						'name' => $category_info['title'],
						'href'  => $this->url->link('module/iblog/category', '&path=' . $category_info['category_id']),
					);
				}
			}
			
			$data['author'] = $post_info['author'];
			$data['show_author'] = $post_info['show_author'];
			$data['date_created'] = date('Y/m/d', strtotime($post_info['created']));
			$data['body'] = html_entity_decode($post_info['body'], ENT_QUOTES, 'UTF-8');

			$data['text_author'] = $this->language->get('text_author');
			$data['text_date_created'] = $this->language->get('text_date_created');

			if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
			}

			$data['column_left']				= $this->load->controller('common/column_left');
			$data['column_right']				= $this->load->controller('common/column_right');
			$data['content_top']				= $this->load->controller('common/content_top');
			$data['content_bottom']				= $this->load->controller('common/content_bottom');
			$data['footer']						= $this->load->controller('common/footer');
			$data['header']						= $this->load->controller('common/header');
	
			$this->response->setOutput($this->getOutput('module/'.$this->moduleNameSmall.'_post.tpl' , $data));
 
		} else {
			$data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('iblog/post', 'post_id=' . $post_id),
        		'separator' => $this->language->get('text_separator')
      		);			
		
      		$this->document->setTitle($this->language->get('text_error'));

      		$data['heading_title']				= $this->language->get('text_error');
      		$data['text_error']					= $this->language->get('text_error');
      		$data['button_continue']			= $this->language->get('button_continue');
      		$data['continue']					= $this->url->link('common/home');
			
			if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
			}
			
			$data['column_left']				= $this->load->controller('common/column_left');
			$data['column_right']				= $this->load->controller('common/column_right');
			$data['content_top']				= $this->load->controller('common/content_top');
			$data['content_bottom']				= $this->load->controller('common/content_bottom');
			$data['footer']						= $this->load->controller('common/footer');
			$data['header']						= $this->load->controller('common/header');
			
			$this->response->setOutput($this->getOutput('error/not_found.tpl' , $data));
    	}
	}
	
	public function listing() {
		$this->language->load('module/'.$this->moduleNameSmall);
		
		$this->load->model('setting/setting');
		$this->load->model('tool/image'); 
		$this->load->model('module/'.$this->moduleNameSmall);
		
		$language_id = (int)$this->config->get('config_language_id');
				
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
       	   
	    $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();
		
		if (!empty($data['moduleData']['PageTitle'][$language_id])) {
            $data['heading_title'] = $data['moduleData']['PageTitle'][$language_id];
        } else {
            $data['heading_title']				= $this->language->get('heading_title');
        }
		
		$data['text_iblog_empty']			= $this->language->get('text_iblog_empty');
		$data['button_continue']			= $this->language->get('button_continue');
		$data['continue']					= $this->url->link('common/home');
		
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['iblog_button'] = $this->language->get('iblog_button');
		$data['search_string'] = $this->language->get('search_string');
		$data['search_button'] = $this->language->get('search_button');
		$data['search_placeholder'] = $this->language->get('search_placeholder');
	
		$data['search_link'] = $this->url->link('module/iblog/search');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
		
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->getProductLimit();
		}

		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		
		$data['breadcrumbs'][] = array(
			'text'      => $data['heading_title'],
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);
		
		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$data['sorts'] = array();
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('module/iblog/listing', '&sort=p.sort_order&order=ASC' . $url)
		);
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.title-ASC',
			'href'  => $this->url->link('module/iblog/listing', '&sort=pd.title&order=ASC' . $url)
		);
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.title-DESC',
			'href'  => $this->url->link('module/iblog/listing', '&sort=pd.title&order=DESC' . $url)
		);
		
		$url = '';
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		// Document Meta
		if (!empty($data['moduleData']['PageTitle'][$language_id])) {
            $this->document->setTitle($data['moduleData']['PageTitle'][$language_id]);
        } else {
            $this->document->setTitle($this->language->get('heading_title'));
        }

		if (!empty($data['moduleData']['MetaDescription'][$language_id])) {
			$this->document->setDescription($data['moduleData']['MetaDescription'][$language_id]);
		} else {
			$this->document->setDescription($this->config->get('config_meta_description'));
		}
		
		if (!empty($data['moduleData']['MetaKeywords'][$language_id])) {
			$this->document->setKeywords($data['moduleData']['MetaKeywords'][$language_id]);
		} else {
			$this->document->setKeywords($this->config->get('config_meta_keywords'));
		}

		$limits = array_unique(array($this->getProductLimit(), 25, 50, 75, 100));
		sort($limits);
		foreach($limits as $value){
			$data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('module/iblog/listing', $url . '&limit=' . $value)
			);
		}

		$postData = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		$posts_total = $this->{$this->moduleModel}->getPosts($postData); 
		$total_posts = $this->{$this->moduleModel}->getTotalPosts($this->config->get('config_store_id'));

		foreach ($posts_total as $post) {
			$data['posts'][] = array(
				'post_id'	=> $post['iblog_post_id'],
				'title'		=> $post['title'],
				'image'		=> (isset($post['image'])) ? $this->model_tool_image->resize($post['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']) : '',
				'excerpt'	=> $post['excerpt'],
				'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
			);	
		}
	
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$pagination 						= new Pagination();
		$pagination->total 					= $total_posts;
		$pagination->page 					= $page;
		$pagination->limit 					= $limit;
		$pagination->url 					= $this->url->link('module/iblog/listing', $url.'&page={page}');
		$data['pagination']					= $pagination->render();
		$data['results']					= sprintf($this->language->get('text_pagination'), ($total_posts) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_posts - $limit)) ? $total_posts : ((($page - 1) * $limit) + $limit), $total_posts, ceil($total_posts / $limit));
		
		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
		}

		$data['column_left']				= $this->load->controller('common/column_left');
		$data['column_right']				= $this->load->controller('common/column_right');
		$data['content_top']				= $this->load->controller('common/content_top');
		$data['content_bottom']				= $this->load->controller('common/content_bottom');
		$data['footer']						= $this->load->controller('common/footer');
		$data['header']						= $this->load->controller('common/header');


		
		$this->response->setOutput($this->getOutput('module/'.$this->moduleNameSmall.'_listing.tpl' , $data));
	}

	private function getConfigTemplate(){
		if(version_compare(VERSION, '2.2.0.0', '<')) {
			return $this->config->get('config_template');
		} else {
			return  $this->config->get($this->config->get('config_theme') . '_directory');
		}
	}

	private function getImageConfigs($name) {
		if(version_compare(VERSION, '2.2.0.0', '<')) {
			return $this->config->get($name);
		} else {
			if(strpos($name, 'config_image') !== false){
				$name = str_replace('config', '', $name);
				return $this->config->get($this->config->get('config_theme') . $name);
			}
		}	
	}

	private function getOutput($TPL_name , $data){
		if(version_compare(VERSION, '2.2.0.0', "<")) {
		    if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/template/module/'. $TPL_name)) {
				return $this->load->view($this->getConfigTemplate().'/template/module/'. $TPL_name, $data);
			} else {
				return $this->load->view('default/template/'. $TPL_name, $data);
			}  
		} else {
		      	return $this->load->view($TPL_name , $data);
		 }
	}

	private function getProductLimit(){
		if(version_compare(VERSION, '2.2.0.0', '<')) {
			return $this->config->get('config_product_limit');
		} else {
			return  $this->config->get($this->config->get('config_theme') . '_product_limit');
		}
	}

	public function search() {
		$this->language->load('module/'.$this->moduleNameSmall);
		
		$this->load->model('module/'.$this->moduleNameSmall);		
		$this->load->model('catalog/product');
		$this->load->model('tool/image'); 
		$this->load->model('setting/setting');
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();

		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		} 
		if (isset($this->request->get['description'])) {
			$description = $this->request->get['description'];
		} else {
			$description = '';
		} 
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		} 
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->getProductLimit();
		}
		
		$language_id = (int)$this->config->get('config_language_id');

		// Document Meta
		if (isset($this->request->get['search'])) {
			$this->document->setTitle($this->language->get('heading_title_search') .  ' - ' . $this->request->get['search']);
		} else {
			if (!empty($iBlogSetting[$this->moduleName]['LinkTitle'][$language_id])) {
				$this->document->setTitle($iBlogSetting[$this->moduleName]['LinkTitle'][$language_id]);
			} else {
				$this->document->setTitle($this->language->get('heading_title'));
			}
		}
		

		if (!empty($data['moduleData']['MetaDescription'][$language_id])) {
			$this->document->setDescription($data['moduleData']['MetaDescription'][$language_id]);
		} else {
			$this->document->setDescription($this->config->get('config_meta_description'));
		}
		
		if (!empty($data['moduleData']['MetaKeywords'][$language_id])) {
			$this->document->setKeywords($data['moduleData']['MetaKeywords'][$language_id]);
		} else {
			$this->document->setKeywords($this->config->get('config_meta_keywords'));
		}


		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);


		$url = '';
		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}
		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_search'),
			'href'      => $this->url->link('module/iblog/search', $url),
			'separator' => $this->language->get('text_separator')
		);

		if (isset($this->request->get['search'])) {
			$data['heading_title'] = $this->language->get('heading_title_search') .  ' - ' . $this->request->get['search'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title_search');
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_critea'] = $this->language->get('text_critea');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');		
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['search_button'] = $this->language->get('search_button');
		$data['iblog_button'] = $this->language->get('iblog_button');

		$data['products'] = array();

		if (isset($this->request->get['search'])) {
			$postData = array(
				'filter_name'         => $search, 
				'filter_description'  => $description,
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);
			
			$total_posts = $this->{$this->moduleModel}->getTotalPosts($this->config->get('config_store_id'), $postData);
			$results = $this->{$this->moduleModel}->getPosts($postData); 
			
		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$current_category = (int)array_pop($parts);

			foreach ($parts as $path_id) { 
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->{$this->moduleModel}->getCategory($path_id,$this->config->get('config_store_id'));

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('module/iblog/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$current_category = 0;
		}
			
			foreach ($results as $post) {
				if(isset($post['category_id']) && $post['category_id'] !== '0') {
					$category_id = unserialize($post['category_id']);
				} else {
					$category_id = array();
				}
			
				if((isset($current_category) && isset($category_id) && in_array($current_category,$category_id)) || $current_category == 0) {
					$data['posts'][] = array(
						'post_id'	=> $post['iblog_post_id'],
						'title'		=> $post['title'],
						'image'		=> (isset($post['image'])) ? $this->model_tool_image->resize($post['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']) : '',
						'excerpt'	=> $post['excerpt'],
						'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
					);	
				}
			}

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('module/iblog/search', '&sort=p.sort_order&order=ASC' . $url)
			);
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.title-ASC',
				'href'  => $this->url->link('module/iblog/search', '&sort=pd.title&order=ASC' . $url)
			);
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.title-DESC',
				'href'  => $this->url->link('module/iblog/search', '&sort=pd.title&order=DESC' . $url)
			);
			
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->getProductLimit(), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value){
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('module/iblog/search', $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination 						= new Pagination();
			$pagination->total 					= $total_posts;
			$pagination->page 					= $page;
			$pagination->limit 					= $limit;
			$pagination->url 					= $this->url->link('module/iblog/search', $url.'&page={page}');
			$data['pagination']					= $pagination->render();
			$data['results']					= sprintf($this->language->get('text_pagination'), ($total_posts) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_posts - $limit)) ? $total_posts : ((($page - 1) * $limit) + $limit), $total_posts, ceil($total_posts / $limit));
		}	

		$data['search'] = $search;
		$data['description'] = $description;

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;
		
		if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
		}

		$data['column_left']				= $this->load->controller('common/column_left');
		$data['column_right']				= $this->load->controller('common/column_right');
		$data['content_top']				= $this->load->controller('common/content_top');
		$data['content_bottom']				= $this->load->controller('common/content_bottom');
		$data['footer']						= $this->load->controller('common/footer');
		$data['header']						= $this->load->controller('common/header');

		$this->response->setOutput($this->getOutput('module/'.$this->moduleNameSmall.'_search.tpl' , $data)); 
	}
	
	public function tag() {
		$this->language->load('module/'.$this->moduleNameSmall);
		
		$this->load->model('module/'.$this->moduleNameSmall);		
		$this->load->model('catalog/product');
		$this->load->model('tool/image'); 
		$this->load->model('setting/setting');
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();

		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		} 
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		} 
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->getProductLimit();
		}
		
		$language_id = (int)$this->config->get('config_language_id');

		// Document Meta
		if (isset($this->request->get['tag'])) {
			$this->document->setTitle($this->language->get('heading_title_tag') .  ' - ' . $this->request->get['tag']);
		} else {
			if (!empty($iBlogSetting[$this->moduleName]['LinkTitle'][$language_id])) {
				$this->document->setTitle($iBlogSetting[$this->moduleName]['LinkTitle'][$language_id]);
			} else {
				$this->document->setTitle($this->language->get('heading_title'));
			}
		}
		

		if (!empty($data['moduleData']['MetaDescription'][$language_id])) {
			$this->document->setDescription($data['moduleData']['MetaDescription'][$language_id]);
		} else {
			$this->document->setDescription($this->config->get('config_meta_description'));
		}
		
		if (!empty($data['moduleData']['MetaKeywords'][$language_id])) {
			$this->document->setKeywords($data['moduleData']['MetaKeywords'][$language_id]);
		} else {
			$this->document->setKeywords($this->config->get('config_meta_keywords'));
		}


		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);


		$url = '';
		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
		}
		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_search'),
			'href'      => $this->url->link('module/iblog/tag', $url),
			'separator' => $this->language->get('text_separator')
		);

		if (isset($this->request->get['tag'])) {
			$data['heading_title'] = $this->language->get('heading_title_tag') .  ' - ' . $this->request->get['tag'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title_tag');
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_critea'] = $this->language->get('text_critea');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');		
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['search_button'] = $this->language->get('search_button');
		$data['iblog_button'] = $this->language->get('iblog_button');

		$data['products'] = array();

		if (isset($this->request->get['tag'])) {
			$postData = array(
				'filter_tag'         =>  $this->request->get['tag'], 
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);
			
			$total_posts = $this->{$this->moduleModel}->getTotalPostsByTag($this->config->get('config_store_id'), $postData);
			$results = $this->{$this->moduleModel}->getPostsByTag($postData); 
			
		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$current_category = (int)array_pop($parts);

			foreach ($parts as $path_id) { 
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->{$this->moduleModel}->getCategory($path_id,$this->config->get('config_store_id'));

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('module/iblog/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$current_category = 0;
		}
			
			foreach ($results as $post) {
				if(isset($post['category_id']) && $post['category_id'] !== '0') {
					$category_id = unserialize($post['category_id']);
				} else {
					$category_id = array();
				}
			
				if((isset($current_category) && isset($category_id) && in_array($current_category,$category_id)) || $current_category == 0) {
					$data['posts'][] = array(
						'post_id'	=> $post['iblog_post_id'],
						'title'		=> $post['title'],
						'image'		=> (isset($post['image'])) ? $this->model_tool_image->resize($post['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']) : '',
						'excerpt'	=> $post['excerpt'],
						'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
					);	
				}
			}

			$url = '';

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('module/iblog/tag', '&sort=p.sort_order&order=ASC' . $url)
			);
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.title-ASC',
				'href'  => $this->url->link('module/iblog/tag', '&sort=pd.title&order=ASC' . $url)
			);
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.title-DESC',
				'href'  => $this->url->link('module/iblog/tag', '&sort=pd.title&order=DESC' . $url)
			);
			
			$url = '';

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->getProductLimit(), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value){
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('module/iblog/tag', $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination 						= new Pagination();
			$pagination->total 					= $total_posts;
			$pagination->page 					= $page;
			$pagination->limit 					= $limit;
			$pagination->url 					= $this->url->link('module/iblog/tag', $url.'&page={page}');
			$data['pagination']					= $pagination->render();
			$data['results']					= sprintf($this->language->get('text_pagination'), ($total_posts) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_posts - $limit)) ? $total_posts : ((($page - 1) * $limit) + $limit), $total_posts, ceil($total_posts / $limit));
		}	

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;
		
		if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
		}

		$data['column_left']				= $this->load->controller('common/column_left');
		$data['column_right']				= $this->load->controller('common/column_right');
		$data['content_top']				= $this->load->controller('common/content_top');
		$data['content_bottom']				= $this->load->controller('common/content_bottom');
		$data['footer']						= $this->load->controller('common/footer');
		$data['header']						= $this->load->controller('common/header');

		$this->response->setOutput($this->getOutput('module/'.$this->moduleNameSmall.'_tag.tpl' , $data));
	}
	
	public function category() {
		$this->language->load('module/'.$this->moduleNameSmall);
		
		$this->load->model('setting/setting');
		$this->load->model('tool/image'); 
		$this->load->model('module/'.$this->moduleNameSmall);
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();

		$data['text_iblog_empty']			= $this->language->get('text_iblog_empty');
		$data['button_continue']			= $this->language->get('button_continue');
		$data['continue']					= $this->url->link('common/home');
		
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['iblog_button'] = $this->language->get('iblog_button');
		$data['search_string'] = $this->language->get('search_string');
		$data['search_button'] = $this->language->get('search_button');
		$data['search_placeholder'] = $this->language->get('search_placeholder');

		$data['search_link'] = $this->url->link('module/iblog/search');
		
		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$current_category = (int)array_pop($parts);

			foreach ($parts as $path_id) { 
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->{$this->moduleModel}->getCategory($path_id,$this->config->get('config_store_id'));

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['title'],
						'href' => $this->url->link('module/iblog/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$current_category = 0;
		}
		$data['current_category'] = $current_category;

		$category_info = $this->{$this->moduleModel}->getCategory($current_category, $this->config->get('config_store_id')); 


		$this->document->setTitle($category_info['meta_title']);
		$this->document->setDescription($category_info['meta_description']);
		$this->document->setKeywords($category_info['meta_keyword']);

		$data['heading_title']	= $category_info['title'];
		$data['description']	= html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

		if(isset($category_info['image'])) { 
			$data['image'] = $this->model_tool_image->resize($category_info['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']);
		}
		
 		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
		
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->getProductLimit();
		}

		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);
		
		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		

		$data['sorts'] = array();
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('module/iblog/category','&sort=p.sort_order&order=ASC&path='.$this->request->get['path'] . $url)
		);
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.title-ASC',
			'href'  => $this->url->link('module/iblog/category', '&sort=pd.title&order=ASC&path='.$this->request->get['path'] . $url)
		);
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.title-DESC',
			'href'  => $this->url->link('module/iblog/category', '&sort=pd.title&order=DESC&path='.$this->request->get['path'] . $url)
		);
		
		$url = '';
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$limits = array_unique(array($this->getProductLimit(), 25, 50, 75, 100));
		sort($limits);
		foreach($limits as $value){
			$data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('module/iblog/category', $url . '&path='.$this->request->get['path']. '&limit=' . $value)
			);
		}

		$postData = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);
		


		$posts_total = $this->{$this->moduleModel}->getPosts($postData); 

		$total_posts = $this->{$this->moduleModel}->getTotalPosts($this->config->get('config_store_id'));

		foreach ($posts_total as $post) {
			if(isset($post['category_id']) && $post['category_id'] !== '0') {
				$category_id = unserialize($post['category_id']);
			} else {
				$category_id = array();
			}
			if((isset($current_category) && isset($category_id) && in_array($current_category,$category_id))) {
				$data['posts'][] = array(
					'post_id'	=> $post['iblog_post_id'],
					'title'		=> $post['title'],
					'image'		=> (isset($post['image'])) ? $this->model_tool_image->resize($post['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']) : '',
					'excerpt'	=> $post['excerpt'],
					'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
				);	
			}
		}
	
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$pagination 						= new Pagination();
		$pagination->total 					= $total_posts;
		$pagination->page 					= $page;
		$pagination->limit 					= $limit;
		$pagination->url 					= $this->url->link('module/iblog/listing', $url.'&page={page}');
		$data['pagination']					= $pagination->render();
		$data['results']					= sprintf($this->language->get('text_pagination'), ($total_posts) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_posts - $limit)) ? $total_posts : ((($page - 1) * $limit) + $limit), $total_posts, ceil($total_posts / $limit));
		
		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		if (file_exists(DIR_TEMPLATE . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->getConfigTemplate() . '/stylesheet/'.$this->moduleNameSmall.'.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
		}

		$data['column_left']				= $this->load->controller('common/column_left');
		$data['column_right']				= $this->load->controller('common/column_right');
		$data['content_top']				= $this->load->controller('common/content_top');
		$data['content_bottom']				= $this->load->controller('common/content_bottom');
		$data['footer']						= $this->load->controller('common/footer');
		$data['header']						= $this->load->controller('common/header');



		$this->response->setOutput($this->getOutput('module/'.$this->moduleNameSmall.'_category.tpl' , $data));

	}

}
?>