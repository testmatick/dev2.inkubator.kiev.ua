<?php
class ControllerTltBlogTltTag extends Controller {
	public function index() {
		$this->load->language('tltblog/tlttag');
		
		$this->load->model('tltblog/tltblog');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		if ($this->config->get('tltblog_seo')) {
			require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
			$tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
			$this->url->addRewrite($tltblog_seo);
		}

		if ($this->config->has('tltblog_path_title')) {
			$tmp_title = $this->config->get('tltblog_path_title');
			$root_title = $tmp_title[$this->config->get('config_language_id')]['path_title'];
		} else {
			$root_title = $this->language->get('text_title');
		}

		if (isset($this->request->get['tlttag_id'])) {
			$tltblogs = $this->model_tltblog_tltblog->getTltBlogsForTag($this->request->get['tlttag_id']);
			$tlttag = $this->model_tltblog_tltblog->getTltTag($this->request->get['tlttag_id']);
			$title = isset($tlttag['title']) ? $tlttag['title'] : '';
			$meta_title = isset($tlttag['meta_title']) ? $tlttag['meta_title'] : '';
			$meta_description = isset($tlttag['meta_description']) ? $tlttag['meta_description'] : '';
			$meta_keyword = isset($tlttag['meta_keyword']) ? $tlttag['meta_keyword'] : '';
		} else {
			$tltblogs = $this->model_tltblog_tltblog->getTltBlogs();
			
			$meta_title = $root_title;
			$title = $root_title;
			
			if ($this->config->has('config_meta_description_' . $this->session->data['language'])) {
				$meta_description = $title . ' ' . $this->config->get('config_meta_description_' . $this->session->data['language']);
				$meta_keyword = $title . ' ' . $this->config->get('config_meta_keyword_' . $this->session->data['language']);
			} else {
				$meta_description = $title . ' ' . $this->config->get('config_meta_description');
				$meta_keyword = $title . ' ' . $this->config->get('config_meta_keyword');
			}
		}

		if (isset($this->request->get['tltpath'])) {
			$path = $this->request->get['tltpath'];
		} elseif ($this->config->has('tltblog_path')) {
			$path = $this->config->get('tltblog_path');
		} else {
			$path = 'blogs';
		}
		
		$show_path = $this->config->get('tltblog_show_path');
		
		$data['show_path'] = $show_path;
		
		if ($this->config->has('tltblog_num_columns')) {
			$data['num_columns'] = $this->config->get('tltblog_num_columns');
		} else {
			$data['num_columns'] = '1';
		}
		
		if ($this->config->has('tltblog_show_image')) {
			$data['show_image'] = $this->config->get('tltblog_show_image');
		} else {
			$data['show_image'] = '1';
		}

		if ($data['show_image']) {
			if ($this->config->has('tltblog_width')) {
				$width = $this->config->get('tltblog_width');
			} else {
				$width = 200;
			}
			
			if ($this->config->has('tltblog_height')) {
				$height = $this->config->get('tltblog_height');
			} else {
				$height = 200;
			}
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if ($show_path) {
			$data['breadcrumbs'][] = array(
				'text' => $root_title,
				'href' => $this->url->link('tltblog/tlttag', 'tltpath=' . $path)
			);
		} 
		
		if ($tltblogs) {
			$this->document->setTitle($meta_title);
			$this->document->setDescription($meta_description);
			$this->document->setKeywords($meta_keyword);

			$data['heading_title'] = $title;

			if (isset($this->request->get['tlttag_id'])) {
				$data['breadcrumbs'][] = array(
					'text' => $title,
					'href' => $this->url->link('tltblog/tlttag', 'tltpath=' . $path . '&tlttag_id=' . $this->request->get['tlttag_id'])
				);
			}

			foreach ($tltblogs as $tltblog) {
				if ($tltblog['image'] && $data['show_image']) {
					$image = $this->model_tool_image->resize($tltblog['image'], $width, $height);
				} elseif ($data['show_image']) {
					$image = $this->model_tool_image->resize('placeholder.png', $width, $height);
				} else {
					$image = '';
				}

				if ($tltblog['show_description']) {
					$data['tltblogs'][] = array(
						'tltblog_id'  		=> $tltblog['tltblog_id'],
						'thumb'       		=> $image,
						'title'       		=> $tltblog['title'],
						'intro'       		=> html_entity_decode($tltblog['intro'], ENT_QUOTES, 'UTF-8'),
						'show_description' 	=> $tltblog['show_description'],
						'href'        		=> $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog['tltblog_id'])
					);
				} else {
					$data['tltblogs'][] = array(
						'tltblog_id'  		=> $tltblog['tltblog_id'],
						'thumb'       		=> $image,
						'title'       		=> $tltblog['title'],
						'intro'       		=> html_entity_decode($tltblog['intro'], ENT_QUOTES, 'UTF-8'),
						'show_description' 	=> $tltblog['show_description'],
						'href'        		=> ''
					);
				}
			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
	
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/tltblog/tlttag.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/tltblog/tlttag.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/tltblog/tlttag.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('tltblog/tlttag', isset($this->request->get['tlttag_id']) ? 'tltpath=' . $path . '&tlttag_id=' . $this->request->get['tlttag_id'] : 'tltpath=' . $path . '&tlttag_id=' . $this->request->get['tlttag_id'])
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