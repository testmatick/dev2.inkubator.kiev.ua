<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
if (!class_exists('ControllerExtensionModuleBlog')) {
	class ControllerExtensionModuleBlog extends Controller {
		public function index() {
				$this->control('module/blog');
				$this->controller_module_blog->index($this->registry);
		}
		public function control($cont)
		{
			$file = DIR_APPLICATION . 'controller/' . $cont . '.php';
			$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
			if (file_exists($file)) {
				include_once($file);
				$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
			} else {
				trigger_error('Error: Could not load controller ' . $cont . '!');
				exit();
			}
		}
 	}
}


