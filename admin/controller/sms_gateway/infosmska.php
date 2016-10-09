<?php
class ControllerSmsGatewayInfosmska extends AddistController
{
    protected $data = array(
        'login'     => '',
        'pwd'       => '',
        'translit'  => false,
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/infosmska');
    }
    
    public function getBalance()
    {
        $response = $this->extension->fileGet('http://api.infosmska.ru/interfaces/getbalance.ashx?login='.$this->config->get('infosmska_login').'&pwd='.$this->config->get('infosmska_pwd'));
        
        $result = '';
        $parts = explode(':',$response);
        if (trim($parts[0]) != 'Error')
        {
            $result = $response;
        }
        
        return $result;
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('infosmska'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/infosmska.tpl',$data);
	}
}
?>