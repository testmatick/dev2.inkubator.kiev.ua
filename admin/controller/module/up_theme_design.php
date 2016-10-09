<?php
class ControllerModuleUPTHEMEDESIGN extends Controller {
	private $error = array();
	
	public function index() {
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$language = $this->load->language('module/up_theme_design');
		$this->document->setTitle('UP Theme Settings - Colors and Styles');
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

        't1d_status',
		't1d_skin',
		
		't1d_body_bg_color',
		't1d_headings_color',
		't1d_headings_border_status',
		't1d_headings_border_color',
		't1d_body_text_color',		
		't1d_light_text_color',			
		't1d_other_links_color',		
		't1d_links_hover_color',
		't1d_icons_color',
		't1d_icons_hover_color',
		
		't1d_img_style',
		
		't1d_wrapper_frame_bg_color',
		
		't1d_content_column_bg_color',
		't1d_content_column_hli_bg_color',
		't1d_content_column_hli_buy_column',
		't1d_content_column_separator_color',
		't1d_content_column_active_tab_border_color',					
		
		't1d_left_column_head_bg_color',
		't1d_left_column_head_title_color',
		't1d_left_column_head_border_status',		
		't1d_left_column_head_border_color',
		't1d_left_column_head_border_size',			
		't1d_left_column_box_bg_color',
		't1d_left_column_box_text_color',
		't1d_left_column_box_links_color',	
		't1d_left_column_box_links_color_hover',
		't1d_left_column_box_separator_color',			
				
		't1d_right_column_head_bg_color',
		't1d_right_column_head_title_color',
		't1d_right_column_head_border_status',		
		't1d_right_column_head_border_color',
		't1d_right_column_head_border_size',		
		't1d_right_column_box_bg_color',
		't1d_right_column_box_text_color',
		't1d_right_column_box_links_color',
		't1d_right_column_box_links_color_hover',
		't1d_right_column_box_separator_color',				
			
		't1d_category_box_head_bg_color',
		't1d_category_box_head_title_color',
		't1d_category_box_head_border_status',		
		't1d_category_box_head_border_color',
		't1d_category_box_head_border_size',			
		't1d_category_box_box_bg_color',	
		't1d_category_box_box_links_color',	
		't1d_category_box_box_links_color_hover',
		't1d_category_box_box_subcat_color',					
		't1d_category_box_box_separator_color',			
			
		't1d_filter_box_head_bg_color',
		't1d_filter_box_head_title_color',
		't1d_filter_box_head_border_status',		
		't1d_filter_box_head_border_color',
		't1d_filter_box_head_border_size',		
		't1d_filter_box_box_bg_color',
		't1d_filter_box_box_filter_title_color',		
		't1d_filter_box_box_filter_name_color',	
		't1d_filter_box_box_filter_name_color_hover',
		't1d_filter_box_box_separator_color',
		
		't1d_top_area_status',		
		't1d_top_area_bg_color',
		't1d_top_area_mini_bg_color',
		't1d_top_area_icons_color',
		't1d_top_area_icons_color_hover',
		't1d_top_area_link_color',
		't1d_top_area_link_color_hover',
		't1d_top_area_separator_status',
		't1d_top_area_separator_color',
		
		't1d_top_area_tb_bg_status',
		't1d_top_area_tb_bg_color',
		't1d_top_area_tb_bottom_border_status',
		't1d_top_area_tb_bottom_border_color',
		't1d_top_area_tb_text_color',
		't1d_top_area_tb_link_color',
		't1d_top_area_tb_link_color_hover',
		't1d_top_area_tb_icons_color',
		't1d_top_area_tb_separator_color',
		
		't1d_mm_bg_color_status',		
		't1d_mm_bg_color',
		't1d_mm_separator_status',		
		't1d_mm_separator_color',
		't1d_mm_separator_size',
		't1d_mm_border_top_status',		
		't1d_mm_border_top_color',
		't1d_mm_border_top_size',
		't1d_mm_hover_border_top_color',
		't1d_mm_border_bottom_status',		
		't1d_mm_border_bottom_color',
		't1d_mm_border_bottom_size',
		
		't1d_mm1_bg_color_status',		
		't1d_mm1_bg_color',		
		't1d_mm1_bg_hover_color',
		't1d_mm1_link_color',
		't1d_mm1_link_hover_color',		
		
		't1d_mm2_bg_color_status',
		't1d_mm2_bg_color',		
		't1d_mm2_bg_hover_color',		
		't1d_mm2_link_color',
		't1d_mm2_link_hover_color',
        't1d_mm2_main_category_icon_status',	

		't1d_mm3_bg_color_status',
		't1d_mm3_bg_color',
		't1d_mm3_bg_hover_color',		
		't1d_mm3_link_color',
		't1d_mm3_link_hover_color',		
	
		't1d_mm4_bg_color_status',
		't1d_mm4_bg_color',
		't1d_mm4_bg_hover_color',		
		't1d_mm4_link_color',
		't1d_mm4_link_hover_color',	

		't1d_mm5_bg_color_status',
		't1d_mm5_bg_color',
		't1d_mm5_bg_hover_color',		
		't1d_mm5_link_color',
		't1d_mm5_link_hover_color',
		
		't1d_mm6_bg_color_status',
		't1d_mm6_bg_color',
		't1d_mm6_bg_hover_color',		
		't1d_mm6_link_color',
		't1d_mm6_link_hover_color',	
		
		't1d_mm_sub_bg_color',	
		't1d_mm_sub_titles_bg_color',				
		't1d_mm_sub_text_color',
		't1d_mm_sub_link_color',		
		't1d_mm_sub_link_hover_color',
		't1d_mm_sub_separator_color',	
		't1d_mm_sub_box_shadow',
		
		't1d_mid_prod_box_sale_icon_color',
		't1d_mid_prod_box_new_icon_color',				
		't1d_mid_prod_stars_color',
		't1d_mid_slider_control_color',
		't1d_mid_slider_control_color_active',			
		
		't1d_mid_prod_slider_bg_color',
		't1d_mid_prod_slider_name_color',
		't1d_mid_prod_slider_desc_color',
		't1d_mid_prod_slider_price_color',			
		't1d_mid_prod_slider_bottom_bar_bg_color',				
		't1d_mid_prod_slider_bottom_bar_bg_color_active',	
		
		't1d_footer_fade_in',
		
		't1d_f1_bg_color_status',
		't1d_f1_bg_color',
		't1d_f1_title_color',
		't1d_f1_subtitle_color',
		't1d_f1_border_top_status',
		't1d_f1_border_top_size',
		't1d_f1_border_top_color',
		
		't1d_f2_bg_color_status',
		't1d_f2_bg_color',
		't1d_f2_titles_color',	
		't1d_f2_text_color',		
		't1d_f2_link_color',
		't1d_f2_link_hover_color',
		't1d_f2_disc_color',
		't1d_f2_border_top_status',		
		't1d_f2_border_top_color',	
		't1d_f2_border_top_size',
		
		't1d_f3_bg_color_status',
		't1d_f3_bg_color',
		't1d_f3_text_color',		
		't1d_f3_link_color',
		't1d_f3_link_hover_color',
		't1d_f3_news_word_color',
		't1d_f3_news_color',
		't1d_f3_news_hover_color',
		't1d_f3_icons_color',
		't1d_f3_border_top_status',		
		't1d_f3_border_top_color',	
		't1d_f3_border_top_size',
		
		't1d_f4_bg_color_status',
		't1d_f4_bg_color',
		't1d_f4_text_color',		
		't1d_f4_link_color',
		't1d_f4_link_hover_color',
		't1d_f4_border_top_status',		
		't1d_f4_border_top_color',	
		't1d_f4_border_top_size',
		
		't1d_price_color',
		't1d_price_old_color',	
		't1d_price_new_color',
		
		't1d_button_border_radius',
		't1d_button_bg_status',
		't1d_button_bg_color',
		't1d_button_bg_hover_color',
		't1d_button_text_color',
		't1d_button_text_hover_color',
		't1d_button_exclusive_bg_status',
		't1d_button_exclusive_bg_color',
		't1d_button_exclusive_bg_hover_color',
		't1d_button_exclusive_text_color',
		't1d_button_exclusive_text_hover_color',
		
		't1d_dd_bg_color',
		't1d_dd_headings_color',
		't1d_dd_text_color',			
		't1d_dd_light_text_color',			
		't1d_dd_links_color',		
		't1d_dd_links_hover_color',
		't1d_dd_icons_color',
		't1d_dd_icons_hover_color',
		't1d_dd_hli_bg_color',
		't1d_dd_separator_color',
		't1d_dd_shadow',
		
		't1d_modal_bg_style',
		
		't1d_pattern_body',
		't1d_bg_image_custom',
		't1d_bg_image_thumb',
		't1d_bg_image_position',
		't1d_bg_image_repeat',
		't1d_bg_image_attachment',		
		
		't1d_pattern_k_ta',
		't1d_bg_image_ta_custom',
		't1d_bg_image_ta_thumb',
		't1d_bg_image_ta_position',
		't1d_bg_image_ta_repeat',
		't1d_bg_image_ta_attachment',		
		
		't1d_pattern_k_mm',
		't1d_bg_image_mm_custom',
		't1d_bg_image_mm_thumb',
		't1d_bg_image_mm_repeat',			
	
		't1d_pattern_k_f1',
		't1d_bg_image_f1_custom',
		't1d_bg_image_f1_thumb',
		't1d_bg_image_f1_position',
		't1d_bg_image_f1_repeat',
		't1d_pattern_k_f2',	
		't1d_bg_image_f2_custom',
		't1d_bg_image_f2_thumb',
		't1d_bg_image_f2_parallax',
		't1d_bg_image_f2_position',
		't1d_bg_image_f2_repeat',		
		't1d_pattern_k_f3',	
		't1d_bg_image_f3_custom',
		't1d_bg_image_f3_thumb',
		't1d_bg_image_f3_position',
		't1d_bg_image_f3_repeat',
		't1d_pattern_k_f4',	
		't1d_bg_image_f4_custom',
		't1d_bg_image_f4_thumb',
		't1d_bg_image_f4_position',
		't1d_bg_image_f4_repeat',
		
		't1d_body_font',
		't1d_body_font_size',
		't1d_body_font_uppercase',
		't1d_small_font_size',
		't1d_title_font',
		't1d_title_font_weight',
		't1d_title_font_uppercase',			
		't1d_price_font',
		't1d_price_font_weight',			
		't1d_button_font',
		't1d_button_font_weight',
		't1d_button_font_size',
		't1d_main_menu_font',
		't1d_mm_font_size',		
		't1d_mm_font_weight',
		't1d_mm_font_uppercase',
		
        );
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('t1d', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');		

			$this->response->redirect($this->url->link('module/up_theme_design&submit=true', 'token=' . $this->session->data['token'], 'SSL'));
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
			'href'      => $this->url->link('module/up_theme_design', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/up_theme_design', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	

		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();

        if (isset($data['t1d_bg_image_custom']) && $data['t1d_bg_image_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_custom'])) {
            $data['t1d_bg_image_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
        if (isset($data['t1d_bg_image_ta_custom']) && $data['t1d_bg_image_ta_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_ta_custom'])) {
            $data['t1d_bg_image_ta_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_ta_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_ta_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
        if (isset($data['t1d_bg_image_mm_custom']) && $data['t1d_bg_image_mm_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_mm_custom'])) {
            $data['t1d_bg_image_mm_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_mm_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_mm_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($data['t1d_bg_image_f1_custom']) && $data['t1d_bg_image_f1_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_f1_custom'])) {
            $data['t1d_bg_image_f1_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_f1_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_f1_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
	    if (isset($data['t1d_bg_image_f2_custom']) && $data['t1d_bg_image_f2_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_f2_custom'])) {
            $data['t1d_bg_image_f2_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_f2_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_f2_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        if (isset($data['t1d_bg_image_f3_custom']) && $data['t1d_bg_image_f3_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_f3_custom'])) {
            $data['t1d_bg_image_f3_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_f3_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_f3_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
	    if (isset($data['t1d_bg_image_f4_custom']) && $data['t1d_bg_image_f4_custom'] != "" && file_exists(DIR_IMAGE . $data['t1d_bg_image_f4_custom'])) {
            $data['t1d_bg_image_f4_thumb'] = $this->model_tool_image->resize($data['t1d_bg_image_f4_custom'], 100, 100);
        } else {
            $data['t1d_bg_image_f4_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		$data['placeholder'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		
		$this->response->setOutput($this->load->view('module/up_theme_design.tpl', $data));
	}
		
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/up_theme_design')) {
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