<?php
class ControllerSmsGatewayAtomPark extends AddistController
{
    protected $data = array(
        'public_key'      => '',
        'private_key'     => '',
        'sender'          => '',
        'currency'        => 'USD',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/atompark');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $params ['version'] ="3.0";
        $params ['action'] = "getUserBalance";
        $params ['key'] = $this->config->get('atompark_public_key');
        $params ['currency'] = $this->config->get('atompark_currency');
        ksort ($params);
        $sum = '';
        foreach ($params as $k=>$v) 
        {
            $sum.=$v;
        }
        $sum .= $this->config->get('atompark_private_key');
        $control_sum =  md5($sum);
        
        $response = json_decode($this->extension->fileGet('http://atompark.com/api/sms/3.0/getUserBalance?key='.$this->config->get('atompark_public_key').'&sum='.$control_sum.'&currency='.$this->config->get('atompark_currency')),true);
        
        $result = '';
        if (is_array($response['result']))
        {
            $result = $response['result']['balance_currency'];
        }
        
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('atompark'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/atompark.tpl',$data);
	}
}
?>