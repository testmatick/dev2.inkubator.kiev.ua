<?php
class AddistConfig extends AddistClass
{
    private $column = 'group';
	private $data = array();
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        
        $query = $this->dbQuery("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "setting' AND COLUMN_NAME = 'code'");
        if ($query->num_rows)
        {
            $this->column = 'code';
        }
        
        //fix columns
        $this->fix();
        
        //get db
        $query = $this->dbQuery("SELECT * FROM `" . DB_PREFIX . "setting` WHERE store_id = '0' OR store_id = '" . (int)STORE_ID . "' ORDER BY store_id ASC");
        foreach ($query->rows as $result)
        {
            if ($result['addist'] || $this->isBase64($result['value']))
            {
                if ($this->isBase64($result['value']) && $this->isSerialized(base64_decode($result['value'])))
                {
                    $value = base64_decode($result['value']);
                }
                else
                {
                    $value = $result['value'];
                }
                
                if ($this->isSerialized($value))
                {
                    $this->set($result['key'], unserialize($value));
                    if ($result['addist'])
                    {
                        $this->config->set($result['key'], unserialize($value));
                    }
            	}
                else
                {
            		$this->set($result['key'], $value);
                    if ($result['addist'])
                    {
                        $this->config->set($result['key'], $value);
                    }
            	}
            }
            else
            {
                if ($result['serialized'])
                {
                    if ($this->isSerialized($result['value']))
                    {
                        $this->set($result['key'], unserialize($result['value']));
                        if ($result['addist'])
                        {
                            $this->config->set($result['key'], unserialize($result['value']));
                        }
                    }
                    else
                    {
                        $this->set($result['key'], array());
                        if ($result['addist'])
                        {
                            $this->config->set($result['key'], array());
                        }
                        //addLog('Corrupted config key: '.$result['key'],'config.error');
                    }
                }
                else
                {
                	$this->set($result['key'], $result['value']);
                    if ($result['addist'])
                    {
                        $this->config->set($result['key'], $result['value']);
                    }
                }
            }
        }
        
        //default data
        $this->set('config_store_id', IS_ADMIN ? 0 : $this->config->get('config_store_id'));
    	$this->set('config_url', version_compare(VERSION,'2.2.0','>=') ? HTTP_SERVER : $this->config->get('config_url'));
    	$this->set('config_ssl', version_compare(VERSION,'2.2.0','>=') ? $this->config->get('site_ssl') : $this->config->get('config_ssl'));
        
        if (version_compare(VERSION,'2.2.0','>='))
        {
            $this->set('config_language_id', $this->getLanguageId($this->data['config_language']));
        }
        else
        {
            $this->set('config_language_id', $this->config->get('config_language_id'));
            $this->set('config_language', $this->config->get('config_language'));
            $this->set('config_customer_group_id', $this->config->get('config_customer_group_id'));
        }
        
        if (OC_VERSION == '2.x')
        {
            $this->set('limit_admin',(int)$this->get('config_limit_admin'));
        }
        else
        {
            $this->set('limit_admin',(int)$this->get('config_admin_limit'));
        }
    }
    
	public function getLanguageId($language)
    {
		$query = $this->db->query("SELECT `language_id` FROM ".DB_PREFIX."language WHERE `code` = '$language'");
        return $query->row['language_id'];
	}

	public function get($key,$default = null)
    {
		return (isset($this->data[$key]) ? $this->data[$key] : $default);
	}

	public function set($key, $value)
    {
		$this->data[$key] = $value;
	}
    
    public function fix()
    {
        $query = $this->dbQuery("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME LIKE '" . DB_PREFIX . "setting' AND COLUMN_NAME = 'store_id'");
        if (!$query->num_rows)
        {
            $this->dbQuery("ALTER TABLE `" . DB_PREFIX . "setting` ADD `store_id` INT( 11 ) NOT NULL AFTER `setting_id`");
        }
        $query = $this->dbQuery("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME LIKE '" . DB_PREFIX . "setting' AND COLUMN_NAME = 'serialized'");
        if (!$query->num_rows)
        {
            $this->dbQuery("ALTER TABLE `" . DB_PREFIX . "setting` ADD `serialized` TINYINT( 1 ) NOT NULL AFTER `setting_id`");
        }
        $query = $this->dbQuery("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME LIKE '" . DB_PREFIX . "setting' AND COLUMN_NAME = 'addist'");
        if (!$query->num_rows)
        {
            $this->dbQuery("ALTER TABLE `" . DB_PREFIX . "setting` ADD `addist` TINYINT( 1 ) NOT NULL AFTER `setting_id`");
        }
    }
    
