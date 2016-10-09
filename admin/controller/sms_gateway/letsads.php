<?php
class ControllerSmsGatewayLetsads extends AddistController
{
    protected $data = array(
        'phone'     => '',
        'pass'      => '',
        'sender'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/letsads');
    }
    
    public function getInfo()
    {
        $info = array();
        $info['name'] = $this->language->get('text_name');
        return $info;
    }
    
    public function getBalance()
    {
        $xml = '<?xml version="1.0" encoding="UTF-8"?>';
        $xml .= '<request>';
        $xml .= '   <auth>';
        $xml .= '       <login>'.$this->config->get('letsads_phone').'</login>';
        $xml .= '       <password>'.$this->config->get('letsads_pass').'</password>';
        $xml .= '   </auth>';
        $xml .= '   <balance />';
        $xml .= '</request>';
        
        $response = $this->extension->fileGet('http://letsads.com/api',$xml);
        
        $result = '';
        $xml_response = simplexml_load_string($response);
        if (!empty($xml_response))
        {
            if ($xml_response[0]->name == 'Balance')
            {
                $result = $xml_response[0]->description.' '.$xml_response[0]->currency;
            }
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('letsads'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/letsads.tpl',$data);
	}
}
?>