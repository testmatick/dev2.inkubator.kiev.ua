<?php

/************copyright**************/
/*                                 */
/*   site:  http://microdata.pro   */
/*   email: info@microdata.pro     */
/*                                 */
/************copyright**************/

class MicrodataPro {

private $data = array();

	public function opencart_version($d){
		
		$opencart_version = explode(".", VERSION);
		
		return $opencart_version[$d];
	}
	
	public function clear_array($data_array) {
		if(isset($data_array) and is_array($data_array)){
			foreach($data_array as $key => $value){
				$data_array[$key] = $this->clear($value);
			}
		}
		
		return $data_array; 
	}
	
	public function clear($text = '', $decode = false) {
		if(is_string($text)){
			if($decode) $text = html_entity_decode($text, ENT_QUOTES, 'UTF-8');
			$text = str_replace("><","> <",$text);
			if($text) $text = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', ' ', strip_tags((string)$text));
			$text = str_replace(array(PHP_EOL, "\r\n", "\r", "\n", "\t", '  ', '    ', '    ', '&nbsp;'), ' ', $text);
			$text = str_replace('"', "'", $text);
			$text = str_replace("'", " ", $text);
			$text = str_replace("\\", " ", $text);
			$text = str_replace('&quot;', " ", $text);
			$text = str_replace("\"", " ", $text);			
		}
		return $text;
	}

	public function request() {
		$url = "https://microdata.pro/index.php?route=sale/sale/request";	
		$prepare_data = array(
			'site' 	    => $_SERVER['HTTP_HOST'],
		);		
		if($curl = curl_init()) { //POST CURL
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_HEADER, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $prepare_data);
			$request = curl_exec($curl);
			curl_close($curl);
			return $request;
		}
	}	
	
	public function getKey() {
		$url = "https://microdata.pro/index.php?route=sale/sale/getKey";	
		$prepare_data = array(
			'site' 	    => $_SERVER['HTTP_HOST'],
		);		
		if($curl = curl_init()) { //POST CURL
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_HEADER, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $prepare_data);
			$register_number = curl_exec($curl);
			curl_close($curl);
			return $register_number;
		}
	}	

	public function module_info($key){
			$information = array(
			'main_host'	=> $_SERVER['HTTP_HOST'],
			'engine' 	=> VERSION,
			'version' 	=> '4.0',
			'module' 	=> 'MicrodataPro',
			'sys_key'	=> '327450',
			'sys_keyf'  => '7473'
		);

		return $information[$key];
	}

	
														/*        _			*/
														/*       /X \		*/
														/*     _------_		*/
														/*    /        \	*/
														/*   |          |	*/																																			 public function license($key){
														/*   |          |	*/																																				$license = false;
														/*   |     __  __)	*/																																				$a=0;if(isset($key) && !empty($key)){ $key_array = explode("327450", base64_decode(strrev(substr($key, 0, -7))));if($key_array[0] == base64_encode($this->module_info('main_host')) && $key_array[1] == base64_encode($this->module_info('sys_key').$this->module_info('sys_keyf')+100)){$a= 1;}}
														/*   |    /  \/  \	*/																																				return $license=str_replace($key,$this->module_info('main_host'),$a);
														/*  /\/\ (o   )o  )	*/																																			 }
														/*  /c    \__/ --.	*/
														/*  \_   _-------'	*/
														/*   |  /         \	*/
														/*   | | '\_______)	*/
														/*   |  \_____)		*/
														/*   |_____ |		*/
														/*  |_____/\/\		*/
														/*  /        \  	*/
														/*info@microdata.pro*/
}
?>