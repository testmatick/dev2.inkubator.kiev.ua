<?php
class ControllerTltBlogTltBlog extends Controller {
	public function index() {
		$this->load->language('tltblog/tltblog');

		$this->load->model('tltblog/tltblog');
		$this->load->model('catalog/product');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		if ($this->config->get('tltblog_seo')) {
			require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
			$tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
			$this->url->addRewrite($tltblog_seo);
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['tltpath'])) {
			$path = $this->request->get['tltpath'];
		} elseif ($this->config->has('tltblog_path')) {
			$path = $this->config->get('tltblog_path');
		} else {
			$path = 'blogs';
		}
		
		$data['show_path'] = $this->config->get('tltblog_show_path');

		if ($data['show_path']) {
			if ($this->config->has('tltblog_path_title')) {
				$tmp_title = $this->config->get('tltblog_path_title');
				$root_title = $tmp_title[$this->config->get('config_language_id')]['path_title'];
			} else {
				$root_title = $this->language->get('text_title');
			}
			
			$data['breadcrumbs'][] = array(
				'text' => $root_title,
				'href' => $this->url->link('tltblog/tlttag', 'tltpath=' . $path)
			);
		}

		if (isset($this->request->get['tltblog_id'])) {
			$tltblog_id = (int)$this->request->get['tltblog_id'];
		} else {
			$tltblog_id = 0;
		}

		$tltblog_info = $this->model_tltblog_tltblog->getTltBlog($tltblog_id);

		if ($tltblog_info) {
			$this->document->setTitle($tltblog_info['meta_title']);
			$this->document->setDescription($tltblog_info['meta_description']);
			$this->document->setKeywords($tltblog_info['meta_keyword']);
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			$this->document->addLink($this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id), 'canonical');

			$data['breadcrumbs'][] = array(
				'text' => $tltblog_info['title'],
				'href' => $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' .  $tltblog_id)
			);
			
			$data['heading_title'] = $tltblog_info['title'];
			$data['show_title'] = $tltblog_info['show_title'];

			if ($this->request->server['HTTPS']) {
				$data['blog_image'] = $this->config->get('config_ssl') . 'image/' . $tltblog_info['image'];
			} else {
				$data['blog_image'] = $this->config->get('config_url') . 'image/' . $tltblog_info['image'];
			}
			
			$data['description'] = html_entity_decode($tltblog_info['description'], ENT_QUOTES, 'UTF-8');
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

			$data['products'] = array();

			$tltblog_relateds = $this->model_tltblog_tltblog->getTltBlogRelated($tltblog_id);

			foreach ($tltblog_relateds as $tltblog_related) {
				$result = $this->model_catalog_product->getProduct($tltblog_related["related_id"]);
				
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['tags'] = array();
			
			$tltblog_tags = $this->model_tltblog_tltblog->getTltTagsForBlog($tltblog_id);
			
			foreach ($tltblog_tags as $tltblog_tag) {
				$data['tags'][] = array(
					'title' => $tltblog_tag['title'],
					'href'  => $this->url->link('tltblog/tlttag', 'tltpath=' . $path . '&tlttag_id=' . $tltblog_tag['tlttag_id'])
				);
			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/tltblog/tltblog.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/tltblog/tltblog.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/tltblog/tltblog.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

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
}