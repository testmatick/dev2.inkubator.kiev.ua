<?php
class ControllerSmsGatewayLoginPanel extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => 'WEBSMS',
        'channel'   => 'Promo',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/loginpanel');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $json_response = json_decode(file_get_contents('http://loginpanel.biz/api/mt/GetBalance?User='.$this->config->get('loginpanel_user').'&Password='.$this->config->get('loginpanel_pass')),true);
        
        $result = '';
        
        if ($json_response && empty($json_response['ErrorCode']))
        {
            $parts = explode('|',$json_response['Balance']);
            foreach($parts as $part)
            {
                $sub_parts = explode(':',$part);
                if ($sub_parts[0] == $this->config->get('loginpanel_channel'))
                {
                    $result = $sub_parts[1];
                }
            }
        }
        
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('loginpanel'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/loginpanel.tpl',$data);
	}
}
?>