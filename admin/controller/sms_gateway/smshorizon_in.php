<?php
class ControllerSmsGatewaySmsHorizonIn extends AddistController
{
    protected $data = array(
        'user'      => '',
        'apikey'    => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/smshorizon_in');
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
        $response = $this->extension->fileGet('http://smshorizon.co.in/api/balance.php?user='.$this->config->get('smshorizon_in_user').'&apikey='.$this->config->get('smshorizon_in_apikey'));
        $parts = explode(':',$response);
        if (count($parts) > 1)
        {
            $result = trim($parts[1]);
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('smshorizon_in'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/smshorizon_in.tpl',$data);
	}
}
?>