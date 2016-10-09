<?php
class ControllerSmsGatewaySmsAero extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => 'NEWS',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/smsaero');
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
        $json_response = json_decode($this->extension->fileGet('http://gate.smsaero.ru/balance/?answer=json&user='.$this->config->get('smsaero_user').'&password='.md5($this->config->get('smsaero_pass'))),true);
        if ($json_response && isset($json_response['balance']))
        {
            $result = $json_response['balance'];
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('smsaero'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/smsaero.tpl',$data);
	}
}
?>