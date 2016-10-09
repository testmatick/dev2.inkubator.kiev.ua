<?php
class ControllerSmsGatewayMirsms extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'post_id'   => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/mirsms');
        libxml_use_internal_errors(true);
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $post_data = array();
        $post_data['user'] = $this->config->get('mirsms_user');
        $post_data['pass'] = $this->config->get('mirsms_pass');
        $post_data['action'] = 'balance';
        $post_data['HTTP_ACCEPT_LANGUAGE'] = 'ru-ru,ru;q=0.8,en-us;q=0.5,en;q=0.3';
        $response = $this->extension->fileGet('http://web.mirsms.ru/public/http/',$post_data);
        
        $result = '';
        $xml = simplexml_load_string($response);
        if (!empty($xml->BALANCE))
        {
            $result = $xml->BALANCE->AGT_BALANCE;
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('mirsms'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/mirsms.tpl',$data);
	}
}
?>