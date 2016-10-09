<?php
class ControllerSmsGatewaySmscRu extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/smsc_ru');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $json = json_decode(fileGet('http://smsc.ru/sys/balance.php?login='.$this->config->get('smsc_ru_user').'&psw='.$this->config->get('smsc_ru_user').'&fmt=3'),true);
        if (isset($json['balance']))
        {
            return $json['balance'];
        }
        else
        {
            return '';
        }
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('smsc_ru'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/smsc_ru.tpl',$data);
	}
}
?>