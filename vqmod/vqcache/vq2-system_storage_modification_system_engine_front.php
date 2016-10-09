<?php
final class Front {
	private $registry;
	private $pre_action = array();
	private $error;

	public function __construct($registry) {

    	    require_once(\VQMod::modCheck(DIR_SYSTEM.'addist/startup.php'));
            

    	    require_once(\VQMod::modCheck(DIR_SYSTEM.'addist/startup.php'));
            
		$this->registry = $registry;

            if (!class_exists('SmartSMS'))
            {
                require_once(\VQMod::modCheck(DIR_SYSTEM.'library/smart_sms.php'));
                $registry->set('smart_sms',new SmartSMS($registry));
            }
            

            if (!class_exists('SmartSMS'))
            {
                require_once(\VQMod::modCheck(DIR_SYSTEM.'library/smart_sms.php'));
                $registry->set('smart_sms',new SmartSMS($registry));
            }
            
	}

	public function addPreAction($pre_action) {
		$this->pre_action[] = $pre_action;
	}

	public function dispatch($action, $error) {
		$this->error = $error;

		foreach ($this->pre_action as $pre_action) {
			$result = $this->execute($pre_action);

			if ($result) {
				$action = $result;

				break;
			}
		}

		while ($action) {
			$action = $this->execute($action);
		}
	}

	private function execute($action) {
		$result = $action->execute($this->registry);

		if (is_object($result)) {
			$action = $result;
		} elseif ($result === false) {
			$action = $this->error;

			$this->error = '';
		} else {
			$action = false;
		}

		return $action;
	}
}