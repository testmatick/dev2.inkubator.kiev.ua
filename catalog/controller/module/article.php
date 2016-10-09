<?php
class ControllerModuleArticle extends Controller {
	public function index($setting) {
		$this->load->language('module/article');

		if ($this->config->get('article_module_heading' .(int)$this->config->get('config_language_id'))) {
			$data['heading_title'] = $this->config->get('article_module_heading' .(int)$this->config->get('config_language_id'));
		}else{
    			$data['heading_title'] = $this->language->get('heading_title');
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

		foreach ($articles as $article) {

			if ($article['sort_order'] != '-1') {

			$children_data = array();

			if ($article['article_id'] == $data['article_id']) {
				$children = $this->model_catalog_article->getArticles($article['article_id']);

				foreach($children as $child) {
				if ($child['sort_order'] != '-1') {
				if (!$child['alternative_link']) {
					$link_to_go = $this->url->link('information/article', 'article=' . $article['article_id'] . '_' . $child['article_id']);
				}else{
					$link_to_go = $child['alternative_link'];
				}
					
					$children_data[] = array(
						'article_id' => $child['article_id'], 
						'name' => $child['name'], 
						'href' => $link_to_go
					);
				}
			    }
			}

			$data['articles'][] = array(
				'article_id' => $article['article_id'],
				'name'        => $article['name'],
				'children'    => $children_data,
				'href'        => $this->url->link('information/article', 'article=' . $article['article_id'])
			);
		}

		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/article.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/article.tpl', $data);
		} else {
			return $this->load->view('default/template/module/article.tpl', $data);
		}

	}
}