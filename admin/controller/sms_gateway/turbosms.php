<?php
class ControllerSmsGatewayTurbosms extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/turbosms');
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
        if (class_exists('SoapClient'))
        {
            $client = new SoapClient ('http://turbosms.in.ua/api/wsdl.html'); 
            $auth = Array (
                'login'     => $this->config->get('turbosms_user'),
                'password'  => $this->config->get('turbosms_pass'),
            );
            $auth_result = $client->Auth($auth)->AuthResult;
            if (trim($auth_result) == 'Вы успешно авторизировались')
            {
                $result = $client->GetCreditBalance()->GetCreditBalanceResult;
            }
        }
        else
        {
            addMessage('error',$this->language->get('error_soap'));
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('turbosms'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/turbosms.tpl',$data);
	}
}
?>