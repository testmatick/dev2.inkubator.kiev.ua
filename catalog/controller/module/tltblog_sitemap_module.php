<?php
class ControllerModuleTltBlogSitemapModule extends Controller {
	public function index($setting) {
		$this->load->language('module/tltblog_sitemap_module');

		$this->load->model('tltblog/tltblog');
		$this->load->model('setting/setting');

		if ($this->config->get('tltblog_seo')) {
			require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
			$tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
			$this->url->addRewrite($tltblog_seo);
		}

		$data['heading_blogs'] = $this->language->get('heading_blogs');
		$data['heading_tags'] = $this->language->get('heading_tags');

		if ($this->config->has('tltblog_path')) {
			$path = $this->config->get('tltblog_path');
		} else {
			$path = 'blogs';
		}

		if ($this->config->has('tltblog_path_title')) {
			$path_title = $this->config->get('tltblog_path_title');
			$data['path_title'] = $path_title[$this->config->get('config_language_id')]['path_title'];
		} else {
			$data['path_title'] = $this->language->get('heading_title');
		}

		$data['show_path'] = $this->config->get('tltblog_show_path');

		$data['tltblogs'] = array();
		$data['tlttags'] = array();
		$data['type'] = $setting['type'];
		$tltblogs = array();
		$tlttags = array();

		if ($setting['type'] == 'blogs') {
			$tltblogs = $this->model_tltblog_tltblog->getTltBlogs();
		} elseif ($setting['type'] == 'tags') {
			$tlttags = $this->model_tltblog_tltblog->getTltTags();
		} else {
			$tltblogs = $this->model_tltblog_tltblog->getTltBlogs();
			$tlttags = $this->model_tltblog_tltblog->getTltTags();
		}

		foreach ($tltblogs as $tltblog) {
			if ($tltblog['show_description']) {		
				$data['tltblogs'][] = array(
					'title'     => $tltblog['title'],
					'href'     => $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog['tltblog_id'])
				);
			}
		}

		foreach ($tlttags as $tlttag) {		
			$data['tlttags'][] = array(
				'title'     => $tlttag['title'],
				'href'     => $this->url->link('tltblog/tlttag', 'tltpath=' . $path . '&tlttag_id=' . $tlttag['tlttag_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tltblog_sitemap_module.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/tltblog_sitemap_module.tpl', $data);
		} else {
			return $this->load->view('default/template/module/tltblog_sitemap_module.tpl', $data);
		}
	}
}