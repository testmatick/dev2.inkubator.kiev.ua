<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// http://opencartadmin.com © 2011-2016 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
class agooDocument extends Controller
{
	protected $Document;
	private $og_image;
	private $og_description;
	private $og_title;
	private $og_type;
	private $og_url;
	private $sc_robots;
	private $sc_hreflang = array();
	private $removelinks = array();

	public function __call($name, array $params)
	{
		$modules = false;
		if ($name == 'setOgImage') {
		} else {
			$this_document  = $this->registry->get('document');
			$this->Document = $this->registry->get('document_old');
			$modules        = call_user_func_array(array(
				$this->Document,
				$name
			), $params);
			unset($this->Document);
			$this->registry->set('document', $this_document);
		}
		if (strtolower($name) == 'getlinks' && is_array($modules) && !empty($modules)) {
			foreach ($modules as $links => $linksarray) {
				if (isset($this->removelinks) && !empty($this->removelinks) && isset($this->removelinks[$links])) {
					unset($modules[$links]);
				}
			}
		}
		return $modules;
	}
	public function setSCRobots($str)
	{
		$this->sc_robots = $str;
	}
	public function getSCRobots()
	{
		return $this->sc_robots;
	}
	public function setHreflang($hreflang = array())
	{
		$this->sc_hreflang = $hreflang;
	}
	public function getHreflang()
	{
		return $this->sc_hreflang;
	}
	public function setOgImage($image)
	{
		$this->og_image = $image;
	}
	public function getOgImage()
	{
		return $this->og_image;
	}
	public function setOgType($og_type)
	{
		$this->og_type = $og_type;
	}
	public function getOgType()
	{
		return $this->og_type;
	}
	public function setOgTitle($title)
	{
		$this->og_title = $title;
	}
	public function getOgTitle()
	{
		return $this->og_title;
	}
	public function setOgDescription($description)
	{
		$this->og_description = $description;
	}
	public function getOgDescription()
	{
		return $this->og_description;
	}
	public function setOgUrl($url)
	{
		$this->og_url = $url;
	}
	public function getOgUrl()
	{
		return $this->og_url;
	}
	public function removeLink($href)
	{
		$this->removelinks[$href] = $href;
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

