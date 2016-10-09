<?php    
    header('Content-Type: application/json');
    echo json_encode(array());
    flush();
    
    require_once DIR_APPLICATION . "controller/module/cartsms.php";
    
    $modification_controller = new ControllerModuleCartsms($this->registry);
    @$modification_controller->install();  
    
    $this->load->model('extension/extension');
    $this->model_extension_extension->uninstall('module', "cartsms");
    @$this->model_extension_extension->install('module', "cartsms");
        
die;

        
