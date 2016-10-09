<?php 
class ControllerModuleNewfastordercart extends Controller { 
	private $error = array();
 
	public function index() {
			$this->language->load('module/newfastorder');									
			$data['lang_id'] = $this->config->get('config_language_id');									
			$data['text_min_price'] = $this->language->get('text_min_price');		
			$data['button_send'] = $this->language->get('button_send');
			$data['icon_send_fastorder'] = $this->config->get('config_icon_send_fastorder');
			$data['background_button_send_fastorder'] = $this->config->get('config_background_button_send_fastorder');
			$data['background_button_open_form_send_order_hover'] = $this->config->get('config_background_button_open_form_send_order_hover');
			$data['background_button_send_fastorder_hover'] = $this->config->get('config_background_button_send_fastorder_hover');
			$data['background_button_open_form_send_order'] = $this->config->get('config_background_button_open_form_send_order');
			$data['icon_open_form_send_order'] = $this->config->get('config_icon_open_form_send_order');
			$data['icon_open_form_send_order_size'] = $this->config->get('config_icon_open_form_send_order_size');
			$data['color_button_open_form_send_order'] = $this->config->get('config_color_button_open_form_send_order');
			$data['config_any_text_at_the_top'] = $this->config->get('config_any_text_at_the_top');
			$data['config_text_open_form_send_order'] = $this->config->get('config_text_open_form_send_order');
			$data['any_text_at_the_bottom_color'] = $this->config->get('config_any_text_at_the_bottom_color');
			$data['img_fastorder'] = $this->config->get('config_img_fastorder');
			$data['mask_phone_number'] = $this->config->get('config_mask_phone_number');
			$data['placeholder_phone_number'] = $this->config->get('config_placeholder_phone_number');
			$data['config_text_before_button_send'] = $this->config->get('config_text_before_button_send');
			$data['config_any_text_at_the_bottom'] = $this->config->get('config_any_text_at_the_bottom');
			$data['continue_shopping'] = $this->language->get('continue_shopping');
			$data['config_title_popup_quickorder'] 				= $this->config->get('config_title_popup_quickorder');
			$data['config_fields_firstname_requared'] 			= $this->config->get('config_fields_firstname_requared');		
			$data['config_fields_phone_requared'] 				= $this->config->get('config_fields_phone_requared');		
			$data['config_fields_email_requared'] 				= $this->config->get('config_fields_email_requared');		
			$data['config_fields_comment_requared'] 			= $this->config->get('config_fields_comment_requared');		
			$data['config_placeholder_fields_firstname'] 		= $this->config->get('config_placeholder_fields_firstname');		
			$data['config_placeholder_fields_phone'] 			= $this->config->get('config_placeholder_fields_phone');		
			$data['config_placeholder_fields_email'] 			= $this->config->get('config_placeholder_fields_email');		
			$data['config_placeholder_fields_comment'] 			= $this->config->get('config_placeholder_fields_comment');
			
			$data['on_off_fields_firstname'] 					= $this->config->get('config_on_off_fields_firstname');		
			$data['on_off_fields_phone'] 						= $this->config->get('config_on_off_fields_phone');		
			$data['on_off_fields_comment'] 						= $this->config->get('config_on_off_fields_comment');		
			$data['on_off_fields_email'] 						= $this->config->get('config_on_off_fields_email');			
							
		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['action'])) {
		
			if ($this->validate()) {
				$data = array();
				if (isset($this->request->post['name_fastorder'])) {
  		    		$data['name_fastorder'] = $this->request->post['name_fastorder'];
				} else {
      				$data['name_fastorder'] = '';
    			}
				if (isset($this->request->post['phone'])) {
      				$data['phone'] = $this->request->post['phone'];
				} else {
      				$data['phone'] = '';
    			}
				if (isset($this->request->post['comment_buyer'])) {
      				$data['comment_buyer'] = $this->request->post['comment_buyer'];
				} else {
      				$data['comment_buyer'] = '';
    			}
				if (isset($this->request->post['email_buyer'])) {
      				$data['email_buyer'] = $this->request->post['email_buyer'];
				} else {
      				$data['email_buyer'] = '';
    			}
				if (isset($this->request->post['url_site'])) {
      				$data['url_site'] = $this->request->post['url_site'];
				} else {
      				$data['url_site'] = '';
    			}
				if (isset($this->request->post['price_shipping_value'])) {
                    $data['price_shipping_value'] = $this->request->post['price_shipping_value'];
                } else {
                    $data['price_shipping_value'] = '';
                }
				if (isset($this->request->post['price_shipping_text'])) {
                    $data['price_shipping_text'] = $this->request->post['price_shipping_text'];
                } else {
                    $data['price_shipping_text'] = '';
                }
				if (isset($this->request->post['shipping_title'])) {
                    $data['shipping_title'] = $this->request->post['shipping_title'];
                } else {
                    $data['shipping_title'] = '';
                }
				if (isset($this->request->post['shipping_code_quickorder'])) {
                    $data['shipping_code_quickorder'] = $this->request->post['shipping_code_quickorder'];
                } else {
                    $data['shipping_code_quickorder'] = '';
                }
				if (isset($this->request->post['tax_class_id_total'])) {
                    $data['tax_class_id_total'] = $this->request->post['tax_class_id_total'];
                } else {
                    $data['tax_class_id_total'] = '';
                }
				if (isset($this->request->post['payment_title'])) {
                    $data['payment_title'] = $this->request->post['payment_title'];
                } else {
                    $data['payment_title'] = '';
                }
				if (isset($this->request->post['payment_code_quickorder'])) {
                    $data['payment_code_quickorder'] = $this->request->post['payment_code_quickorder'];
                } else {
                    $data['payment_code_quickorder'] = '';
                }
				$order_data = array();

			$order_data['totals'] = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();

			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($order_data['totals'], $total, $taxes);
				}
			}

			$sort_order = array();

			foreach ($order_data['totals'] as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $order_data['totals']);

			
			$this->load->model('tool/image');
			foreach ($this->cart->getProducts() as $product) {
				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}
				$option_data = array();

				foreach ($product['option'] as $option) {
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],
						'name'                    => $option['name'],
						'value'                   => $option['value'],
						'type'                    => $option['type']
					);
				}

				$products_data[] = array(
					'product_id' => $product['product_id'],
					'thumb'     => $image,
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				);
			}
				$data['products'] = $products_data;
				$data['total'] = $order_data;
				/*************************/	
				$data['ip_store'] = $this->request->server['REMOTE_ADDR'];
				$data['currency_value'] = $this->currency->getValue();
				$data['currency_code'] = $this->currency->getCode();
				$data['currency_id'] = $this->currency->getId();
				$data['language_id'] = $this->config->get('config_language_id');
				$data['store_id'] = $this->config->get('config_store_id');
				$data['store_name'] = $this->config->get('config_name');
				$data['customer_id'] = 0;
				$data['customer_group_id'] = 1;
				$data['config_tax'] = $this->config->get('config_tax');
				$data['store_url'] = HTTP_SERVER;
				$data['ip'] = $this->request->server['REMOTE_ADDR'];
				if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
					$data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
				} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
					$data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
				} else {
					$data['forwarded_ip'] = '';
				}

				if (isset($this->request->server['HTTP_USER_AGENT'])) {
					$data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
				} else {
					$data['user_agent'] = '';
				}

				if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
					$data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
				} else {
					$data['accept_language'] = '';
				}
				if (isset($this->request->post['total_order'])) {
                    $data['total_order'] = $this->request->post['total_order'];
                } else {
                    $data['total_order'] = '';
                }
					
				
				$this->load->model('module/newfastordercart');
				$results = $this->model_module_newfastordercart->addOrder($data);
				$config_on_off_send_buyer_mail = $this->config->get('config_on_off_send_buyer_mail');
				if($config_on_off_send_buyer_mail =='1'){
					if($data['email_buyer'] !='') { 
					$this->sendMailBuyer($data);	
					}
				}
				$config_on_off_send_me_mail = $this->config->get('config_on_off_send_me_mail');
				if($config_on_off_send_me_mail =='1'){
					$this->sendMailMe($data);	
				}	
				if($this->config->get('config_send_sms_on_off_fastorder') == '1'){	
					$this->sendSms($data);	
				}				
				$lang_id = $this->config->get('config_language_id');
				$config_complete_quickorder = $this->config->get('config_complete_quickorder');				
				$ok = $config_complete_quickorder[$lang_id]['config_complete_quickorder'];								
				if($ok !=''){
					$json['success'] = $ok;
				} else {
					$json['success'] = $this->language->get('ok');
				} 			
				$this->cache->delete('product.bestseller');
				$this->cart->clear();
											
			}else{
				$json['error'] = $this->error;				
			}			
			return $this->response->setOutput(json_encode($json));
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newfastordercart.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/newfastordercart.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/module/newfastordercart.tpl', $data));
		}			
  	}

  	private function validate() {
   		$this->language->load('module/newfastorder');
			$config_fields_firstname_requared = $this->config->get('config_fields_firstname_requared');
			$config_on_off_fields_firstname = $this->config->get('config_on_off_fields_firstname');
			if(($config_fields_firstname_requared =='1') && $config_on_off_fields_firstname =='1'){
				if ((strlen(utf8_decode($this->request->post['name_fastorder'])) < 1) || (strlen(utf8_decode($this->request->post['name_fastorder'])) > 32)) {
					$this->error['name_fastorder'] = $this->language->get('mister');
				}
			}
			$config_fields_phone_requared = $this->config->get('config_fields_phone_requared');
			$config_on_off_fields_phone = $this->config->get('config_on_off_fields_phone');
			if(($config_fields_phone_requared =='1') && $config_on_off_fields_phone =='1'){
				if ((strlen(utf8_decode($this->request->post['phone'])) < 3) || (strlen(utf8_decode($this->request->post['phone'])) > 32)) {
					$this->error['phone'] = $this->language->get('error_phone');
				}
			}
			$config_fields_comment_requared = $this->config->get('config_fields_comment_requared');
			$config_on_off_fields_comment = $this->config->get('config_on_off_fields_comment');
			if(($config_fields_comment_requared =='1') && $config_on_off_fields_comment == '1'){
				if ((strlen(utf8_decode($this->request->post['comment_buyer'])) < 1) || (strlen(utf8_decode($this->request->post['comment_buyer'])) > 400)) {
					$this->error['comment_buyer'] = $this->language->get('comment_buyer_error');
				}
			}
			$config_fields_email_requared = $this->config->get('config_fields_email_requared');
			$config_on_off_fields_email = $this->config->get('config_on_off_fields_email');
			if(($config_fields_email_requared =='1') && $config_on_off_fields_email == '1'){
				if(!preg_match("/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/", $this->request->post['email_buyer'])){
						$this->error['email_error'] =  $this->language->get('email_buyer_error');
				}
			}
			
			$this->load->model('catalog/product');
			
			
    		if (!$this->error) {
     	 		return true;
    		} else {
     			return false;
   	 	}
	}
	private function getCustomFields($order_info, $varabliesd) {
			$instros = explode('~', $varabliesd);
			$instroz = "";
			foreach ($instros as $instro) {
				if ($instro == 'totals' || isset($order_info[$instro]) ){
					if ($instro == 'totals'){
					    $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], true);
					}
					if(isset($order_info[$instro])){
						$instro_other = $order_info[$instro];
					}
				}
				else {
				    $instro_other = nl2br(htmlspecialchars_decode($instro));
				}
				    $instroz .=  $instro_other;
			}
			return $instroz;
	}
  	private function sendMailBuyer($data) {

		$this->language->load('module/newfastorder');		
		$data['text_photo'] = $this->language->get('text_photo');
		$data['text_product'] = $this->language->get('text_new_product');
		$data['text_model'] = $this->language->get('text_new_model');
		$data['text_quantity'] = $this->language->get('text_new_quantity');
		$data['text_price'] = $this->language->get('text_new_price');
		$data['text_total'] = $this->language->get('text_new_total');
		foreach ($data['total']['totals'] as $result) {
			$data['totals'][] = array(
				'title' => $result['title'],
				'text'  => $this->currency->format($result['value']),
			);
		}

		$text = '';		
		$subject_buyer = $this->getCustomFields($data, $this->config->get('quickorder_subject' . $data['language_id']));
		if ((strlen(utf8_decode($subject_buyer)) > 5)){
			$subject = $subject_buyer;
		} else {
			$subject = $this->language->get('subject');
		}
		$html = $this->getCustomFields($data, $this->config->get('quickorder_description' . $data['language_id'])). "\n";
		$config_buyer_html_products = $this->config->get('config_buyer_html_products');
		if($config_buyer_html_products =='1'){
		$html .= $this->load->view('default/template/mail/quickorder.tpl', $data);
		}
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email_buyer']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($data['store_name'], ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml(html_entity_decode($html, ENT_QUOTES, 'UTF-8'));
		$mail->setText($text);
		$mail->send();		
	}
	private function sendMailMe($data) {
		$this->language->load('module/newfastorder');		
		$data['text_photo'] = $this->language->get('text_photo');
		$data['text_product'] = $this->language->get('text_new_product');
		$data['text_model'] = $this->language->get('text_new_model');
		$data['text_quantity'] = $this->language->get('text_new_quantity');
		$data['text_price'] = $this->language->get('text_new_price');
		$data['text_total'] = $this->language->get('text_new_total');
		foreach ($data['total']['totals'] as $result) {
			$data['totals'][] = array(
				'title' => $result['title'],
				'text'  => $this->currency->format($result['value']),
			);
		}

		$text = '';		
		$subject_me = $this->getCustomFields($data, $this->config->get('quickorder_subject_me' . $data['language_id']));
		if ((strlen(utf8_decode($subject_me)) > 5)){
			$subject = $subject_me;
		} else {
			$subject = $this->language->get('subject');
		}
		$html = $this->getCustomFields($data, $this->config->get('quickorder_description_me' . $data['language_id'])). "\n";
		$on_off_html_product_me = $this->config->get('config_me_html_products');
		if($on_off_html_product_me =='1'){
		$html .= $this->load->view('default/template/mail/quickorder.tpl', $data);
		}
		
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($this->config->get('config_you_email_quickorder'));
		$mail->setFrom($this->config->get('config_you_email_quickorder'));
		$mail->setSender(html_entity_decode($data['store_name'], ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml(html_entity_decode($html, ENT_QUOTES, 'UTF-8'));
		$mail->setText($text);
		$mail->send();		
	}
	private function sendSms($data) {
		if($this->config->get('config_send_sms_on_off_fastorder') == '1'){
		include_once('smsc_api_fastorder.php');
		$tel = $this->config->get('config_phone_number_send_sms_fastorder');
		$text_sms 	= $this->language->get('text_1');
		list($sms_id, $sms_cnt, $cost, $balance) = send_sms($tel,$text_sms."\n" .$data['name_fastorder']."\n" .$data['phone'], 0, 0, 0, 0, false, "maxsms=3");
		}
	}		
}
?>
