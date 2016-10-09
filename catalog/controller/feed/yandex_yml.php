<?php
/**
* Yandex.YML data feed for OpenCart (ocStore) (1.5.x - 2.x)
*
* Main class to create YML
*
* @author Yesvik http://opencartforum.ru/user/6876-yesvik/
* @author Alexander Toporkov <toporchillo@gmail.com>
* @copyright (C) 2013- Alexander Toporkov
* @license GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
*
* Official version of this module: http://opencartforum.ru/files/file/670-eksport-v-iandeksmarket/
*/

/**
 * Класс YML экспорта
 * YML (Yandex Market Language) - стандарт, разработанный "Яндексом"
 * для принятия и публикации информации в базе данных Яндекс.Маркет
 * YML основан на стандарте XML (Extensible Markup Language)
 * описание формата YML http://partner.market.yandex.ru/legal/tt/
 */
//Версия модуля
define ('YANDEX_YML_VERSION', '1.8.3');

class ControllerFeedYandexYml extends Controller {
//++++ Config section ++++
	//До какой длины укорачивать описание товара. 0 - не укорачивать
	protected $SHORTER_DESCRIPTION = 0;
	//Отдавать ли Яндексу оригиналы фотографий товаров. Если false - то всегда масштабировать
	protected $ORIGINAL_IMAGES = true;
	//Сколько товаров брать из базы за один запрос 
	//(чем больше товаров, тем больше потребление памяти, чем товаров меньше - тем больше нагрузка на SQL)
	protected $CHUNK_SIZE = 8000;
	//1-секундная задержка между генерацией блоков для снижения нагрузки на SQL
	protected $SLEEP = 1000;
//---- Config section ----
	protected $CONFIG_PREFIX = 'yandex_yml_';

	protected $shop = array();
	protected $currencies = array();
	protected $categories = array();
	protected $delivery_option = false;
	protected $offers = array();
	//protected $from_charset = 'utf-8';
	protected $eol = "\n";
	protected $yml = '';
	
	protected $color_options;
	protected $size_options;
	protected $size_units;
	protected $optioned_name;

	public function index() {
		if ($this->config->get($this->CONFIG_PREFIX.'status')) {
			header('Content-Type: application/xml');
			$this->outYml();
		}
	}
	
	public function saveToFile($filename) {
		$fp = fopen($filename[0], 'w');
		if ($this->config->get($this->CONFIG_PREFIX.'status')) {
			$this->putYml($fp);
		}
		fclose($fp);
	}

	/**
	* Формирования YML до первого тэга <offer>
	*/
	protected function getYmlHeader() {
		$this->load->model('export/yandex_yml');
		$this->model_export_yandex_yml->is_main_category = $this->config->get($this->CONFIG_PREFIX.'ocstore');
		$this->load->model('localisation/currency');
		$this->load->model('tool/image');
		
		// Магазин
		$this->setShop('name', $this->config->get('config_name'));
		//$this->setShop('name', $this->config->get($this->CONFIG_PREFIX.'shopname'));
		$this->setShop('company', $this->config->get('config_owner'));
		//$this->setShop('company', $this->config->get($this->CONFIG_PREFIX.'company'));
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$HTTP_SERVER = $this->config->get('config_ssl');
		} else {
			$HTTP_SERVER = $this->config->get('config_url');
		}    
		$this->setShop('url', $HTTP_SERVER);
		$this->setShop('phone', $this->config->get('config_telephone'));
		$this->setShop('platform', 'Yandex.YML for OpenCart (ocStore)');
		$this->setShop('version', YANDEX_YML_VERSION);

		// Валюты
		$offers_currency = $this->config->get($this->CONFIG_PREFIX.'currency');
		if (!$this->currency->has($offers_currency)) exit();

		$decimal_place = intval($this->currency->getDecimalPlace($offers_currency));

		$shop_currency = $this->config->get('config_currency');

		$this->setCurrency($offers_currency, 1);

		$currencies = $this->model_localisation_currency->getCurrencies();

		$supported_currencies = array('RUR', 'RUB', 'USD', 'EUR', 'BYR', 'KZT', 'UAH');

		$currencies = array_intersect_key($currencies, array_flip($supported_currencies));

		foreach ($currencies as $currency) {
			if ($currency['code'] != $offers_currency && $currency['status'] == 1) {
				$this->setCurrency($currency['code'], number_format(1/$this->currency->convert($currency['value'], $offers_currency, $shop_currency), 4, '.', ''));
			}
		}
		//Тип данных vendor.model или default
		$datamodel = $this->config->get($this->CONFIG_PREFIX.'datamodel');
		
		// Категории
		$allowed_categories = $this->config->get($this->CONFIG_PREFIX.'categories');
		$allowed_manufacturers = $this->config->get($this->CONFIG_PREFIX.'manufacturers');
		$blacklist_type = $this->config->get($this->CONFIG_PREFIX.'blacklist_type');
		$blacklist = $this->config->get($this->CONFIG_PREFIX.'blacklist');
		$product_rel = $this->config->get($this->CONFIG_PREFIX.'product_rel');
		$product_accessory = $this->config->get($this->CONFIG_PREFIX.'product_accessory');
		$out_of_stock_ids = explode(',', $this->config->get($this->CONFIG_PREFIX.'out_of_stock')); // id статуса товара "Нет на складе"
		$this->categories = $this->model_export_yandex_yml->getCategoryTree($allowed_categories, $blacklist_type, $blacklist, $out_of_stock_ids, $allowed_manufacturers);
		
