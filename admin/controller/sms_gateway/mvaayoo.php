<?php
class ControllerSmsGatewayMvaayoo extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/mvaayoo');
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
        $response = $this->extension->fileGet('http://api.mvaayoo.com/mvaayooapi/APIUtil?user='.$this->config->get('mvaayoo_user').':'.$this->config->get('mvaayoo_pass').'&type=0');
        $parts = explode(',',$response);
        if (trim($parts[0]) == 'Status=0')
        {
            $result = preg_replace('#Credit balance is(\d+)#','${1}',trim($parts[1]));
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('mvaayoo'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/mvaayoo.tpl',$data);
	}
}
?>