	public function save($group, $key, $value, $store_id = null)
    {
        if ($this->validate())
        {
            $text = is_array($value) ? base64_encode(serialize($value)) : $value;
            
            $store_id = is_null($store_id) ? STORE_ID : $store_id;
            
    		$this->data[$group.'_'.$key] = $value;
            
            $query_check = $this->dbQuery("SELECT * FROM " . DB_PREFIX . "setting WHERE `".$this->column."` = '" . $group . "' AND `key` = '" . $group.'_'.$key . "' AND store_id = '" . (int)$store_id . "'");
            
            if ($query_check->num_rows)
            {
                $this->dbQuery("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $text . "', `serialized` = '0', `addist` = '1' WHERE `".$this->column."` = '" . $this->db->escape($group) . "' AND `key` = '" . $group.'_'.$key . "' AND store_id = '" . (int)$store_id . "'");
            }
            else
            {
                $this->dbQuery("INSERT IGNORE INTO " . DB_PREFIX . "setting SET `".$this->column."` = '" . $group . "', `key` = '" . $group.'_'.$key . "', `value` = '".$text."', store_id = '" . (int)$store_id . "', `serialized` = '0', `addist` = '1'");
            }
        }
	}
    
    public function saveGroup($group, $data)
    {
        foreach($data as $key=>$value)
        {
            $this->save($group,$key,$value);
        }
    }
    
	public function delete($group, $key)
    {
        if ($this->validate())
        {
            $key = $group.'_'.$key;
    		$this->dbQuery("DELETE FROM `" . DB_PREFIX . "setting` WHERE `".$this->column."` = '" . $group . "' AND `key` = '$key'");
            unset($this->data[$group.'_'.$key]);
        }
	}
    
	public function remove($group)
    {
        if ($this->validate())
        {
            $this->dbQuery("DELETE FROM " . DB_PREFIX . "setting WHERE `".$this->column."` = '" . $group . "'");
        }
	}
    
	public function has($key)
    {
		return isset($this->data[$key]);
	}
    
    public function filter($group)
    {
        $result = array();
        foreach($this->data as $key=>$value)
        {
            if (substr($key,0,strlen($group)+1) == $group.'_')
            {
                $result[substr($key,strlen($group)+1,strlen($key))] = $value;
            }
        }
        return $result;
    }
    
	public function load($filename)
    {
		$file = DIR_CONFIG . $filename . '.php';

		if (file_exists($file))
        {
			$_ = array();

			if (class_exists('VQMod'))
            {
                require(VQMod::modCheck($file));
            }
            else
            {
                require($file);
            }

			$this->data = array_merge($this->data, $_);
		}
        else
        {
			trigger_error('Error: Could not load config ' . $filename . '!');
			exit();
		}
	}
    
    public function isBase64($string)
    {
        // Check if there are valid base64 characters
        if (!preg_match('/^[a-zA-Z0-9\/\r\n+]*={0,2}$/', $string)) return false;
    
        // Decode the string in strict mode and check the results
        $decoded = base64_decode($string, true);
        if(false === $decoded) return false;
    
        // Encode the string again
        if(base64_encode($decoded) != $string) return false;
    
        return true;
    }
    
    function isSerialized($value, &$result = null)
    {
        // Bit of a give away this one
        if (!is_string($value)) {
            return false;
        }
        // Serialized false, return true. unserialize() returns false on an
        // invalid string or it could return false if the string is serialized
        // false, eliminate that possibility.
        if ($value === 'b:0;') {
            $result = false;
            return true;
        }
        $length = strlen($value);
        $end    = '';
        if ($value)
        {
            switch ($value[0]) {
                case 's':
                    if ($value[$length - 2] !== '"') {
                        return false;
                    }
                case 'b':
                case 'i':
                case 'd':
                    // This looks odd but it is quicker than isset()ing
                    $end .= ';';
                case 'a':
                case 'O':
                    $end .= '}';
                    if (empty($value[1]) || $value[1] !== ':') {
                        return false;
                    }
                    switch ($value[2]) {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                            break;
                        default:
                            return false;
                    }
                case 'N':
                    $end .= ';';
                    if ($value[$length - 1] !== $end[0]) {
                        return false;
                    }
                    break;
                default:
                    return false;
            }
            if (($result = @unserialize($value)) === false) {
                $result = null;
                return false;
            }
            return true;
        }
        else
        {
            return false;
        }
    }
    
	public function validate()
    {
        if (!empty($this->request->get['route']))
        {
            if (IS_ADMIN)
            {
                if (version_compare(VERSION,'2.2','>='))
                {
                    $this->registry->set('user', new Cart\User($this->registry));
                }
                
                if ($this->registry->get('user') && $this->registry->get('user')->isLogged())
                {
                    $route = implode('/',array_slice(explode('/',$this->request->get['route']),0,2));
                    if ($this->user->hasPermission('modify', $route) || $route == 'common/home' || $route == 'common/dashboard')
                    {
                        return true;
                    }
                    else
                    {
                        if ($this->request->server['REQUEST_METHOD'] == 'POST')
                        {
                            addMessage('error',$this->language->get('error_permission'));
                        }
                        return false;
                    }
                }
                else
                {
                    if ($this->request->server['REQUEST_METHOD'] == 'POST')
                    {
                        addMessage('error',$this->language->get('error_permission'));
                    }
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
        else
        {
            return true;
        }
	}
}
?>