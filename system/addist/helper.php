<?php
//error page
function addist_error($errors)
{
    global $registry;
    
    $args['errors'] = $errors;
    
    if (OC_VERSION == '2.x')
    {
        return $registry->get('load')->controller('addist/error',$args);
    }
    else
    {
        $action = new Action('addist/error', $args);
        $file = class_exists('VQMod') ? VQMod::modCheck($action->getFile()) : $action->getFile();
        if (file_exists($file))
        {
            $class = $action->getClass();
            if (!class_exists($class))
            {
                require_once($file);
            }
            $controller = new $class($registry);                                
			if (is_callable(array($controller, $action->getMethod()), false))
            {
				$output = call_user_func(array($controller, $action->getMethod()), $args);
                if (!empty($controller->output))
                {
                    $output = $controller->output;
                }
			}
            else
            {
				$output = $controller->getChild('addist/error', $args);
			}
            $registry->get('response')->setOutput($output);
        }
    }
    $registry->get('response')->output();
}

//check requirements function
function check_requirements($force = true)
{
    if (ob_get_contents())
    {
        ob_clean();
    }
    
    global $registry;
    
    $errors = array();
    
    //checking php version
    if (version_compare('5.2',PHP_VERSION) > 0)
    {
        $errors['php_version'] = $registry->get('language')->get('addist_error_php_version');
    }
    
    //checking mbstring
    if (!in_array('mbstring', get_loaded_extensions()))
    {
        $errors['mbstring'] = $registry->get('language')->get('addist_error_mbstring');
    }
    
    //checking curl
    if (!in_array('curl', get_loaded_extensions()) && !function_exists('curl_version') && !extension_loaded('curl'))
    {
        $errors['curl'] = $registry->get('language')->get('addist_error_curl');
    }
    
    //checking mcrypt
    if (!in_array('mcrypt', get_loaded_extensions()))
    {
        $errors['mcrypt'] = $registry->get('language')->get('addist_error_mcrypt');
    }
    
    //checking zip
    if (!in_array('zip', get_loaded_extensions()))
    {
        $errors['zip'] = $registry->get('language')->get('addist_error_zip');
    }
    
    //checking ioncube
    if (IONCUBE_VERSION != '0')
    {
        $extensions = get_loaded_extensions();
        if (function_exists('ioncube_loader_version'))
        {
            if (version_compare(ioncube_loader_version(),IONCUBE_VERSION) < 0)
            {
                $errors['ioncube'] = sprintf($registry->get('language')->get('addist_error_ioncube_version'),IONCUBE_VERSION);
            }
        }
        else
        {
            $errors['ioncube'] = $registry->get('language')->get('addist_error_ioncube');
        }
    }
    
    //checking vqmod
    if (OC_VERSION != '2.x')
    {
        $vq = check_vqmod();
        if ($vq == 0)
        {
            $errors['vqmod'] = $registry->get('language')->get('addist_error_vqmod');
        }
        elseif ($vq == -1)
        {
            $errors['vqmod'] = sprintf($registry->get('language')->get('addist_error_vqmod_version'),VQMOD_VERSION);
        }
    }
    
    if ($errors && php_sapi_name() != "cli")
    {
        foreach($errors as $error)
        {
            addLog($error,'addist');
        }
        if ($force)
        {
            addist_error($errors);
        }
        else
        {
            return $errors;
        }
    }
    else
    {
        return true;
    }
}

