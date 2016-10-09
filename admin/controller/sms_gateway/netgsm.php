<?php
class ControllerSmsGatewayNetGsm extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/netgsm');
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
        $response = $this->extension->fileGet('https://api.netgsm.com.tr/get_kredi.asp?usercode='.$this->config->get('netgsm_user').'&password='.$this->config->get('netgsm_pass'));
        $parts = explode(' ',$response);
        if (count($parts) == 2 && $parts[0] == '00')
        {
            $result = $parts[1];
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('netgsm'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/netgsm.tpl',$data);
	}
}
?>