<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
class agooCache extends Controller
{
	protected $Cache;
	private $dir_cache = DIR_CACHE;
	public $expire = 36000;
	public $max_files = 300;
	private $first = false;
	private $maxfile_length = 9000000;

	public function construct_cache()
	{
		$asc_construct_cache = $this->registry->get('asc_construct_cache');
		if (!isset($asc_construct_cache[$this->dir_cache])) {
			$files = glob($this->dir_cache . 'cache.*');
			if ($files) {
				clearstatcache();
				$count_files = count($files);
				foreach ($files as $file) {
					$time      = substr(strrchr($file, '.'), 1);
					$file_size = @filesize($file);
					if (@file_exists($file)) {
						if ($time < time() || $count_files > $this->max_files || $file_size < 0 || $file_size > $this->maxfile_length) {
							@unlink($file);
						}
					}
				}
			}
			$asc_construct_cache[$this->dir_cache] = true;
			$this->registry->set('asc_construct_cache', $asc_construct_cache);
		}
	}
	public function __call($name, array $params)
	{
		$modules = false;
		if (isset($params[0])) {
			$pieces_array = explode(".", $params[0]);
		} else {
			$pieces_array = Array();
			$params[0]    = '';
		}
		if (!$this->config->get("blog_work") || $pieces_array[0] != 'blog') {
			$this_cache  = $this->registry->get('cache');
			$this->Cache = $this->registry->get('cache_old');
			$modules     = call_user_func_array(array(
				$this->Cache,
				$name
			), $params);
			unset($this->Cache);
			$this->registry->set('cache', $this_cache);
		} else {
			if (isset($params[0])) {
				if (isset($pieces_array[1])) {
					$pieces = $pieces_array[1];
				} else {
					$pieces = '';
				}
			} else {
				$pieces = '';
			}
			if (isset($pieces_array[0]) && $pieces_array[0] == 'blog') {
				$file_cache = DIR_CACHE . 'seocms/index.html';
				if (!@file_exists($file_cache)) {
					$this->mkdirs($file_cache, true);
				}
				$file_cache = DIR_CACHE . 'seocms/' . $pieces . '/index.html';
				if (!@file_exists($file_cache)) {
					$this->mkdirs($file_cache, true);
				}
				if ($pieces == '') {
					$end_cache_devider = '';
				} else {
					$end_cache_devider = '/';
				}
				$this->dir_cache = DIR_CACHE . 'seocms/' . $pieces . $end_cache_devider;
				if ($name == 'set') {
					$modules = $this->set_agoo($params[0], $params[1]);
				}
				if ($name == 'get') {
					$modules = $this->get_agoo($params[0]);
				}
				if ($name == 'delete') {
					$modules = $this->delete_agoo($params[0]);
				}
			} else {
				$this->dir_cache = DIR_CACHE;
			}
		}
		return $modules;
	}
	public function set_agoo($key, $value)
	{
		$this->delete_agoo($key);
		$file   = $this->dir_cache . 'cache.' . preg_replace('/[^A-Z0-9\._-]/i', '', $key) . '.' . (time() + $this->expire);
		$handle = @fopen($file, 'w');
		@flock($handle, LOCK_EX);
		if (is_array($value)) {
			$exceptionizer = new PHP_Exceptionizer(E_ALL);
		    try {
		    		$value = json_encode($value);
		    	}  catch (E_WARNING $e) {
		    		return false;
		    	}
		}
		@fwrite($handle, $value);
		@fflush($handle);
		@flock($handle, LOCK_UN);
		@fclose($handle);
		$this->construct_cache();
		return true;
	}
	public function get_agoo($key)
	{
		$files = glob($this->dir_cache . 'cache.' . preg_replace('/[^A-Z0-9\._-]/i', '', $key) . '.*');
		if ($files) {
			$exceptionizer = new PHP_Exceptionizer(E_ALL);
               /*
			    try {
			    		$this->data['...'] = @unserialize($...);
			    	}  catch (E_WARNING $e) {
			    		$this->data['...'] = ...;
			    	}
			   */
			clearstatcache();
			if (@file_exists($files[0])) {
				$handle = @fopen($files[0], 'r');
				@flock($handle, LOCK_SH);
				$file_size = @filesize($files[0]);
				if ($file_size > 0) {
					if ($file_size > $this->maxfile_length) {
						@unlink($files[0]);
						$datas = '[]';
					} else {
						$datas = @fread($handle, $file_size);
					}
				} else {
					$datas = '[]';
				}
				@flock($handle, LOCK_UN);
				@fclose($handle);
				$datas_array = json_decode($datas, true);
			} else {
				$datas_array = $datas = array();
			}
			if (is_array($datas_array)) {
				$datas = $datas_array;
			} else {
				try {
					$datas_array = @unserialize($datas);
				}
				catch (E_WARNING $e) {
				}
			}
			unset($exceptionizer);
			if (is_array($datas_array)) {
				return $datas_array;
			} else {
				return $datas;
			}
		}
		return false;
	}
	public function delete_agoo($key)
	{
		$files = glob($this->dir_cache . 'cache.' . preg_replace('/[^A-Z0-9\._-]/i', '', $key) . '.*');
		if ($key == 'blog') {
			$files = $this->DirFilesR($this->dir_cache);
		}
		if ($files) {
			clearstatcache();
			foreach ($files as $file) {
				if (@file_exists($file)) {
					@unlink($file);
				}
			}
			return true;
		}
		return false;
	}
	private function DirFilesR($dir)
	{
		$handle   = opendir($dir);
		$files    = Array();
		$subfiles = Array();
		while (false !== ($file = readdir($handle))) {
			if ($file != "." && $file != "..") {
				if (is_dir($dir . "/" . $file)) {
					$subfiles = $this->DirFilesR($dir . "/" . $file);
					$files    = array_merge($files, $subfiles);
				} else {
					$flie_name = $dir . "/" . $file;
					$flie_name = str_replace("//", "/", $flie_name);
					$files[]   = $flie_name;
				}
			}
		}
		closedir($handle);
		return $files;
	}
	private function mkdirs($pathname, $index = FALSE, $mode = 0777)
	{
		$flag_save = false;
		$path_file = dirname($pathname);
		$name_file = basename($pathname);
		if (is_dir(dirname($path_file))) {
		} else {
			$this->mkdirs(dirname($pathname), $index, $mode);
		}
		if (is_dir($path_file)) {
			if (@file_exists($path_file)) {
				$flag_save = true;
			}
		} else {
			@umask(0);
			if (@!file_exists($path_file)) {
				@mkdir($path_file, $mode);
			}
			if (@file_exists($path_file)) {
				$flag_save = true;
			}
			if ($index) {
				$accessFile = $path_file . "/" . $name_file;
				@touch($accessFile);
				$accessWrite = @fopen($accessFile, "wb");
				@fwrite($accessWrite, 'Access denied');
				@fclose($accessWrite);
				if (@file_exists($accessFile)) {
					$flag_save = true;
				} else {
					$flag_save = false;
				}
			}
		}
		return $flag_save;
	}
	public function cont($cont)
	{
		$file  = DIR_APPLICATION . 'controller/' . $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
		} else {
			trigger_error('Error: Could not load controller ' . $cont . '!');
			exit();
		}
	}
}
