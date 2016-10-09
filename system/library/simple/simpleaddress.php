<?php
/*
@author Dmitriy Kubarev
@link   http://www.simpleopencart.com
@link   http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4811
*/

include_once(DIR_SYSTEM . 'library/simple/simple.php');

class SimpleAddress extends Simple {
    protected static $_instance;

    protected function __construct($registry) {
        $this->setPage('address');
        parent::__construct($registry);
    }

    public static function getInstance($registry) {
        if (self::$_instance === null) {
            self::$_instance = new self($registry);
        }

        return self::$_instance;
    }

    public function loadSimpleSession() {
        if ($this->request->server['REQUEST_METHOD'] == 'GET') {
            $this->load->model('account/address');

            $addressId = isset($this->request->get['address_id']) ? $this->request->get['address_id'] : (int)$this->request->get['address_id'];

            if ($addressId) {
                $mainInfo = $this->model_account_address->getAddress($addressId);

                foreach ($mainInfo as $key => $value) {
                    $this->session->data['simple']['address'][$key] = $value;
                }
            } else {
                $addressFields = array('firstname', 'lastname', 'company_id', 'tax_id', 'address_1', 'address_2', 'postcode', 'city', 'country_id', 'zone_id');

                foreach ($addressFields as $key) {
                    $this->session->data['simple']['address'][$key] = '';
                }
            }

            $customInfo = $this->loadCustomFields('address', $addressId);

            foreach ($customInfo as $key => $value) {
                $this->session->data['simple']['address'][$key] = $value;
            }
        } else {
            if (isset($this->request->post['address']) && is_array($this->request->post['address'])) {
                foreach ($this->request->post['address'] as $key => $value) {
                    $this->session->data['simple']['address'][$key] = $value;
                }
            }
        }
    }
}