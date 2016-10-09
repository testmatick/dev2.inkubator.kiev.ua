<?php 
class ControllerModuleNewfastorder extends Controller { 


	private $error = array();
 
	public function index() {
		$this->language->load('module/newfastorder');	
			if (isset($this->request->get['product_id'])) {
				$product_id = (int)$this->request->get['product_id'];
				$data['product_id'] = (int)$this->request->get['product_id'];
			} else {
				$product_id = 0;
				$data['product_id'] = 0;
			}			
			$this->language->load('product/product');
			$data['lang_id'] = $this->config->get('config_language_id');
			$data['buying'] = $this->language->get('buying');
			$data['byprice'] = $this->language->get('byprice');
			$data['quantity_buy'] = $this->language->get('quantity_buy');
			
			$data['text_option'] = $this->language->get('text_option');
			$data['text_select'] = $this->language->get('text_select');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['comment_buyer'] = $this->language->get('comment_buyer');
			$data['text_min_price'] = $this->language->get('text_min_price');
			$data['text_column_name'] = $this->language->get('text_column_name');
			$data['text_column_price'] = $this->language->get('text_column_price');
			$data['text_column_quantity'] = $this->language->get('text_column_quantity');
			$data['min_price_fastorder_view'] = $this->currency->format($this->config->get('config_min_price_fastorder'));
			$data['min_price_fastorder'] = $this->config->get('config_min_price_fastorder');
			$data['email_buyer'] = $this->language->get('email_buyer');
			$data['namew'] = $this->language->get('namew');
			$data['phonew'] = $this->language->get('phonew');
			$data['button_send'] = $this->language->get('button_send');
			$data['continue_shopping'] = $this->language->get('continue_shopping');
			$data['title_fastorder'] = $this->language->get('title_fastorder');
			$data['text_quick_order_enter_name_phone'] = $this->language->get('text_quick_order_enter_name_phone');
			$data['text_you_order'] = $this->language->get('text_you_order');
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
			$data['config_title_popup_quickorder'] = $this->config->get('config_title_popup_quickorder');
			
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
			
			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			$product_info = $this->model_catalog_product->getProduct($product_id);
			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], 228, 228);
			} else {
				$data['popup'] = $this->model_tool_image->resize('no_image.jpg', 228, 228);
			}
			
			$data['images'] = array();
			
			$results = $this->model_catalog_product->getProductImages($product_id);
			
			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], 228, 228),
					'thumb' => $this->model_tool_image->resize($result['image'], 74, 74)
				);
			}
			
			$data['points'] = $product_info['points'];
			$data['heading_title'] = $product_info['name'];
			
			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 228, 228);
				$data['small'] = $this->model_tool_image->resize($product_info['image'], 74, 74);
			} else {
				$data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 228, 228);
			}		
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$data['price'] = false;
			}
						
			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$data['special'] = false;
			}
			
			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$data['tax'] = false;
			}
			
			$discounts = $this->model_catalog_product->getProductDiscounts($product_id);
			
			$data['discounts'] = array(); 
			
			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
		  $data['price_value'] = $product_info['price'];
          $data['special_value'] = $product_info['special'];
          $data['tax_value'] = (float)$product_info['special'] ? $product_info['special'] : $product_info['price'];
          
          $var_currency = array();
          $var_currency['value'] = $this->currency->getValue();
          $var_currency['symbol_left'] = $this->currency->getSymbolLeft();
          $var_currency['symbol_right'] = $this->currency->getSymbolRight();
          $var_currency['currency_code'] = $this->currency->getCode();
          $var_currency['decimals'] = $this->currency->getDecimalPlace();
          $var_currency['decimal_point'] = $this->language->get('decimal_point');
          $var_currency['thousand_point'] = $this->language->get('thousand_point');
          $data['currency'] = $var_currency;
          
          $data['dicounts_unf'] = $discounts;

          $data['tax_class_id'] = $product_info['tax_class_id'];
		  $data['model'] = $product_info['model'];

		  $data['tax_rates'] = $this->tax->getRates(0, $product_info['tax_class_id']);
			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'price_value'                   => $option_value['price'],
							'points_value'                  => intval($option_value['points_prefix'].$option_value['points']),
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}		
			
			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}	
			
			$data['ip_store'] = $this->request->server['REMOTE_ADDR'];
			$data['getvalue'] = $this->currency->getValue();
			$data['getcode'] = $this->currency->getCode();
			$data['getid'] = $this->currency->getId();
			
			$this->language->load('module/newfastorder');
					
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
				
				if (isset($this->request->post['prod_name'])) {
                          $data['prod_name'] = $this->request->post['prod_name'];
                } else {
                          $data['prod_name'] = '';
                    }
				
				if (isset($this->request->post['prod_image'])) {
                          $data['prod_image'] = $this->request->post['prod_image'];
                } else {
                          $data['prod_image'] = '';
                    }
				if (isset($this->request->post['this_prod_id'])) {
                          $data['this_prod_id'] = $this->request->post['this_prod_id'];
                } else {
                          $data['this_prod_id'] = '';
                    }
				if (isset($this->request->post['price_tax'])) {
                          $data['price_tax'] = $this->request->post['price_tax'];
                } else {
                          $data['price_tax'] = '';
                }
				if (isset($this->request->post['price_no_tax'])) {
                          $data['price_no_tax'] = $this->request->post['price_no_tax'];
                } else {
                          $data['price_no_tax'] = '';
                }
				if (isset($this->request->post['quantity'])) {
                          $data['quantity'] = $this->request->post['quantity'];
                } else {
                          $data['quantity'] = '';
                }
				if (isset($this->request->post['total_fast'])) {
                          $data['total_fast'] = $this->request->post['total_fast'];
                } else {
                          $data['total_fast'] = '';
                }
				if (isset($this->request->post['currency_code'])) {
                          $data['currency_code'] = $this->request->post['currency_code'];
                } else {
                          $data['currency_code'] = '';
                }
				if (isset($this->request->post['currency_value'])) {
                          $data['currency_value'] = $this->request->post['currency_value'];
                } else {
                          $data['currency_value'] = '';
                }
				if (isset($this->request->post['currency_id'])) {
                          $data['currency_id'] = $this->request->post['currency_id'];
                } else {
                          $data['currency_id'] = '';
                }
				if (isset($this->request->post['option-fast'])) {
                          $data['option-fast'] = $this->request->post['option-fast'];
                } else {
                          $data['option-fast'] = '';
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
				if (isset($this->request->post['model'])) {
                    $data['model'] = $this->request->post['model'];
                } else {
                    $data['model'] = '';
                }
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
				
				$this->load->model('module/newfastorder');
				if (!empty($this->request->post['option-fast'])) {
					$product_options = $this->getProductsOptionsFastorder($this->request->post['this_prod_id'], $this->request->post['option-fast']);	
				} else {
					$product_options = array();
				}
				
				
				$results = $this->model_module_newfastorder->addOrder($data, $product_options);
				
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
			}else{
				$json['error'] = $this->error;
				
			}
			
			return $this->response->setOutput(json_encode($json));
		}
		
		
     		$data['sendthis'] = $this->language->get('sendthis');
     		$data['comment_buyer'] = $this->language->get('comment_buyer');
     		$data['email_buyer'] = $this->language->get('email_buyer');
     		$data['namew'] = $this->language->get('namew');
     		$data['phonew'] = $this->language->get('phonew');	
     		$data['button_send'] = $this->language->get('button_send');
     		$data['cancel'] = $this->language->get('cancel');
			$data['lang_id'] = $this->config->get('config_language_id');
			
		
		$design_fastorder = $this->config->get('config_select_design_fastorder');	
		if($design_fastorder == '2'){
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newfastorder2.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/newfastorder2.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/newfastorder2.tpl', $data));
			}		
		} elseif($design_fastorder == '3') {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newfastorder3.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/newfastorder3.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/newfastorder3.tpl', $data));
			}
		} elseif($design_fastorder == '4'){
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newfastorder4.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/newfastorder4.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/newfastorder4.tpl', $data));
			}
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newfastorder.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/newfastorder.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/newfastorder.tpl', $data));
			}
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
			
			if (isset($this->request->post['option-fast'])) {
				$option = array_filter($this->request->post['option-fast']);
			} else {
				$option = array();	
			}
			$this->load->model('catalog/product');
			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['this_prod_id']);
			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$this->error['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}
			
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
		if($data['config_tax'] =='1'){
		$data['tax_rates_f_p'] = $this->tax->getRates($data['price_no_tax'], $data['tax_class_id_total']);	
		}
		$data['total'] = $data['price_tax']*$data['quantity'];
		$data['total_all'] = $this->currency->format($data['total_fast']);
		$this->language->load('module/newfastorder');		
		$data['text_photo'] = $this->language->get('text_photo');
		$data['text_product'] = $this->language->get('text_new_product');
		$data['text_model'] = $this->language->get('text_new_model');
		$data['text_quantity'] = $this->language->get('text_new_quantity');
		$data['text_price'] = $this->language->get('text_new_price');
		$data['text_total'] = $this->language->get('text_new_total');
		
		if (!empty($data['option-fast'])) {
			$data['option_send_mail'] = $this->getProductsOptionsFastorder($this->request->post['this_prod_id'], $data['option-fast']);	
		} else {
			$data['option_send_mail'] = array();
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
		$html .= $this->load->view('default/template/mail/quickorderone.tpl', $data);
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
		if($data['config_tax'] =='1'){
		$data['tax_rates_f_p'] = $this->tax->getRates($data['price_no_tax'], $data['tax_class_id_total']);	
		}
		$data['total'] = $data['price_tax']*$data['quantity'];
		$data['total_all'] = $this->currency->format($data['total_fast']);
		$this->language->load('module/newfastorder');		
		$data['text_photo'] = $this->language->get('text_photo');
		$data['text_product'] = $this->language->get('text_new_product');
		$data['text_model'] = $this->language->get('text_new_model');
		$data['text_quantity'] = $this->language->get('text_new_quantity');
		$data['text_price'] = $this->language->get('text_new_price');
		$data['text_total'] = $this->language->get('text_new_total');
		
		if (!empty($data['option-fast'])) {
			$data['option_send_mail'] = $this->getProductsOptionsFastorder($this->request->post['this_prod_id'], $data['option-fast']);	
		} else {
			$data['option_send_mail'] = array();
		}
		$text = '';		
		$subject_me = $this->getCustomFields($data, $this->config->get('quickorder_subject_me' . $data['language_id']));
		if ((strlen(utf8_decode($subject_me)) > 5)){
			$subject = $subject_me;
		} else {
			$subject = $this->language->get('subject');
		}
		$html = $this->getCustomFields($data, $this->config->get('quickorder_description_me' . $data['language_id'])). "\n";
		$config_me_html_products = $this->config->get('config_me_html_products');
		if($config_me_html_products =='1'){
		$html .= $this->load->view('default/template/mail/quickorderone.tpl', $data);
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
		list($sms_id, $sms_cnt, $cost, $balance) = send_sms($tel,$text_sms.$data['prod_name']."\n" .$data['name_fastorder']."\n" .$data['phone'], 0, 0, 0, 0, false, "maxsms=3");
		}
	}		
		private function getProductsOptionsFastorder($this_prod_id, $option_fast) {
		$product_id = $this_prod_id;
				if (isset($option_fast)) {
					$options = $option_fast;
				} else {
					$options = array();
				}
				
				
				$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p 
				LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
				WHERE p.product_id = '" . (int)$product_id . "' 
				AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND p.date_available <= NOW() AND p.status = '1'");
				
				$option_data = array();
				foreach ($options as $product_option_id => $value) {
					$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po 
					LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) 
					LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) 
					WHERE po.product_option_id = '" . (int)$product_option_id . "' 
					AND po.product_id = '" . (int)$product_id . "' 
					AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
					
						if ($option_query->num_rows) {
							if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

								if ($option_value_query->num_rows) {
								
									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $value,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'value'                   => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
									);
								}
							} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
								foreach ($value as $product_option_value_id) {
									$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

									if ($option_value_query->num_rows) {	
										$option_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => $product_option_value_id,
											'option_id'               => $option_query->row['option_id'],
											'option_value_id'         => $option_value_query->row['option_value_id'],
											'name'                    => $option_query->row['name'],
											'value'                   => $option_value_query->row['name'],
											'type'                    => $option_query->row['type'],
										);
									}
								}
							} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => '',
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => '',
									'name'                    => $option_query->row['name'],
									'value'                   => $value,
									'type'                    => $option_query->row['type'],
								);
							}
						}
						
			}
	return $option_data;		
}	
}
?>
