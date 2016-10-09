<?php
class ControllerSmsGatewaySmscab extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/smscab');
    }
    
    public function getBalance()
    {
        $response = json_decode($this->extension->fileGet('http://my.smscab.ru/sys/balance.php?login='.$this->config->get('smscab_user').'&psw='.$this->config->get('smscab_pass').'&fmt=3'),true);
        
        $result = '';
        if (!empty($response['balance']))
        {
            $result = $response['balance'];
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
        $data = array_merge($this->data,$this->config->filter('smscab'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/smscab.tpl',$data);
	}
}
?>