		$local_delivery_cost = $this->config->get($this->CONFIG_PREFIX.'delivery_cost');
		if ($local_delivery_cost!='') {
			$days = $this->config->get($this->CONFIG_PREFIX.'delivery_days');
			$this->delivery_option = array('cost'=>$this->getDeliveryPrice($local_delivery_cost, 0),
				'days'=>$this->config->get($this->CONFIG_PREFIX.'delivery_days'));
			$delivery_before = $this->config->get($this->CONFIG_PREFIX.'delivery_before');
			if ($delivery_before) {
				/*
				if (strpos($delivery_before, ':') == false) {
					$delivery_before.= ':00';
				}
				*/
				$this->delivery_option['before'] = $delivery_before;
			}
		}
		
		//+++ Вывод +++
		$yml  = '<?xml version="1.0" encoding="UTF-8"?>' . $this->eol;
		$yml .= '<!DOCTYPE yml_catalog SYSTEM "shops.dtd">' . $this->eol;
		$yml .= '<yml_catalog date="' . date('Y-m-d H:i') . '">' . $this->eol;
		$yml .= '<shop>' . $this->eol;

		// информация о магазине
		$yml .= $this->array2Tag($this->shop);

		// валюты
		$yml .= '<currencies>' . $this->eol;
		foreach ($this->currencies as $currency) {
			$yml .= $this->getElement($currency, 'currency');
		}
		$yml .= '</currencies>' . $this->eol;

		// категории
		$yml .= '<categories>' . $this->eol;
		foreach ($this->categories as $category) {
			$category_name = $this->prepareField($category['name']);
			unset($category['name'], $category['export']);
			$yml .= $this->getElement($category, 'category', $category_name);
		}
		$yml .= '</categories>' . $this->eol;
		if (is_array($this->delivery_option)) {
			$yml .= $this->array2Delivery($this->delivery_option).$this->eol;
		}

