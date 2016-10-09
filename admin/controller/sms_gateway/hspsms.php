<?php
class ControllerSmsGatewayHspSMS extends AddistController
{
    protected $data = array(
        'user'      => '',
        'apikey'    => '',
        'sender'    => 'MSGIND',
        'type'      => 'TRANS',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/hspsms');
    }
    
    public function getBalance()
    {
        $response = json_decode($this->extension->fileGet('http://sms.hspsms.com/getSMSCredit?username='.$this->config->get('hspsms_user').'&apikey='.$this->config->get('hspsms_apikey')),true);
        
        $result = '';
        foreach($response as $item)
        {
            if (isset($item[1]) && $item[1] == $this->config->get('hspsms_type'))
            {
                $result = (string)$item[0];
                break;
            }
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
        $data = array_merge($this->data,$this->config->filter('hspsms'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/hspsms.tpl',$data);
	}
}
?>