<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
class agooRequest extends Controller
{
	protected $Request;

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
			//agoo_cont('record/addrewrite', $this->registry);
		}

  		$this_request  = $this->registry->get('request');
		$this->Request = $this->registry->get('request_old');
		$modules        = call_user_func_array(array(
				$this->Request,
				$name
		), $params);
		unset($this->Request);
		$this->registry->set('request', $this_request);


        if (strtolower($name) == 'get' && ($this->registry->get('sc_router') == 'record/blog' || $this->registry->get('sc_router') == 'record/record')) {
        }

		return $modules;
	}
    public function get($name) {
    }
}

