<?php
class ControllerSmsGatewayMsg91Com extends AddistController
{
    protected $data = array(
        'secret'    => '',
        'sender'    => '',
        'route'     => 'default',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/msg91_com');
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
        $response = $this->extension->fileGet('http://api.msg91.com/api/balance.php?authkey='.$this->config->get('msg91_com_secret').'&type='.$this->config->get('msg91_com_route'));
        if ((int)$response > 0)
        {
            $result = $response;
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('msg91_com'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/msg91_com.tpl',$data);
	}
}
?>