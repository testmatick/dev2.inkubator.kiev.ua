<?php
class ControllerSmsGatewayWebSMS extends AddistController
{
    protected $data = array(
        'user'      => '',
        'apikey'    => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/websms');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $params = http_build_query(array(
            'r'         =>  'api/user_balance',
            'user'      =>  $this->config->get('websms_user'),
            'apikey'    =>  $this->config->get('websms_apikey'),
        ));
        $response = $this->extension->fileGet('http://cp.websms.by',$params);
        $result = '';
        $json_response = json_decode($response,true);
        if (!empty($json_response['balance']))
        {
            $result = $json_response['balance'];
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('websms'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/websms.tpl',$data);
	}
}
?>