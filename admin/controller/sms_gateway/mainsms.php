<?php
class ControllerSmsGatewayMainSMS extends AddistController
{
    protected $api;
    
    protected $data = array(
        'project'   => '',
        'sign'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/mainsms');
        
        require_once(DIR_SYSTEM.'/library/mainsms.class.php');
        $this->api = new MainSMS($this->config->get('mainsms_project') , $this->config->get('mainsms_sign'), false, false);
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        return $this->api->getBalance();
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('mainsms'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/mainsms.tpl',$data);
	}
}
?>