<?php
class Action {
	private $file;
	private $class;
	private $method;
	private $args = array();


        	public function getClass() {
        		return isset($this->class) ? $this->class : 'controller' . strtolower(preg_replace('/[^a-zA-Z0-9]/', '', $this->route));
        	}
            

        	public function getFile() {
        		return isset($this->file) ? $this->file : DIR_APPLICATION . 'controller/' . $this->route . '.php';
        	}
            

        	public function getMethod() {
        		return $this->method;
        	}
            
	public function __construct($route, $args = array()) {
		$parts = explode('/', str_replace('../', '', (string)$route));

		// Break apart the route
		while ($parts) {
			$file = DIR_APPLICATION . 'controller/' . implode('/', $parts) . '.php';

			if (is_file($file)) {
				$this->file = $file;

				$this->class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', implode('/', $parts));
				break;
			} else {
				$this->method = array_pop($parts);
			}
		}

		if (!$this->method) {
			$this->method = 'index';
		}

		$this->args = $args;
	}

	public function execute($registry) {
		// Stop any magical methods being called
		if (substr($this->method, 0, 2) == '__') {
			return false;
		}

		if (is_file($this->file)) {
			include_once(\VQMod::modCheck(modification($this->file), $this->file));

			$class = $this->class;

			$controller = new $class($registry);

			if (is_callable(array($controller, $this->method))) {
				return call_user_func(array($controller, $this->method), $this->args);
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
}
