<?php
class Url {
	private $domain;
	private $ssl;
	private $rewrite = array();

	public function __construct($domain, $ssl = '') {
		$this->domain = $domain;
		$this->ssl = $ssl;
	}

	public function addRewrite($rewrite) {
		$this->rewrite[] = $rewrite;
	}

	public function link($route, $args = '', $secure = false) {
        // SIMPLE START
        $get_route = isset($_GET['route']) ? $_GET['route'] : (isset($_GET['_route_']) ? $_GET['_route_'] : '');
            
        if ($route == 'checkout/cart' && $get_route != 'checkout/cart') {
            $connection = 'SSL';
            $route = 'checkout/simplecheckout';
        }
        
        if ($route == 'checkout/checkout' && $get_route != 'checkout/checkout') {
            $route = 'checkout/simplecheckout';
        }
        
        if ($route == 'account/register' && $get_route != 'account/register') {
            $route = 'account/simpleregister';
        }   

        if ($route == 'account/edit' && $get_route != 'account/edit') {
            $route = 'account/simpleedit';
        }  

        if ($route == 'account/address/update' && $get_route != 'account/address/update') {
            $route = 'account/simpleaddress/update';
        } 

        if ($route == 'account/address/insert' && $get_route != 'account/address/insert') {
            $route = 'account/simpleaddress/insert';
        }       
        // SIMPLE END
		if (!$secure) {
			$url = $this->domain;
		} else {
			$url = $this->ssl;
		}

		$url .= 'index.php?route=' . $route;

		if ($args) {
			if (is_array($args)) {
				$url .= '&amp;' . http_build_query($args);
			} else {
				$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
			}
		}

		foreach ($this->rewrite as $rewrite) {
			$url = $rewrite->rewrite($url);
		}

		return $url;
	}
}
