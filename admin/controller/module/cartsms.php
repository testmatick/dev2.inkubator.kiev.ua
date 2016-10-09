<?php

require_once DIR_APPLICATION . "controller/extension/modification.php";

class ControllerModuleCartsms extends Controller
{

    private $error = array();
    static public $lang_iso = array('aa' => 'Afar', 'ab' => 'Abkhaz', 'ae' => 'Avestan',
        'af' => 'Afrikaans', 'ak' => 'Akan', 'am' => 'Amharic', 'an' => 'Aragonese',
        'ar' => 'Arabic', 'as' => 'Assamese', 'av' => 'Avaric', 'ay' => 'Aymara',
        'az' => 'Azerbaijani', 'ba' => 'Bashkir', 'be' => 'Belarusian', 'bg' => 'Bulgarian',
        'bh' => 'Bihari', 'bi' => 'Bislama', 'bm' => 'Bambara', 'bn' => 'Bengali',
        'bo' => 'Tibetan Standard, Tibetan, Central', 'br' => 'Breton', 'bs' => 'Bosnian',
        'ca' => 'Catalan; Valencian', 'ce' => 'Chechen', 'ch' => 'Chamorro', 'co' => 'Corsican',
        'cr' => 'Cree', 'cs' => 'Czech', 'cu' => 'Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic',
        'cv' => 'Chuvash', 'cy' => 'Welsh', 'da' => 'Danish', 'de' => 'German', 'dv' => 'Divehi; Dhivehi; Maldivian;',
        'dz' => 'Dzongkha', 'ee' => 'Ewe', 'el' => 'Greek, Modern', 'en' => 'English',
        'eo' => 'Esperanto', 'es' => 'Spanish', 'et' => 'Estonian', 'eu' => 'Basque',
        'fa' => 'Persian', 'ff' => 'Fula; Fulah; Pulaar; Pular', 'fi' => 'Finnish',
        'fj' => 'Fijian', 'fo' => 'Faroese', 'fr' => 'French', 'fy' => 'Western Frisian',
        'ga' => 'Irish', 'gd' => 'Scottish Gaelic; Gaelic', 'gl' => 'Galician', 'gn' => 'GuaranÃ­',
        'gu' => 'Gujarati', 'gv' => 'Manx', 'ha' => 'Hausa', 'he' => 'Hebrew (modern)',
        'hi' => 'Hindi', 'ho' => 'Hiri Motu', 'hr' => 'Croatian', 'ht' => 'Haitian; Haitian Creole',
        'hu' => 'Hungarian', 'hy' => 'Armenian', 'hz' => 'Herero', 'ia' => 'Interlingua',
        'id' => 'Indonesian', 'ie' => 'Interlingue', 'ig' => 'Igbo', 'ii' => 'Nuosu',
        'ik' => 'Inupiaq', 'io' => 'Ido', 'is' => 'Icelandic', 'it' => 'Italian',
        'iu' => 'Inuktitut', 'ja' => 'Japanese (ja)', 'jv' => 'Javanese (jv)', 'ka' => 'Georgian',
        'kg' => 'Kongo', 'ki' => 'Kikuyu, Gikuyu', 'kj' => 'Kwanyama, Kuanyama',
        'kk' => 'Kazakh', 'kl' => 'Kalaallisut, Greenlandic', 'km' => 'Khmer', 'kn' => 'Kannada',
        'ko' => 'Korean', 'kr' => 'Kanuri', 'ks' => 'Kashmiri', 'ku' => 'Kurdish',
        'kv' => 'Komi', 'kw' => 'Cornish', 'ky' => 'Kirghiz, Kyrgyz', 'la' => 'Latin',
        'lb' => 'Luxembourgish, Letzeburgesch', 'lg' => 'Luganda', 'li' => 'Limburgish, Limburgan, Limburger',
        'ln' => 'Lingala', 'lo' => 'Lao', 'lt' => 'Lithuanian', 'lu' => 'Luba-Katanga',
        'lv' => 'Latvian', 'mg' => 'Malagasy', 'mh' => 'Marshallese', 'mi' => 'Maori',
        'mk' => 'Macedonian', 'ml' => 'Malayalam', 'mn' => 'Mongolian', 'mr' => 'Marathi (Mara?hi)',
        'ms' => 'Malay', 'mt' => 'Maltese', 'my' => 'Burmese', 'na' => 'Nauru', 'nb' => 'Norwegian BokmÃ¥l',
        'nd' => 'North Ndebele', 'ne' => 'Nepali', 'ng' => 'Ndonga', 'nl' => 'Dutch',
        'nn' => 'Norwegian Nynorsk', 'no' => 'Norwegian', 'nr' => 'South Ndebele',
        'nv' => 'Navajo, Navaho', 'ny' => 'Chichewa; Chewa; Nyanja', 'oc' => 'Occitan',
        'oj' => 'Ojibwe, Ojibwa', 'om' => 'Oromo', 'or' => 'Oriya', 'os' => 'Ossetian, Ossetic',
        'pa' => 'Panjabi, Punjabi', 'pi' => 'Pali', 'pl' => 'Polish', 'ps' => 'Pashto, Pushto',
        'pt' => 'Portuguese', 'qu' => 'Quechua', 'rm' => 'Romansh', 'rn' => 'Kirundi',
        'ro' => 'Romanian, Moldavian, Moldovan', 'ru' => 'Russian', 'rw' => 'Kinyarwanda',
        'sa' => 'Sanskrit (Sa?sk?ta)', 'sc' => 'Sardinian', 'sd' => 'Sindhi', 'se' => 'Northern Sami',
        'sg' => 'Sango', 'si' => 'Sinhala, Sinhalese', 'sk' => 'Slovak', 'sl' => 'Slovene',
        'sm' => 'Samoan', 'sn' => 'Shona', 'so' => 'Somali', 'sq' => 'Albanian',
        'sr' => 'Serbian', 'ss' => 'Swati', 'st' => 'Southern Sotho', 'su' => 'Sundanese',
        'sv' => 'Swedish', 'sw' => 'Swahili', 'ta' => 'Tamil', 'te' => 'Telugu',
        'tg' => 'Tajik', 'th' => 'Thai', 'ti' => 'Tigrinya', 'tk' => 'Turkmen', 'tl' => 'Tagalog',
        'tn' => 'Tswana', 'to' => 'Tonga (Tonga Islands)', 'tr' => 'Turkish', 'ts' => 'Tsonga',
        'tt' => 'Tatar', 'tw' => 'Twi', 'ty' => 'Tahitian', 'ug' => 'Uighur, Uyghur',
        'uk' => 'Ukrainian', 'ur' => 'Urdu', 'uz' => 'Uzbek', 've' => 'Venda', 'vi' => 'Vietnamese',
        'vo' => 'VolapÃ¼k', 'wa' => 'Walloon', 'wo' => 'Wolof', 'xh' => 'Xhosa',
        'yi' => 'Yiddish', 'yo' => 'Yoruba', 'za' => 'Zhuang, Chuang', 'zh' => 'Chinese',
        'zu' => 'Zulu',);
    private $timezone = array();