function check_ioncube()
{
    $extensions = get_loaded_extensions();
    if (in_array('ionCube Loader', $extensions))
    {
        if (function_exists('ioncube_loader_version') && version_compare(ioncube_loader_version(),IONCUBE_VERSION) < 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    else
    {
        return false;
    }
}

function check_vqmod()
{
    if (OC_VERSION == '2.x' && is_dir(DIR_SYSTEM.'../vqmod/xml') && substr_count(file_get_contents(DIR_SYSTEM.'../admin/controller/extension/modification.php'),'vqmodGetIndexes'))
    {
        return 2;
    }
    
    if (!class_exists('VQMod'))
    {
        return 0;
    }
    else
    {
        $vqm = new ReflectionClass('VQMod');
        if ($vqm->isAbstract())
        {
            if (version_compare(VQMod::$_vqversion,VQMOD_VERSION) < 0)
            {
                return -1;
            }
            else
            {
                return 1;
            }
        }
        else
        {
            $rp = new ReflectionProperty(new VQMod(),'_vqversion');
            if (!$rp->isStatic() || $rp->isPrivate())
            {
                return -1;
            }
            else
            {
                return 1;
            }
        }
    }
}

//adutoload
function addist_autoload($class)
{
    $class = strtolower($class);
    if (substr($class,0,6) == 'addist')
    {
        check_requirements(true);
        $filename = DIR_SYSTEM . 'addist/engine/'.substr($class,6,strlen($class)).'.php';
        if (file_exists($filename))
        {
            require_once($filename);
        }
        
        $filename = DIR_SYSTEM . 'addist/library/'.substr($class,6,strlen($class)).'.php';
        if (file_exists($filename))
        {
            require_once($filename);
        }
    }
}
    
function addMessage($type, $message)
{
    global $registry;
    $registry->get('session')->data['messages'][$type][] = $message;
    $registry->get('session')->data['messages'][$type] = array_unique($registry->get('session')->data['messages'][$type]);
}

function getStores()
{
    global $registry;
    
    $stores = array();
    
    //main store
    $query = $registry->get('db')->query("SELECT `value` FROM `".DB_PREFIX."setting` WHERE `store_id` = '0' AND `key` = 'config_name'");
    $stores[] = array('store_id'=>'0','name'=>$query->row['value'],'url'=>IS_ADMIN ? HTTP_CATALOG : HTTP_SERVER,'ssl'=>IS_ADMIN && defined('HTTPS_CATALOG') ? HTTPS_CATALOG : HTTPS_SERVER);
    
    //other stores
    $query = $registry->get('db')->query("SELECT * FROM `".DB_PREFIX."store`");
    foreach($query->rows as $row)
    {
        $stores[] = $row;
    }
    
    return $stores;
}

function requireOnce($file)
{
    require_once($file);
}

function load_lib($library)
{
    require_once(DIR_SYSTEM.'library/'.$library.'.php');
}

function recurse_copy($src,$dst)
{ 
    $dir = opendir($src);
    @mkdir($dst);
    while(false !== ( $file = readdir($dir)) )
    {
        if ($file != '.' && $file != '..')
        {
            if ( is_dir($src . '/' . $file) )
            {
                recurse_copy($src . '/' . $file,$dst . '/' . $file);
            }
            else
            {
                copy($src . '/' . $file,$dst . '/' . $file);
                @unlink($src . '/' . $file);
            }
        }
    }
    closedir($dir); 
    @rmdir($src);
}

function fileGet($url, $data = array(), $user_agent = 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', $cookiefile = null)
{
	if (extension_loaded('curl'))
    {
    	$ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        if (trim(!ini_get('open_basedir')))
        {
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        }
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_AUTOREFERER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);
        if ($cookiefile)
        {
            curl_setopt($ch, CURLOPT_COOKIEFILE, $cookiefile);
            curl_setopt($ch, CURLOPT_COOKIEJAR, $cookiefile);
        }
        curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
        if ($data)
        {
            if (is_array($data) || is_object($data))
            {
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            }
            elseif (is_string($data))
            {
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            }
        }
    	$contents = curl_exec($ch);
        
    	curl_close($ch);
        
        return $contents;
    }
    else
    {
        addMessage('error',$registry->get('language')->get('addist_error_curl'));
        return false;
    }
}

function addLog($message, $filename = false)
{
    if (!$filename)
    {
        global $registry;
        $filename = $registry->get('config')->get('config_error_filename');
    }
    else
    {
        $filename .= '.log';
    }
    
    if (is_file(DIR_LOGS . $filename) && is_writable(DIR_LOGS . $filename))
    {
        @chmod(DIR_LOGS . $filename,0777);
    }
    
    $handle = fopen(DIR_LOGS . $filename, 'a');
    fwrite($handle, date('Y-m-d G:i:s') . ' - ' . print_r($message, true) . "\n");
    fclose($handle);
    
    if (is_file(DIR_LOGS . $filename) && is_writable(DIR_LOGS . $filename))
    {
        @chmod(DIR_LOGS . $filename,0777);
    }
}

function readLog($filename = 'error')
{
    if (is_file(DIR_LOGS.$filename.'.log'))
    {
        return file_get_contents(DIR_LOGS.$filename.'.log');
    }
}

function listFiles($folder)
{
    $result = array();
    
    $folder = str_replace('\\','/',$folder);
    if (is_dir($folder))
    {
        foreach(new RecursiveIteratorIterator(new RecursiveDirectoryIterator($folder, FilesystemIterator::SKIP_DOTS), RecursiveIteratorIterator::CHILD_FIRST) as $path)
        {
            if (basename($path->getPathname()) != 'extension.xml')
            {
                $pathname = str_replace('\\','/',$path->getPathname());
                
                if ($path->isFile())
                {
                    $result['files'][] = trim(str_replace($folder,'',$pathname),'\\/');
                }
                else
                {
                    $result['folders'][] = trim(str_replace($folder,'',$pathname),'\\/');
                }
            }
        }
    }
    
    return $result;
}

class nullClass
{
    public function __call($method,$args = array())
    {
        return true;
    }
}
?>