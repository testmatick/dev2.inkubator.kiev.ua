<?php
class ControllerSmsGatewaySmsRU extends AddistController
{
    protected $data = array(
        'secret'    => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/sms_ru');
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
        $response = explode("\n",$this->extension->fileGet('http://sms.ru/my/balance?api_id='.$this->config->get('sms_ru_secret')));
        if ($response)
        {
            if ($response[0]=='100')
            {
                $result = $response[1];
            }
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('sms_ru'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/sms_ru.tpl',$data);
	}
}
?>