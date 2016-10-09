<?php
class ControllerSmsGatewaySMSLane extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'gwid'      => 0,
        'sender'    => 'SMSLAN',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/smslane');
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
        $response = $this->extension->fileGet('http://www.smslane.com/vendorsms/CheckBalance.aspx?user='.$this->config->get('smslane_user').'&password='.$this->config->get('smslane_pass').'&gwid='.$this->config->get('smslane_gwid'));
        
        $parts = explode('#',$response);
        if (count($parts) == 1)
        {
            $result = $response;
        }
        elseif (count($parts) == 2)
        {
            $result = $parts[1];
        }
        
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('smslane'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/smslane.tpl',$data);
	}
}
?>