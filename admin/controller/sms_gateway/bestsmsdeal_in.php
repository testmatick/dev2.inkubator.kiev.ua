<?php
class ControllerSmsGatewayBestSmsDealIn extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
        'route'     => '0',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/bestsmsdeal_in');
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
        $response = $this->extension->fileGet('http://websms.bestsmsdeal.com/vendorsms/CheckBalance.aspx?user='.$this->config->get('bestsmsdeal_in_user').'&password='.$this->config->get('bestsmsdeal_in_pass'));
        $parts = explode('|',$response);
        if ($this->config->get('bestsmsdeal_in_route')=='0')
        {
            $parts = explode(':',$parts[0]);
        }
        elseif ($this->config->get('bestsmsdeal_in_route')=='2')
        {
            $parts = explode(':',$parts[1]);
        }
        if (count($parts) > 1)
        {
            $result = $parts[1];
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('bestsmsdeal_in'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/bestsmsdeal_in.tpl',$data);
	}
}
?>