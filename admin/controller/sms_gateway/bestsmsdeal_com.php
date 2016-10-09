<?php
class ControllerSmsGatewayBestSmsDealCom extends AddistController
{
    protected $data = array(
        'key'         => '',
        'campaign'    => '0',
        'routeid'     => '5',
        'senderid'    => '',
    );
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load_language('sms_gateway/bestsmsdeal_com');
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
        $response = $this->extension->fileGet('http://new.bestsmsdeal.com/app/miscapi/'.$this->config->get('bestsmsdeal_com_key').'/getBalance/true/');
        $json = json_decode($response,true);
        if (is_array($json))
        {
            foreach($json as $item)
            {
                if ($item['ROUTE_ID'] == $this->config->get('bestsmsdeal_com_routeid'))
                {
                    $result = $item['BALANCE'];
                    break;
                }
            }
        }
        return $result;
    }
    
	public function index()
    {
        $data = array_merge($this->data,$this->config->filter('bestsmsdeal_com'));
        $data['balance'] = $this->getBalance();
		return $this->load_view('sms_gateway/bestsmsdeal_com.tpl',$data);
	}
}
?>