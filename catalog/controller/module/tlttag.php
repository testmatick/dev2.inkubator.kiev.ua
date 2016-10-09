<?php
class ControllerModuleTltTag extends Controller {
	public function index() {
		$this->load->language('module/tlttag');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('tltblog/tltblog');
		$this->load->model('setting/setting');

		if ($this->config->get('tltblog_seo')) {
			require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
			$tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
			$this->url->addRewrite($tltblog_seo);
		}

		$data['show_path'] = $this->config->get('tltblog_show_path');

		if (isset($this->request->get['tltpath'])) {
			$path = $this->request->get['tltpath'];
		} elseif ($this->config->has('tltblog_path')) {
			$path = $this->config->get('tltblog_path');
		} else {
			$path = 'blogs';
		}
		
		if (isset($this->request->get['tlttag_id'])) {
			$data['current_tag'] = $this->request->get['tlttag_id'];
		} else {
			$data['current_tag'] = '';
		}

		$data['tags'] = array();

		$tags = $this->model_tltblog_tltblog->getTltTags();
		
		if (!$data['current_tag'] && isset($this->request->get['tltblog_id'])) {
			$tagsforblog = $this->model_tltblog_tltblog->getTltTagsForBlog($this->request->get['tltblog_id']);
			if ($tagsforblog) {
				$data['current_tag'] = $tagsforblog[0]['tlttag_id'];
			}
		}
		
		foreach ($tags as $tag) {
			$data['tags'][] = array(
				'tlttag_id'  => $tag['tlttag_id'],
				'title' => $tag['title'],
				'href' => $this->url->link('tltblog/tlttag', 'tltpath=' . $path . '&tlttag_id=' . $tag['tlttag_id'])
			);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tlttag.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/tlttag.tpl', $data);
		} else {
			return $this->load->view('default/template/module/tlttag.tpl', $data);
		}
	}
}