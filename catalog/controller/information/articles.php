<?php  
class ControllerInformationArticles extends Controller {
	public function index() {
	
		$this->language->load('information/articles');
		$this->load->model('tool/image');

		if ($this->config->get('article_module_heading' .(int)$this->config->get('config_language_id'))) {
			$text_articles = $this->config->get('article_module_heading' .(int)$this->config->get('config_language_id'));
		}else{
    			$text_articles = $this->language->get('text_articles');
		}

		if ($this->config->get('article_module_title' .(int)$this->config->get('config_language_id'))) {
			$articles_title = $this->config->get('article_module_title' .(int)$this->config->get('config_language_id'));
		}else{
    			$articles_title = $this->language->get('text_articles');
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$data['breadcrumbs'] = array();
		
      		$data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home')
      		);
      		
      		$data['breadcrumbs'][] = array(
        	'text'      => $text_articles,
		'href'      => $this->url->link('information/articles')
      		);
		
		$this->document->setTitle($articles_title);
		$this->document->setDescription($this->config->get('article_module_metadescription' .(int)$this->config->get('config_language_id')));

		$data['heading_title'] = $text_articles;
		$data['text_subcategories'] = $this->language->get('text_subcategories');
		$data['text_articles_list'] = $this->language->get('text_articles_list');
		$data['text_readmore'] = $this->language->get('text_readmore');	
		$data['text_empty'] = $this->language->get('text_empty');

		if ($this->config->get('articles_description' .(int)$this->config->get('config_language_id'))) {
			$articles_description = $this->config->get('articles_description' .(int)$this->config->get('config_language_id'));
			$data['articles_description'] = html_entity_decode($articles_description, ENT_QUOTES, 'UTF-8');
		}else{
			$data['articles_description'] = ''; 
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/articles.css')) {
			$this->document->addStyle('catalog/view/theme/'. $this->config->get('config_template') . '/stylesheet/articles.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/articles.css');
		}		
		
		if (isset($this->request->get['article'])) {
			$parts = explode('_', (string)$this->request->get['article']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$data['article_id'] = $parts[0];
		} else {
			$data['article_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}
							
		$this->load->model('catalog/article');
		
		$data['articles'] = array();
					
		$articles = $this->model_catalog_article->getArticles(0);
		
		foreach ($articles as $result) {

			if ($result['sort_order'] != '-1') {

			if ($this->config->get('article_thumb_category_width') && $this->config->get('article_thumb_category_height')) {
				if ($result['image']) {
				$thumb_category = $this->model_tool_image->resize($result['image'], $this->config->get('article_thumb_category_width'), $this->config->get('article_thumb_category_height'));
				} else {
				$thumb_category = $this->model_tool_image->resize('placeholder.png', $this->config->get('article_thumb_category_width'), $this->config->get('article_thumb_category_height'));
				}
                 	} else {
				$thumb_category = '';
			}


			$short_description = html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8');

			$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));

			if (strlen(strip_tags($short_description)) > 20) {
				$desc = str_replace(array('<p>', '</p>'), '', $short_description);
			}else{
				if (strlen($description) > 20) {
					$desc = utf8_substr(str_replace(array('<p>', '</p>'), '', $description), 0, 400) . '...';
				}else{
					$desc = '';
				}
			}

			if (!$result['alternative_link']) {
				$link_to_go = $this->url->link('information/article', 'article=' . $result['article_id']);
				$external = false;
			}else{
				$link_to_go = $result['alternative_link'];
				$external = true;
			}

			$level_data = $this->model_catalog_article->getArticles($result['article_id']);
			
					$data['articles'][] = array(
					'article_id'  => $result['article_id'],
					'thumb_category'  => $thumb_category,
					'name'        => $result['name'],
					'description' => $desc,
					'children'    => $level_data,
					'href'        => $link_to_go,
					'date'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'viewed'  => $result['viewed'],
					'external'  => $external
					);
		     }

		}

		$data['latest_articles'] = array();

		if ($this->config->get('article_page_limit')) {
			$limit = $this->config->get('article_page_limit');
		}else{
    			$limit = 10;
		}

		$filter_data = array(
			'parent_id'  => '0',
			'article_id'  => '0',
			'sort'  => 'a.date_added',
			'order' => 'DESC',
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);
					
		if ($this->config->get('article_show_latest')) {			
			$latest_articles = $this->model_catalog_article->getLatestArticles($filter_data);
		}else{
			$latest_articles = $this->model_catalog_article->getArticlesList($filter_data);
		}
		
		if ($latest_articles) {
		foreach ($latest_articles as $result) {
			if ($result['sort_order'] != '-1') {

			if ($this->config->get('article_thumb_width') && $this->config->get('article_thumb_height')) {
				if ($result['image']) {
				$thumb = $this->model_tool_image->resize($result['image'], $this->config->get('article_thumb_width'), $this->config->get('article_thumb_height'));
				} else {
				$thumb = $this->model_tool_image->resize('placeholder.png', $this->config->get('article_thumb_width'), $this->config->get('article_thumb_height'));
				}
                 	} else {
				$thumb = '';
			}

			$short_description = html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8');

			$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));

			if (strlen(strip_tags($short_description)) > 20) {
				$desc = str_replace(array('<p>', '</p>'), '', $short_description);
			}else{
				if (strlen($description) > 20) {
					$desc = utf8_substr(str_replace(array('<p>', '</p>'), '', $description), 0, 400) . '...';
				}else{
					$desc = '';
				}
			}

			if (!$result['alternative_link']) {
				$link_to_go = $this->url->link('information/article', 'article=' . $result['article_id']);
				$external = false;
			}else{
				$link_to_go = $result['alternative_link'];
				$external = true;
			}
			
					$data['latest_articles'][] = array(
					'article_id'  => $result['article_id'],
					'thumb'        => $thumb,
					'name'        => $result['name'],
					'description' => $desc,
					'href'        => $link_to_go,
					'date'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'viewed'  => $result['viewed'],
					'external'  => $external
					);
		     }
		   }
		}

		if ($this->config->get('article_show_latest')) {
			$articles_total = $this->model_catalog_article->getTotalArticles();
		}else{
			$articles_total = $this->model_catalog_article->getTotalArticlesByArticleId();
		}

		$pagination = new Pagination();
		$pagination->total = $articles_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/articles','&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($articles_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($articles_total - $limit)) ? $articles_total : ((($page - 1) * $limit) + $limit), $articles_total, ceil($articles_total / $limit));

		$data['show_date'] = $this->config->get('article_show_date');
		$data['show_views'] = $this->config->get('article_show_views');
		$data['show_readmore'] = $this->config->get('article_show_readmore');
		$data['button_continue'] = $this->language->get('button_continue');
		$data['continue'] = $this->url->link('common/home');
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/articles.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/articles.tpl', $data));
		} else {
		$this->response->setOutput($this->load->view('default/template/information/articles.tpl', $data));
		}
	}
}