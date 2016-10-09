<?php
class ControllerSmsGatewaySmsSendingRu extends AddistController
{
    protected $data = array(
        'login'     => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/sms_sending_ru');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $xml = '<?xml version="1.0" encoding="UTF-8"?>';
        $xml .= '<data>';
        $xml .= '   <login>'.$this->config->get('sms_sending_ru_login').'</login>';
        $xml .= '   <password>'.$this->config->get('sms_sending_ru_pass').'</password>';
        $xml .= '</data>';
        
        $response = $this->extension->fileGet('http://lcab.sms-sending.ru/API/XML/balance.php',$xml);
        
        $result = '';
        $xml_response = simplexml_load_string($response);
        if (!empty($xml_response))
        {
            if ($xml_response[0]->code == '1')
            {
                $result = $xml_response[0]->account;
            }
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('sms_sending_ru'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/sms_sending_ru.tpl',$data);
	}
}
?>