<?php
class ControllerModuleiBlog extends Controller {
	private $moduleName = 'iBlog';
	private $moduleNameSmall = 'iblog';
	private $moduleData_module = 'iblog_module';
	private $moduleModel = 'model_module_iblog';
	private $version = '2.7.2';

    public function index() { 
		$data['moduleName'] = $this->moduleName;
		$data['moduleNameSmall'] = $this->moduleNameSmall;
		$data['moduleData_module'] = $this->moduleData_module;
		$data['moduleModel'] = $this->moduleModel;
	 
        $this->load->language('module/'.$this->moduleNameSmall);
		
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->load->model('setting/store');
		$this->load->model('setting/setting');
        $this->load->model('localisation/language');
 
        $this->document->addStyle('view/stylesheet/'.$this->moduleNameSmall.'/'.$this->moduleNameSmall.'.css');
		$this->document->addScript('view/javascript/'.$this->moduleNameSmall.'/'.$this->moduleNameSmall.'.js');

        $this->document->setTitle($this->language->get('heading_title').' '.$this->version);

        if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }
	
        $store = $this->getCurrentStore($this->request->get['store_id']);
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) { 	
            if (!empty($_POST['OaXRyb1BhY2sgLSBDb21'])) {
                $this->request->post[$this->moduleName]['LicensedOn'] = $_POST['OaXRyb1BhY2sgLSBDb21'];
            }
            if (!empty($_POST['cHRpbWl6YXRpb24ef4fe'])) {
                $this->request->post[$this->moduleName]['License'] = json_decode(base64_decode($_POST['cHRpbWl6YXRpb24ef4fe']), true);
            }

        	$this->model_setting_setting->editSetting($this->moduleName, $this->request->post, $this->request->post['store_id']);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('module/'.$this->moduleNameSmall, 'store_id='.$this->request->post['store_id'] . '&token=' . $this->session->data['token'], 'SSL'));
        }
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $data['breadcrumbs']   = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/'.$this->moduleNameSmall, 'token=' . $this->session->data['token'], 'SSL'),
        );

        $languageVariables = array(
			'error_permission', 'text_success', 'text_enabled', 'text_disabled', 'button_cancel', 'save_changes', 'text_default', 'text_module', 'entry_code', 'entry_code_help', 'button_add_module', 'button_remove','entry_page_title','entry_meta_description','entry_meta_keywords','entry_seo_slug','entry_seo_slug_help','entry_image_dimension','entry_image_dimension_help','entry_main_image_dimension','entry_main_image_dimension_help','entry_width','entry_height','entry_css','entry_css_help','entry_px','entry_listing_url','entry_listing_url_help','entry_add_link_listing','entry_add_link_listing_help','entry_link_title','entry_link_title_help','entry_add_link_listing_help','entry_link_sort_order','entry_link_sort_order_help','entry_seo_options','entry_seo_options_help','entry_main_image_show','entry_main_image_show_help','entry_disqus_status','entry_disqus_status_help','entry_disqus_short','entry_disqus_short_help','entry_addthis','entry_addthis_help', 'entry_enable_disable', 'entry_status', 'entry_add','entry_edit','entry_add_new_category','entry_close','entry_remove_category_confirm','entry_fill_required','entry_add_category_success','entry_update_category_success','entry_category_details', 'entry_title_blog_help', 'entry_excerpt_help', 'entry_body_help', 'entry_meta_keyword_help');
			
        foreach ($languageVariables as $languageVariable) {
            $data[$languageVariable] = $this->language->get($languageVariable);
        }
		
		$data['heading_title'] 			= $this->language->get('heading_title').' '.$this->version;

        $data['stores']					= array_merge(array(0 => array('store_id' => '0', 'name' => $this->config->get('config_name') . ' (' . $data['text_default'].')', 'url' => HTTP_SERVER, 'ssl' => HTTPS_SERVER)), $this->model_setting_store->getStores());
        $data['languages']              = $this->model_localisation_language->getLanguages();
        $data['store']                  = $store;
        $data['token']                  = $this->session->data['token'];
        $data['action']                 = $this->url->link('module/'.$this->moduleNameSmall, 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel']                 = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $data['moduleSettings']			= $this->model_setting_setting->getSetting($this->moduleName, $store['store_id']);
        $data['moduleData']				= (isset($data['moduleSettings'][$this->moduleName])) ? $data['moduleSettings'][$this->moduleName] : array();
		$data['catalog_url']			= $this->getCatalogURL();
		$data['url']					= $this->url;

		$data['header']					= $this->load->controller('common/header');
		$data['column_left']			= $this->load->controller('common/column_left');
		$data['footer']					= $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'.tpl', $data));
    }
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/'.$this->moduleNameSmall)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
	
    public function install() {
	    $this->load->model('module/'.$this->moduleNameSmall);
	    $this->{$this->moduleModel}->install();
    }
    
    public function uninstall() {
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->load->model('setting/store');
        $this->load->model('localisation/language');
        $this->load->model('design/layout');
		
		$this->model_setting_setting->deleteSetting($this->moduleData_module,0);
		$stores=$this->model_setting_store->getStores();
		foreach ($stores as $store) {
			$this->model_setting_setting->deleteSetting($this->moduleData_module, $store['store_id']);
		}
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->{$this->moduleModel}->uninstall();
    }
	
	
    private function getCatalogURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        } 
        return $storeURL;
    }

    private function getServerURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_SERVER;
        } else {
            $storeURL = HTTP_SERVER;
        } 
        return $storeURL;
    }

    private function getCurrentStore($store_id) {    
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL(); 
        }
        return $store;
    }
	
	public function getPosts() {
		$data['moduleName'] = $this->moduleName;
		$data['moduleNameSmall'] = $this->moduleNameSmall;
		$data['moduleData_module'] = $this->moduleData_module;
		$data['moduleModel'] = $this->moduleModel;
		
		$data['store_id']			= $this->request->get['store_id'];
		$data['token']				= $this->session->data['token'];

		if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
			
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0;
        } 
		
		$data['sorts'] = array();
		
		$categories = $this->db->query( "SELECT * FROM " . DB_PREFIX . "iblog_categories_id cid LEFT JOIN ". DB_PREFIX . "iblog_categories ic ON cid.category_id = ic.category_id WHERE language_id = '" . (int)$this->config->get('config_language_id') . "' AND store_id = '" . (int)$data['store_id'] . "'")->rows;
	
		if(!empty($categories)) {
			foreach($categories as $category) {
				$data['sorts'][] = array(
					'text'  => $category['name'],
					'value' => $category['category_id'],
				);
			} 
		}
		
		if (isset($this->request->get['category'])) {
			$category_sort = $this->request->get['category'];
			$data['category_sort'] = $category_sort;
		} 
		
	    $this->load->model('module/'.$this->moduleNameSmall);
		
		$data['url_link'] = $this->url;

		$data['limit']				= 10;
		$data['total']				= $this->{$this->moduleModel}->getTotalPosts($this->request->get['store_id']);
		
		$sources			= $this->{$this->moduleModel}->viewPosts($page, $data['limit'], $data['store_id']);
				
		if(!isset($category_sort) || $category_sort == 0) {
			$data['sources'] = $sources;
		} else {
			$data['sources'] = array();
			foreach($sources as $source) {
				if(isset($source['category_id']) && $source['category_id'] !== '0') {
					$category_id = unserialize($source['category_id']);
				} else {
					$category_id = array();
				}
			
				if((isset($category_sort) && isset($category_id) && in_array($category_sort,$category_id)) || $category_sort == 0) {
					$data['sources'][] = array(
						'iblog_post_id'	=> $source['iblog_post_id'],
						'title'		=> $source['title'],
						'excerpt'	=> $source['excerpt'],
						'author'	=> $source['author'],
						'created'	=> $source['created'],
						'modified'	=> $source['modified'],
						'is_published' => $source['is_published'],
					);	
				}
			}
		}

	    $pagination					= new Pagination();
        $pagination->total			= $data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $data['limit']; 
        $pagination->url			= $this->url->link('module/'.$this->moduleNameSmall.'/getPosts','token=' . $this->session->data['token'].'&page={page}&store_id='.$this->request->get['store_id'], 'SSL');
		
		$data['pagination']			= $pagination->render();
		
		$this->load->language('module/iblog');	
		
		$data['sort_category']		= $this->language->get('sort_category');
		$data['text_all'] 			= $this->language->get('text_all');
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($data['total']) ? (($page - 1) * $data['limit']) + 1 : 0, ((($page - 1) * $data['limit']) > ($data['total'] - $data['limit'])) ? $data['total'] : ((($page - 1) * $data['limit']) + $data['limit']), $data['total'], ceil($data['total'] / $data['limit']));	
			
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'/view_blogs.tpl', $data));
	}
	
	public function getCategories() {
		$data['moduleName'] = $this->moduleName;
		$data['moduleNameSmall'] = $this->moduleNameSmall;
		$data['moduleData_module'] = $this->moduleData_module;
		$data['moduleModel'] = $this->moduleModel;
		
		if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
			
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0;
        } 
				
        $this->load->model('module/'.$this->moduleNameSmall);
		
		$data['url_link'] = $this->url;

		$data['store_id']			= $this->request->get['store_id'];
		$data['token']				= $this->session->data['token'];
		$data['limit']				= 10;
		$data['total']				= $this->{$this->moduleModel}->getTotalCategories($this->request->get['store_id']);
		
		$data['categories']			= $this->{$this->moduleModel}->viewCategories($page, $data['limit'], $data['store_id']);
	    $pagination					= new Pagination();
        $pagination->total			= $data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $data['limit']; 
        $pagination->url			= $this->url->link('module/'.$this->moduleNameSmall.'/getCategories','token=' . $this->session->data['token'].'&page={page}&store_id='.$this->request->get['store_id'], 'SSL');
		
		$data['pagination']			= $pagination->render();

		$this->language->load('module/'.$this->moduleNameSmall);
				
	    $languageVariables = array('entry_id','entry_name','entry_actions','entry_edit','entry_remove','entry_no_categories', 'entry_add','entry_edit','entry_add_new_category','entry_close','entry_remove_category_confirm','entry_fill_required','entry_add_category_success','entry_update_category_success','entry_category_details');
			
        foreach ($languageVariables as $languageVariable) {
            $data[$languageVariable] = $this->language->get($languageVariable);
        }
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($data['total']) ? (($page - 1) * $data['limit']) + 1 : 0, ((($page - 1) * $data['limit']) > ($data['total'] - $data['limit'])) ? $data['total'] : ((($page - 1) * $data['limit']) + $data['limit']), $data['total'], ceil($data['total'] / $data['limit']));	
			
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'/view_categories.tpl', $data));
	}
	
	public function newBlogPost() {
		$this->load->model('tool/image');
		$this->load->model('module/'.$this->moduleNameSmall);
		$this->load->model('localisation/language');
		$this->load->model('user/user');
		
		$this->language->load('module/'.$this->moduleNameSmall);		
		    $languageVariables = array(
			'text_published',
			'text_draft',
			'text_none',
			'text_image_manager',
			'text_browse',
			'text_clear',
			'entry_title',
			'entry_title_blog_help',
			'entry_meta_description',
			'entry_meta_keyword',
			'entry_meta_keyword_help',
			'entry_body',
			'entry_body_help',
			'entry_excerpt',
			'entry_excerpt_help',
			'entry_slug',
			'entry_slug_help',
			'entry_image',
			'entry_image_help',
			'entry_status',
			'entry_post_status',
			'entry_author',
			'entry_author_help',
			'entry_show_author',
			'entry_show_author_help',
			'entry_date_published',
			'entry_category',
			'entry_category_help',
			'entry_featured',
			'entry_featured_help',
			'text_enabled',
			'text_disabled',
			'entry_sort_order',
			'entry_sort_order_post_help'
        );
       
        foreach ($languageVariables as $languageVariable) {
            $data[$languageVariable] = $this->language->get($languageVariable);
        }
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }
		$data['store_id'] = $this->request->get['store_id'];
		
		if (isset($this->request->get['post_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$post_info = $this->{$this->moduleModel}->getPost($this->request->get['post_id']);
			$data['post_id'] = $this->request->get['post_id'];
    	}
		
		if (isset($this->request->post['post_description'])) {
			$data['post_description'] = $this->request->post['post_description'];
		} elseif (isset($this->request->get['post_id'])) {
			$data['post_description'] = $this->{$this->moduleModel}->getPostDescriptions($this->request->get['post_id']);
		} else {
			$data['post_description'] = array();
		}
		
		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (!empty($post_info)) {
			$data['category_id'] = unserialize($post_info['category_id']);
		} else {
			$data['category_id'] = array(0);
		}
				
		if (isset($this->request->post['slug'])) {
      		$data['slug'] = $this->request->post['slug'];
    	} elseif (!empty($post_info)) {
			$data['slug'] = $post_info['slug'];
		} else {
      		$data['slug'] = '';
    	}
		
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($post_info)) {
			$data['image'] = $post_info['image'];
		} else {
			$data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($post_info) && is_file(DIR_IMAGE . $post_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($post_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		if (isset($this->request->post['date_published'])) {
       		$data['date_published'] = $this->request->post['date_published'];
		} elseif (!empty($post_info)) {
			$data['date_published'] = date('Y-m-d H:i:s', strtotime($post_info['created']));
		} else {
			$data['date_published'] = date('Y-m-d H:i:s', time());
		}
				
    	if (isset($this->request->post['status'])) {
      		$data['status'] = $this->request->post['status'];
    	} elseif (!empty($post_info)) {
			$data['status'] = $post_info['is_published'];
		} else {
      		$data['status'] = 1;
    	}
		
		if (isset($this->request->post['featured'])) {
      		$data['featured'] = $this->request->post['featured'];
    	} elseif (!empty($post_info)) {
			$data['featured'] = !empty($post_info['is_featured']);
		} else {
      		$data['featured'] = 0;
    	}
		
		
		if (isset($this->request->post['show_author'])) {
      		$data['show_author'] = $this->request->post['show_author'];
    	} elseif (!empty($post_info['show_author'])) {
			$data['show_author'] = !empty($post_info['show_author']);
		} else {
      		$data['show_author'] = 0;
    	}

		$users = $this->model_user_user->getUsers();
		$data['authors'] = array();
		
		foreach ($users as $user) {
			$data['authors'][] = array(
				'author_id' => $user['user_id'],
				'name' => $user['firstname'] . ' ' . $user['lastname']
			);	
		}
		
		if (isset($this->request->post['category_id'])) {
      		$data['category_id'] = $this->request->post['category_id'];
    	} elseif (!empty($post_info)) {
			$data['category_id'] = $post_info['category_id'];
		} else {
      		$data['category_id'] = 0;
    	}
		
		if (isset($this->request->post['slug'])) {
      		$data['slug'] = $this->request->post['slug'];
    	} elseif (!empty($post_info)) {
			$data['slug'] = $post_info['slug'];
		} else {
      		$data['slug'] = '';
    	}
		
		if (isset($this->request->post['sort_order_post'])) {
      		$data['sort_order_post'] = $this->request->post['sort_order_post'];
    	} elseif (!empty($post_info['sort_order_post'])) {
			$data['sort_order_post'] = $post_info['sort_order_post'];
		} else {
      		$data['sort_order_post'] = '';
    	}
		
		$data['categories'] = $this->db->query("SELECT * FROM " . DB_PREFIX . "iblog_categories_id cid LEFT JOIN " . DB_PREFIX . "iblog_categories ic ON ic.category_id=cid.category_id WHERE language_id = '" . (int)$this->config->get('config_language_id') . "' AND store_id = '" . (int)$this->request->get['store_id'] . "'")->rows;	

		$data['token'] = $this->session->data['token'];
		
		$data['language_id'] = $this->config->get('config_language_id');
		
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'/add_new.tpl', $data));
	}
	
	public function newCategory() {
		$this->load->model('module/'.$this->moduleNameSmall);
		$this->load->model('localisation/language');
		$this->load->model('user/user');
		
		$this->language->load('module/'.$this->moduleNameSmall);		
		    $languageVariables = array(
			'entry_title',
			'entry_title_help',
			'entry_parent',
			'entry_parent_help',
			'entry_description',
			'entry_description_help',
			'text_none',
			'entry_meta_title',
			'entry_meta_description',
			'entry_meta_keyword',
			'entry_keyword',
			'entry_keyword_help',
			'entry_image',
        );
       
        foreach ($languageVariables as $languageVariable) {
            $data[$languageVariable] = $this->language->get($languageVariable);
        }

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }
		$data['store_id'] = $this->request->get['store_id'];
		
		if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$category_info = $this->{$this->moduleModel}->getCategory($this->request->get['category_id'], $data['store_id']);
			$data['category_id'] = $this->request->get['category_id'];
    	}
		
		if (isset($this->request->post['category_description'])) {
			$data['category_description'] = $this->request->post['category_description'];
		} elseif (isset($this->request->get['category_id'])) {
			$data['category_description'] = $this->{$this->moduleModel}->getCategoryDescriptions($this->request->get['category_id']);
		} else {
			$data['category_description'] = array();
		}

		if (isset($this->request->post['path'])) {
			$data['path'] = $this->request->post['path'];
		} elseif (!empty($category_info)) {
			$data['path'] = $category_info['path'];
		} else {
			$data['path'] = '';
		}

	    if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($category_info)) {
			$data['parent_id'] = $category_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}
		
		if (isset($this->request->post['slug'])) {
			$data['slug'] = $this->request->post['slug'];
		} elseif (!empty($category_info)) {
			$data['slug'] = $category_info['slug'];
		} else {
			$data['slug'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($category_info)) {
			$data['image'] = $category_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($category_info) && is_file(DIR_IMAGE . $category_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($category_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		
		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['slug'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}
		
		$data['token'] = $this->session->data['token'];
		
		$data['language_id'] = $this->config->get('config_language_id');	
			
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'/add_category.tpl', $data));
	}
	
	public function updatePost() {
		$this->load->model('module/'.$this->moduleNameSmall);
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && (!isset($this->request->post['post_id'])) && $this->validateForm()) {
			$this->{$this->moduleModel}->addPost($this->request->post);
    	} else if ($this->request->server['REQUEST_METHOD'] == 'POST' && (isset($this->request->post['post_id']))) {
			$this->{$this->moduleModel}->editPost($this->request->post['post_id'], $this->request->post);
		}	
	}
	
	public function updateCategory() {
		$this->load->model('module/'.$this->moduleNameSmall);
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && (!isset($this->request->post['category_id'])) && $this->validateForm()) {
			$this->{$this->moduleModel}->addCategory($this->request->post);
    	} else if ($this->request->server['REQUEST_METHOD'] == 'POST' && (isset($this->request->post['category_id']))) {
			$this->{$this->moduleModel}->editCategory($this->request->post['category_id'], $this->request->post);
		}	
	}
		
	public function removePost() {
		$this->load->model('module/'.$this->moduleNameSmall);
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			if (isset($this->request->post['id'])) {
				$this->{$this->moduleModel}->deletePost($this->request->post['id']);
			}
    	}	
	}
	
	public function removeCategories() {
		$this->load->model('module/'.$this->moduleNameSmall);
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			if (isset($this->request->post['id'])) {
				$this->{$this->moduleModel}->deleteCategory($this->request->post['id']);
			}
    	}	
	}
	
	public function autocompleteCategory() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('module/iblog');
			
			if(isset($this->request->get['store_id'])) {
				$store_id = $this->request->get['store_id'];
			} else {
			   $store_id = 0; 
			}


			$results = $this->model_module_iblog->viewCategories(1, 5, $store_id ,'name', 'ASC', $this->request->get['filter_name']);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
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