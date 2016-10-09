<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
	$sc_ver = VERSION;
	if (!defined('SC_VERSION')) define('SC_VERSION', (int)substr(str_replace('.','',$sc_ver), 0,2));

	require_once(DIR_SYSTEM . 'helper/seocmsprofunc.php');

	if (!isset($registry)) {
		$registry = $this->registry;
	}
    /*
	if ($registry->get('config')->get('ascp_settings') != '') {
		$settings_general = $registry->get('config')->get('ascp_settings');
	} else {
		$settings_general = Array();
	}

    if (isset($settings_general['langmark_widget_status']) && $settings_general['langmark_widget_status'] && !$registry->get('admin_work')) {
		loadlibrary('agoo/multilang');
		$multilang = new agooMultilang($registry);
	}

    unset($settings_general);
     */

 	$this->file= DIR_APPLICATION.'controller/common/front.php';

	if (SC_VERSION < 22) {
	    //$this->class='ControllerCommonfront';
	    //$this->method ='install';
    }
    require_once($this->file);

	//if (SC_VERSION < 20 || SC_VERSION > 21)
    {
		$SeoCMSFront = new ControllerCommonFront($registry);
		$SeoCMSFront->install();
	}
