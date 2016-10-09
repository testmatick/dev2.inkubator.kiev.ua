<?php
class ControllerModuleUPTHEMEOPTIONS extends Controller {
	private $error = array();
	
	public function index() {
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$language = $this->load->language('module/up_theme_options');
		$this->document->setTitle('UP Theme Settings - General Options');
        $data = array_merge($data, $language);
		
        $this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$languages = $this->model_localisation_language->getLanguages();

        $this->load->model('tool/image');
		
        $data['text_image_manager'] = 'Image manager';
        $data['token'] = $this->session->data['token'];
		
		$text_strings = array(
            'heading_title',
            'text_enabled',
            'text_disabled',
            'text_content_top',
            'text_content_bottom',
            'text_column_left',
            'text_column_right',
            'entry_status',
            'entry_sort_order',
            'button_save',
            'button_cancel',
        );
        
        foreach ($text_strings as $text) {
            $data[$text] = $this->language->get($text);
        }

        
        $data['modules'] = array();  

        $config_data = array(

        't1o_status',
		
		't1o_layout_style',
		't1o_layout_l',
		't1o_layout_h_align',
		't1o_layout_catalog_mode',
		
		't1o_top_bar_status',
		't1o_logo_position',
		't1o_text_logo_color',
		't1o_header_fixed_header_status',
		't1o_header_fixed_header_style',
		't1o_header_auto_suggest_status',
		't1o_top_custom_block_status',
		't1o_top_custom_block_content',
		't1o_top_custom_block_bg',
		't1o_top_custom_block_bg_color',
		't1o_top_custom_block_bg_animation',
		't1o_top_custom_block_text_color',
		
		't1o_menu_align',
		
		't1o_menu_homepage',	
		
        't1o_menu_categories',		
        't1o_menu_categories_status',
        't1o_menu_categories_style',
		't1o_menu_categories_per_row',	
		't1o_menu_categories_3_level',
		't1o_menu_main_category_icon_status',
		't1o_menu_main_category_icon_margin',
		't1o_menu_categories_custom_block_status',
		't1o_menu_categories_custom_block_content',
		
        't1o_menu_brands',		
        't1o_menu_brands_status',
        't1o_menu_brands_style',		
        't1o_menu_brands_per_row',				
		
		't1o_menu_link',
		
        't1o_menu_cm_status',	
		't1o_menu_cm_title',	
		't1o_menu_cm_link',			
		
        't1o_menu_custom_block',
		
		't1o_menu_labels',
		't1o_menu_labels_color',
		
		't1o_custom_bar_below_menu_status',
		't1o_custom_bar_below_menu_content',
		't1o_custom_bar_below_menu_bg',
		't1o_custom_bar_below_menu_bg_color',
		't1o_custom_bar_below_menu_bg_animation',
		't1o_custom_bar_below_menu_text_color',
		
		't1o_bestseller_style',
		't1o_bestseller_per_row',
        't1o_featured_style',	
		't1o_featured_per_row',	
        't1o_latest_style',
		't1o_latest_per_row',
        't1o_specials_style',
		't1o_specials_per_row',
		't1o_most_viewed_style',
		't1o_most_viewed_per_row',
		't1o_product_tabs_style',
		't1o_product_tabs_per_row',
		't1o_carousel_items_per_row',

		't1o_category_title_position',
		't1o_category_title_above_color',
		't1o_category_desc_status',
		't1o_category_img_status',
		't1o_category_img_parallax',
		't1o_category_subcategories_status',				
        't1o_category_subcategories_style',
        't1o_sale_badge_status',
		't1o_sale_badge_type',
		't1o_new_badge_status',
		't1o_category_prod_name_status',
		't1o_category_prod_brand_status',
		't1o_category_prod_price_status',
		't1o_category_prod_quickview_status',
		't1o_category_prod_cart_status',
		't1o_category_prod_ratings_status',
		't1o_category_prod_wis_com_status',
		't1o_category_prod_zoom_status',
		't1o_category_prod_swap_status',
		't1o_category_prod_align',
		
		't1o_product_prev_next_status',
		't1o_layout_product_page',
		't1o_additional_images',
		't1o_product_name_position',
		't1o_product_align',
		't1o_product_manufacturer_logo_status',		
		't1o_product_save_percent_status',
		't1o_product_tax_status',			
        't1o_product_viewed_status',	
		't1o_product_i_c_status',
		't1o_product_related_status',
        't1o_product_related_position',
		't1o_product_related_style',
		
		't1o_product_fb1_title',
		't1o_product_fb1_subtitle',
		't1o_product_fb2_title',
		't1o_product_fb2_subtitle',
		't1o_product_fb3_title',
		't1o_product_fb3_subtitle',
		
		't1o_product_fb1_icon',
		't1o_product_fb1_icon_thumb',
		't1o_product_fb2_icon',
		't1o_product_fb2_icon_thumb',
		't1o_product_fb3_icon',
		't1o_product_fb3_icon_thumb',
		
		't1o_product_fb1_awesome',
		't1o_product_fb2_awesome',
		't1o_product_fb3_awesome',
			
        't1o_product_fb1_content',
		't1o_product_fb2_content',
		't1o_product_fb3_content',
		
		't1o_product_custom_block_1_status',
		't1o_product_custom_block_1_title',
		't1o_product_custom_block_1_content',
		't1o_product_custom_block_2_status',
		't1o_product_custom_block_2_title',
		't1o_product_custom_block_2_content',
		't1o_product_custom_block_3_status',
		't1o_product_custom_block_3_title',
		't1o_product_custom_block_3_content',
		
		't1o_product_custom_tab',
		
		't1o_contact_custom_status',
		't1o_contact_map_status',
		't1o_contact_map_ll',
		't1o_contact_map_type',
		
		't1o_fp_fb1_icon',
		't1o_fp_fb1_icon_thumb',
		't1o_fp_fb1_awesome',
		't1o_fp_fb1_color',
		't1o_fp_fb1_title',
		't1o_fp_fb1_subtitle',
		't1o_fp_fb1_content',
		't1o_fp_fb2_icon',
		't1o_fp_fb2_icon_thumb',
		't1o_fp_fb2_awesome',
		't1o_fp_fb2_color',
		't1o_fp_fb2_title',
		't1o_fp_fb2_subtitle',
		't1o_fp_fb2_content',
		't1o_fp_fb3_icon',
		't1o_fp_fb3_icon_thumb',
		't1o_fp_fb3_awesome',
		't1o_fp_fb3_color',
		't1o_fp_fb3_title',
		't1o_fp_fb3_subtitle',
		't1o_fp_fb3_content',
		't1o_fp_fb4_icon',
		't1o_fp_fb4_icon_thumb',
		't1o_fp_fb4_awesome',
		't1o_fp_fb4_color',
		't1o_fp_fb4_title',
		't1o_fp_fb4_subtitle',
		't1o_fp_fb4_content',
		
		't1o_information_column_1_status',	
		't1o_i_c_1_1_status',
		't1o_information_column_2_status',	
		't1o_i_c_2_1_status',
		't1o_i_c_2_2_status',
		't1o_i_c_2_3_status',
		't1o_i_c_2_4_status',
		't1o_i_c_2_5_status',
		't1o_information_column_3_status',
		't1o_i_c_3_1_status',
		't1o_i_c_3_2_status',
		't1o_i_c_3_3_status',
		't1o_i_c_3_4_status',
		't1o_i_c_3_5_status',
		
		't1o_custom_1_status',
		't1o_custom_1_title',
		't1o_custom_1_content',
		't1o_custom_2_status',
		't1o_custom_2_content',
		
		't1o_powered_status',
		't1o_powered_content',
		
		't1o_news_status',
		't1o_news',
		
		't1o_follow_us_status',
        't1o_facebook',
        't1o_twitter',
        't1o_googleplus',
        't1o_rss',
        't1o_pinterest',
		't1o_vk',
        't1o_vimeo',
        't1o_flickr',		
        't1o_linkedin',	
        't1o_youtube',		
        't1o_dribbble',
		't1o_instagram',
		't1o_behance',	
		't1o_skype',	
		't1o_tumblr',		
		't1o_reddit',
		
		't1o_payment_block_status',	
		't1o_payment_block_custom',
		't1o_payment_block_custom_thumb',
		't1o_payment_block_custom_status',
		't1o_payment_block_custom_url',		
        't1o_payment_paypal',
        't1o_payment_paypal_url',		
        't1o_payment_visa',
        't1o_payment_visa_url',			
        't1o_payment_mastercard',	
        't1o_payment_mastercard_url',
        't1o_payment_maestro',	
        't1o_payment_maestro_url',
        't1o_payment_discover',	
        't1o_payment_discover_url',			
        't1o_payment_skrill',	
        't1o_payment_skrill_url',
        't1o_payment_american_express',	
        't1o_payment_american_express_url',		
		't1o_payment_cirrus',	
        't1o_payment_cirrus_url',		
		't1o_payment_delta',
        't1o_payment_delta_url',		
		't1o_payment_google',	
        't1o_payment_google_url',		
		't1o_payment_2co',	
        't1o_payment_2co_url',		
		't1o_payment_sage',	
        't1o_payment_sage_url',		
		't1o_payment_solo',	
        't1o_payment_solo_url',		
		't1o_payment_amazon',	
        't1o_payment_amazon_url',		
		't1o_payment_western_union',	
        't1o_payment_western_union_url',	
		
		't1o_left_right_column_categories_type',
		
		't1o_others_totop',
		
		't1o_facebook_likebox_status',	
        't1o_facebook_likebox_id',
        't1o_facebook_likebox_position',	
		
		't1o_twitter_block_status',
        't1o_twitter_block_user',
        't1o_twitter_block_widget_id',
		't1o_twitter_block_tweets',
		't1o_twitter_block_position',
		
		't1o_video_box_status',
		't1o_video_box_content',	
        't1o_video_box_position',
		't1o_video_box_bg',
		
        't1o_custom_box_status',
		't1o_custom_box_content',
        't1o_custom_box_position',
		't1o_custom_box_bg',
		
		't1o_eu_cookie_status',
		't1o_eu_cookie_message',
		't1o_eu_cookie_close',
		
		't1o_custom_css',
		't1o_custom_js',
		
        );
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('t1o', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');		

			$this->response->redirect($this->url->link('module/up_theme_options&submit=true', 'token=' . $this->session->data['token'], 'SSL'));
		}	
		
        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $data[$conf] = $this->request->post[$conf];
            } else {
                $data[$conf] = $this->config->get($conf);
            }
        }
		
		if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/up_theme_options', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/up_theme_options', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	

		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
					 	
		if (isset($data['t1o_top_custom_block_bg']) && $data['t1o_top_custom_block_bg'] != "" && file_exists(DIR_IMAGE . $data['t1o_top_custom_block_bg'])) {
            $data['t1o_top_custom_block_bg_thumb'] = $this->model_tool_image->resize($data['t1o_top_custom_block_bg'], 100, 100);
        } else {
            $data['t1o_top_custom_block_bg_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_custom_bar_below_menu_bg']) && $data['t1o_custom_bar_below_menu_bg'] != "" && file_exists(DIR_IMAGE . $data['t1o_custom_bar_below_menu_bg'])) {
            $data['t1o_custom_bar_below_menu_bg_thumb'] = $this->model_tool_image->resize($data['t1o_custom_bar_below_menu_bg'], 100, 100);
        } else {
            $data['t1o_custom_bar_below_menu_bg_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }							
		if (isset($data['t1o_product_fb1_icon']) && $data['t1o_product_fb1_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_product_fb1_icon'])) {
            $data['t1o_product_fb1_icon_thumb'] = $this->model_tool_image->resize($data['t1o_product_fb1_icon'], 100, 100);
        } else {
            $data['t1o_product_fb1_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_product_fb2_icon']) && $data['t1o_product_fb2_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_product_fb2_icon'])) {
            $data['t1o_product_fb2_icon_thumb'] = $this->model_tool_image->resize($data['t1o_product_fb2_icon'], 100, 100);
        } else {
            $data['t1o_product_fb2_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_product_fb3_icon']) && $data['t1o_product_fb3_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_product_fb3_icon'])) {
            $data['t1o_product_fb3_icon_thumb'] = $this->model_tool_image->resize($data['t1o_product_fb3_icon'], 100, 100);
        } else {
            $data['t1o_product_fb3_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_fp_fb1_icon']) && $data['t1o_fp_fb1_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_fp_fb1_icon'])) {
            $data['t1o_fp_fb1_icon_thumb'] = $this->model_tool_image->resize($data['t1o_fp_fb1_icon'], 100, 100);
        } else {
            $data['t1o_fp_fb1_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_fp_fb2_icon']) && $data['t1o_fp_fb2_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_fp_fb2_icon'])) {
            $data['t1o_fp_fb2_icon_thumb'] = $this->model_tool_image->resize($data['t1o_fp_fb2_icon'], 100, 100);
        } else {
            $data['t1o_fp_fb2_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_fp_fb3_icon']) && $data['t1o_fp_fb3_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_fp_fb3_icon'])) {
            $data['t1o_fp_fb3_icon_thumb'] = $this->model_tool_image->resize($data['t1o_fp_fb3_icon'], 100, 100);
        } else {
            $data['t1o_fp_fb3_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
		if (isset($data['t1o_fp_fb4_icon']) && $data['t1o_fp_fb4_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_fp_fb4_icon'])) {
            $data['t1o_fp_fb4_icon_thumb'] = $this->model_tool_image->resize($data['t1o_fp_fb4_icon'], 100, 100);
        } else {
            $data['t1o_fp_fb4_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1o_about_logo_icon']) && $data['t1o_about_logo_icon'] != "" && file_exists(DIR_IMAGE . $data['t1o_about_logo_icon'])) {
            $data['t1o_about_logo_icon_thumb'] = $this->model_tool_image->resize($data['t1o_about_logo_icon'], 100, 100);
        } else {
            $data['t1o_about_logo_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
			
	    if (isset($data['t1o_bg_image_f1_custom']) && $data['t1o_bg_image_f1_custom'] != "" && file_exists(DIR_IMAGE . $data['t1o_bg_image_f1_custom'])) {
            $data['t1o_bg_image_f1_thumb'] = $this->model_tool_image->resize($data['t1o_bg_image_f1_custom'], 100, 100);
        } else {
            $data['t1o_bg_image_f1_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
	    if (isset($data['t1o_bg_image_f2_custom']) && $data['t1o_bg_image_f2_custom'] != "" && file_exists(DIR_IMAGE . $data['t1o_bg_image_f2_custom'])) {
            $data['t1o_bg_image_f2_thumb'] = $this->model_tool_image->resize($data['t1o_bg_image_f2_custom'], 100, 100);
        } else {
            $data['t1o_bg_image_f2_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
	    if (isset($data['t1o_bg_image_f4_custom']) && $data['t1o_bg_image_f4_custom'] != "" && file_exists(DIR_IMAGE . $data['t1o_bg_image_f4_custom'])) {
            $data['t1o_bg_image_f4_thumb'] = $this->model_tool_image->resize($data['t1o_bg_image_f4_custom'], 100, 100);
        } else {
            $data['t1o_bg_image_f4_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
	    if (isset($data['t1o_bg_image_f5_custom']) && $data['t1o_bg_image_f5_custom'] != "" && file_exists(DIR_IMAGE . $data['t1o_bg_image_f5_custom'])) {
            $data['t1o_bg_image_f5_thumb'] = $this->model_tool_image->resize($data['t1o_bg_image_f5_custom'], 100, 100);
        } else {
            $data['t1o_bg_image_f5_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }			
        if (isset($data['t1o_payment_block_custom']) && $data['t1o_payment_block_custom'] != "" && file_exists(DIR_IMAGE . $data['t1o_payment_block_custom'])) {
            $data['t1o_payment_block_custom_thumb'] = $this->model_tool_image->resize($data['t1o_payment_block_custom'], 100, 100);
        } else {
            $data['t1o_payment_block_custom_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		
		$this->response->setOutput($this->load->view('module/up_theme_options.tpl', $data));
	}
		
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/up_theme_options')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>