<?php
class ControllerSmsGatewayIqsms extends AddistController
{
    protected $api;
    
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => 'TEST',
        'last_id'   => 1,
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/iqsms');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        return $this->api->credits();
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('iqsms'));
        
        if ($this->config->get('iqsms_user') && $this->config->get('iqsms_pass'))
        {
            require_once(DIR_SYSTEM.'/library/iqsms.class.php');
            $this->api = new iqsms_JsonGate($this->config->get('iqsms_user') , $this->config->get('iqsms_pass'));
            
            $result = $this->getBalance();
            if (@$result['status'] == 'ok')
            {
                $data['balance'] = $result['credits'];
            }
            
            $result = $this->api->senders();
            if (@$result['status'] == 'ok')
            {
                $data['senders'] = $result['senders'];
            }
        }
        else
        {
            $data['balance'] = '';
            $data['senders'] = array();
        }
        
		return $this->load_view('sms_gateway/iqsms.tpl',$data);
	}
}
?>