<?php
class ControllerModuleLatestArticles extends Controller {
	public function index($setting) {
		$this->language->load('module/latest_articles');
		
      		$data['heading_title'] = $setting['name'];		
		$data['text_all_articles'] = $this->language->get('text_all_articles');
		$data['button_readmore'] = $this->language->get('button_readmore');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/articles.css')) {
			$this->document->addStyle('catalog/view/theme/'. $this->config->get('config_template') . '/stylesheet/articles.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/articles.css');
		}
				
		$this->load->model('catalog/article');
		
		$this->load->model('tool/image');

		if (isset($setting['parent_id'])) {
			$parent_id = $setting['parent_id'];
		} else {
			$parent_id = 0;
		}
		
		$data['articles'] = array();
		
		$filter_data = array(
			'parent_id'  => $parent_id,
			'sort'  => 'a.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		if ($parent_id == '0') {
			$data['parent_href'] = $this->url->link('information/articles');
		}else{
			$data['parent_href'] = $this->url->link('information/article', 'article=' . $parent_id);
		}
	
		$results = $this->model_catalog_article->getLatestArticles($filter_data);

		if ($results) {
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
			}

			$short_description = strip_tags(html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8'));

			$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));

			if (strlen($short_description) > 10) {
				$desc = $short_description;
			}else{
				$desc = $description;
			}

			if (!$result['alternative_link']) {
				$link_to_go = $this->url->link('information/article', 'article=' . $result['article_id']);
			}else{
				$link_to_go = $result['alternative_link'];
			}

			if (strlen($result['name']) > 68) {
				$caption = 120;
			}elseif (strlen($result['name']) > 34) {
				$caption = 150;
			}else{
				$caption = 180;
			}
			
			$data['articles'][] = array(
				'article_id' => $result['article_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'caption'    	 => utf8_substr($desc, 0, $caption) . '...',
				'href'    	 => $link_to_go
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest_articles.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/latest_articles.tpl', $data);
		} else {
			return $this->load->view('default/template/module/latest_articles.tpl', $data);
		}
	    }
	}
}