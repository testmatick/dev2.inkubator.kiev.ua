<?php
class ControllerSmsGatewayismscommy extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/isms_com_my');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $result = '';
        $response = fileGet('http://www.isms.com.my/isms_balance.php?un='.$this->config->get('isms_com_my_user').'&pwd='.$this->config->get('isms_com_my_pass'));
        $parts = explode('=',$response);
        if (count($parts) == 1)
        {
            $result = $response;
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('isms_com_my'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/isms_com_my.tpl',$data);
	}
}
?>