    public function index()
    {
        if(!defined("SMS_MODULE"))
        {
            if(file_exists("model/sms/hooks.php"))
            {
                require_once("model/sms/hooks.php");
                require_once("model/sms/sms.php");
                $hooks = new ModelSmsHooks($this->registry);
                require_once($hooks->getLanguageDirectory());
            }
        }

        $this->load->language('module/cartsms');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('sms/main');

        if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
        {
            $this->model_setting_setting->editSetting('sms', $this->request->post + array(
                "sms_status" => 1));

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $smsSettings = $this->model_setting_setting->getSetting("sms");
        if(isset($smsSettings["sms_lang"]))
        {
            $lang = $smsSettings["sms_lang"];
        }
        else
        {
            $lang = "en";
        }

        $d = dir(DIR_APPLICATION . "model/sms/languages");
        $data['lang'] = "";
        //while (false !== ($entry = $d->read())) {
        foreach(scandir(DIR_APPLICATION . "model/sms/languages") as $entry)
        {
            $selected = "";
            if($entry == $lang)
            {
                $selected = " selected";
            }
            if(is_dir(DIR_APPLICATION . "model/sms/languages/" . $entry) && $entry != ".." && $entry != ".")
            {
                $data['lang'] .= "<option value=\"" . $entry . "\" " . $selected . ">" . $entry . " - " . self::$lang_iso[$entry] . "</option>";
            }
        }

        $smsSettings = $this->model_setting_setting->getSetting("sms");

        $this->getTimezone();

        if(!in_array($smsSettings["sms_timezone"], $this->timezone))
            $this->timezone[] = $smsSettings["sms_timezone"];

        $data['timezone'] = $this->timezone;

        $data['timezone_actual'] = $smsSettings["sms_timezone"];

        $data['entry_language'] = $this->language->get('entry_language');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if(isset($this->error['warning']))
        {
            $data['error_warning'] = $this->error['warning'];
        }
        else
        {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->getLink('common/home'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->getLink('extension/module'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->getLink('module/sms'),
            'separator' => ' :: '
        );

        $data['action'] = $this->getLink('module/cartsms');

        $data['cancel'] = $this->getLink('extension/module');



        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('module/cartsms.tpl', $data));
    }

    protected function validate()
    {
        if(!$this->user->hasPermission('modify', 'module/sms'))
        {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if(!$this->error)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public function install()
    {
        if(VERSION == "2.0.0.0")
        {
            $this->load->model('tool/event');
            $this->model_tool_event->deleteEvent('cartsms');
        }
        else
        {
            $this->load->model('extension/event');
            $this->model_extension_event->deleteEvent('cartsms');
        }

        $this->load->model('sms/main');
        $this->load->model('setting/setting');

        $this->model_sms_main->createTable();

        $this->getTimezone();

        $this->model_setting_setting->editSetting('sms', array('sms_lang' => 'en',
            'sms_status' => 1, 'sms_timezone' => $this->timezone[0]));

        $this->load->model('user/user_group');

        if(VERSION == "2.0.0.0")
        {
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/profile');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/about');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/admin');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/answers');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/credit');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/customer');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/history');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/marketing');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/send');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/settings');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/smscharging');
            $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'sms/statistics');
            $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/sms');

