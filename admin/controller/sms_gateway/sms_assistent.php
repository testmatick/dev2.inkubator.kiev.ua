<?php
class ControllerSmsGatewaySmsAssistent extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/sms_assistent');
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
        $response = $this->extension->fileGet('https://userarea.sms-assistent.by/api/v1/credits/plain?user='.$this->config->get('sms_assistent_user').'&password='.$this->config->get('sms_assistent_pass'));
        
        if ((int)$response > -1)
        {
            $result = $response;
        }
        
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('sms_assistent'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/sms_assistent.tpl',$data);
	}
}
?>