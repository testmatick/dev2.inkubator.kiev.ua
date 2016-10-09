<?php
class ControllerSmsGatewayZong extends AddistController
{
    protected $data = array(
        'user'      => '',
        'pass'      => '',
        'sender'    => '',
        'unicode'   => '0',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/zong');
        ini_set("default_socket_timeout", 200);
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
            $client = new SoapClient('http://cbs.zong.com.pk/reachcwsv2/corporatesms.svc?wsdl', array("trace" => 1, "exception" => 0));
            //$queryResult = $client->GetAccountSummary(array('obj_GetAccountSummary'=>array('loginId'=>$this->config->get('zong_user'),'loginPassword'=>$this->config->get('zong_pass'))));
            
            //$result = $queryResult->GetAccountSummaryResult->CounterResponse->Total_Balance;
        }
        else
        {
            addMessage('error',$this->language->get('error_soap'));
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('zong'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/zong.tpl',$data);
	}
}
?>