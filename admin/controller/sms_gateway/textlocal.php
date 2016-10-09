<?php
class ControllerSmsGatewayTextLocal extends AddistController
{
    protected $data = array(
        'user'      => '',
        'hash'      => '',
        'sender'    => 'TXTLCL',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/textlocal');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $json_response = json_decode(file_get_contents('http://api.textlocal.in/balance/?username='.$this->config->get('textlocal_user').'&hash='.$this->config->get('textlocal_hash')),true);
        
        $result = '';
        
        if ($json_response)
        {
            if (empty($json_response['errors']) && $json_response['status'] == 'success')
            {
                $result = $json_response['balance']['sms'];
            }
        }
        
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('textlocal'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/textlocal.tpl',$data);
	}
}
?>