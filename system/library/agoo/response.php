<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
class agooResponse extends Controller
{
	protected $Response;
	protected $data;
	protected $agooheaders = array();
	protected $octet_stream_flag = false;

	public function __call($name, array $params)
	{
		//$enter_mem = memory_get_peak_usage();

		if ($this->registry->get('returnResponseSetOutput') && strtolower($name) == 'setoutput') {
			$this->registry->set('returnResponseSetOutput', $params[0]);
			return;
		}
		if ($this->config->get('ascp_settings') != '') {
			$this->data['settings_general'] = $this->config->get('ascp_settings');
		} else {
			$this->data['settings_general'] = Array();
		}

		if (strtolower($name) == 'addheader') {
			$this->agooheaders[] = $params[0];
			if (strpos(strtolower($params[0]), 'application/octet-stream') !== false) {
            	$this->octet_stream_flag = true;
			}
		}


		if (isset($this->data['settings_general']['cache_pages']) && $this->data['settings_general']['cache_pages'] && !$this->registry->get('admin_work')) {
			if (isset($this->session->data)) {
				$session = $this->session->data;
			} else {
				$session = array();
			}
			if (isset($session['token'])) {
				unset($session['token']);
			}
			if (isset($session['captcha'])) {
				unset($session['captcha']);
			}
			$serial_session    = serialize($session);
			$data_cache['url'] = $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			$hash              = md5(serialize($data_cache) . serialize($this->request->post) . $serial_session . serialize($this->config->get('config_language_id')) . serialize($this->config->get('config_store_id')));
			$cache_name        = 'blog.output.' . $hash;
			if (!$this->config->get("blog_work")) {
				$this->config->set("blog_work", true);
				$off_blog_work = true;
			} else {
				$off_blog_work = false;

			}
			$module_view_cache = $this->cache->get($cache_name);
			if ($off_blog_work) {
				$this->config->set("blog_work", false);
			}
			if (isset($module_view_cache) && $module_view_cache != '' && !$this->registry->get('blog_cache_set')) {
				$Response_old = $this->registry->get('response_old');
				$this->registry->set('response', $Response_old);
				//echo "Bingo cache - fastest output";
				if (!$this->registry->get('admin_work')) {
					$this->config->set('ascp_comp_url', true);
					if (SC_VERSION > 15) {
						$this->load->controller('common/seoblog');
					} else {
						$this->getChild('common/seoblog');
					}
				}
				if (isset($this->request->get['record_id'])) {
					$this->countRecordUpdate();
				}
				if (isset($this->request->get['record_id']) || isset($this->request->get['blog_id'])) {
					if ($this->checkAccess()) {
						$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
					} else {
						$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');
					}
				}
				$this->response->setOutput($module_view_cache);
				$this->response->output();
				exit();
			}
		}
		$modules = false;

		if (isset($params[0]) && is_string($params[0])) {
			if (!$this->registry->get('admin_work')) {
				if (strtolower($name) == 'setoutput') {
					$params[0] = $this->set_sitemap($params[0]);
				}
				//$pagination_file= DIR_APPLICATION.'controller/record/pagination.php';
				//require_once($pagination_file);
				//$ControllerRecordPagination = new ControllerRecordPagination($this->registry);
				if (SC_VERSION < 20) {
					//$params[0] = $ControllerRecordPagination->index($params[0]);
				}
				// $params[0] = $ControllerRecordPagination->removecategorydescription($params[0]);
				//unset($ControllerRecordPagination);
				$params[0] = $this->set_og_page($params[0]);
				$params[0] = $this->set_hreflang($params[0]);
				//if (!isset($this->data['settings_general']['langmark_widget_status']) || !$this->data['settings_general']['langmark_widget_status']) {
				//if (SC_VERSION < 20) {
					$this->cont('record/pagination');
					$params[0] = $this->controller_record_pagination->setPagination($params[0]);
					unset($this->controller_record_pagintation);
				//}
				// }
			}
			if ($this->registry->get('admin_work') && isset($this->data['settings_general']['menu_admin_status']) && $this->data['settings_general']['menu_admin_status']) {
				if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
				} else {
					if (strtolower($name) == 'setoutput' && $this->cont('catalog/seocms')) {
						$admin_html = $this->controller_catalog_seocms->index();
						$find       = array(
							"</body>"
						);
						$replace    = array(
							$admin_html . "</body>"
						);

						if (!$this->octet_stream_flag) {
							if (!isset($params[0][11000000])) {
								$params[0]  = str_replace($find, $replace, $params[0]);
							}
						}
					}
				}
			}
		}
		if (strtolower($name) == 'setoutput' && $this->registry->get("blog_output") && isset($this->data['settings_general']['cache_pages']) && $this->data['settings_general']['cache_pages']) {
			$cache_output = $params[0];
			//for cache
			if (!$this->config->get("blog_work")) {
				$this->config->set("blog_work", true);
				$off_blog_work = true;
			} else {
				$off_blog_work = false;
				;
			}
			$this->cache->set($cache_name, $cache_output);
			if ($off_blog_work) {
				$this->config->set("blog_work", false);
			}
			$this->registry->set('blog_cache_set', true);
		}
		$this->registry->set('response_work', true);
		$this->Response = $this->registry->get('response_old');
		$modules        = call_user_func_array(array(
			$this->Response,
			$name
		), $params);
		unset($this->Response);
		$this->registry->set('response_work', false);
		unset($params);
		// low memory consumption
		// print_my(memory_get_peak_usage() - $enter_mem);
		return $modules;
	}
	private function set_sitemap($params)
	{
		if ($this->config->get('google_sitemap_blog_status')) {
			if ($this->config->get('ascp_settings_sitemap') != '') {
				$data['ascp_settings_sitemap'] = $this->config->get('ascp_settings_sitemap');
			} else {
				$data['ascp_settings_sitemap'] = Array();
			}
			if (isset($data['ascp_settings_sitemap']['google_sitemap_blog_inter_status']) && $data['ascp_settings_sitemap']['google_sitemap_blog_inter_status']) {
				if (isset($this->request->get['route'])) {
					$data['route'] = $this->request->get['route'];
				} else {
					$data['route'] = false;
				}
				if (isset($data['ascp_settings_sitemap']['google_sitemap_blog_inter_route']) && $data['ascp_settings_sitemap']['google_sitemap_blog_inter_route'] != '' && $data['ascp_settings_sitemap']['google_sitemap_blog_inter_route'] == $data['route'] && $data['route'] != 'record/google_sitemap_blog') {
					if (isset($data['ascp_settings_sitemap']['google_sitemap_blog_inter_tag']) && $data['ascp_settings_sitemap']['google_sitemap_blog_inter_tag'] != '') {
						$google_sitemap_blog_inter_tag = html_entity_decode($data['ascp_settings_sitemap']['google_sitemap_blog_inter_tag'], ENT_QUOTES, 'UTF-8');
						if (strpos($params, $google_sitemap_blog_inter_tag) === false) {
						} else {
							if ($this->cont('record/google_sitemap_blog')) {
								$sitemap_html = $this->controller_record_google_sitemap_blog->getascp();
								$find         = array(
									$google_sitemap_blog_inter_tag
								);
								$replace      = array(
									$sitemap_html . $google_sitemap_blog_inter_tag
								);
								$params       = str_replace($find, $replace, $params);
							}
						}
					}
				}
			}
		}
		return $params;
	}
	private function set_hreflang($params)
	{
		if (isset($params) && !$this->registry->get('admin_work')) {
			if (strpos($params, '<link rel="alternate"') === false && method_exists($this->document, 'getHreflang')) {
				$sc_hreflang = $this->document->getHreflang();
				if ($sc_hreflang && !empty($sc_hreflang)) {
					foreach ($sc_hreflang as $sc_hreflang_code => $sc_hreflang_array) {
						$params = str_replace("</head>", '
<link rel="alternate" hreflang="' . $sc_hreflang_array['hreflang'] . '" href="' . $sc_hreflang_array['href'] . '" />
</head>', $params);
					}
				}
			}
		}
		return $params;
	}
	private function set_og_page($params)
	{
		if (isset($params) && !$this->registry->get('admin_work')) {
			if (isset($this->request->get['route']) && ($this->request->get['route'] == 'record/record' || $this->request->get['route'] == 'record/blog')) {
				if (strpos($params, '<meta name="robots"') === false && method_exists($this->document, 'getSCRobots')) {
					$sc_robots = $this->document->getSCRobots();
					if ($sc_robots && $sc_robots != '')
						$params = str_replace("</head>", '
<meta name="robots" content="' . $sc_robots . '" />
</head>', $params);
				}
				if (isset($this->data['settings_general']['og']) && $this->data['settings_general']['og']) {
					if (strpos($params, "og:image") === false && method_exists($this->document, 'getOgImage')) {
						$og_image = $this->document->getOgImage();
						if ($og_image && $og_image != '')
							$params = str_replace("</head>", '
<meta property="og:image" content="' . $og_image . '" />
</head>', $params);
					}
					if (strpos($params, "og:title") === false && method_exists($this->document, 'getOgTitle')) {
						$og_title = $this->document->getOgTitle();
						if ($og_title && $og_title != '')
							$params = str_replace("</head>", '
<meta property="og:title" content="' . $og_title . '" />
</head>', $params);
					}
					if (strpos($params, "og:description") === false && method_exists($this->document, 'getOgDescription')) {
						$og_description = $this->document->getOgDescription();
						if ($og_description && $og_description != '')
							$params = str_replace("</head>", '
<meta property="og:description" content="' . $og_description . '" />
</head>', $params);
					}
					if (strpos($params, "og:url") === false && method_exists($this->document, 'getOgUrl')) {
						$og_url = $this->document->getOgUrl();
						if ($og_url && $og_url != '')
							$params = str_replace("</head>", '
<meta property="og:url" content="' . $og_url . '" />
</head>', $params);
					}
					if (strpos($params, "og:type") === false && method_exists($this->document, 'getOgType')) {
						$og_type = $this->document->getOgType();
						if ($og_type && $og_type != '')
							$params = str_replace("</head>", '
<meta property="og:type" content="' . $og_type . '" />
</head>', $params);
					}
				}
			}
		}
		return $params;
	}
	private function countRecordUpdate()
	{
		$msql = "UPDATE `" . DB_PREFIX . "record` SET `viewed`=`viewed` + 1 WHERE `record_id`='" . (int) ($this->db->escape($this->request->get['record_id'])) . "'";
		$this->db->query($msql);
	}
	public function getSCOutput()
	{
		return $this->output;
	}
	private function checkAccess()
	{
		if (!$this->config->get('ascp_customer_groups')) {
			$this->cont('record/customer');
			$this->data = $this->controller_record_customer->customer_groups($this->data);
			$this->config->set('ascp_customer_groups', $this->data['customer_groups']);
		} else {
			$this->data['customer_groups'] = $this->config->get('ascp_customer_groups');
		}
		if (isset($this->request->get['record_id'])) {

			$this->load->model('record/record');
			$record_info = $this->model_record_record->getRecord($this->request->get['record_id']);
			if ($record_info) {
				$check = true;
			} else {
				$check = false;
			}
		}
		if (isset($this->request->get['blog_id'])) {
			$this->load->model('record/blog');
			$blog_info = $this->model_record_blog->getBlog($this->request->get['blog_id']);
			if ($blog_info) {
				$check = true;
			} else {
				$check = false;
			}
		}
		return $check;
	}
	private function cont($cont)
	{
		$file  = DIR_APPLICATION . 'controller/' . $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
			return true;
		} else {
			return false;
		}
	}
}
