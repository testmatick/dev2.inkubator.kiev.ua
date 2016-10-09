<?php
class ControllerModuleTltBlog extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')]['title'])) {
			$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
			$data['show_title'] = $setting['show_title'];
			$data['show_blogs'] = $setting['show_blogs'];
			$data['num_columns'] = $setting['num_columns'];
			$data['show_image'] = $setting['show_image'];
			
			if (!isset($setting['template'])) {
				$setting['template'] = 'tltblog.tpl';
			}
			
			if (!isset($setting['template'])) {
				$setting['template'] = 'tltblog.tpl';
			}
			
			$this->load->model('tltblog/tltblog');
			$this->load->model('setting/setting');
			$this->load->model('tool/image');
			
			if ($this->config->get('tltblog_seo')) {
				require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
				$tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
				$this->url->addRewrite($tltblog_seo);
			}
			
			$data['tltblogs'] = array();

			if (isset($setting['tags_to_show'])) {
				$where_tags = $setting['tags_to_show'];
			} else {
				$where_tags = array();
			}

			$blogs_count = $this->model_tltblog_tltblog->countTltBlogs($where_tags);

			$cache_id = md5(http_build_query($setting));
			
			$results = '';

			if (($setting['sort'] == 'sortorder') || ($setting['limit'] > $blogs_count)) {
				$results = $this->cache->get('tltblog.' . $cache_id . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
			}
			
			if (!$results) {
				if ($setting['sort'] == 'sortorder') {
					$results = $this->model_tltblog_tltblog->getTltBlogs($setting['limit'], $where_tags);
					
					$this->cache->set('tltblog.' . $cache_id . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $results);
				} elseif ($setting['limit'] < $blogs_count) {
					$results = $this->model_tltblog_tltblog->getRandomTltBlogs($setting['limit'], $where_tags);
				} else {
					$results = $this->model_tltblog_tltblog->getTltBlogs(0, $where_tags);

					$this->cache->set('tltblog.' . $cache_id . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $results);
				}
			}
			
			if ($results) {
				if (isset($this->request->get['tltpath'])) {
					$path = $this->request->get['tltpath'];
				} elseif ($this->config->has('tltblog_path')) {
					$path = $this->config->get('tltblog_path');
				} else {
					$path = 'blogs';
				}
								
				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}
					
					if ($data['show_blogs'] && $result['show_description']) {
						$data['tltblogs'][] = array(
							'tltblog_id'  		=> $result['tltblog_id'],
							'thumb'       		=> $image,
							'title'       		=> $result['title'],
							'intro'       		=> html_entity_decode($result['intro'], ENT_QUOTES, 'UTF-8'),
							'show_description' 	=> $result['show_description'],
							'href'        		=> $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $result['tltblog_id'])
						);
					} else {
						$data['tltblogs'][] = array(
							'tltblog_id'  		=> $result['tltblog_id'],
							'thumb'       		=> $image,
							'title'       		=> $result['title'],
							'intro'       		=> html_entity_decode($result['intro'], ENT_QUOTES, 'UTF-8'),
							'show_description' 	=> '0',
							'href'        		=> ''
						);
					}
				}

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $setting['template'])) {
					return $this->load->view($this->config->get('config_template') . '/template/module/' . $setting['template'], $data);
				} elseif (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 'tltblog.tpl')) {
					return $this->load->view($this->config->get('config_template') . '/template/module/tltblog.tpl', $data);
				} else {
					return $this->load->view('default/template/module/tltblog.tpl', $data);
				}
			}
		}
	}
}