            $this->model_tool_event->addEvent('cartsms', 'sms.post.return.history.add', 'sms/events/returnGoodsStatus');
            $this->model_tool_event->addEvent('cartsms', 'post.order.history.add', 'sms/events/changeOrderStatusHook');
            $this->model_tool_event->addEvent('cartsms', 'sms.post.order.add.success', 'sms/events/orderAddHook');
            $this->model_tool_event->addEvent('cartsms', 'post.customer.add', 'sms/events/customerAddHook');
            $this->model_tool_event->addEvent('cartsms', 'post.return.add', 'sms/events/returnGoods');
            $this->model_tool_event->addEvent('cartsms', 'pre.admin.delete.product', 'sms/events/productDeleteHook');
            $this->model_tool_event->addEvent('cartsms', 'sms.post.contactformmail.send', 'sms/events/contactFormHook');

            $refresh = new ControllerExtensionModification($this->registry);
            $refresh->refresh();
        }
        else
        {
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/profile');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/about');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/admin');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/answers');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/credit');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/customer');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/history');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/marketing');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/send');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/settings');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/smscharging');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sms/statistics');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'module/sms');

            $version = (int)str_replace(".", "", VERSION);
            
            if($version < 2200)
            {
                $this->model_extension_event->addEvent('cartsms', 'sms.post.return.history.add', 'sms/events/returnGoodsStatus');
                $this->model_extension_event->addEvent('cartsms', 'post.order.history.add', 'sms/events/changeOrderStatusHook');
                $this->model_extension_event->addEvent('cartsms', 'sms.post.order.add.success', 'sms/events/orderAddHook');
                $this->model_extension_event->addEvent('cartsms', 'post.customer.add', 'sms/events/customerAddHook');
                $this->model_extension_event->addEvent('cartsms', 'post.return.add', 'sms/events/returnGoods');
                $this->model_extension_event->addEvent('cartsms', 'pre.admin.delete.product', 'sms/events/productDeleteHook');
                $this->model_extension_event->addEvent('cartsms', 'sms.post.contactformmail.send', 'sms/events/contactFormHook');
            }
            else
            {
                $this->model_extension_event->addEvent('cartsms', 'admin/model/sale/return/addReturnHistory2200/after', 'sms/events/returnGoodsStatus');
                $this->model_extension_event->addEvent('cartsms', 'catalog/model/checkout/order/addOrderHistory2200/after', 'sms/events/changeOrderStatusHook');
                $this->model_extension_event->addEvent('cartsms', 'catalog/sms.post.order.add.success', 'sms/events/orderAddHook');
                $this->model_extension_event->addEvent('cartsms', 'catalog/model/account/customer/addCustomer2200/after', 'sms/events/customerAddHook');
                $this->model_extension_event->addEvent('cartsms', 'catalog/model/account/return/addReturn2200/after', 'sms/events/returnGoods');
                $this->model_extension_event->addEvent('cartsms', 'admin/model/catalog/product/deleteProduct2200/after', 'sms/events/productDeleteHook');
                $this->model_extension_event->addEvent('cartsms', 'catalog/sms.post.contactformmail.send', 'sms/events/contactFormHook');
            }
            
            $refresh = new ControllerExtensionModification($this->registry);
            $refresh->refresh();
        }
    }

    public function uninstall()
    {
        if(VERSION == "2.0.0.0")
        {
            $this->load->model('tool/event');
        }
        else
        {
            $this->load->model('extension/event');
        }

        $this->load->model('sms/main');
        $this->load->model('user/user_group');
        $this->model_sms_main->deleteTable();

        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('sms');

        if(VERSION == "2.0.0.0")
        {
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/profile');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/about');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/admin');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/answers');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/credit');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/customer');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/history');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/marketing');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/send');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/settings');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/smscharging');
            $this->model_user_user_group->removePermission($this->user->getId(), 'access', 'sms/statistics');
            $this->model_user_user_group->removePermission($this->user->getId(), 'modify', 'module/sms');

            $this->model_tool_event->deleteEvent('cartsms');
        }
        else
        {
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/profile');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/about');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/admin');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/answers');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/credit');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/customer');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/history');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/marketing');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/send');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/settings');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/smscharging');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sms/statistics');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'module/sms');

            $this->model_extension_event->deleteEvent('cartsms');
        }
    }

    private function getLink($target, $variables = "")
    {
        return $this->url->link($target, 'token=' . $this->session->data['token'] . $variables, 'SSL');
    }

    private function getTimezone()
    {
        $country = array();
        $result = $this->model_sms_main->Execute("SELECT * FROM " . DB_PREFIX . "setting where `key`='config_country_id'");

        if($result->num_rows)
        {
            foreach($result->rows as $item)
            {
                $country[] = $item["value"];
                if(!isset($item["store_id"]) || $item["store_id"] == 0)
                {
                    $country[] = $item["value"];
                }
            }

            $result = $this->model_sms_main->Execute("SELECT * FROM " . DB_PREFIX . "country where country_id IN (" . implode($country, ",") . ")");

            if($result->num_rows)
            {
                foreach($result->rows as $row)
                {
                    $isoCode = $row["iso_code_2"];
                    $timezoneArray = DateTimeZone::listIdentifiers(4096, $isoCode);
                    foreach($timezoneArray as $timezone)
                    {
                        $this->timezone[] = $timezone;
                    }

                    if(count($this->timezone) < 0)
                    {
                        $this->timezone[] = 'Europe/Prague';
                    }
                }
            }
            else
            {
                $this->timezone[] = 'Europe/Prague';
            }
        }
        else
        {
            $this->timezone[] = 'Europe/Prague';
        }
    }

    public function refreshMod()
    {
        $this->load->language('extension/modification');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/modification');

        if($this->validate())
        {
            //Log
            $log = array();

            // Clear all modification files
            $files = glob(DIR_MODIFICATION . '{*.php,*.tpl}', GLOB_BRACE);

            if($files)
            {
                foreach($files as $file)
                {
                    if(file_exists($file))
                    {
                        unlink($file);
                    }
                }
            }

            // Begin
            $xml = array();

            // Load the default modification XML
            $xml[] = file_get_contents(DIR_SYSTEM . 'modification.xml');

            // Get the default modification file
            $results = $this->model_extension_modification->getModifications();

            foreach($results as $result)
            {
                if($result['status'])
                {
                    $xml[] = $result['code'];
                }
            }

            $modification = array();

            foreach($xml as $xml)
            {
                $dom = new DOMDocument('1.0', 'UTF-8');
                $dom->preserveWhiteSpace = false;
                $dom->loadXml($xml);

                // Log
                $log[] = 'MOD: ' . $dom->getElementsByTagName('name')->item(0)->textContent;

                $files = $dom->getElementsByTagName('modification')->item(0)->getElementsByTagName('file');

                foreach($files as $file)
                {
                    $operations = $file->getElementsByTagName('operation');

                    $path = '';

                    // Get the full path of the files that are going to be used for modification
                    if(substr($file->getAttribute('path'), 0, 7) == 'catalog')
                    {
                        $path = DIR_CATALOG . str_replace('../', '', substr($file->getAttribute('path'), 8));
                    }

                    if(substr($file->getAttribute('path'), 0, 5) == 'admin')
                    {
                        $path = DIR_APPLICATION . str_replace('../', '', substr($file->getAttribute('path'), 6));
                    }

                    if(substr($file->getAttribute('path'), 0, 6) == 'system')
                    {
                        $path = DIR_SYSTEM . str_replace('../', '', substr($file->getAttribute('path'), 7));
                    }

                    if($path)
                    {
                        $files = glob($path, GLOB_BRACE);

                        if($files)
                        {
                            foreach($files as $file)
                            {
                                // Get the key to be used for the modification cache filename.
                                if(substr($file, 0, strlen(DIR_CATALOG)) == DIR_CATALOG)
                                {
                                    $key = 'catalog/' . substr($file, strlen(DIR_CATALOG));
                                }

                                if(substr($file, 0, strlen(DIR_APPLICATION)) == DIR_APPLICATION)
                                {
                                    $key = 'admin/' . substr($file, strlen(DIR_APPLICATION));
                                }

                                if(substr($file, 0, strlen(DIR_SYSTEM)) == DIR_SYSTEM)
                                {
                                    $key = 'system/' . substr($file, strlen(DIR_SYSTEM));
                                }

                                if(!isset($modification[$key]))
                                {
                                    $content = file_get_contents($file);

                                    $content = preg_replace('~\r?\n~', "\n", $content);

                                    $modification[$key] = $content;
                                    $original[$key] = $content;

                                    // Log
                                    $log[] = 'FILE: ' . $key;
                                }

                                foreach($operations as $operation)
                                {
                                    // Search and replace
                                    if($operation->getElementsByTagName('search')->item(0)->getAttribute('regex') != 'true')
                                    {
                                        $search = $operation->getElementsByTagName('search')->item(0)->textContent;
                                        $trim = $operation->getElementsByTagName('search')->item(0)->getAttribute('trim');
                                        $offset = $operation->getElementsByTagName('search')->item(0)->getAttribute('offset');
                                        $limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');
                                        $add = $operation->getElementsByTagName('add')->item(0)->textContent;
                                        $position = $operation->getElementsByTagName('add')->item(0)->getAttribute('position');

                                        // Trim
                                        if(!$trim || $trim == 'true')
                                        {
                                            $search = trim($search);
                                        }

                                        switch ($position)
                                        {
                                            default:
                                            case 'replace':
                                                $replace = $add;
                                                break;
                                            case 'before':
                                                $replace = $add . $search;
                                                break;
                                            case 'after':
                                                $replace = $search . $add;
                                                break;
                                        }

                                        $i = 0;
                                        $pos = -1;
                                        $match = array();

                                        // Create an array of all the start postions of all the matched code
                                        while(($pos = strpos($modification[$key], $search, $pos + 1)) !== false)
                                        {
                                            $match[$i++] = $pos;
                                        }

                                        // Offset
                                        if(!$offset)
                                        {
                                            $offset = 0;
                                        }

                                        // Limit
                                        if(!$limit)
                                        {
                                            $limit = count($match);
                                        }
                                        else
                                        {
                                            $limit = $offset + $limit;
                                        }

                                        // Log
                                        $log[] = 'CODE: ' . $search;

                                        $status = false;

                                        // Only replace the occurance of the string that is equal to the between the offset and limit
                                        for($i = $offset; $i < $limit; $i++)
                                        {
                                            if(isset($match[$i]))
                                            {
                                                $modification[$key] = substr_replace($modification[$key], $replace, $match[$i], strlen($search));

                                                // Log
                                                $log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[$i]), "\n") + 1);

                                                $status = true;
                                            }
                                        }

                                        if(!$status)
                                        {
                                            $log[] = 'NOT FOUND!';
                                        }
                                    }
                                    else
                                    {
                                        $search = $operation->getElementsByTagName('search')->item(0)->textContent;
                                        $replace = $operation->getElementsByTagName('add')->item(0)->textContent;
                                        $limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');

                                        // Limit
                                        if(!$limit)
                                        {
                                            $limit = -1;
                                        }

                                        // Log
                                        $match = array();

                                        preg_match_all($search, $modification[$key], $match, PREG_OFFSET_CAPTURE);

                                        // Remove part of the the result if a limit is set.
                                        if($limit > 0)
                                        {
                                            $match[0] = array_slice($match[0], 0, $limit);
                                        }

                                        if($match[0])
                                        {
                                            $log[] = 'REGEX: ' . $search;

                                            for($i = 0; $i < count($match[0]); $i++)
                                            {
                                                $log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[0][$i][1]), "\n") + 1);
                                            }
                                        }
                                        else
                                        {
                                            $log[] = 'NOT FOUND!';
                                        }

                                        // Make the modification
                                        $modification[$key] = preg_replace($search, $replace, $modification[$key], $limit);
                                    }
                                }
                            }
                        }
                    }

                    // Log
                    $log[] = '----------------------------------------------------------------';
                }
            }

            // Log
            $ocmod = new Log('ocmod.log');
            $ocmod->write(implode("\n", $log));

            // Write all modification files
            foreach($modification as $key => $value)
            {
                // Only create a file if there are changes
                if($original[$key] != $value)
                {
                    $path = '';

                    $directories = explode('/', dirname($key));

                    foreach($directories as $directory)
                    {
                        $path = $path . '/' . $directory;

                        if(!is_dir(DIR_MODIFICATION . $path))
                        {
                            @mkdir(DIR_MODIFICATION . $path, 0777);
                        }
                    }

                    $handle = fopen(DIR_MODIFICATION . $key, 'w');

                    fwrite($handle, $value);

                    fclose($handle);
                }
            }
        }
    }

    public function refreshModv2000()
    {
        $this->load->language('extension/modification');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/modification');
        //Log
        $log = array();

        // Clear all modification files
        $files = glob(DIR_MODIFICATION . '{*.php,*.tpl}', GLOB_BRACE);

        if($files)
        {
            foreach($files as $file)
            {
                if(file_exists($file))
                {
                    unlink($file);
                }
            }
        }

        // Begin
        $xml = array();

        // Load the default modification XML
        $xml[] = file_get_contents(DIR_SYSTEM . 'modification.xml');

        // Get the default modification file
        $results = $this->model_extension_modification->getModifications();

        foreach($results as $result)
        {
            if($result['status'])
            {
                $xml[] = $result['code'];
            }
        }

        $modification = array();

        foreach($xml as $xml)
        {
            $dom = new DOMDocument('1.0', 'UTF-8');
            $dom->preserveWhiteSpace = false;
            $dom->loadXml($xml);

            // Log
            $log[] = 'MOD: ' . $dom->getElementsByTagName('name')->item(0)->textContent;

            $files = $dom->getElementsByTagName('modification')->item(0)->getElementsByTagName('file');

            foreach($files as $file)
            {
                $operations = $file->getElementsByTagName('operation');

                $path = '';

                // Get the full path of the files that are going to be used for modification
                if(substr($file->getAttribute('path'), 0, 7) == 'catalog')
                {
                    $path = DIR_CATALOG . str_replace('../', '', substr($file->getAttribute('path'), 8));
                }

                if(substr($file->getAttribute('path'), 0, 5) == 'admin')
                {
                    $path = DIR_APPLICATION . str_replace('../', '', substr($file->getAttribute('path'), 6));
                }

                if(substr($file->getAttribute('path'), 0, 6) == 'system')
                {
                    $path = DIR_SYSTEM . str_replace('../', '', substr($file->getAttribute('path'), 7));
                }

                if($path)
                {
                    $files = glob($path, GLOB_BRACE);

                    if($files)
                    {
                        foreach($files as $file)
                        {
                            // Get the key to be used for the modification cache filename.
                            if(substr($file, 0, strlen(DIR_CATALOG)) == DIR_CATALOG)
                            {
                                $key = 'catalog/' . substr($file, strlen(DIR_CATALOG));
                            }

                            if(substr($file, 0, strlen(DIR_APPLICATION)) == DIR_APPLICATION)
                            {
                                $key = 'admin/' . substr($file, strlen(DIR_APPLICATION));
                            }

                            if(substr($file, 0, strlen(DIR_SYSTEM)) == DIR_SYSTEM)
                            {
                                $key = 'system/' . substr($file, strlen(DIR_SYSTEM));
                            }

                            if(!isset($modification[$key]))
                            {
                                $content = file_get_contents($file);

                                $content = preg_replace('~\r?\n~', "\n", $content);

                                $modification[$key] = $content;
                                $original[$key] = $content;

                                // Log
                                $log[] = 'FILE: ' . $key;
                            }

                            foreach($operations as $operation)
                            {
                                // Search and replace
                                if($operation->getElementsByTagName('search')->item(0)->getAttribute('regex') != 'true')
                                {
                                    $search = $operation->getElementsByTagName('search')->item(0)->textContent;
                                    $trim = $operation->getElementsByTagName('search')->item(0)->getAttribute('trim');
                                    $offset = $operation->getElementsByTagName('search')->item(0)->getAttribute('offset');
                                    $limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');
                                    $add = $operation->getElementsByTagName('add')->item(0)->textContent;
                                    $position = $operation->getElementsByTagName('add')->item(0)->getAttribute('position');

                                    // Trim
                                    if(!$trim || $trim == 'true')
                                    {
                                        $search = trim($search);
                                    }

                                    switch ($position)
                                    {
                                        default:
                                        case 'replace':
                                            $replace = $add;
                                            break;
                                        case 'before':
                                            $replace = $add . $search;
                                            break;
                                        case 'after':
                                            $replace = $search . $add;
                                            break;
                                    }

                                    $i = 0;
                                    $pos = -1;
                                    $match = array();

                                    // Create an array of all the start postions of all the matched code
                                    while(($pos = strpos($modification[$key], $search, $pos + 1)) !== false)
                                    {
                                        $match[$i++] = $pos;
                                    }

                                    // Offset
                                    if(!$offset)
                                    {
                                        $offset = 0;
                                    }

                                    // Limit
                                    if(!$limit)
                                    {
                                        $limit = count($match);
                                    }
                                    else
                                    {
                                        $limit = $offset + $limit;
                                    }

                                    // Log
                                    $log[] = 'CODE: ' . $search;

                                    $status = false;

                                    // Only replace the occurance of the string that is equal to the between the offset and limit
                                    for($i = $offset; $i < $limit; $i++)
                                    {
                                        if(isset($match[$i]))
                                        {
                                            $modification[$key] = substr_replace($modification[$key], $replace, $match[$i], strlen($search));

                                            // Log
                                            $log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[$i]), "\n") + 1);

                                            $status = true;
                                        }
                                    }

                                    if(!$status)
                                    {
                                        $log[] = 'NOT FOUND!';
                                    }
                                }
                                else
                                {
                                    $search = $operation->getElementsByTagName('search')->item(0)->textContent;
                                    $replace = $operation->getElementsByTagName('add')->item(0)->textContent;
                                    $limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');

                                    // Limit
                                    if(!$limit)
                                    {
                                        $limit = -1;
                                    }

                                    // Log
                                    $match = array();

                                    preg_match_all($search, $modification[$key], $match, PREG_OFFSET_CAPTURE);

                                    // Remove part of the the result if a limit is set.
                                    if($limit > 0)
                                    {
                                        $match[0] = array_slice($match[0], 0, $limit);
                                    }

                                    if($match[0])
                                    {
                                        $log[] = 'REGEX: ' . $search;

                                        for($i = 0; $i < count($match[0]); $i++)
                                        {
                                            $log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[0][$i][1]), "\n") + 1);
                                        }
                                    }
                                    else
                                    {
                                        $log[] = 'NOT FOUND!';
                                    }

                                    // Make the modification
                                    $modification[$key] = preg_replace($search, $replace, $modification[$key], $limit);
                                }
                            }
                        }
                    }
                }

                // Log
                $log[] = '----------------------------------------------------------------';
            }
        }

        // Log
        $ocmod = new Log('ocmod.log');
        $ocmod->write(implode("\n", $log));

        // Write all modification files
        foreach($modification as $key => $value)
        {
            // Only create a file if there are changes
            if($original[$key] != $value)
            {
                $path = '';

                $directories = explode('/', dirname($key));

                foreach($directories as $directory)
                {
                    $path = $path . '/' . $directory;

                    if(!is_dir(DIR_MODIFICATION . $path))
                    {
                        @mkdir(DIR_MODIFICATION . $path, 0777);
                    }
                }

                $handle = fopen(DIR_MODIFICATION . $key, 'w');

                fwrite($handle, $value);

                fclose($handle);
            }
        }
    }

}

?>