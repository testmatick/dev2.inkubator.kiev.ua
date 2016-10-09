<?php
class ControllerTriggerSmartSms extends Controller
{
    public function __construct($registry)
    {
        parent::__construct($registry);
        
        if (!class_exists('SmartSMS'))
        {
            require_once(DIR_SYSTEM.'library/smart_sms.php');
            $registry->set('smart_sms',new SmartSMS($registry));
        }
        
        $this->load->model('checkout/order');
    }
    
    public function customer_add($data)
    {
        if ($this->config->get('smart_sms_status'))
        {
            $this->smart_sms->customerAdded($data);
        }
    }
    
    public function history_add($order_id)
    {
        if ($this->config->get('smart_sms_status'))
        {
            $order_info = $this->getOrder($order_id);
            if ($order_info['order_status_id'] == 0)
            {
                $this->smart_sms->orderAdded($order_id);
            }
            else
            {
                $this->smart_sms->orderUpdated($order_id);
            }
        }
    }
    
    public function getOrder($order_id)
    {
        $query = $this->db->query("SELECT * FROM `".DB_PREFIX."order` WHERE `order_id` = '$order_id'");
        if ($query->num_rows)
        {
            return $query->row;
        }
        else
        {
            return false;
        }
    }
}
?>