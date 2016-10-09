<?php
class ControllerSmsGatewayThaiBulkSms extends AddistController
{
    protected $data = array(
        'username'      => '',
        'password'      => '',
        'sender'        => 'THAIBULKSMS',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/thaibulksms');
        
        require_once(DIR_SYSTEM.'/library/thaisms.class.php');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $thaisms = new thaisms();
        $result = $thaisms->check_credit($this->config->get('thaibulksms_username'),$this->config->get('thaibulksms_password'));
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('thaibulksms'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/thaibulksms.tpl',$data);
	}
}
?>