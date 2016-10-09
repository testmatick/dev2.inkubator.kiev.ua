<?php
require_once("admin/model/sms/main.php");
require_once("admin/model/sms/sms.php");

class ControllerSmsApi extends Controller
{

    public function index()
    {
        die("DISABLED");
        $model = new ModelSmsMain($this->registry);

        $to = $this->getVar("to");
        $text = $this->getVar("text");
        $unicode = $this->getVar("unicode");
        $type = $this->getVar("type");
        
        if(isset($to) && strlen($to) > 4 && strlen($text) > 0)
        {
            $sms = new SmsModel($model->getDb(), SmsModel::TYPE_SIMPLE, $type, SmsModel::SMS_BULK);
            $sms->number($to)->text($text)->unicode($unicode)->send();
            if(!$sms->isError())
            {
                echo "SMSSTATUS:OK";
            }
            else
            {
                echo "SMSSTATUS:ERROR";
            }
        }
        else
        {
            echo "SMSSTATUS:ERROR";
        }
    }
    
    private function getVar($var)
    {
        if(filter_input(INPUT_POST, $var))
        {
            return filter_input(INPUT_POST, $var);
        }
        elseif(filter_input(INPUT_GET, $var))
        {
            return filter_input(INPUT_GET, $var);
        }
        else
        {
            return null;
        }
    }

}
