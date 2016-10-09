<?php
class ControllerFeedTltBlogSitemap extends Controller {
	public function index() {
		if ($this->config->get('tltblog_sitemap_status')) {
			if ($this->config->has('tltblog_path')) {
				$path = $this->config->get('tltblog_path');
			} else {
				$path = 'blogs';
			}

			if ($this->config->get('tltblog_seo')) {
				require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
				$tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
				$this->url->addRewrite($tltblog_seo);
			}

			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

			$this->load->model('tltblog/tltblog');

			$tltblogs = $this->model_tltblog_tltblog->getTltBlogs();

			foreach ($tltblogs as $tltblog) {
				if ($tltblog['show_description']) {
					$output .= '<url>';
					$output .= '<loc>' . $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog['tltblog_id']) . '</loc>';
					$output .= '<changefreq>weekly</changefreq>';
					$output .= '<priority>1.0</priority>';
					$output .= '</url>';
				}
			}

			$tlttags = $this->model_tltblog_tltblog->getTltTags();

			foreach ($tlttags as $tlttag) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('tltblog/tlttag', 'tltpath=' . $path . '&tlttag_id=' . $tlttag['tlttag_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>1.0</priority>';
				$output .= '</url>';
			}

			$output .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}
}
