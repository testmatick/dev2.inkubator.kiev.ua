<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
class agooLanguage extends Controller
{
	protected $scLanguage;
	private $directory;
	private $data = array();

	public function __call($name, array $params)
	{
		$modules = false;

		if ($this->registry->get('seocms_url_alter') &&
			!class_exists('ControllerCommonSeoBlog') &&
			(class_exists('ControllerCommonSeoUrl') ||
			 class_exists('ControllerCommonSeoPro') ||
			 class_exists('ControllerStartupSeoUrl') ||
			 class_exists('ControllerStartupSeoPro'))
			 && !$this->registry->get('admin_work')
             && !$this->config->get('sc_ar_'.strtolower('ControllerCommonSeoBlog'))
			 ) {
			agoo_cont('record/addrewrite', $this->registry);
		}

		$this_language  = $this->registry->get('language');
		$this->scLanguage = $this->registry->get('language_old');

		$modules  = call_user_func_array(array(
				$this->scLanguage,
				$name
		), $params);

		$this->registry->set('language', $this_language);
        unset($this_language);

        if ($name == "load") {
	        $seocms_folder = substr($params[0], 0, strpos($params[0], '/'));
			if (isset($this->session->data['language'])) {
				$current_lang = $this->session->data['language'];
			} else {
				$current_lang = $this->config->get('config_language');
			}

            if ($this->registry->get('admin_work')) {
            	$lang = substr(strtolower($this->config->get('config_admin_language')), 0,2);
            } else {            	$lang = substr(strtolower($current_lang), 0,2);
            }

			if (($seocms_folder == 'agoo' || $seocms_folder == 'seocms' || $params[0]=='module/blog' || $params[0]=='extension/module/blog' || $params[0]=='feed/google_sitemap_blog' || $params[0]=='catalog/langmark') && ($lang == 'ru')) {

				$class = get_class($this->scLanguage);
				$reflection = new ReflectionClass($class);
				$priv_attr  = $reflection->getProperties(ReflectionProperty::IS_PRIVATE);

                 if ($reflection->hasProperty('data')) {					$reflectionProperty = $reflection->getProperty('data');
					$reflectionProperty->setAccessible(true);

					$data_private = $reflectionProperty->getValue($this->scLanguage);
					$property_flag = true;
				} else {					$data_private = array();
					$property_flag = false;
				}

				$modules = $this->lang_merge($params[0], $modules, $data_private);
  	           	$reflectionProperty->setValue($this->scLanguage, $modules);
                unset($reflection);
			}
        }
        unset($this->scLanguage);
		return $modules;
	}

	public function lang_merge($filename, $data = array(), $_= array()) {

	 	$file = DIR_LANGUAGE . 'russian/' . $filename . '.php';

		if (is_file($file)) {
			require($file);
		}

		$this->data = array_merge($data, $_);

		return $this->data;
	}

	public function cont($cont)
	{
		$file  = DIR_APPLICATION . 'controller/' . $cont . '.php';
        if (function_exists('modification')) {
        	$file = modification($file);
       	}
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
		}
	}

}
