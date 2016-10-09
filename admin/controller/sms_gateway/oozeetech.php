<?php
class ControllerSmsGatewayOozeetech extends AddistController
{
    protected $data = array(
        'username'  => '',
        'password'  => '',
        'sender'    => '',
        'route'     => 'route3',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/oozeetech');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $response = $this->extension->fileGet('http://sms.oozeetech.com/balance.aspx?username='.$this->config->get('oozeetech_username').'&password='.$this->config->get('oozeetech_password'));
        
        $lines = explode("\n",$response);
        foreach($lines as $line)
        {
            list($key,$value) = explode(':',$line);
            if ($key == 'route')
            {
                $key = 'route3';
            }
            if ($key == $this->config->get('oozeetech_route'))
            {
                $result = $value;
                break;
            }
        }
        
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('oozeetech'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/oozeetech.tpl',$data);
	}
}
?>