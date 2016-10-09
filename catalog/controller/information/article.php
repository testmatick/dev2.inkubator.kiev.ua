<?php 
class ControllerInformationArticle extends Controller {  
	public function index() { 
		$this->language->load('information/article');
		
		$this->load->model('catalog/article');
		
		$this->load->model('tool/image');
			
		if (isset($this->request->get['article'])) {

			$parts = explode('_', (string)$this->request->get['article']);

			$article_id = (int)array_pop($parts);

		} else {
			$article_id = 0;
		}
		
		$article_info = $this->model_catalog_article->getArticle($article_id);
	
		if ($article_info) {

			$results = $this->model_catalog_article->getArticles($article_id);				
			
			$url = '';
					
			$data['articles'] = array();			
					
			foreach ($results as $result) {

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

			$level_data = $this->model_catalog_article->getArticles($result['article_id']);

			if (!$result['alternative_link']) {
				$link_to_go = $this->url->link('information/article', 'article=' . $this->request->get['article'] . '_' . $result['article_id'] . $url);
				$external = false;
			}else{
				$link_to_go = $result['alternative_link'];
				$external = true;
			}
				
				$data['articles'][] = array(
					'article_id'  => $result['article_id'],
					'thumb_category'  => $thumb_category,
					'name'  => $result['name'],
					'children'    => $level_data,
					'description' => $desc,
					'href'  => $link_to_go,
					'date'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'viewed'  => $result['viewed'],
					'external'  => $external
				);
			}
		}

		$data['articles_list'] = array();

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if ($this->config->get('article_page_limit')) {
			$limit = $this->config->get('article_page_limit');
		}else{
    			$limit = 10;
		}

		$filter_data = array(
			'article_id'              => $article_id,
			'sort'  => 'a.date_added',
			'order' => 'DESC',
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);
					
		$articles_list = $this->model_catalog_article->getArticlesList($filter_data);
		
		foreach ($articles_list as $result) {
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
				$link_to_go = $this->url->link('information/article', 'article=' . $this->request->get['article'] . '_' . $result['article_id']);
				$external = false;
			}else{
				$link_to_go = $result['alternative_link'];
				$external = true;
			}
			
					$data['articles_list'][] = array(
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


		if ($this->config->get('article_module_heading' .(int)$this->config->get('config_language_id'))) {
			$text_articles = $this->config->get('article_module_heading' .(int)$this->config->get('config_language_id'));
		}else{
    			$text_articles = $this->language->get('text_articles');
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
   		
		if ($this->config->get('article_show_root') == '1' || $this->config->get('article_show_root') == '2') {

   		$data['breadcrumbs'][] = array(
       		'text'      => $text_articles,
		'href'      => $this->url->link('information/articles')
   		);

		}

		if (isset($this->request->get['article'])) {

			$path = '';

			$parts = explode('_', (string)$this->request->get['article']);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$article_info = $this->model_catalog_article->getArticle($path_id);

				if ($article_info) {
					$data['breadcrumbs'][] = array(
						'text' => $article_info['name'],
						'href' => $this->url->link('information/article', 'article=' . $path)
					);
				}
			}
		}	

			if ($article_info['image']) {

				if ($results) {
				if ($this->config->get('article_thumb_category_width') && $this->config->get('article_thumb_category_height')) {
				$data['image'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('article_thumb_category_width'), $this->config->get('article_thumb_category_height'));
				$data['image_popup'] = '';
				} else {
				$data['image'] = '';
				$data['image_popup'] = '';
				}

				}else{

				if ($this->config->get('article_image_width') && $this->config->get('article_image_height')) {
				$data['image'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('article_image_width'), $this->config->get('article_image_height'));
				$data['image_popup'] = 'image/' . $article_info['image'];
				} else {
				$data['image'] = '';
				$data['image_popup'] = '';
				}
			}

                 	} else {
				$data['image'] = '';
				$data['image_popup'] = '';
			}
									
			$data['description'] = html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8');

			$data['date'] = date($this->language->get('date_format_short'), strtotime($article_info['date_added']));
			$data['viewed'] = $article_info['viewed'];

			if ($article_info['seo_title']) {
		  		$this->document->setTitle($article_info['seo_title']);
			} else {
		  		$this->document->setTitle($article_info['name']);
			}

			$this->document->setDescription($article_info['meta_description']);
			$this->document->setKeywords($article_info['meta_keyword']);

			$data['products'] = array();

			$products = $this->model_catalog_article->getProductRelated($article_id);

		if ($products) {
			$this->load->model('catalog/product');

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info['status'] != 0) {

				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$product_info['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			    }
			  }
			}

$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/articles.css')) {
			$this->document->addStyle('catalog/view/theme/'. $this->config->get('config_template') . '/stylesheet/articles.css');
			} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/articles.css');
			}
			
			if ($article_info['seo_h1']) {
      				$data['heading_title'] = $article_info['seo_h1'];
   			} else {
      				$data['heading_title'] = $article_info['name'];
   			}

			if ($article_info['related_title']) {
      				$data['text_related'] = $article_info['related_title'];
   			} else {
      				$data['text_related'] = $this->language->get('text_related');
   			}
			
			$data['text_subcategories'] = $this->language->get('text_subcategories');
			$data['text_articles_list'] = $this->language->get('text_articles_list');
			$data['text_readmore'] = $this->language->get('text_readmore');
			$data['text_empty'] = $this->language->get('text_empty');

			$data['text_tax'] = $this->language->get('text_tax');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');			
			$data['show_date'] = $this->config->get('article_show_date');
			$data['show_views'] = $this->config->get('article_show_views');
			$data['show_readmore'] = $this->config->get('article_show_readmore');
			$data['social'] = html_entity_decode($this->config->get('article_social'));	
			$data['button_continue'] = $this->language->get('button_continue');

			$articles_total = $this->model_catalog_article->getTotalArticlesByArticleId($article_id);
	
			$pagination = new Pagination();
			$pagination->total = $articles_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('information/article', 'article=' . $this->request->get['article'] . $url . '&page={page}');
	
			$data['pagination'] = $pagination->render();
	
			$data['results'] = sprintf($this->language->get('text_pagination'), ($articles_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($articles_total - $limit)) ? $articles_total : ((($page - 1) * $limit) + $limit), $articles_total, ceil($articles_total / $limit));

			$this->model_catalog_article->updateViewed($article_id);
			
			if ($this->config->get('article_show_root') == '1' || $this->config->get('article_show_root') == '2') {
				$data['continue'] = $this->url->link('information/articles');
			}else{
				$data['continue'] = '';
			}

			$data['button_continue'] = $this->language->get('button_continue');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/article.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/article.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/article.tpl', $data));
			}									
    	} else {
		$url = '';
		
		if (isset($this->request->get['article'])) {
			$url .= '&article=' . $this->request->get['article'];
		}
					
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_error'),
			'href'      => $this->url->link('information/article', $url)
		);
			
		$this->document->setTitle($this->language->get('text_error'));

      		$data['heading_title'] = $this->language->get('text_error');

      		$data['text_error'] = $this->language->get('text_error');

      		$data['button_continue'] = $this->language->get('button_continue');

      		$data['continue'] = $this->url->link('information/articles');

		$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
		}
		}
  	}

	public function updateViewed() {
		$this->load->model('catalog/article');
		$this->model_catalog_article->updateViewed($this->request->post['article_id']);
	}

}