		// товарные предложения
		$yml .= '<offers>' . $this->eol;
		return $yml;
		//--- Вывод ---
	}
	
	protected function getYmlChunk($page = 0) {
		$this->offers = array();
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$HTTP_SERVER = $this->config->get('config_ssl');
		} else {
			$HTTP_SERVER = $this->config->get('config_url');
		}                             
		if (!defined('HTTP_IMAGE')) {
			define('HTTP_IMAGE', $HTTP_SERVER . 'image/');
		}
		$this->load->model('export/yandex_yml');
		$this->model_export_yandex_yml->is_main_category = $this->config->get($this->CONFIG_PREFIX.'ocstore');
		$this->load->model('localisation/currency');
		$this->load->model('tool/image');

		//Тип данных vendor.model или default
		$datamodel = $this->config->get($this->CONFIG_PREFIX.'datamodel');
		
		// Товарные предложения
		$in_stock_ids = explode(',', $this->config->get($this->CONFIG_PREFIX.'in_stock')); // id статуса товара "В наличии"
		$out_of_stock_ids = explode(',', $this->config->get($this->CONFIG_PREFIX.'out_of_stock')); // id статуса товара "Нет на складе"

		$pickup = ($this->config->get($this->CONFIG_PREFIX.'pickup') ? 'true' : false);
		
		$local_delivery_cost = $this->config->get($this->CONFIG_PREFIX.'delivery_cost');
			
		$store = ($this->config->get($this->CONFIG_PREFIX.'store') ? 'true' : false);
		$unavailable = $this->config->get($this->CONFIG_PREFIX.'unavailable');

		$allowed_categories = $this->config->get($this->CONFIG_PREFIX.'categories');
		$allowed_manufacturers = $this->config->get($this->CONFIG_PREFIX.'manufacturers');
		$blacklist_type = $this->config->get($this->CONFIG_PREFIX.'blacklist_type');
		$blacklist = $this->config->get($this->CONFIG_PREFIX.'blacklist');
		$product_rel = $this->config->get($this->CONFIG_PREFIX.'product_rel');
		$product_accessory = $this->config->get($this->CONFIG_PREFIX.'product_accessory');
		$skip = $page*$this->CHUNK_SIZE;
		$limit = $this->CHUNK_SIZE;
		
		$offers_currency = $this->config->get($this->CONFIG_PREFIX.'currency');
		$shop_currency = $this->config->get('config_currency');
		$decimal_place = intval($this->currency->getDecimalPlace($offers_currency));

		$numpictures = $this->config->get($this->CONFIG_PREFIX.'numpictures');
		if ($numpictures > 1) {
			//++++ Дополнительные изображения товара ++++
			$product_images = $this->model_export_yandex_yml->getProductImages($numpictures - 1);
			//---- Дополнительные изображения товара ----
		}
		$all_attributes = $this->model_export_yandex_yml->getAttributes($this->config->get($this->CONFIG_PREFIX.'attributes'));
		$this->optioned_name = $this->config->get($this->CONFIG_PREFIX.'optioned_name');
		
		$yandex_yml_categ_mapping = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_mapping'));
		$yandex_yml_categ_delivery_cost = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_delivery_cost'));
		$yandex_yml_categ_sales_notes = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_sales_notes'));
		$yandex_yml_categ_cpa = unserialize($this->config->get($this->CONFIG_PREFIX.'categ_cpa'));
		
		$this->color_options = explode(',', $this->config->get($this->CONFIG_PREFIX.'color_options'));
		$this->size_options = explode(',', $this->config->get($this->CONFIG_PREFIX.'size_options'));
		$this->size_units = $this->config->get($this->CONFIG_PREFIX.'size_units') ? unserialize($this->config->get($this->CONFIG_PREFIX.'size_units')) : array();
		
		$is_out = true;
		$yml = '';
		
		$customer_group = $this->config->get($this->CONFIG_PREFIX.'groupprice');
		if (!$customer_group) {
			$customer_group = $this->config->get('config_customer_group_id');
		}
		
		foreach ($this->model_export_yandex_yml->getProduct($allowed_categories, $blacklist_type, $blacklist, $out_of_stock_ids, $allowed_manufacturers, $customer_group, $product_rel || $product_accessory, $skip, $limit) as $product) {
			$is_out = false;
			$data = array();

			// Атрибуты товарного предложения
			$data['id'] = $product['product_id'];
			$data['type'] = $product['manufacturer'] ? $datamodel : 'default'; //'vendor.model' или 'default';
			$data['available'] = (!$unavailable && ($product['quantity'] > 0 || in_array($product['stock_status_id'], $in_stock_ids)) ? 'true' : false);
//				$data['bid'] = 10;
//				$data['cbid'] = 15;

			// Параметры товарного предложения
			$data['url'] = $this->url->link('product/product', 'path=' . $this->getPath($product['category_id']) . '&product_id=' . $product['product_id']);
			if ($this->config->get($this->CONFIG_PREFIX.'utm_label')) {
				$data['url'].= (strpos($data['url'], '?') === false ? '?' : '&').str_replace('{product_id}', $product['product_id'], $this->config->get($this->CONFIG_PREFIX.'utm_label'));
			}
			if ($product['special'] && $product['special'] < $product['price']) {
				$data['price'] = $product['special'];
				if ($this->config->get($this->CONFIG_PREFIX.'oldprice')) {
					$data['oldprice'] = $product['price'];
				}
			}
			else {
				$data['price'] = $product['price'];
			}
			$data['currencyId'] = $offers_currency;
			$data['categoryId'] = $product['category_id'];
			if (isset($yandex_yml_categ_mapping[$product['category_id']]) && $yandex_yml_categ_mapping[$product['category_id']]) {
				$data['market_category'] = $yandex_yml_categ_mapping[$product['category_id']];
			}
			
			if ($product['shipping']) {
				$data['delivery'] = 'true';
				if (is_array($this->delivery_option) && isset($this->delivery_option['cost'])) {
					$total = number_format($this->currency->convert($this->tax->calculate($data['price'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
					if (isset($yandex_yml_categ_delivery_cost[$product['category_id']]) && $yandex_yml_categ_delivery_cost[$product['category_id']]!='') {
						$delivery_cost = $this->getDeliveryPrice($yandex_yml_categ_delivery_cost[$product['category_id']], $total);
					}
					else {
						$delivery_cost = $this->getDeliveryPrice($local_delivery_cost, $total);
					}
					if ($delivery_cost != $this->delivery_option['cost']) {
						$data['delivery-option'] = $this->delivery_option;
						$data['delivery-option']['cost'] = $delivery_cost;
					}
				}
			}
			else {
				$data['delivery'] = false;
			}
			
			if (isset($yandex_yml_categ_cpa) && count($yandex_yml_categ_cpa) > 0) {
				if (isset($yandex_yml_categ_cpa[$product['category_id']]) && $yandex_yml_categ_cpa[$product['category_id']]!='') {
					$data['cpa'] = 1;
				}
				else {
					$data['cpa'] = '0';
				}
			}
			
			if ($pickup)
				$data['pickup'] = $pickup;
			if ($store)
				$data['store'] = $store;

			$data['name'] = $this->config->get($this->CONFIG_PREFIX.'name_field') ? $product[$this->config->get($this->CONFIG_PREFIX.'name_field')] : $product['name'];
			$data['vendor'] = $product['manufacturer'];
			$data['model'] = $this->config->get($this->CONFIG_PREFIX.'model_field') ? $product[$this->config->get($this->CONFIG_PREFIX.'model_field')] : $product['name'];
			$data['vendorCode'] = $this->config->get($this->CONFIG_PREFIX.'vendorcode_field') ? $product[$this->config->get($this->CONFIG_PREFIX.'vendorcode_field')] : $product['model'];
			if ($data['type'] == 'default' && $data['vendorCode'] == '') {
				unset($data['vendorCode']);
			}
			if ($this->config->get($this->CONFIG_PREFIX.'typeprefix_field')) {
				$data['typePrefix'] = $product[$this->config->get($this->CONFIG_PREFIX.'typeprefix_field')];
			}
			if ($this->config->get($this->CONFIG_PREFIX.'barcode_field')) {
				$data['barcode'] = $product[$this->config->get($this->CONFIG_PREFIX.'barcode_field')];
			}
			
			$sales_notes = $this->config->get($this->CONFIG_PREFIX.'sales_notes');
			if ($sales_notes) {
				$data['sales_notes'] = $sales_notes;
			}
			if (isset($yandex_yml_categ_sales_notes[$product['category_id']]) && $yandex_yml_categ_sales_notes[$product['category_id']]!='') {
				$data['sales_notes'] = (isset($data['sales_notes']) ? $data['sales_notes'].', ' : '') . $yandex_yml_categ_sales_notes[$product['category_id']];
			}
//				$data['manufacturer_warranty'] = 'true';
			if ($numpictures > 0) {
				if ($product['image']) {
					$data['picture'] = array($this->prepareImage($product['image']));
				}
				//++++ Дополнительные изображения товара ++++
				if (isset($product_images[$product['product_id']])) {
					if (!isset($data['picture']) || !is_array($data['picture'])) {
						$data['picture'] = array();
					}
					foreach ($product_images[$product['product_id']] as $image) {
						$data['picture'][] = $this->prepareImage($image);
					}
				}
				//---- Дополнительные изображения товара ----
			}

			if ($product_rel && $product['rel']) {
				$data['rec'] = $product['rel'];
			}
			if ($product_accessory && $product['rel']) {
				$data['accessory'] = explode(',', $product['rel']);
			}

			/*++++ Атрибуты товара ++++
			// пример структуры массива для вывода параметров
			$data['param'] = array(
				array(
					'name'=>'Wi-Fi',
					'value'=>'есть'
				), array(
					'name'=>'Размер экрана',
					'unit'=>'дюйм',
					'value'=>'20'
				), array(
					'name'=>'Вес',
					'unit'=>'кг',
					'value'=>'4.6'
				)
			);
			*/
			if ($this->config->get($this->CONFIG_PREFIX.'all_adult')) {
				$data['adult'] = 'true';
			}
			if ($this->config->get($this->CONFIG_PREFIX.'all_manufacturer_warranty')) {
				$data['manufacturer_warranty'] = 'true';
			}
			
			$data['param'] = array();
			$attributes = $this->model_export_yandex_yml->getProductAttributes($product['product_id']);
			$attr_text = array();
			if (count($attributes) > 0) {
				foreach ($attributes as $attr) {
					if ($attr['attribute_id'] == $this->config->get($this->CONFIG_PREFIX.'adult')) {
						$data['adult'] = 'true';
					}
					elseif ($attr['attribute_id'] == $this->config->get($this->CONFIG_PREFIX.'manufacturer_warranty')) {
						$data['manufacturer_warranty'] = 'true';
					}
					elseif ($attr['attribute_id'] == $this->config->get($this->CONFIG_PREFIX.'country_of_origin')) {
						$data['country_of_origin'] = $attr['text'];
					}
					elseif (isset($all_attributes[$attr['attribute_id']])) {
						$data['param'][] = $this->detectUnits(array(
							'name' => $all_attributes[$attr['attribute_id']],
							'value' => $attr['text']));
					}
					$attr_text[] = $attr['name'].': '.$attr['text'];
				}
			}
			if ($product['weight'] > 0) {
				$data['param'][] = array('id'=>'WEIGHT', 'name'=>'Вес', 'value'=>$product['weight'], 'unit'=>$product['weight_unit']);
			}
			//---- Атрибуты товара ----
			
			//++++ Описание товара ++++
			$description_field = $this->config->get($this->CONFIG_PREFIX.'description_field');
			if ($description_field) {
				if ($description_field == 'attr_vs_description') {
					$product_description = implode($attr_text,"<br/>\n");
				}
				else {
					$product_description = $product[$description_field];
				}
				
				if ($this->SHORTER_DESCRIPTION > 0) {
					$product_description = strip_tags($product_description);
					$product_description = mb_substr($product_description, 0, $this->SHORTER_DESCRIPTION, 'UTF-8');
				}
				
				
				if ($this->config->get($this->CONFIG_PREFIX.'export_tags')) {
					$data['description'] = '<![CDATA['.$product_description.']]>';
				}
				else {
					$data['description'] = strip_tags($product_description);
				}
			}
			//---- Описание товара ----
			
			if ($product['minimum'] > 1) {
				if (isset($data['sales_notes']))
					$data['sales_notes'].= ', минимальное кол-во заказа: '.$product['minimum'];
				else
					$data['sales_notes'] = 'Минимальное кол-во заказа: '.$product['minimum'];
			}

			if (!$this->setOptionedOffer($data, $product, $shop_currency, $offers_currency, $decimal_place)) {
				$data['price'] = number_format($this->currency->convert($this->tax->calculate($data['price'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
				if (isset($data['oldprice']))
					$data['oldprice'] = number_format($this->currency->convert($this->tax->calculate($data['oldprice'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
				if ($data['price'] > 0) {
					$this->setOffer($data);
				}
			}
			unset($data);
			unset($product);
			//++++ Вывод ++++
			foreach ($this->offers as $idx=>$offer) {
				$this->offers[$idx] = null;
				$tags = $this->array2Tag($offer['data']);
				unset($offer['data']);
				if (isset($offer['delivery-option'])) {
					$tags .= $this->array2Delivery($offer['delivery-option']);
					unset($offer['delivery-option']);
				}
				if (isset($offer['param'])) {
					$tags .= $this->array2Param($offer['param']);
					unset($offer['param']);
				}
				if (isset($offer['accessory'])) {
					$tags .= $this->array2Accessory($offer['accessory']);
					unset($offer['accessory']);
				}
				$yml.= $this->getElement($offer, 'offer', $tags);
			}
			//---- Вывод ----
			$this->offers = array();
		}
		if ($is_out) {
			return 'OUT';
		}
		return $yml;
	}

	/**
	 * Создает много элементов offer товарных предложений для разных опций цвет и размер товара
	 */
	protected function setOptionedOffer($data, $product, $shop_currency, $offers_currency, $decimal_place) {
		$offers_array = array();
		
		$coptions = array();
		if ($this->color_options)
			$coptions = $this->model_export_yandex_yml->getProductOptions($this->color_options, $product['product_id']);
		$soptions = array();
		if ($this->size_options)
			$soptions = $this->model_export_yandex_yml->getProductOptions($this->size_options, $product['product_id']);
		if (!count($coptions) && !count($soptions)) {
			return false;
		}
		$numpictures = $this->config->get($this->CONFIG_PREFIX.'numpictures');
		
		//++++ Цвета x Размеры для магазинов одежды ++++
		if (count($coptions)) {
			foreach ($coptions as $option) {
				//Если в опциях кол-во равно 0, то в OpenCart эта опция не показывается совсем, хотя она может быть просто не быть в наличии
				if ($option['subtract'] && ($option['quantity'] <= 0)) {
					continue;
				}
				$data_arr = $data;
				if (($this->optioned_name == 'short') || ($this->optioned_name == 'long')) {
					$data_arr['name'].= ', '.$option['option_name'].' '.$option['name'];
					if (isset($data_arr['model']))
						$data_arr['model'].= ', '.$option['option_name'].' '.$option['name'];
				}
				//++++ Если у опции есть картинка - ставим ее первой ++++
				if ($numpictures>0 && $option['image']) {
					$pictures = array($this->prepareImage($option['image']));
					if (isset($data_arr['picture']))
						$data_arr['picture'] = array_merge($pictures, $data_arr['picture']);
					else
						$data_arr['picture'] = $pictures;
				}
				//---- Если у опции есть картинка - ставим ее первой ----
				$data_arr['param'][] = array('name'=>$option['option_name'], 'value'=>$option['name']);
				$data_arr['group_id'] = $product['product_id'];
				$data_arr['option_value_id'] = $option['option_value_id'];
				$data_arr['available'] = $data_arr['available'] && ($option['quantity'] > 0);
				if ($option['price_prefix'] == '+') {
					$data_arr['price']+= $option['price'];
					if (isset($data_arr['oldprice']))
						$data_arr['oldprice']+= $option['price'];
				}
				elseif ($option['price_prefix'] == '-') {
					$data_arr['price']-= $option['price'];
					if (isset($data_arr['oldprice']))
						$data_arr['oldprice']-= $option['price'];
				}
				elseif ($option['price_prefix'] == '=') {
					$data_arr['price'] = $option['price'];
				}
				$data_arr = $this->setOptionedWeight($data_arr, $option);
				$data_arr['url'].= '#'.$option['product_option_value_id'];
				$offers_array[] = $data_arr;
			}
		}
		else {
			$data['group_id'] = $product['product_id'];
			$offers_array[] = $data;
		}
		// Размеры
		foreach ($offers_array as $i=>$data) {
			if (count($soptions)) {
				foreach ($soptions as $option) {
					//Если в опциях кол-во равно 0, то в OpenCart эта опция не показывается совсем, хотя она может быть просто не быть в наличии
					if ($option['subtract'] && ($option['quantity'] <= 0)) {
						continue;
					}
					$size_option_name = $option['option_name'];
					$size_option_unit = $this->size_units[$option['option_id']];
					$data_arr = $data;
					if ($this->optioned_name == 'long') {
						$data_arr['name'].= ', '.$size_option_name.' '.$option['name'];
						if (isset($data_arr['model']))
							$data_arr['model'].= ', '.$size_option_name.' '.$option['name'];
					}
					//++++ Если у опции есть картинка - ставим ее первой ++++
					if ($numpictures>0 && $option['image']) {
						$pictures = array($this->prepareImage($option['image']));
						if (isset($data_arr['picture']))
							$data_arr['picture'] = array_merge($pictures, $data_arr['picture']);
						else
							$data_arr['picture'] = $pictures;
					}
					//---- Если у опции есть картинка - ставим ее первой ----
					$size_param = array('name'=>$size_option_name, 'value'=>$option['name']);
					if ($size_option_unit) {
						$size_param['unit'] = $size_option_unit;
					} 
					$data_arr['param'][] = $size_param;
					$data_arr['available'] = $data_arr['available'] && ($option['quantity'] > 0);
					
					if ($option['price_prefix'] == '+') {
						$data_arr['price']+= $option['price'];
						if (isset($data_arr['oldprice']))
							$data_arr['oldprice']+= $option['price'];
					}
					elseif ($option['price_prefix'] == '-') {
						$data_arr['price']-= $option['price'];
						if (isset($data_arr['oldprice']))
							$data_arr['oldprice']-= $option['price'];
					}
					elseif ($option['price_prefix'] == '=') {
						$data_arr['price'] = $option['price'];
					}

					$data_arr = $this->setOptionedWeight($data_arr, $option);
					if (count($coptions)) {
						$data_arr['url'].= '-'.$option['product_option_value_id'];
					}
					else {
						$data_arr['url'].= '#'.$option['product_option_value_id'];
					}
					$offers_array[] = $data_arr;

					$data_arr['id'] = $data['group_id']
						.(isset($data['option_value_id']) ? str_pad($data['option_value_id'], 6, '0', STR_PAD_LEFT) : '')
						.(isset($option['option_value_id']) ? str_pad($option['option_value_id'], 6, '0', STR_PAD_LEFT) : '');
					$data_arr['price'] = number_format($this->currency->convert($this->tax->calculate($data_arr['price'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
					if (isset($data_arr['oldprice']))
						$data_arr['oldprice'] = number_format($this->currency->convert($this->tax->calculate($data_arr['oldprice'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
					$this->setOffer($data_arr);
				}
			}
			else {
				$data['id'] = $data['group_id']
					.(isset($data['option_value_id']) ? str_pad($data['option_value_id'], 6, '0', STR_PAD_LEFT) : '');
				$data['price'] = number_format($this->currency->convert($this->tax->calculate($data['price'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
				if (isset($data['oldprice']))
					$data['oldprice'] = number_format($this->currency->convert($this->tax->calculate($data['oldprice'], $product['tax_class_id'], $this->config->get('config_tax')), $shop_currency, $offers_currency), $decimal_place, '.', '');
				if ($data['price'] > 0) {
					$this->setOffer($data);
				}
			}
		}
		return true;
		//---- Цвета x Размеры для магазинов одежды ----
	}
	
	/**
	* Меняет аттрибут веса товара в зависимости от опции
	*/
	protected function setOptionedWeight($product, $option) {
		if (isset($option['weight']) && isset($option['weight_prefix'])) {
			foreach ($product['param'] as $i=>$param) {
				if (isset($param['id']) && ($param['id'] == 'WEIGHT')) {
					if ($option['weight_prefix'] == '+')
						$product['param'][$i]['value']+= $option['weight'];
					elseif ($option['weight_prefix'] == '-')
						$product['param'][$i]['value']-= $option['weight'];
					break;
				}
			}
		}
		return $product;
	}
	
	/**
	 * Подготовка данных о фотографии
	 */
	protected function prepareImage($image) {
		if ((strpos($image, 'http://') === 0) || (strpos($image, 'https://') === 0)) {
			return $image;
		}
		if (is_file(DIR_IMAGE . $image)) {
			list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $image);
			if ($width_orig < 600 || $height_orig < 600 || !$this->ORIGINAL_IMAGES) {
				return $this->model_tool_image->resize($image, 600, 600);
			} else {
				$parts = explode('/', $image);
				$new_url = implode('/', array_map('rawurlencode', $parts));			
				return HTTP_IMAGE . $new_url;
			}
		}
		return false;
	}
	
	/**
	 * Методы формирования YML
	 */

	/**
	 * Формирование массива для элемента shop описывающего магазин
	 *
	 * @param string $name - Название элемента
	 * @param string $value - Значение элемента
	 */
	protected function setShop($name, $value) {
		$allowed = array('name', 'company', 'url', 'phone', 'platform', 'version', 'agency', 'email');
		if (in_array($name, $allowed)) {
			$this->shop[$name] = $this->prepareField($value);
		}
	}

	/**
	 * Валюты
	 *
	 * @param string $id - код валюты (RUR, RUB, USD, BYR, KZT, EUR, UAH)
	 * @param float|string $rate - курс этой валюты к валюте, взятой за единицу.
	 *	Параметр rate может иметь так же следующие значения:
	 *		CBRF - курс по Центральному банку РФ.
	 *		NBU - курс по Национальному банку Украины.
	 *		NBK - курс по Национальному банку Казахстана.
	 *		СВ - курс по банку той страны, к которой относится интернет-магазин
	 * 		по Своему региону, указанному в Партнерском интерфейсе Яндекс.Маркета.
	 * @param float $plus - используется только в случае rate = CBRF, NBU, NBK или СВ
	 *		и означает на сколько увеличить курс в процентах от курса выбранного банка
	 * @return bool
	 */
	protected function setCurrency($id, $rate = 'CBRF', $plus = 0) {
		$allow_id = array('RUR', 'RUB', 'USD', 'BYR', 'KZT', 'EUR', 'UAH');
		if (!in_array($id, $allow_id)) {
			return false;
		}
		$allow_rate = array('CBRF', 'NBU', 'NBK', 'CB');
		if (in_array($rate, $allow_rate)) {
			$plus = str_replace(',', '.', $plus);
			if (is_numeric($plus) && $plus > 0) {
				$this->currencies[] = array(
					'id'=>$this->prepareField(strtoupper($id)),
					'rate'=>$rate,
					'plus'=>(float)$plus
				);
			} else {
				$this->currencies[] = array(
					'id'=>$this->prepareField(strtoupper($id)),
					'rate'=>$rate
				);
			}
		} else {
			$rate = str_replace(',', '.', $rate);
			if (!(is_numeric($rate) && $rate > 0)) {
				return false;
			}
			$this->currencies[] = array(
				'id'=>$this->prepareField(strtoupper($id)),
				'rate'=>(float)$rate
			);
		}

		return true;
	}

	/**
	 * Товарные предложения
	 *
	 * @param array $data - массив параметров товарного предложения
	 */
	protected function setOffer($data) {
		if ($this->config->get($this->CONFIG_PREFIX.'changeprice')) {
			$data['price']*= floatval($this->config->get($this->CONFIG_PREFIX.'changeprice'));
		}
		if ($data['price'] <= floatval($this->config->get($this->CONFIG_PREFIX.'pricefrom'))) {
            return;
        }
		if ($this->config->get($this->CONFIG_PREFIX.'priceto') != '' && $data['price'] >= floatval($this->config->get($this->CONFIG_PREFIX.'priceto'))) {
            return;
        }

		$offer = array();

		$attributes = array('id', 'type', 'available', 'bid', 'cbid', 'param', 'delivery-option', 'group_id', 'accessory');
		$attributes = array_intersect_key($data, array_flip($attributes));

		foreach ($attributes as $key => $value) {
			switch ($key)
			{
				case 'id':
					$offer['id'] = $value;
					break;
				case 'bid':
				case 'cbid':
				case 'group_id':
					$value = (int)$value;
					if ($value > 0) {
						$offer[$key] = $value;
					}
					break;

				case 'type':
					if (in_array($value, array('vendor.model', 'book', 'audiobook', 'artist.title', 'tour', 'ticket', 'event-ticket'))) {
						$offer['type'] = $value;
					}
					break;

				case 'available':
					$offer['available'] = ($value ? 'true' : 'false');
					break;

				case 'param':
					if (is_array($value)) {
						$offer['param'] = $value;
					}
					break;

				case 'accessory':
					if (is_array($value)) {
						$offer['accessory'] = $value;
					}
					break;
					
				case 'delivery-option':
					if (is_array($value)) {
						$offer['delivery-option'] = $value;
					}
					break;

				default:
					break;
			}
		}

		$type = isset($offer['type']) ? $offer['type'] : '';

		$allowed_tags = array('url'=>0, 'buyurl'=>0, 'price'=>1, 'oldprice'=>0, 'wprice'=>0, 'currencyId'=>1, 'xCategory'=>0, 'categoryId'=>1, 'market_category'=>0, 'picture'=>0, 'store'=>0, 'pickup'=>0, 'delivery'=>0, 'deliveryIncluded'=>0, 'local_delivery_cost'=>0, 'orderingTime'=>0, 'cpa'=>0);

		switch ($type) {
			case 'vendor.model':
				$allowed_tags = array_merge($allowed_tags, array('typePrefix'=>0, 'vendor'=>1, 'vendorCode'=>0, 'model'=>1, 'provider'=>0, 'tarifplan'=>0));
				break;

			case 'book':
				$allowed_tags = array_merge($allowed_tags, array('author'=>0, 'name'=>1, 'publisher'=>0, 'series'=>0, 'year'=>0, 'ISBN'=>0, 'volume'=>0, 'part'=>0, 'language'=>0, 'binding'=>0, 'page_extent'=>0, 'table_of_contents'=>0));
				break;

			case 'audiobook':
				$allowed_tags = array_merge($allowed_tags, array('author'=>0, 'name'=>1, 'publisher'=>0, 'series'=>0, 'year'=>0, 'ISBN'=>0, 'volume'=>0, 'part'=>0, 'language'=>0, 'table_of_contents'=>0, 'performed_by'=>0, 'performance_type'=>0, 'storage'=>0, 'format'=>0, 'recording_length'=>0));
				break;

			case 'artist.title':
				$allowed_tags = array_merge($allowed_tags, array('artist'=>0, 'title'=>1, 'year'=>0, 'media'=>0, 'starring'=>0, 'director'=>0, 'originalName'=>0, 'country'=>0));
				break;

			case 'tour':
				$allowed_tags = array_merge($allowed_tags, array('worldRegion'=>0, 'country'=>0, 'region'=>0, 'days'=>1, 'dataTour'=>0, 'name'=>1, 'hotel_stars'=>0, 'room'=>0, 'meal'=>0, 'included'=>1, 'transport'=>1, 'price_min'=>0, 'price_max'=>0, 'options'=>0));
				break;

			case 'event-ticket':
				$allowed_tags = array_merge($allowed_tags, array('name'=>1, 'place'=>1, 'hall'=>0, 'hall_part'=>0, 'date'=>1, 'is_premiere'=>0, 'is_kids'=>0));
				break;

			default:
				$allowed_tags = array_merge($allowed_tags, array('name'=>1, 'vendor'=>0, 'vendorCode'=>0));
				break;
		}

		$allowed_tags = array_merge($allowed_tags, array('aliases'=>0, 'additional'=>0, 'description'=>0, 'sales_notes'=>0, 'promo'=>0, 'manufacturer_warranty'=>0, 'country_of_origin'=>0, 'downloadable'=>0, 'adult'=>0, 'barcode'=>0, 'rec'=>0));

		$required_tags = array_filter($allowed_tags);

		if (sizeof(array_intersect_key($data, $required_tags)) != sizeof($required_tags)) {
			return;
		}

		$data = array_intersect_key($data, $allowed_tags);

		$allowed_tags = array_intersect_key($allowed_tags, $data);

		// Стандарт XML учитывает порядок следования элементов,
		// поэтому важно соблюдать его в соответствии с порядком описанным в DTD
		$offer['data'] = array();
		foreach ($allowed_tags as $key => $value) {
			if (!isset($data[$key]))
				continue;
			if (is_array($data[$key])) {
				foreach ($data[$key] as $i => $val) {
					$offer['data'][$key][$i] = $this->prepareField($val);
				}
			}
			else {
				$offer['data'][$key] = $this->prepareField($data[$key]);
			}
		}

		$this->offers[] = $offer;
	}

	/**
	 * Формирование YML файла
	 *
	 * @return string
	 */
	protected function outYml() {
		if (isset($this->request->get['language'])) {
			$query = $this->db->query("SELECT language_id FROM `" . DB_PREFIX . "language` WHERE code='".$this->db->escape($this->request->get['language'])."'"); 
			if ($query->num_rows) {
				$this->session->data['language'] = $this->request->get['language'];
				$this->config->set('config_language_id', $query->row['language_id']);
				$this->config->set('config_language', $this->request->get['language']);
			}
		}
		echo $this->getYmlHeader();
		unset($this->categories);
		$page = 0;
		$products_yml = $this->getYmlChunk($page);
		while ($products_yml !== 'OUT') {
			echo $products_yml;
			unset($products_yml);
			usleep($this->SLEEP);
			$page++;
			$products_yml = $this->getYmlChunk($page);
		}
		echo '</offers>' . $this->eol
			.'</shop>'
			.'</yml_catalog>';
		return true;
	}

	/**
	 * Вывод YML в файл
	 * @param $fp дескриптор файла
	 */
	protected function putYml($fp) {
		fwrite($fp, $this->getYmlHeader());
		unset($this->categories);
		$page = 0;
		$products_yml = $this->getYmlChunk($page);
		while ($products_yml !== 'OUT') {
			fwrite($fp, $products_yml);
			unset($products_yml);
			usleep($this->SLEEP);
			$page++;
			$products_yml = $this->getYmlChunk($page);
		}
		fwrite($fp, '</offers>' . $this->eol
			.'</shop>'
			.'</yml_catalog>');
		return true;
	}


	/**
	 * Фрмирование элемента
	 *
	 * @param array $attributes
	 * @param string $element_name
	 * @param string $element_value
	 * @return string
	 */
	protected function getElement($attributes, $element_name, $element_value = '') {
		$retval = '<' . $element_name . ' ';
		foreach ($attributes as $key => $value) {
			$retval .= $key . '="' . $value . '" ';
		}
		$retval .= $element_value ? '>' . $this->eol . $element_value . '</' . $element_name . '>' : '/>';
		$retval .= $this->eol;

		return $retval;
	}

	/**
	 * Преобразование массива в теги
	 *
	 * @param array $tags
	 * @return string
	 */
	protected function array2Tag($tags) {
		$retval = '';
		foreach ($tags as $key => $value) {
			if (is_array($value)) {
				foreach ($value as $val) {
					$retval .= '<' . $key . '>' . $val . '</' . $key . '>' . $this->eol;
				}
			}
			else {
				$retval .= '<' . $key . '>' . $value . '</' . $key . '>' . $this->eol;
			}
		}

		return $retval;
	}

	/**
	 * Преобразование массива в теги параметров
	 *
	 * @param array $params
	 * @return string
	 */
	protected function array2Param($params) {
		$retval = '';
		foreach ($params as $param) {
			$retval .= '<param name="' . $this->prepareField($param['name']);
			if (isset($param['unit'])) {
				$retval .= '" unit="' . $this->prepareField($param['unit']);
			}
			$retval .= '">' . $this->prepareField($param['value']) . '</param>' . $this->eol;
		}

		return $retval;
	}

	/**
	 * Преобразование массива в теги accessory
	 *
	 * @param array $params
	 * @return string
	 */
	protected function array2Accessory($rels) {
		$retval = '';
		foreach ($rels as $rel) {
			$retval .= '<accessory offer="' . $rel . '"/>';
		}

		return $retval;
	}

	/**
	 * Преобразование массива в тег delivery-option
	 *
	 * @param array $params
	 * @return string
	 */
	protected function array2Delivery($delivery_option) {
		$retval = '';
		if (is_array($delivery_option)) {
			$retval = '<delivery-options><option cost="'.$delivery_option['cost'].'" days="'.$delivery_option['days'].'"'
				.(isset($delivery_option['before']) ? ' order-before="'.$delivery_option['before'].'"' : '').' /></delivery-options>';
		}
		return $retval;
	}
	
	/**
	 * Подготовка текстового поля в соответствии с требованиями Яндекса
	 * Запрещаем любые html-тэги, стандарт XML не допускает использования в текстовых данных
	 * непечатаемых символов с ASCII-кодами в диапазоне значений от 0 до 31 (за исключением
	 * символов с кодами 9, 10, 13 - табуляция, перевод строки, возврат каретки). Также этот
	 * стандарт требует обязательной замены некоторых символов на их символьные примитивы.
	 * @param string $text
	 * @return string
	 */
	protected function prepareField($field) {
		$field = htmlspecialchars_decode($field);
		if (strpos($field, '<![CDATA[') === 0) {
			return trim($field);
		}
		$field = strip_tags($field);
		$from = array('"', '&', '>', '<', '\'', '&nbsp;');
		$to = array('&quot;', '&amp;', '&gt;', '&lt;', '&apos;', ' ');
		$field = str_replace($from, $to, $field);
		/**
		if ($this->from_charset != 'windows-1251') {
			$field = iconv($this->from_charset, 'windows-1251//IGNORE', $field);
		}
		**/
		$field = preg_replace('#[\x00-\x08\x0B-\x0C\x0E-\x1F]+#is', ' ', $field);

		return trim($field);
	}

	protected function getPath($category_id, $current_path = '') {
		if (isset($this->categories[$category_id])) {
			if (!$current_path) {
				$new_path = $this->categories[$category_id]['id'];
			} else {
				$new_path = $this->categories[$category_id]['id'] . '_' . $current_path;
			}	

			if (isset($this->categories[$category_id]['parentId'])) {
				return $this->getPath($this->categories[$category_id]['parentId'], $new_path);
			} else {
				return $new_path;
			}
		}
	}

	/**
	 * Определение единиц измерения по содержимому
	 *
	 * @param array $attr array('name'=>'Вес', 'value'=>'100кг')
	 * @return array array('name'=>'Вес', 'unit'=>'кг', 'value'=>'100')
	 */
	protected function detectUnits($attr) {
		//$matches = array();
		$attr['name'] = trim(strip_tags($attr['name']));
		$attr['value'] = trim(strip_tags($attr['value']));
		if (preg_match('/\(([^\)]+)\)$/mi', $attr['name'], $matches)) {
			$attr['name'] = trim(str_replace('('.$matches[1].')', '', $attr['name']));
			$attr['unit'] = trim($matches[1]);
		}
		return $attr;
	}
	
	/**
	* Опредение цены доставки в зависимости от цены товара
	*
	* @param str $price - цена в виде: 0:300|5000:0 (стоимость товара от 0, доставка 300; стоимость товара от 5000, доставка 0)
	* @param float $total - цена товара
	*/
	protected function getDeliveryPrice($price, $total=0) {
		if (strpos($price, ':') === false)
			return floatval($price);
		$vars = explode('|', $price);
		$ret = floatval($price);
		foreach ($vars as $var) {
			$tp = explode(':', $var);
			if (floatval($total) < floatval($tp[0])) break;
			$ret = floatval($tp[1]);
		}
		return $ret;
	}
}
