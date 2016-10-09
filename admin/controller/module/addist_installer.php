<?php
if (!class_exists('AddistObject')) require_once(DIR_SYSTEM.'addist/startup.php');
class ControllerModuleAddistInstaller extends Controller
{
    public $path        = 'module/addist_installer/addist_installer';
    public $data        = array();
    public $errors      = false;
    
    public function login()
    {
        return call_user_func_array(array($this->installer,'login'),func_get_args());
    }
    
    public function logout()
    {
        return call_user_func_array(array($this->installer,'logout'),func_get_args());
    }
    
    public function get_modal()
    {
        return call_user_func_array(array($this->installer,'get_modal'),func_get_args());
    }
    
    public function refresh_mods()
    {
        return call_user_func_array(array($this->installer,'refresh_mods'),func_get_args());
    }
    
    public function ext_download()
    {
        return call_user_func_array(array($this->installer,'ext_download'),func_get_args());
    }
    
    public function ext_remove()
    {
        return call_user_func_array(array($this->installer,'ext_remove'),func_get_args());
    }
    
    public function ext_view()
    {
        return call_user_func_array(array($this->installer,'ext_view'),func_get_args());
    }
    
    public function refresh()
    {
        return call_user_func_array(array($this->installer,'refresh'),func_get_args());
    }
    
    public function send_pass()
    {
        return call_user_func_array(array($this->installer,'send_pass'),func_get_args());
    }
    
	public function __get($key)
    {
        if ($key=='installer')
		{
            $installer = $this->registry->get('installer');
            if (empty($installer))
            {
                $installer = new AddistInstaller($this->registry);
                $this->registry->set('installer', $installer);
            }
		}
        
        return parent::__get($key);
	}
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        
        $this->language->load('common/addist');
        $this->language->load('module/addist_installer');
        
        $errors = check_requirements(false);
        if (is_array($errors))
        {
            $this->errors = $errors;
            if ($this->request->get['route'] != 'module/addist_installer' && $this->request->get['route'] != 'extension/module/install' && $this->request->get['route'] != 'extension/module/uninstall')
            {
                if (OC_VERSION == '2.x')
                {
                    $this->response->redirect($this->url->link('module/addist_installer', 'token=' . $this->session->data['token'], 'SSL'));
                }
                else
                {
                    $this->redirect($this->url->link('module/addist_installer', 'token=' . $this->session->data['token'], 'SSL'));
                }
            }
        }
        else
        {
            require_once(DIR_SYSTEM . 'addist/library/installer.php');
            $this->registry->set('installer',new AddistInstaller($this->registry));
        }
    }
    
    public function __call($method,$args)
    {
        if (empty($this->errors))
        {
            return call_user_func_array(array($this->installer,$method),$args);
        }
    }
    
    public function install()
    {
        //set permission
        $this->load->model('user/user');
        $user = $this->model_user_user->getUser($this->user->getId());
        
        $this->load->model('user/user_group');
        $this->model_user_user_group->addPermission($user['user_group_id'],'access','addist/activation');
        $this->model_user_user_group->addPermission($user['user_group_id'],'access','addist/error');
        $this->model_user_user_group->addPermission($user['user_group_id'],'access','addist/tab');
        
        //install ioncube
        $extensions = get_loaded_extensions();
        if (!in_array('ionCube Loader', $extensions))
        {
            $php_ini = is_file(DIR_APPLICATION.'php.ini') ? file_get_contents(DIR_APPLICATION.'php.ini') : '';
            if (!preg_match('#zend_extension +\= +(.*)ioncube(.*)\.so(.*)#',$php_ini))
            {
                $this->install_ioncube();
            }
        }
        
        //redirect
        if (OC_VERSION == '2.x')
        {
            $this->response->redirect($this->url->link('module/addist_installer', 'token=' . $this->session->data['token'], 'SSL'));
        }
        else
        {
            $this->redirect($this->url->link('module/addist_installer', 'token=' . $this->session->data['token'], 'SSL'));
        }
    }
    
    public function install_ioncube()
    {
        if (!function_exists('posix_uname'))
        {
            return false;
        }
        
        $os = posix_uname();
        if (strtolower($os['sysname']) == 'linux')
        {
            $install = true;
        }
        else
        {
            $install = false;
        }
        
        $connection = @fsockopen('addist.ru', 80, $errno, $errstr, 2);
        if (is_resource($connection))
        {
            $bit = $os['machine'] == 'x86_64' ? '64' : '32';
            $php_v = implode('.',array_slice(explode('.',PHP_VERSION),0,2));
            
            $content = file_get_contents('http://addist.ru/upload/ioncube/linux/'.$bit.'/'.$php_v.'.so');
            if ($content)
            {
                if (!is_dir(DIR_SYSTEM.'../ioncube') && is_writable(DIR_SYSTEM.'../'))
                {
                    mkdir(DIR_SYSTEM.'../ioncube');
                }
                
                if (is_dir(DIR_SYSTEM.'../ioncube') && is_writable(DIR_SYSTEM.'../ioncube'))
                {
                    file_put_contents(DIR_SYSTEM.'../ioncube/ioncube_loader_'.strtolower($os['sysname']).'_'.$php_v.'.so',$content);
                    
                    $php_ini = is_file(DIR_APPLICATION.'php.ini') ? file_get_contents(DIR_APPLICATION.'php.ini') : '';
                    $php_ini = 'zend_extension = '.realpath(DIR_APPLICATION.'../').'/ioncube/ioncube_loader_'.strtolower($os['sysname']).'_'.$php_v.'.so'."\n".$php_ini;
                    file_put_contents(DIR_APPLICATION.'php.ini',$php_ini);
                    
                    $php_ini = is_file(DIR_APPLICATION.'../php.ini') ? file_get_contents(DIR_APPLICATION.'../php.ini') : '';
                    $php_ini = 'zend_extension = '.realpath(DIR_APPLICATION.'../').'/ioncube/ioncube_loader_'.strtolower($os['sysname']).'_'.$php_v.'.so'."\n".$php_ini;
                    file_put_contents(DIR_APPLICATION.'../php.ini',$php_ini);
                }
            }
        }
        
        $php_ini = is_file(DIR_APPLICATION.'php.ini') ? file_get_contents(DIR_APPLICATION.'php.ini') : '';
        if (preg_match('#zend_extension +\= +(.*)ioncube(.*)\.so(.*)#',$php_ini))
        {
            return true;
        }
    }
    
    public function index()
    {
        if (empty($this->errors))
        {
            return call_user_func_array(array($this->installer,'index'),array());
        }
        else
        {
            $this->data['heading_title'] = $this->language->get('heading_title');
            $this->data['errors'] = $this->errors;
            $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
            
            if (OC_VERSION == '2.x')
            {
                return $this->load->controller('addist/error',$this->data);
            }
            else
            {
                return $this->getChild('addist/error',$this->data);
            }
        }
	}
}
?>