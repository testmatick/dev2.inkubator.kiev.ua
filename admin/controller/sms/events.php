<?php  class ControllerSmsEvents extends Controller { public $hooks; public function __construct($i2ff622d6d3240319aa3f9fedd663caef3d28e3e2) { parent::__construct($i2ff622d6d3240319aa3f9fedd663caef3d28e3e2); require_once("model/sms/hooks.php"); require_once("model/sms/sms.php"); $this->hooks = new ModelSmsHooks( $this->registry ); require_once("".$this->hooks->getLanguageDirectory()); } public function returnGoodsStatus($i10dabd0ff3063e4a86ec016d1e108ad0fbecba80) { $i30127f0cd4894803854852241754c6b654188778 = filter_input(INPUT_POST, "notifySms"); if($i30127f0cd4894803854852241754c6b654188778 || !isset($i30127f0cd4894803854852241754c6b654188778)) { $this->hooks->returnGoodsStatus(filter_input(INPUT_POST, "return_status_id"), filter_input(INPUT_POST, "comment"), $i10dabd0ff3063e4a86ec016d1e108ad0fbecba80); } } public function productDeleteHook($ie62263543c6d01ab851f16e2bd84a579245466a6) { $this->hooks->productDeleteHook($ie62263543c6d01ab851f16e2bd84a579245466a6); } public function returnGoodsStatus2200($icae1003a7b78317ecd106d559490d2ed7842f019, $ib0c3f93ef17272b8cc68ee288e41ffdccd570878, $i10dabd0ff3063e4a86ec016d1e108ad0fbecba80) { $this->returnGoodsStatus($i10dabd0ff3063e4a86ec016d1e108ad0fbecba80); } public function productDeleteHook2200($icae1003a7b78317ecd106d559490d2ed7842f019, $ib0c3f93ef17272b8cc68ee288e41ffdccd570878, $ie62263543c6d01ab851f16e2bd84a579245466a6) { $this->productDeleteHook($ie62263543c6d01ab851f16e2bd84a579245466a6); } } 