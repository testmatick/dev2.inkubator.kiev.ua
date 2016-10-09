<?php
class ControllerSmsGatewaySmscBiz extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/smsc_biz');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $balance = (int)$this->extension->fileGet('http://smsc.biz/api/getcredits?username='.$this->config->get('smsc_biz_user').'&password='.$this->config->get('smsc_biz_pass'));
        if ($balance > 0)
        {
            return $balance;
        }
        else
        {
            return '';
        }
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('smsc_biz'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/smsc_biz.tpl',$data);
	}
}
?>