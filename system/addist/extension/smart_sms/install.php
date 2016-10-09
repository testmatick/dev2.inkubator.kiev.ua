<?php
class smart_sms extends AddistModel
{
    public $info = array(
        'hash'              =>  '9ffddf811ed333a4e1ac022fcb16988c',
        'version'           =>  '0.1.3.3.4',
        'link'              =>  'http://addist.ru/index.php?route=product/product&product_id=8',
        'trial'             =>  '0',
        'domain'            =>  'dev.inkubator.kiev.ua',
        'release'           =>  'stable',
    );
    
    public $fields = array(
        'provider'          =>  'sms_ru',
        'admin_phone'       =>  '',
        'notify_admin'      =>  true,
        'notify_customer'   =>  true,
        'notify_update'     =>  false,
        'notify_signup'     =>  false,
        'use_checkbox'      =>  false,
        'message_admin'     =>  '',
        'message_customer'  =>  array(),
        'message_update'    =>  array(),
        'statuses'          =>  array(),
        'log'               =>  '',
        'debug'             =>  false,
    );
    
    public $mods = array('vqmod'=>array(),);
    
    public $files = array('system/library/epochtasms/config.php', 'system/library/epochtasms/Stat.php', 'system/library/epochtasms/Account.php', 'system/library/epochtasms/APISMS.php', 'system/library/epochtasms/Exceptions.php', 'system/library/epochtasms/index.php', 'system/library/epochtasms/Addressbook.php', 'system/library/smart_sms.php', 'system/library/thaisms.class.php', 'system/library/mainsms.class.php', 'system/library/iqsms.class.php', 'system/addist/extension/smart_sms/install.php', 'system/addist/extension/smart_sms/vqmod/1.x/smart_sms.xml', 'system/addist/extension/smart_sms/vqmod/2.x/smart_sms.xml', 'system/sms_gateway/smslane.php', 'system/sms_gateway/zong.php', 'system/sms_gateway/isms_com_my.php', 'system/sms_gateway/oozeetech.php', 'system/sms_gateway/infosmska.php', 'system/sms_gateway/loginpanel.php', 'system/sms_gateway/sms_assistent.php', 'system/sms_gateway/thaibulksms.php', 'system/sms_gateway/turbosms.php', 'system/sms_gateway/bestsmsdeal_com.php', 'system/sms_gateway/msg91_com.php', 'system/sms_gateway/textlocal.php', 'system/sms_gateway/netgsm.php', 'system/sms_gateway/sms_ru.php', 'system/sms_gateway/websms.php', 'system/sms_gateway/smsc_ru.php', 'system/sms_gateway/mvaayoo.php', 'system/sms_gateway/hspsms.php', 'system/sms_gateway/smsaero.php', 'system/sms_gateway/mainsms.php', 'system/sms_gateway/mirsms.php', 'system/sms_gateway/letsads.php', 'system/sms_gateway/iqsms.php', 'system/sms_gateway/smsc_biz.php', 'system/sms_gateway/smshorizon_in.php', 'system/sms_gateway/atompark.php', 'system/sms_gateway/bestsmsdeal_in.php', 'system/sms_gateway/smscab.php', 'system/sms_gateway/sms_sending_ru.php', 'admin/view/template/module/smart_sms.tpl', 'admin/view/template/sms_gateway/thaibulksms.tpl', 'admin/view/template/sms_gateway/websms.tpl', 'admin/view/template/sms_gateway/smslane.tpl', 'admin/view/template/sms_gateway/smsaero.tpl', 'admin/view/template/sms_gateway/atompark.tpl', 'admin/view/template/sms_gateway/oozeetech.tpl', 'admin/view/template/sms_gateway/sms_ru.tpl', 'admin/view/template/sms_gateway/textlocal.tpl', 'admin/view/template/sms_gateway/bestsmsdeal_com.tpl', 'admin/view/template/sms_gateway/zong.tpl', 'admin/view/template/sms_gateway/smsc_ru.tpl', 'admin/view/template/sms_gateway/letsads.tpl', 'admin/view/template/sms_gateway/smsc_biz.tpl', 'admin/view/template/sms_gateway/smscab.tpl', 'admin/view/template/sms_gateway/hspsms.tpl', 'admin/view/template/sms_gateway/loginpanel.tpl', 'admin/view/template/sms_gateway/netgsm.tpl', 'admin/view/template/sms_gateway/turbosms.tpl', 'admin/view/template/sms_gateway/mvaayoo.tpl', 'admin/view/template/sms_gateway/sms_sending_ru.tpl', 'admin/view/template/sms_gateway/bestsmsdeal_in.tpl', 'admin/view/template/sms_gateway/iqsms.tpl', 'admin/view/template/sms_gateway/mainsms.tpl', 'admin/view/template/sms_gateway/sms_assistent.tpl', 'admin/view/template/sms_gateway/isms_com_my.tpl', 'admin/view/template/sms_gateway/smshorizon_in.tpl', 'admin/view/template/sms_gateway/mirsms.tpl', 'admin/view/template/sms_gateway/msg91_com.tpl', 'admin/view/template/sms_gateway/infosmska.tpl', 'admin/language/english/module/smart_sms.php', 'admin/language/english/sms_gateway/smslane.php', 'admin/language/english/sms_gateway/zong.php', 'admin/language/english/sms_gateway/isms_com_my.php', 'admin/language/english/sms_gateway/oozeetech.php', 'admin/language/english/sms_gateway/infosmska.php', 'admin/language/english/sms_gateway/loginpanel.php', 'admin/language/english/sms_gateway/sms_assistent.php', 'admin/language/english/sms_gateway/thaibulksms.php', 'admin/language/english/sms_gateway/turbosms.php', 'admin/language/english/sms_gateway/bestsmsdeal_com.php', 'admin/language/english/sms_gateway/msg91_com.php', 'admin/language/english/sms_gateway/textlocal.php', 'admin/language/english/sms_gateway/netgsm.php', 'admin/language/english/sms_gateway/sms_ru.php', 'admin/language/english/sms_gateway/websms.php', 'admin/language/english/sms_gateway/smsc_ru.php', 'admin/language/english/sms_gateway/mvaayoo.php', 'admin/language/english/sms_gateway/hspsms.php', 'admin/language/english/sms_gateway/smsaero.php', 'admin/language/english/sms_gateway/mainsms.php', 'admin/language/english/sms_gateway/mirsms.php', 'admin/language/english/sms_gateway/letsads.php', 'admin/language/english/sms_gateway/iqsms.php', 'admin/language/english/sms_gateway/smsc_biz.php', 'admin/language/english/sms_gateway/smshorizon_in.php', 'admin/language/english/sms_gateway/atompark.php', 'admin/language/english/sms_gateway/bestsmsdeal_in.php', 'admin/language/english/sms_gateway/smscab.php', 'admin/language/english/sms_gateway/sms_sending_ru.php', 'admin/language/russian/module/smart_sms.php', 'admin/language/russian/sms_gateway/smslane.php', 'admin/language/russian/sms_gateway/zong.php', 'admin/language/russian/sms_gateway/isms_com_my.php', 'admin/language/russian/sms_gateway/oozeetech.php', 'admin/language/russian/sms_gateway/infosmska.php', 'admin/language/russian/sms_gateway/loginpanel.php', 'admin/language/russian/sms_gateway/sms_assistent.php', 'admin/language/russian/sms_gateway/thaibulksms.php', 'admin/language/russian/sms_gateway/turbosms.php', 'admin/language/russian/sms_gateway/bestsmsdeal_com.php', 'admin/language/russian/sms_gateway/msg91_com.php', 'admin/language/russian/sms_gateway/textlocal.php', 'admin/language/russian/sms_gateway/netgsm.php', 'admin/language/russian/sms_gateway/sms_ru.php', 'admin/language/russian/sms_gateway/websms.php', 'admin/language/russian/sms_gateway/smsc_ru.php', 'admin/language/russian/sms_gateway/mvaayoo.php', 'admin/language/russian/sms_gateway/hspsms.php', 'admin/language/russian/sms_gateway/smsaero.php', 'admin/language/russian/sms_gateway/mainsms.php', 'admin/language/russian/sms_gateway/mirsms.php', 'admin/language/russian/sms_gateway/letsads.php', 'admin/language/russian/sms_gateway/iqsms.php', 'admin/language/russian/sms_gateway/smsc_biz.php', 'admin/language/russian/sms_gateway/smshorizon_in.php', 'admin/language/russian/sms_gateway/atompark.php', 'admin/language/russian/sms_gateway/bestsmsdeal_in.php', 'admin/language/russian/sms_gateway/smscab.php', 'admin/language/russian/sms_gateway/sms_sending_ru.php', 'admin/controller/module/smart_sms.php', 'admin/controller/sms_gateway/smslane.php', 'admin/controller/sms_gateway/zong.php', 'admin/controller/sms_gateway/isms_com_my.php', 'admin/controller/sms_gateway/oozeetech.php', 'admin/controller/sms_gateway/infosmska.php', 'admin/controller/sms_gateway/loginpanel.php', 'admin/controller/sms_gateway/sms_assistent.php', 'admin/controller/sms_gateway/thaibulksms.php', 'admin/controller/sms_gateway/turbosms.php', 'admin/controller/sms_gateway/bestsmsdeal_com.php', 'admin/controller/sms_gateway/msg91_com.php', 'admin/controller/sms_gateway/textlocal.php', 'admin/controller/sms_gateway/netgsm.php', 'admin/controller/sms_gateway/sms_ru.php', 'admin/controller/sms_gateway/websms.php', 'admin/controller/sms_gateway/smsc_ru.php', 'admin/controller/sms_gateway/mvaayoo.php', 'admin/controller/sms_gateway/hspsms.php', 'admin/controller/sms_gateway/smsaero.php', 'admin/controller/sms_gateway/mainsms.php', 'admin/controller/sms_gateway/mirsms.php', 'admin/controller/sms_gateway/letsads.php', 'admin/controller/sms_gateway/iqsms.php', 'admin/controller/sms_gateway/smsc_biz.php', 'admin/controller/sms_gateway/smshorizon_in.php', 'admin/controller/sms_gateway/atompark.php', 'admin/controller/sms_gateway/bestsmsdeal_in.php', 'admin/controller/sms_gateway/smscab.php', 'admin/controller/sms_gateway/sms_sending_ru.php', 'catalog/language/english/module/smart_sms.php', 'catalog/language/russian/module/smart_sms.php', 'catalog/controller/trigger/smart_sms.php');
    
    public function __construct($registry)
    {
        parent::__construct($registry);
    }
    
    public function install()
    {
        if (!$this->config->get('smart_sms_admin_phone'))
        {
            $this->config->save('smart_sms','admin_phone',$this->config->get('config_telephone'));
        }
        
        if (OC_VERSION == '2.x')
        {
            $this->load->model('extension/event');
            $this->model_extension_event->deleteEvent('smart_sms');
            $this->model_extension_event->addEvent('smart_sms', 'pre.customer.add', 'trigger/smart_sms/customer_add');
        }
    }
    
    public function uninstall()
    {
        if (OC_VERSION == '2.x')
        {
            $this->load->model('extension/event');
            $this->model_extension_event->deleteEvent('smart_sms');
        }
    }
}
?>