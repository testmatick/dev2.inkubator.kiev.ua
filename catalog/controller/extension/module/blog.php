<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com � 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
if (!class_exists('ControllerExtensionModuleBlog')) {
	class ControllerExtensionModuleBlog extends Controller {
		public function index($arg) {
				agoo_cont('module/blog', $this->registry);
				$html = $this->controller_module_blog->index($arg);
				return $html;
		}
	}
}
