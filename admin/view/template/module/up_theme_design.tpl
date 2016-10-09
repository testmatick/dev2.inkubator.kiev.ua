<?php echo $header; ?>
                    
<?php 

if(empty($t1d_body_bg_color)) $t1d_body_bg_color ="F1F7F8";
if(empty($t1d_headings_color)) $t1d_headings_color ="4C5867";
if(empty($t1d_headings_border_color)) $t1d_headings_border_color ="5AC7C0";
if(empty($t1d_body_text_color)) $t1d_body_text_color ="707C8C";
if(empty($t1d_light_text_color)) $t1d_light_text_color ="9BA9BA";
if(empty($t1d_other_links_color)) $t1d_other_links_color ="707C8C";
if(empty($t1d_links_hover_color)) $t1d_links_hover_color ="5AC7C0";
if(empty($t1d_icons_color)) $t1d_icons_color ="D6DDE6";
if(empty($t1d_icons_hover_color)) $t1d_icons_hover_color ="5AC7C0";

if(empty($t1d_wrapper_frame_bg_color)) $t1d_wrapper_frame_bg_color ="E7EEEF";
if(empty($t1d_content_column_bg_color)) $t1d_content_column_bg_color ="FFFFFF";
if(empty($t1d_content_column_hli_bg_color)) $t1d_content_column_hli_bg_color ="FFFFFF";
if(empty($t1d_content_column_separator_color)) $t1d_content_column_separator_color ="F4F7F7";
if(empty($t1d_content_column_active_tab_border_color)) $t1d_content_column_active_tab_border_color ="5AC7C0";
if(empty($t1d_left_column_head_bg_color)) $t1d_left_column_head_bg_color ="FFFFFF";
if(empty($t1d_left_column_head_title_color)) $t1d_left_column_head_title_color ="4C5867";
if(empty($t1d_left_column_head_border_color)) $t1d_left_column_head_border_color ="F4F7F7";
if(empty($t1d_left_column_box_bg_color)) $t1d_left_column_box_bg_color ="FFFFFF";
if(empty($t1d_left_column_box_links_color)) $t1d_left_column_box_links_color ="707C8C";
if(empty($t1d_left_column_box_links_color_hover)) $t1d_left_column_box_links_color_hover ="5AC7C0";
if(empty($t1d_left_column_box_text_color)) $t1d_left_column_box_text_color ="707C8C";
if(empty($t1d_left_column_box_separator_color)) $t1d_left_column_box_separator_color ="F4F7F7";
if(empty($t1d_right_column_head_bg_color)) $t1d_right_column_head_bg_color ="FFFFFF";
if(empty($t1d_right_column_head_title_color)) $t1d_right_column_head_title_color ="4C5867";
if(empty($t1d_right_column_head_border_color)) $t1d_right_column_head_border_color ="F4F7F7";
if(empty($t1d_right_column_box_bg_color)) $t1d_right_column_box_bg_color ="FFFFFF";
if(empty($t1d_right_column_box_links_color)) $t1d_right_column_box_links_color ="707C8C";
if(empty($t1d_right_column_box_links_color_hover)) $t1d_right_column_box_links_color_hover ="5AC7C0";
if(empty($t1d_right_column_box_text_color)) $t1d_right_column_box_text_color ="707C8C";
if(empty($t1d_right_column_box_separator_color)) $t1d_right_column_box_separator_color ="F4F7F7";
if(empty($t1d_category_box_head_bg_color)) $t1d_category_box_head_bg_color ="FFFFFF";
if(empty($t1d_category_box_head_title_color)) $t1d_category_box_head_title_color ="4C5867";
if(empty($t1d_category_box_head_border_color)) $t1d_category_box_head_border_color ="F4F7F7";
if(empty($t1d_category_box_box_bg_color)) $t1d_category_box_box_bg_color ="FFFFFF";
if(empty($t1d_category_box_box_links_color)) $t1d_category_box_box_links_color ="707C8C";
if(empty($t1d_category_box_box_links_color_hover)) $t1d_category_box_box_links_color_hover ="5AC7C0";
if(empty($t1d_category_box_box_subcat_color)) $t1d_category_box_box_subcat_color ="9BA9BA";
if(empty($t1d_category_box_box_separator_color)) $t1d_category_box_box_separator_color ="F4F7F7";
if(empty($t1d_filter_box_head_bg_color)) $t1d_filter_box_head_bg_color ="FFFFFF";
if(empty($t1d_filter_box_head_title_color)) $t1d_filter_box_head_title_color ="4C5867";
if(empty($t1d_filter_box_head_border_color)) $t1d_filter_box_head_border_color ="F4F7F7";
if(empty($t1d_filter_box_box_bg_color)) $t1d_filter_box_box_bg_color ="FFFFFF";
if(empty($t1d_filter_box_box_filter_title_color)) $t1d_filter_box_box_filter_title_color ="4C5867";
if(empty($t1d_filter_box_box_filter_name_color)) $t1d_filter_box_box_filter_name_color ="707C8C";
if(empty($t1d_filter_box_box_filter_name_color_hover)) $t1d_filter_box_box_filter_name_color_hover ="5AC7C0";
if(empty($t1d_filter_box_box_separator_color)) $t1d_filter_box_box_separator_color ="F4F7F7";

if(empty($t1d_price_color)) $t1d_price_color ="4C5867";
if(empty($t1d_price_old_color)) $t1d_price_old_color ="9BA9BA";
if(empty($t1d_price_new_color)) $t1d_price_new_color ="E55E5E";

if(empty($t1d_button_bg_color)) $t1d_button_bg_color ="EBF2F3";
if(empty($t1d_button_bg_hover_color)) $t1d_button_bg_hover_color ="62CEFB";
if(empty($t1d_button_text_color)) $t1d_button_text_color ="707C8C";
if(empty($t1d_button_text_hover_color)) $t1d_button_text_hover_color ="FFFFFF";
if(empty($t1d_button_exclusive_bg_color)) $t1d_button_exclusive_bg_color ="5AC7C0";
if(empty($t1d_button_exclusive_bg_hover_color)) $t1d_button_exclusive_bg_hover_color ="62CEFB";
if(empty($t1d_button_exclusive_text_color)) $t1d_button_exclusive_text_color ="FFFFFF";
if(empty($t1d_button_exclusive_text_hover_color)) $t1d_button_exclusive_text_hover_color ="FFFFFF";

if(empty($t1d_dd_bg_color)) $t1d_dd_bg_color ="FFFFFF";
if(empty($t1d_dd_headings_color)) $t1d_dd_headings_color ="4C5867";
if(empty($t1d_dd_text_color)) $t1d_dd_text_color ="707C8C";
if(empty($t1d_dd_light_text_color)) $t1d_dd_light_text_color ="9BA9BA";
if(empty($t1d_dd_links_color)) $t1d_dd_links_color ="9BA9BA";
if(empty($t1d_dd_links_hover_color)) $t1d_dd_links_hover_color ="4C5867";
if(empty($t1d_dd_icons_color)) $t1d_dd_icons_color ="D6DDE6";
if(empty($t1d_dd_icons_hover_color)) $t1d_dd_icons_hover_color ="5AC7C0";
if(empty($t1d_dd_hli_bg_color)) $t1d_dd_hli_bg_color ="FBFCFC";
if(empty($t1d_dd_separator_color)) $t1d_dd_separator_color ="F4F7F7";

if(empty($t1d_top_area_bg_color)) $t1d_top_area_bg_color ="FFFFFF";
if(empty($t1d_top_area_mini_bg_color)) $t1d_top_area_mini_bg_color ="FFFFFF";
if(empty($t1d_top_area_icons_color)) $t1d_top_area_icons_color ="D6DDE6";
if(empty($t1d_top_area_icons_color_hover)) $t1d_top_area_icons_color_hover ="5AC7C0";
if(empty($t1d_top_area_link_color)) $t1d_top_area_link_color ="9BA9BA";
if(empty($t1d_top_area_link_color_hover)) $t1d_top_area_link_color_hover ="4C5867";
if(empty($t1d_top_area_separator_color)) $t1d_top_area_separator_color ="F4F7F7";

if(empty($t1d_top_area_tb_bg_color)) $t1d_top_area_tb_bg_color ="FFFFFF";
if(empty($t1d_top_area_tb_bottom_border_color)) $t1d_top_area_tb_bottom_border_color ="F4F7F7";
if(empty($t1d_top_area_tb_text_color)) $t1d_top_area_tb_text_color ="9BA9BA";
if(empty($t1d_top_area_tb_link_color)) $t1d_top_area_tb_link_color ="9BA9BA";
if(empty($t1d_top_area_tb_link_color_hover)) $t1d_top_area_tb_link_color_hover ="5AC7C0";
if(empty($t1d_top_area_tb_icons_color)) $t1d_top_area_tb_icons_color ="D6DDE6";
if(empty($t1d_top_area_tb_separator_color)) $t1d_top_area_tb_separator_color ="F4F7F7";

if(empty($t1d_mm_bg_color)) $t1d_mm_bg_color ="FFFFFF";
if(empty($t1d_mm_separator_color)) $t1d_mm_separator_color ="F4F7F7";
if(empty($t1d_mm_border_top_color)) $t1d_mm_border_top_color ="F4F7F7";
if(empty($t1d_mm_hover_border_top_color)) $t1d_mm_hover_border_top_color ="5AC7C0";
if(empty($t1d_mm_border_bottom_color)) $t1d_mm_border_bottom_color ="F4F7F7";

if(empty($t1d_mm1_bg_color)) $t1d_mm1_bg_color ="FFFFFF";
if(empty($t1d_mm1_bg_hover_color)) $t1d_mm1_bg_hover_color ="FFFFFF";
if(empty($t1d_mm1_link_color)) $t1d_mm1_link_color ="707C8C";
if(empty($t1d_mm1_link_hover_color)) $t1d_mm1_link_hover_color ="4C5867";

if(empty($t1d_mm2_bg_color)) $t1d_mm2_bg_color ="FFFFFF";
if(empty($t1d_mm2_bg_hover_color)) $t1d_mm2_bg_hover_color ="FFFFFF";
if(empty($t1d_mm2_link_color)) $t1d_mm2_link_color ="707C8C";
if(empty($t1d_mm2_link_hover_color)) $t1d_mm2_link_hover_color ="4C5867";

if(empty($t1d_mm3_bg_color)) $t1d_mm3_bg_color ="FFFFFF";
if(empty($t1d_mm3_bg_hover_color)) $t1d_mm3_bg_hover_color ="FFFFFF";
if(empty($t1d_mm3_link_color)) $t1d_mm3_link_color ="707C8C";
if(empty($t1d_mm3_link_hover_color)) $t1d_mm3_link_hover_color ="4C5867";

if(empty($t1d_mm4_bg_color)) $t1d_mm4_bg_color ="FFFFFF";
if(empty($t1d_mm4_bg_hover_color)) $t1d_mm4_bg_hover_color ="FFFFFF";
if(empty($t1d_mm4_link_color)) $t1d_mm4_link_color ="707C8C";
if(empty($t1d_mm4_link_hover_color)) $t1d_mm4_link_hover_color ="4C5867";

if(empty($t1d_mm5_bg_color)) $t1d_mm5_bg_color ="FFFFFF";
if(empty($t1d_mm5_bg_hover_color)) $t1d_mm5_bg_hover_color ="FFFFFF";
if(empty($t1d_mm5_link_color)) $t1d_mm5_link_color ="707C8C";
if(empty($t1d_mm5_link_hover_color)) $t1d_mm5_link_hover_color ="4C5867";

if(empty($t1d_mm6_bg_color)) $t1d_mm6_bg_color ="FFFFFF";
if(empty($t1d_mm6_bg_hover_color)) $t1d_mm6_bg_hover_color ="FFFFFF";
if(empty($t1d_mm6_link_color)) $t1d_mm6_link_color ="707C8C";
if(empty($t1d_mm6_link_hover_color)) $t1d_mm6_link_hover_color ="4C5867";

if(empty($t1d_mm_sub_bg_color)) $t1d_mm_sub_bg_color ="FFFFFF";
if(empty($t1d_mm_sub_titles_bg_color)) $t1d_mm_sub_titles_bg_color ="FBFCFC";
if(empty($t1d_mm_sub_text_color)) $t1d_mm_sub_text_color ="707C8C";
if(empty($t1d_mm_sub_link_color)) $t1d_mm_sub_link_color ="707C8C";
if(empty($t1d_mm_sub_link_hover_color)) $t1d_mm_sub_link_hover_color ="5AC7C0";
if(empty($t1d_mm_sub_separator_color)) $t1d_mm_sub_separator_color ="F4F7F7";

if(empty($t1d_mm_mobile_bg_color)) $t1d_mm_mobile_bg_color ="2A2A2A";
if(empty($t1d_mm_mobile_bg_hover_color)) $t1d_mm_mobile_bg_hover_color ="E55E5E";
if(empty($t1d_mm_mobile_text_color)) $t1d_mm_mobile_text_color ="FFFFFF";

if(empty($t1d_mid_prod_box_sale_icon_color)) $t1d_mid_prod_box_sale_icon_color ="E55E5E";
if(empty($t1d_mid_prod_box_new_icon_color)) $t1d_mid_prod_box_new_icon_color ="5AC7C0";
if(empty($t1d_mid_prod_stars_color)) $t1d_mid_prod_stars_color ="FFE654";
if(empty($t1d_mid_slider_control_color_active)) $t1d_mid_slider_control_color ="EBF2F3";
if(empty($t1d_mid_slider_control_color_active)) $t1d_mid_slider_control_color_active ="62CEFB";

if(empty($t1d_mid_prod_slider_bg_color)) $t1d_mid_prod_slider_bg_color ="FFFFFF";
if(empty($t1d_mid_prod_slider_name_color)) $t1d_mid_prod_slider_name_color ="4C5867";
if(empty($t1d_mid_prod_slider_desc_color)) $t1d_mid_prod_slider_desc_color ="9BA9BA";
if(empty($t1d_mid_prod_slider_price_color)) $t1d_mid_prod_slider_price_color ="4C5867";
if(empty($t1d_mid_prod_slider_bottom_bar_bg_color)) $t1d_mid_prod_slider_bottom_bar_bg_color ="D6DDE6";
if(empty($t1d_mid_prod_slider_bottom_bar_bg_color_active)) $t1d_mid_prod_slider_bottom_bar_bg_color_active ="5AC7C0";

if(empty($t1d_f1_bg_color)) $t1d_f1_bg_color ="FFFFFF";
if(empty($t1d_f1_title_color)) $t1d_f1_title_color ="4C5867";
if(empty($t1d_f1_subtitle_color)) $t1d_f1_subtitle_color ="9BA9BA";
if(empty($t1d_f1_border_top_color)) $t1d_f1_border_top_color ="F6F6F6";

if(empty($t1d_f2_bg_color)) $t1d_f2_bg_color ="FFFFFF";
if(empty($t1d_f2_titles_color)) $t1d_f2_titles_color ="4C5867";
if(empty($t1d_f2_text_color)) $t1d_f2_text_color ="9BA9BA";
if(empty($t1d_f2_link_color)) $t1d_f2_link_color ="707C8C";
if(empty($t1d_f2_link_hover_color)) $t1d_f2_link_hover_color ="5AC7C0";
if(empty($t1d_f2_disc_color)) $t1d_f2_disc_color ="62CEFB";
if(empty($t1d_f2_border_top_color)) $t1d_f2_border_top_color ="F4F7F7";

if(empty($t1d_f3_bg_color)) $t1d_f3_bg_color ="FFFFFF";
if(empty($t1d_f3_text_color)) $t1d_f3_text_color ="9BA9BA";
if(empty($t1d_f3_link_color)) $t1d_f3_link_color ="707C8C";
if(empty($t1d_f3_link_hover_color)) $t1d_f3_link_hover_color ="5AC7C0";
if(empty($t1d_f3_news_word_color)) $t1d_f3_news_word_color ="5AC7C0";
if(empty($t1d_f3_news_color)) $t1d_f3_news_color ="9BA9BA";
if(empty($t1d_f3_news_hover_color)) $t1d_f3_news_hover_color ="707C8C";
if(empty($t1d_f3_icons_color)) $t1d_f3_icons_color ="D6DDE6";
if(empty($t1d_f3_border_top_color)) $t1d_f3_border_top_color ="F4F7F7";

if(empty($t1d_f4_bg_color)) $t1d_f4_bg_color ="FFFFFF";
if(empty($t1d_f4_text_color)) $t1d_f4_text_color ="9BA9BA";
if(empty($t1d_f4_link_color)) $t1d_f4_link_color ="707C8C";
if(empty($t1d_f4_link_hover_color)) $t1d_f4_link_hover_color ="5AC7C0";
if(empty($t1d_f4_border_top_color)) $t1d_f4_border_top_color ="F4F7F7";

if(empty($t1d_video_box_bg)) $t1d_video_box_bg ="E55E5E";
if(empty($t1d_custom_box_bg)) $t1d_custom_box_bg ="B3E04B";

	
$googlefonts = array(
	''                         => '--- Default ---',
	'Arial'                    => 'Arial',
	'Georgia'                  => 'Georgia',
	'Helvetica'                => 'Helvetica',
	'Lucida Grande'            => 'Lucida Grande',    
	'Lucida Sans Unicode'      => 'Lucida Sans Unicode',
 	'Segoe UI'                 => 'Segoe UI',   
	'Tahoma'                   => 'Tahoma',
	'Times New Roman'          => 'Times New Roman',
	'Trebuchet MS'             => 'Trebuchet MS',    
	'Verdana'                  => 'Verdana', 
    'ABeeZee'                  => 'ABeeZee',  
	'Abel'                     => 'Abel',
	'Abril+Fatface'            => 'Abril Fatface',
	'Aclonica'                 => 'Aclonica',
	'Acme'                     => 'Acme',
	'Actor'                    => 'Actor',
	'Adamina'                  => 'Adamina',
	'Advent+Pro'               => 'Advent Pro',
	'Aguafina+Script'          => 'Aguafina Script',    
    'Akronim'                  => 'Akronim',
	'Aladin'                   => 'Aladin',
	'Aldrich'                  => 'Aldrich',
	'Alegreya'                 => 'Alegreya',
	'Alegreya+SC'              => 'Alegreya SC',
	'Alex+Brush'               => 'Alex Brush',
	'Alfa+Slab+One'            => 'Alfa Slab One',
	'Alice'                    => 'Alice',
	'Alike'                    => 'Alike',
	'Alike+Angular'            => 'Alike Angular',
	'Allan'                    => 'Allan',
	'Allerta'                  => 'Allerta',
	'Allerta+Stencil'          => 'Allerta Stencil',
	'Allura'                   => 'Allura',
	'Almendra'                 => 'Almendra',
	'Almendra+Display'         => 'Almendra Display',    
	'Almendra+SC'              => 'Almendra SC',
    'Amarante'                 => 'Amarante',
	'Amaranth'                 => 'Amaranth',
	'Amatic+SC'                => 'Amatic SC',
	'Amethysta'                => 'Amethysta',
    'Anaheim'                  => 'Anaheim',
	'Andada'                   => 'Andada',
	'Andika'                   => 'Andika',
	'Angkor'                   => 'Angkor',    
	'Annie+Use+Your+Telescope' => 'Annie Use Your Telescope',
	'Anonymous+Pro'            => 'Anonymous Pro',
	'Antic'                    => 'Antic',
	'Antic+Didone'             => 'Antic Didone',
	'Antic+Slab'               => 'Antic Slab',        
	'Anton'                    => 'Anton',
	'Arapey'                   => 'Arapey',
	'Arbutus'                  => 'Arbutus',  
    'Arbutus+Slab'             => 'Arbutus Slab',    
	'Architects+Daughter'      => 'Architects Daughter',
    'Archivo+Black'            => 'Archivo Black',
    'Archivo+Narrow'           => 'Archivo Narrow',
	'Arimo'                    => 'Arimo',
	'Arizonia'                 => 'Arizonia',    
	'Armata'                   => 'Armata',
	'Artifika'                 => 'Artifika',
	'Arvo'                     => 'Arvo',
	'Asap'                     => 'Asap',
	'Asset'                    => 'Asset',
	'Astloch'                  => 'Astloch',
	'Asul'                     => 'Asul',
	'Atomic+Age'               => 'Atomic Age',
	'Aubrey'                   => 'Aubrey',
	'Audiowide'                => 'Audiowide', 
    'Autour+One'               => 'Autour One',
	'Average'                  => 'Average',
    'Average+Sans'             => 'Average Sans',
	'Averia+Gruesa+Libre'      => 'Averia Gruesa Libre',
	'Averia+Libre'             => 'Averia Libre',
	'Averia+Sans+Libre'        => 'Averia Sans Libre',
	'Averia+Serif+Libre'       => 'Averia Serif Libre',                       
	'Bad+Script'               => 'Bad Script',
	'Balthazar'                => 'Balthazar',
	'Bangers'                  => 'Bangers',
	'Basic'                    => 'Basic',
	'Battambang'               => 'Battambang',
	'Baumans'                  => 'Baumans',
	'Bayon'                    => 'Bayon',
	'Belgrano'                 => 'Belgrano',
	'Belleza'                  => 'Belleza',  
    'BenchNine'                => 'BenchNine',  
	'Bentham'                  => 'Bentham',
	'Berkshire+Swash'          => 'Berkshire Swash',    
	'Bevan'                    => 'Bevan',
	'Bigelow+Rules'            => 'Bigelow Rules',    
	'Bigshot+One'              => 'Bigshot One',
	'Bilbo'                    => 'Bilbo',
	'Bilbo+Swash+Caps'         => 'Bilbo Swash Caps',
	'Bitter'                   => 'Bitter',
	'Black+Ops+One'            => 'Black Ops One',
	'Bokor'                    => 'Bokor',
	'Bonbon'                   => 'Bonbon',
	'Boogaloo'                 => 'Boogaloo',
	'Bowlby+One'               => 'Bowlby One',
	'Bowlby+One+SC'            => 'Bowlby One SC',
	'Brawler'                  => 'Brawler',
	'Bree+Serif'               => 'Bree Serif',
	'Bubblegum+Sans'           => 'Bubblegum Sans',
    'Bubbler+One'              => 'Bubbler One',
	'Buda'                     => 'Buda',
	'Buenard'                  => 'Buenard',
	'Butcherman'               => 'Butcherman',
	'Butterfly+Kids'           => 'Butterfly Kids',
	'Cabin'                    => 'Cabin',
	'Cabin+Condensed'          => 'Cabin Condensed',
	'Cabin+Sketch'             => 'Cabin Sketch',
	'Caesar+Dressing'          => 'Caesar Dressing',
	'Cagliostro'               => 'Cagliostro',
	'Calligraffitti'           => 'Calligraffitti',
	'Cambo'                    => 'Cambo',
	'Candal'                   => 'Candal',
	'Cantarell'                => 'Cantarell',
	'Cantata+One'              => 'Cantata One',
    'Cantora+One'              => 'Cantora One',
    'Capriola'                 => 'Capriola',
	'Cardo'                    => 'Cardo',
	'Carme'                    => 'Carme',
    'Carrois+Gothic'           => 'Carrois Gothic',
    'Carrois+Gothic+SC'        => 'Carrois Gothic SC',
	'Carter+One'               => 'Carter One',
	'Caudex'                   => 'Caudex',    
	'Cedarville Cursive'       => 'Cedarville Cursive',
	'Ceviche+One'              => 'Ceviche One',    
	'Changa+One'               => 'Changa One',
	'Chango'                   => 'Chango',
	'Chau+Philomene+One'       => 'Chau Philomene One',    
    'Chela+One'                => 'Chela One',
	'Chelsea+Market'           => 'Chelsea Market',
	'Chenla'                   => 'Chenla',    
	'Cherry+Cream+Soda'        => 'Cherry Cream Soda',
    'Cherry+Swash'             => 'Cherry Swash',
	'Chewy'                    => 'Chewy',
	'Chicle'                   => 'Chicle',
	'Chivo'                    => 'Chivo',  
    'Cinzel'                   => 'Cinzel', 
    'Cinzel+Decorative'        => 'Cinzel Decorative',     
	'Clicker+Script'           => 'Clicker Script',
	'Coda'                     => 'Coda',    
	'Coda+Caption'             => 'Coda Caption',
	'Codystar'                 => 'Codystar',
    'Combo'                    => 'Combo',
	'Comfortaa'                => 'Comfortaa',
	'Coming+Soon'              => 'Coming Soon',
	'Concert+One'              => 'Concert One',    
	'Condiment'                => 'Condiment',
	'Content'                  => 'Content',    
	'Contrail+One'             => 'Contrail One',
	'Convergence'              => 'Convergence',
	'Cookie'                   => 'Cookie',
	'Copse'                    => 'Copse',
	'Corben'                   => 'Corben',
    'Courgette'                => 'Courgette',
	'Cousine'                  => 'Cousine',
	'Coustard'                 => 'Coustard',
	'Covered+By+Your+Grace'    => 'Covered By Your Grace',
	'Crafty+Girls'             => 'Crafty Girls',
	'Creepster'                => 'Creepster',        
	'Crete+Round'              => 'Crete Round',
	'Crimson+Text'             => 'Crimson Text',
	'Croissant+One'            => 'Croissant One',    
	'Crushed'                  => 'Crushed',
	'Cuprum'                   => 'Cuprum',
	'Cutive'                   => 'Cutive', 
    'Cutive+Mono'              => 'Cutive Mono',
	'Damion'                   => 'Damion',
	'Dancing+Script'           => 'Dancing Script',
	'Dangrek'                  => 'Dangrek',
	'Dawning+Of+A+New+Day'     => 'Dawning of a New Day',
	'Days+One'                 => 'Days One',        
	'Delius'                   => 'Delius',
	'Delius+Swash+Caps'        => 'Delius Swash Caps',
	'Delius+Unicase'           => 'Delius Unicase',
	'Della+Respira'            => 'Della Respira',
    'Denk+One'                 => 'Denk One',
	'Devonshire'               => 'Devonshire',
	'Didact+Gothic'            => 'Didact Gothic',
	'Diplomata'                => 'Diplomata',
	'Diplomata+SC'             => 'Diplomata SC',
    'Domine'                   => 'Domine',
    'Donegal+One'              => 'Donegal One',
	'Doppio+One'               => 'Doppio One',
	'Dorsa'                    => 'Dorsa',
	'Dosis'                    => 'Dosis',    
	'Dr+Sugiyama'              => 'Dr Sugiyama',
	'Droid+Sans'               => 'Droid Sans',
	'Droid+Sans+Mono'          => 'Droid Sans Mono',
	'Droid+Serif'              => 'Droid Serif',
	'Duru+Sans'                => 'Duru Sans',
	'Dynalight'                => 'Dynalight',
    'Eagle+Lake'               => 'Eagle Lake',
	'Eater'                    => 'Eater',
	'EB+Garamond'              => 'EB Garamond',
	'Economica'                => 'Economica',
	'Electrolize'              => 'Electrolize',
    'Elsie'                    => 'Elsie',
    'Elsie+Swash+Caps'         => 'Elsie Swash Caps',
	'Emblema+One'              => 'Emblema One',
	'Emilys+Candy'             => 'Emilys Candy',    
	'Engagement'               => 'Engagement',
	'Englebert'                => 'Englebert',    
	'Enriqueta'                => 'Enriqueta',
	'Erica+One'                => 'Erica One',
	'Esteban'                  => 'Esteban',
	'Euphoria+Script'          => 'Euphoria Script',
	'Ewert'                    => 'Ewert',    
	'Exo'                      => 'Exo',
	'Expletus+Sans'            => 'Expletus Sans',
	'Fanwood+Text'             => 'Fanwood Text',
	'Fascinate'                => 'Fascinate',
	'Fascinate+Inline'         => 'Fascinate Inline',
    'Faster+One'               => 'Faster One',
	'Federant'                 => 'Federant',
	'Federo'                   => 'Federo',
	'Felipa'                   => 'Felipa',
    'Fenix'                    => 'Fenix',
    'Finger+Paint'             => 'Finger Paint',
	'Fjalla+One'               => 'Fjalla One',    
	'Fjord+One'                => 'Fjord One',
	'Flamenco'                 => 'Flamenco',
	'Flavors'                  => 'Flavors',
	'Fondamento'               => 'Fondamento',
	'Fontdiner+Swanky'         => 'Fontdiner Swanky',
	'Forum'                    => 'Forum',
	'Francois+One'             => 'Francois One',
    'Freckle+Face'             => 'Freckle Face',    
	'Fredericka+The+Great'     => 'Fredericka the Great',   
    'Fredoka+One'              => 'Fredoka One',
    'Freehand'                 => 'Freehand', 
	'Fresca'                   => 'Fresca',
	'Frijole'                  => 'Frijole',
	'Fruktur'                  => 'Fruktur',    
	'Fugaz+One'                => 'Fugaz One',
	'Gabriela'                 => 'Gabriela', 
    'Gafata'                   => 'Gafata',    
	'Galdeano'                 => 'Galdeano',
    'Galindo'                  => 'Galindo',
	'Gentium+Basic'            => 'Gentium Basic',
	'Gentium+Book+Basic'       => 'Gentium Book Basic',
	'Geo'                      => 'Geo',
	'Geostar'                  => 'Geostar',
	'Geostar+Fill'             => 'Geostar Fill',
	'Germania+One'             => 'Germania One',
	'GFS+Didot'                => 'GFS Didot',
	'GFS+Neohellenic'          => 'GFS Neohellenic',
	'Gilda+Display'            => 'Gilda Display',
    'Give+You+Glory'           => 'Give You Glory',
	'Glass+Antiqua'            => 'Glass Antiqua',
	'Glegoo'                   => 'Glegoo',
	'Gloria+Hallelujah'        => 'Gloria Hallelujah',
	'Goblin+One'               => 'Goblin One',
	'Gochi+Hand'               => 'Gochi Hand',
	'Gorditas'                 => 'Gorditas',
	'Goudy+Bookletter+1911'    => 'Goudy Bookletter 1911',
	'Graduate'                 => 'Graduate',
    'Grand+Hotel'              => 'Grand Hotel',
	'Gravitas+One'             => 'Gravitas One',
	'Great Vibes'              => 'Great Vibes',
    'Griffy'                   => 'Griffy',
	'Gruppo'                   => 'Gruppo',
	'Gudea'                    => 'Gudea',
	'Habibi'                   => 'Habibi',
	'Hammersmith+One'          => 'Hammersmith One',
	'Hanalei'                  => 'Hanalei',       
	'Hanalei+Fill'             => 'Hanalei Fill',    
	'Handlee'                  => 'Handlee',
	'Hanuman'                  => 'Hanuman',
	'Happy+Monkey'             => 'Happy Monkey',
    'Headland+One'             => 'Headland One',
	'Henny+Penny'              => 'Henny Penny',
	'Herr+Von+Muellerhoff'     => 'Herr Von Muellerhoff',
	'Holtwood+One+SC'          => 'Holtwood One SC',
	'Homemade+Apple'           => 'Homemade Apple',    
	'Homenaje'                 => 'Homenaje',
	'Iceberg'                  => 'Iceberg',
	'Iceland'                  => 'Iceland',
	'IM+Fell+Double+Pica'      => 'IM Fell Double Pica',
	'IM+Fell+Double+Pica+SC'   => 'IM Fell Double Pica SC',
	'IM+Fell+DW+Pica'          => 'IM Fell DW Pica',    
	'IM+Fell+DW+Pica+SC'       => 'IM Fell DW Pica SC',
	'IM+Fell+English'          => 'IM Fell English',
	'IM+Fell+English+SC'       => 'IM Fell English SC',
	'IM+Fell+French+Canon'     => 'IM Fell French Canon',
	'IM+Fell+French+Canon+SC'  => 'IM Fell French Canon SC',
	'IM+Fell+Great+Primer'     => 'IM Fell Great Primer',
	'IM+Fell+Great+Primer+SC'  => 'IM Fell Great Primer SC',
	'Imprima'                  => 'Imprima',
	'Inconsolata'              => 'Inconsolata',
	'Inder'                    => 'Inder',
	'Indie+Flower'             => 'Indie Flower',
	'Inika'                    => 'Inika',
	'Irish+Grover'             => 'Irish Grover',
	'Istok+Web'                => 'Istok Web',
	'Italiana'                 => 'Italiana',
	'Italianno'                => 'Italianno',
    'Jacques+Francois'         => 'Jacques Francois',
    'Jacques+Francois+Shadow'  => 'Jacques Francois Shadow',
	'Jim+Nightshade'           => 'Jim Nightshade',
	'Jockey+One'               => 'Jockey One',
	'Jolly Lodger'             => 'Jolly Lodger',
	'Josefin+Sans'             => 'Josefin Sans',
	'Josefin+Slab'             => 'Josefin Slab',
    'Joti+One'                 => 'Joti One',
	'Judson'                   => 'Judson',
	'Julee'                    => 'Julee',
    'Julius+Sans+One'          => 'Julius Sans One',
	'Junge'                    => 'Junge',
	'Jura'                     => 'Jura',
	'Just+Another+Hand'        => 'Just Another Hand',
	'Just+Me+Again+Down+Here'  => 'Just Me Again Down Here',
	'Kameron'                  => 'Kameron',
	'Karla'                    => 'Karla',
	'Kaushan+Script'           => 'Kaushan Script',
    'Kavoon'                   => 'Kavoon',
    'Keania+One'               => 'Keania One',
	'Kelly+Slab'               => 'Kelly Slab',
	'Kenia'                    => 'Kenia',
	'Khmer'                    => 'Khmer',
    'Kite+One'                 => 'Kite One',
	'Knewave'                  => 'Knewave',
	'Kotta+One'                => 'Kotta One',
	'Koulen'                   => 'Koulen',
	'Kranky'                   => 'Kranky',
	'Kreon'                    => 'Kreon',
	'Kristi'                   => 'Kristi',
	'Krona+One'                => 'Krona One',
	'La+Belle+Aurore'          => 'La Belle Aurore',
	'Lancelot'                 => 'Lancelot',
	'Lato'                     => 'Lato',
	'League+Script'            => 'League Script',
	'Leckerli+One'             => 'Leckerli One',
	'Ledger'                   => 'Ledger',
	'Lekton'                   => 'Lekton',
	'Lemon'                    => 'Lemon',
    'Libre+Baskerville'        => 'Libre Baskerville',
    'Life+Savers'              => 'Life Savers',
	'Lilita+One'               => 'Lilita One',
	'Limelight'                => 'Limelight',
	'Linden+Hill'              => 'Linden Hill',
	'Lobster'                  => 'Lobster',
	'Lobster+Two'              => 'Lobster Two',
	'Londrina+Outline'         => 'Londrina Outline',
	'Londrina+Shadow'          => 'Londrina Shadow',
	'Londrina+Sketch'          => 'Londrina Sketch',
	'Londrina+Solid'           => 'Londrina Solid',
	'Lora'                     => 'Lora',
	'Love+Ya+Like+A+Sister'    => 'Love Ya Like A Sister',
	'Loved+By+The+King'        => 'Loved by the King',
	'Lovers+Quarrel'           => 'Lovers Quarrel',
	'Luckiest+Guy'             => 'Luckiest Guy',
	'Lusitana'                 => 'Lusitana',
	'Lustria'                  => 'Lustria',
	'Macondo'                  => 'Macondo',
	'Macondo+Swash+Caps'       => 'Macondo Swash Caps',
	'Magra'                    => 'Magra',
	'Maiden+Orange'            => 'Maiden Orange',
	'Mako'                     => 'Mako',
    'Marcellus'                => 'Marcellus',
    'Marcellus+SC'             => 'Marcellus SC',
	'Marck+Script'             => 'Marck Script',
	'Margarine'                => 'Margarine',    
	'Marko+One'                => 'Marko One',
	'Marmelad'                 => 'Marmelad',
	'Marvel'                   => 'Marvel',
	'Mate'                     => 'Mate',
	'Mate+SC'                  => 'Mate SC',
	'Maven+Pro'                => 'Maven Pro',
    'McLaren'                  => 'McLaren',    
	'Meddon'                   => 'Meddon',
	'MedievalSharp'            => 'MedievalSharp',
	'Medula+One'               => 'Medula One',
	'Megrim'                   => 'Megrim',
    'Meie+Script'              => 'Meie Script',
    'Merienda'                 => 'Merienda',
	'Merienda+One'             => 'Merienda One',
	'Merriweather'             => 'Merriweather',
    'Merriweather+Sans'        => 'Merriweather Sans',
	'Metal'                    => 'Metal',
    'Metal Mania'              => 'Metal Mania',
	'Metamorphous'             => 'Metamorphous',
	'Metrophobic'              => 'Metrophobic',
	'Michroma'                 => 'Michroma',
	'Milonga'                  => 'Milonga',    
	'Miltonian'                => 'Miltonian',
	'Miltonian+Tattoo'         => 'Miltonian Tattoo',
	'Miniver'                  => 'Miniver',
	'Miss+Fajardose'           => 'Miss Fajardose',
	'Modern+Antiqua'           => 'Modern Antiqua',
	'Molengo'                  => 'Molengo',
    'Molle'                    => 'Molle',
	'Monda'                    => 'Monda',    
	'Monofett'                 => 'Monofett',
	'Monoton'                  => 'Monoton',
	'Monsieur+La+Doulaise'     => 'Monsieur La Doulaise',
	'Montaga'                  => 'Montaga',
	'Montez'                   => 'Montez',
	'Montserrat'               => 'Montserrat',
    'Montserrat+Alternates'    => 'Montserrat Alternates',
    'Montserrat+Subrayada'     => 'Montserrat Subrayada',
	'Moul'                     => 'Moul',
	'Moulpali'                 => 'Moulpali',
	'Mountains+of+Christmas'   => 'Mountains of Christmas',
	'Mouse+Memoirs'            => 'Mouse Memoirs',    
	'Mr+Bedfort'               => 'Mr Bedfort',
	'Mr+Dafoe'                 => 'Mr Dafoe',
	'Mr+De+Haviland'           => 'Mr De Haviland',
	'Mrs+Saint+Delafield'      => 'Mrs Saint Delafield',
	'Mrs+Sheppards'            => 'Mrs Sheppards',
	'Muli'                     => 'Muli',
	'Mystery+Quest'            => 'Mystery Quest',
	'Neucha'                   => 'Neucha',
	'Neuton'                   => 'Neuton',
    'New+Rocker'               => 'New Rocker',    
	'News+Cycle'               => 'News Cycle',
	'Niconne'                  => 'Niconne',
	'Nixie+One'                => 'Nixie One',
	'Nobile'                   => 'Nobile',
	'Nokora'                   => 'Nokora',
	'Norican'                  => 'Norican',
	'Nosifer'                  => 'Nosifer',
	'Nothing+You+Could+Do'     => 'Nothing You Could Do',
	'Noticia+Text'             => 'Noticia Text',
	'Noto+Sans'                => 'Noto Sans',
	'Noto+Serif'               => 'Noto Serif',          
	'Nova+Cut'                 => 'Nova Cut',
	'Nova+Flat'                => 'Nova Flat',
	'Nova+Mono'                => 'Nova Mono',
	'Nova+Oval'                => 'Nova Oval',
	'Nova+Round'               => 'Nova Round',
	'Nova+Script'              => 'Nova Script',
	'Nova+Slim'                => 'Nova Slim',
	'Nova+Square'              => 'Nova Square',
	'Numans'                   => 'Numans',
	'Nunito'                   => 'Nunito',
	'Odor+Mean+Chey'           => 'Odor Mean Chey',
    'Offside'                  => 'Offside',
	'Old+Standard+TT'          => 'Old Standard TT',
	'Oldenburg'                => 'Oldenburg',
	'Oleo+Script'              => 'Oleo Script',
 	'Oleo+Script+Swash+Caps'   => 'Oleo Script Swash Caps',   
	'Open+Sans'                => 'Open Sans',
	'Open+Sans+Condensed'      => 'Open Sans Condensed',
    'Oranienbaum'              => 'Oranienbaum',
	'Orbitron'                 => 'Orbitron',
    'Oregano'                  => 'Oregano',
    'Orienta'                  => 'Orienta',
	'Original+Surfer'          => 'Original Surfer',
	'Oswald'                   => 'Oswald',
	'Over+the+Rainbow'         => 'Over the Rainbow',
	'Overlock'                 => 'Overlock',
	'Overlock+SC'              => 'Overlock SC',
	'Ovo'                      => 'Ovo',
	'Oxygen'                   => 'Oxygen',
    'Oxygen+Mono'              => 'Oxygen Mono',
	'Pacifico'                 => 'Pacifico',
    'Paprika'                  => 'Paprika',
	'Parisienne'               => 'Parisienne',
	'Passero+One'              => 'Passero One',
	'Passion+One'              => 'Passion One',
	'Patrick+Hand'             => 'Patrick Hand',
    'Patrick+Hand+SC'          => 'Patrick Hand SC',
	'Patua+One'                => 'Patua One',
	'Paytone+One'              => 'Paytone One',
    'Peralta'                  => 'Peralta',
	'Permanent+Marker'         => 'Permanent Marker',
    'Petit+Formal+Script'      => 'Petit Formal Script',
	'Petrona'                  => 'Petrona',
	'Philosopher'              => 'Philosopher',
	'Piedra'                   => 'Piedra',
	'Pinyon+Script'            => 'Pinyon Script',
    'Pirata+One'               => 'Pirata One',
	'Plaster'                  => 'Plaster',
	'Play'                     => 'Play',
	'Playball'                 => 'Playball',
	'Playfair+Display'         => 'Playfair Display',
    'Playfair+Display+SC'      => 'Playfair Display SC',
	'Podkova'                  => 'Podkova',
	'Poiret+One'               => 'Poiret One',
	'Poller+One'               => 'Poller One',
	'Poly'                     => 'Poly',
	'Pompiere'                 => 'Pompiere',
	'Pontano+Sans'             => 'Pontano Sans',
	'Port+Lligat+Sans'         => 'Port Lligat Sans',
	'Port+Lligat+Slab'         => 'Port Lligat Slab',
	'Prata'                    => 'Prata',
	'Preahvihear'              => 'Preahvihear',
	'Press+Start+2P'           => 'Press Start 2P',
	'Princess+Sofia'           => 'Princess Sofia',
	'Prociono'                 => 'Prociono',
	'Prosto+One'               => 'Prosto One',
	'PT+Mono'                  => 'PT Mono',
	'PT+Sans'                  => 'PT Sans',
	'PT+Sans+Caption'          => 'PT Sans Caption',
	'PT+Sans+Narrow'           => 'PT Sans Narrow',
	'PT+Serif'                 => 'PT Serif',
	'PT+Serif+Caption'         => 'PT Serif Caption',
	'Puritan'                  => 'Puritan',
    'Purple+Purse'             => 'Purple Purse',
    'Quando'                   => 'Quando',
	'Quantico'                 => 'Quantico',
	'Quattrocento'             => 'Quattrocento',
	'Quattrocento+Sans'        => 'Quattrocento Sans',
	'Questrial'                => 'Questrial',
	'Quicksand'                => 'Quicksand',
	'Quintessential'           => 'Quintessential',    
	'Qwigley'                  => 'Qwigley',
    'Racing+Sans+One'          => 'Racing Sans One',
	'Radley'                   => 'Radley',
	'Raleway'                  => 'Raleway',
    'Raleway+Dots'             => 'Raleway Dots',
    'Rambla'                   => 'Rambla',
	'Rammetto+One'             => 'Rammetto One',
    'Ranchers'                 => 'Ranchers',
	'Rancho'                   => 'Rancho',
	'Rationale'                => 'Rationale',
	'Redressed'                => 'Redressed',
	'Reenie+Beanie'            => 'Reenie Beanie',
	'Revalia'                  => 'Revalia',
	'Ribeye'                   => 'Ribeye',
	'Ribeye+Marrow'            => 'Ribeye Marrow',
	'Righteous'                => 'Righteous',
	'Risque'                   => 'Risque',
	'Roboto'                   => 'Roboto',
    'Roboto+Condensed'         => 'Roboto Condensed',          
	'Rochester'                => 'Rochester',
	'Rock+Salt'                => 'Rock Salt',
	'Rokkitt'                  => 'Rokkitt',
    'Romanesco'                => 'Romanesco',
	'Ropa+Sans'                => 'Ropa Sans',
	'Rosario'                  => 'Rosario',
	'Rosarivo'                 => 'Rosarivo',
	'Rouge+Script'             => 'Rouge Script',
	'Ruda'                     => 'Ruda',
    'Rufina'                   => 'Rufina',
	'Ruge+Boogie'              => 'Ruge Boogie',
	'Ruluko'                   => 'Ruluko',
	'Rum+Raisin'               => 'Rum Raisin',    
	'Ruslan+Display'           => 'Ruslan Display',
	'Russo+One'                => 'Russo One',
	'Ruthie'                   => 'Ruthie',
    'Rye'                      => 'Rye',
    'Sacramento'               => 'Sacramento',
	'Sail'                     => 'Sail',
	'Salsa'                    => 'Salsa',
    'Sanchez'                  => 'Sanchez',
	'Sancreek'                 => 'Sancreek',
	'Sansita+One'              => 'Sansita One',
	'Sarina'                   => 'Sarina',
	'Satisfy'                  => 'Satisfy',
    'Scada'                    => 'Scada',
	'Schoolbell'               => 'Schoolbell',
	'Seaweed+Script'           => 'Seaweed Script',
	'Sevillana'                => 'Sevillana',
    'Seymour+One'              => 'Seymour One',
	'Shadows+Into+Light'       => 'Shadows Into Light',
	'Shadows+Into+Light+Two'   => 'Shadows Into Light Two',
	'Shanti'                   => 'Shanti',
	'Share'                    => 'Share',
    'Share+Tech'               => 'Share Tech',
    'Share+Tech+Mono'          => 'Share Tech Mono',
	'Shojumaru'                => 'Shojumaru',
	'Short+Stack'              => 'Short Stack',
	'Siemreap'                 => 'Siemreap',
	'Sigmar+One'               => 'Sigmar One',
	'Signika'                  => 'Signika',
	'Signika+Negative'         => 'Signika Negative',
	'Simonetta'                => 'Simonetta',
	'Sintony'                  => 'Sintony',    
	'Sirin+Stencil'            => 'Sirin Stencil',
	'Six+Caps'                 => 'Six Caps',
    'Skranji'                  => 'Skranji',
	'Slackey'                  => 'Slackey',
	'Smokum'                   => 'Smokum',
	'Smythe'                   => 'Smythe',
	'Sniglet'                  => 'Sniglet',
	'Snippet'                  => 'Snippet',
	'Snowburst+One'            => 'Snowburst One',  
    'Sofadi+One'               => 'Sofadi One',  
	'Sofia'                    => 'Sofia',
	'Sonsie+One'               => 'Sonsie One',
	'Sorts+Mill+Goudy'         => 'Sorts Mill Goudy',
    'Source+Code+Pro'          => 'Source Code Pro',
    'Source+Sans+Pro'          => 'Source Sans Pro',
	'Special+Elite'            => 'Special Elite',
	'Spicy+Rice'               => 'Spicy Rice',
	'Spinnaker'                => 'Spinnaker',
	'Spirax'                   => 'Spirax',
	'Squada+One'               => 'Squada One',
	'Stalemate'                => 'Stalemate',
    'Stalinist+One'            => 'Stalinist One',        
	'Stardos+Stencil'          => 'Stardos Stencil',
	'Stint+Ultra+Condensed'    => 'Stint Ultra Condensed',
	'Stint+Ultra+Expanded'     => 'Stint Ultra Expanded',
	'Stoke'                    => 'Stoke',
    'Strait'                   => 'Strait',
	'Sue+Ellen+Francisco'      => 'Sue Ellen Francisco',
	'Sunshiney'                => 'Sunshiney',
	'Supermercado+One'         => 'Supermercado One',
	'Suwannaphum'              => 'Suwannaphum',
	'Swanky+And+Moo+Moo'       => 'Swanky and Moo Moo',
	'Syncopate'                => 'Syncopate',
	'Tangerine'                => 'Tangerine',
	'Taprom'                   => 'Taprom',
	'Tauri'                    => 'Tauri',    
	'Telex'                    => 'Telex',
	'Tenor+Sans'               => 'Tenor Sans',
	'Terminal+Dosis'           => 'Terminal Dosis',
    'Text+Me+One'              => 'Text Me One',
	'The+Girl+Next+Door'       => 'The Girl Next Door',
	'Tienne'                   => 'Tienne',
	'Tinos'                    => 'Tinos',
	'Titan+One'                => 'Titan One',
    'Titillium+Web'            => 'Titillium Web',
	'Trade+Winds'              => 'Trade Winds',
	'Trocchi'                  => 'Trocchi',
	'Trochut'                  => 'Trochut',
	'Trykker'                  => 'Trykker',
	'Tulpen+One'               => 'Tulpen One',
	'Ubuntu'                   => 'Ubuntu',
	'Ubuntu+Condensed'         => 'Ubuntu Condensed',
	'Ubuntu+Mono'              => 'Ubuntu Mono',
	'Ultra'                    => 'Ultra',
	'Uncial+Antiqua'           => 'Uncial Antiqua',
    'Underdog'                 => 'Underdog',
    'Unica+One'                => 'Unica One',
	'UnifrakturCook'           => 'UnifrakturCook',
	'UnifrakturMaguntia'       => 'UnifrakturMaguntia',
	'Unkempt'                  => 'Unkempt',
	'Unlock'                   => 'Unlock',
	'Unna'                     => 'Unna',
	'Vampiro+One'              => 'Vampiro One',    
	'Varela'                   => 'Varela',
	'Varela+Round'             => 'Varela Round',
	'Vast+Shadow'              => 'Vast Shadow',
	'Vibur'                    => 'Vibur',
	'Vidaloka'                 => 'Vidaloka',
	'Viga'                     => 'Viga',
	'Voces'                    => 'Voces',
	'Volkhov'                  => 'Volkhov',
	'Vollkorn'                 => 'Vollkorn',
	'Voltaire'                 => 'Voltaire',
	'VT323'                    => 'VT323',
	'Waiting+for+the+Sunrise'  => 'Waiting for the Sunrise',
	'Wallpoet'                 => 'Wallpoet',
	'Walter+Turncoat'          => 'Walter Turncoat',
    'Warnes'                   => 'Warnes',
	'Wellfleet'                => 'Wellfleet',
	'Wendy+One'                => 'Wendy One',    
	'Wire+One'                 => 'Wire One',
	'Yanone+Kaffeesatz'        => 'Yanone Kaffeesatz',
	'Yellowtail'               => 'Yellowtail',
	'Yeseva+One'               => 'Yeseva One',
	'Yesteryear'               => 'Yesteryear',
	'Zeyada'                   => 'Zeyada',
	); 
?>

<style type="text/css">
.color {border:1px solid #CCC;border-radius:2px;margin-top:5px;padding:3px 4px 4px;}
.k_help {color:#999999;font-size:12px;padding-left:5px;}
span.k_help_tip {margin-left:8px;padding:4px 9px 3px;border-radius:100%;background-color:#add472;color:#FFF;font-weight:bold;}
span.k_help_tip a {color:#FFF;font-size:12px;font-weight:bold;text-decoration:none;}
span.k_tooltip {cursor:pointer;}
.k_sep {background-color:#F7F7F7;}
.ptn {position:relative;width:40px;height:40px;float:left;margin-right:5px;margin-bottom:5px;}
.ptn_nr {position:absolute;bottom:0px;right:3px;}
.prod_l {position:relative;width:81px;height:63px;float:left;margin-right:25px;margin-bottom:20px;}
.prod_l_nr {position:absolute;bottom:-17px;right:0px;}
table.form {margin-bottom:0;}
table.form div {text-align:left}
table.form b {color:#003A88;font-size:13px}
table.form > tbody > tr > td:first-child {text-align:right}
a.link {text-decoration:none; margin-left:15px; margin-right:15px;}
.htabs {margin-top:15px;}
table.form {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}
table.form > tbody > tr > td:first-child {
	width: 200px;
}
table.form > tbody > tr > td {
	padding: 10px;
	color: #000000;
	border-bottom: 1px dotted #CCCCCC;
}
label.control-label span:after {
	display: none;
}
fieldset legend {
	padding: 20px 0 15px;
}
legend.bn {
	border-color: #FFFFFF;
	padding: 0;
}
legend span {
	font-size: 12px;
}
</style>    

<?php echo $column_left; ?>




<div id="content">


  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-up-theme" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
	</div>
    <div class="panel-body">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-up-theme">
    


        <div style="margin-top:10px; margin-bottom:25px;">
		
            <span style="margin-left:50px;">Useful links:</span> 
            <a href="http://321cart.com/up/documentation/" class="link" target="_blank">UP Documentation</a> | 
            <a href="http://321cart.com/up/" class="link" target="_blank">UP Demos</a> | 
            <a href="http://321cart.com/support/up-theme/" class="link" target="_blank">UP Support</a>
            <span class="k_help_tip k_tooltip" title="If you need help, please contact us. We provide support only through our UP Theme Support System." data-toggle="tooltip">?</span>

		</div>

    
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-colors" data-toggle="tab">Colors and Styles</a></li>
          <li><a href="#tab-backgrounds" data-toggle="tab">Background Images</a></li>
          <li><a href="#tab-fonts" data-toggle="tab">Fonts</a></li>
          <li><a href="#tab-skins" data-toggle="tab">Extra Skins</a></li>
        </ul>
        
        <div class="tab-content">
        <!-- -->


        <div class="tab-pane active" id="tab-colors"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-2">    
        <ul id="colors_settings_tabs" class="nav nav-pills nav-stacked">
             <li class="active"><a href="#tab-colors-general" data-toggle="tab">General</a></li>     
             <li><a href="#tab-colors-layout" data-toggle="tab">Layout</a></li>
             <li><a href="#tab-colors-header" data-toggle="tab">Header</a></li>
             <li><a href="#tab-colors-menu" data-toggle="tab">Main Menu</a></li>
             <li><a href="#tab-colors-midsection" data-toggle="tab">Midsection</a></li>
             <li><a href="#tab-colors-footer" data-toggle="tab">Footer</a></li>
             <li><a href="#tab-colors-prices" data-toggle="tab">Prices</a></li>
             <li><a href="#tab-colors-buttons" data-toggle="tab">Buttons</a></li>
             <li><a href="#tab-colors-dropdowns" data-toggle="tab">Dropdowns</a></li>
             <li><a href="#tab-colors-modal" data-toggle="tab">Modal</a></li>
        </ul> 
        </div>
        
        <div class="col-sm-10">
        <div class="tab-content">
        
        <div id="tab-colors-general" class="tab-pane fade in active"> 
        
                    <fieldset> 
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Body background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_body_bg_color" id="t1d_body_bg_color" value="<?php echo $t1d_body_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_01.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Headings color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_headings_color" id="t1d_headings_color" value="<?php echo $t1d_headings_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_02.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show headings border bottom: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_03.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_headings_border_status" id="t1d_headings_border_status" class="form-control">
									<option value="1"<?php if($t1d_headings_border_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_headings_border_status == '0') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Headings border bottom color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_headings_border_color" id="t1d_headings_border_color" value="<?php echo $t1d_headings_border_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Body text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_body_text_color" id="t1d_body_text_color" value="<?php echo $t1d_body_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_04.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Light text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_light_text_color" id="t1d_light_text_color" value="<?php echo $t1d_light_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_05.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Other links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_other_links_color" id="t1d_other_links_color" value="<?php echo $t1d_other_links_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_06.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_links_hover_color" id="t1d_links_hover_color" value="<?php echo $t1d_links_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Others Icons color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_icons_color" id="t1d_icons_color" value="<?php echo $t1d_icons_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_07.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Others Icons color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_icons_hover_color" id="t1d_icons_hover_color" value="<?php echo $t1d_icons_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Product Images style: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_08.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_img_style" id="t1d_img_style" class="form-control">
									<option value="normal"<?php if($t1d_img_style == 'normal') echo ' selected="selected"';?>>Normal</option>
                                    <option value="thumbnail-theme"<?php if($t1d_img_style == 'thumbnail-theme') echo ' selected="selected"';?>>With Border</option> 
								</select>
							</div>
						</div>

                    </fieldset> 

        </div>

        <div id="tab-colors-layout" class="tab-pane"> 

                    <fieldset> 

                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Wrapper Frame color:<br /><span class="k_help">(only for "Framed" and "Full Width + Border" layout styles)</span>
                            </label>
							<div class="col-sm-10">
								<input type="text" name="t1d_wrapper_frame_bg_color" id="t1d_wrapper_frame_bg_color" value="<?php echo $t1d_wrapper_frame_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_09.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend>Content Column<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_10.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_content_column_bg_color" id="t1d_content_column_bg_color" value="<?php echo $t1d_content_column_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Highlighted Items background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_content_column_hli_bg_color" id="t1d_content_column_hli_bg_color" value="<?php echo $t1d_content_column_hli_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_11.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Highlighted Buy Column on the Product Page: 
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_12.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_content_column_hli_buy_column" id="t1d_content_column_hli_buy_column" class="form-control">
									<option value="1"<?php if($t1d_content_column_hli_buy_column == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_content_column_hli_buy_column == '0') echo ' selected="selected"';?><?php if($t1d_content_column_hli_buy_column == '') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
						</div>                   
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1d_content_column_separator_color" id="t1d_content_column_separator_color" value="<?php echo $t1d_content_column_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_13.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Active Tab border top color:</label>
                            <div class="col-sm-10">
								<input type="text" name="t1d_content_column_active_tab_border_color" id="t1d_content_column_active_tab_border_color" value="<?php echo $t1d_content_column_active_tab_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_14.jpg" target="_blank">?</a></span>
							</div>
						</div>  
                        
                        <legend>Left Column Heading</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Heading background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_head_bg_color" id="t1d_left_column_head_bg_color" value="<?php echo $t1d_left_column_head_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_15.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_head_title_color" id="t1d_left_column_head_title_color" value="<?php echo $t1d_left_column_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_16.jpg" target="_blank">?</a></span>
							</div>
						</div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_left_column_head_border_status" id="t1d_left_column_head_border_status" class="form-control">
								    <option value="1"<?php if($t1d_left_column_head_border_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_left_column_head_border_status == '0') echo ' selected="selected"';?>>No</option>         
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_left_column_head_border_size" id="t1d_left_column_head_border_size" class="form-control">
								    <option value="1"<?php if($t1d_left_column_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_left_column_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_left_column_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_left_column_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_left_column_head_border_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_left_column_head_border_color" id="t1d_left_column_head_border_color" value="<?php echo $t1d_left_column_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_17.jpg" target="_blank">?</a></span>

							</div>
						</div>
                        
                        <legend>Left Column Box</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Box background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_box_bg_color" id="t1d_left_column_box_bg_color" value="<?php echo $t1d_left_column_box_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_18.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_box_links_color" id="t1d_left_column_box_links_color" value="<?php echo $t1d_left_column_box_links_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_19.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_box_links_color_hover" id="t1d_left_column_box_links_color_hover" value="<?php echo $t1d_left_column_box_links_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_box_text_color" id="t1d_left_column_box_text_color" value="<?php echo $t1d_left_column_box_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_20.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_left_column_box_separator_color" id="t1d_left_column_box_separator_color" value="<?php echo $t1d_left_column_box_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_21.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend>Right Column Heading</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Heading background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_head_bg_color" id="t1d_right_column_head_bg_color" value="<?php echo $t1d_right_column_head_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_head_title_color" id="t1d_right_column_head_title_color" value="<?php echo $t1d_right_column_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_right_column_head_border_status" id="t1d_right_column_head_border_status" class="form-control">
								    <option value="1"<?php if($t1d_right_column_head_border_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_right_column_head_border_status == '0') echo ' selected="selected"';?>>No</option>       
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_right_column_head_border_size" id="t1d_right_column_head_border_size" class="form-control">
								    <option value="1"<?php if($t1d_right_column_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_right_column_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_right_column_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_right_column_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_right_column_head_border_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_right_column_head_border_color" id="t1d_right_column_head_border_color" value="<?php echo $t1d_right_column_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Right Column Box</legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Box background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_box_bg_color" id="t1d_right_column_box_bg_color" value="<?php echo $t1d_right_column_box_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_box_links_color" id="t1d_right_column_box_links_color" value="<?php echo $t1d_right_column_box_links_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_box_links_color_hover" id="t1d_right_column_box_links_color_hover" value="<?php echo $t1d_right_column_box_links_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_box_text_color" id="t1d_right_column_box_text_color" value="<?php echo $t1d_right_column_box_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_right_column_box_separator_color" id="t1d_right_column_box_separator_color" value="<?php echo $t1d_right_column_box_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Category Box Heading</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Heading background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_head_bg_color" id="t1d_category_box_head_bg_color" value="<?php echo $t1d_category_box_head_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_22.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_head_title_color" id="t1d_category_box_head_title_color" value="<?php echo $t1d_category_box_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_23.jpg" target="_blank">?</a></span>
							</div>
						</div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_category_box_head_border_status" id="t1d_category_box_head_border_status" class="form-control">
								    <option value="1"<?php if($t1d_category_box_head_border_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_category_box_head_border_status == '0') echo ' selected="selected"';?>>No</option>  
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_category_box_head_border_size" id="t1d_category_box_head_border_size" class="form-control">
								    <option value="1"<?php if($t1d_category_box_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_category_box_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_category_box_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_category_box_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_category_box_head_border_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_category_box_head_border_color" id="t1d_category_box_head_border_color" value="<?php echo $t1d_category_box_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_24.jpg" target="_blank">?</a></span>

							</div>
						</div>
                        
                        <legend>Category Box Content</legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Box background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_box_bg_color" id="t1d_category_box_box_bg_color" value="<?php echo $t1d_category_box_box_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_25.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Categories links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_box_links_color" id="t1d_category_box_box_links_color" value="<?php echo $t1d_category_box_box_links_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_26.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Categories links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_box_links_color_hover" id="t1d_category_box_box_links_color_hover" value="<?php echo $t1d_category_box_box_links_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subcategories links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_box_subcat_color" id="t1d_category_box_box_subcat_color" value="<?php echo $t1d_category_box_box_subcat_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_27.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_category_box_box_separator_color" id="t1d_category_box_box_separator_color" value="<?php echo $t1d_category_box_box_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_28.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend>Filter Box Heading</legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Heading background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_head_bg_color" id="t1d_filter_box_head_bg_color" value="<?php echo $t1d_filter_box_head_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_29.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_head_title_color" id="t1d_filter_box_head_title_color" value="<?php echo $t1d_filter_box_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_30.jpg" target="_blank">?</a></span>
							</div>
						</div> 
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_filter_box_head_border_status" id="t1d_filter_box_head_border_status" class="form-control">
								    <option value="1"<?php if($t1d_filter_box_head_border_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_filter_box_head_border_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_filter_box_head_border_size" id="t1d_filter_box_head_border_size" class="form-control">
								    <option value="1"<?php if($t1d_filter_box_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_filter_box_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_filter_box_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_filter_box_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_filter_box_head_border_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_filter_box_head_border_color" id="t1d_filter_box_head_border_color" value="<?php echo $t1d_filter_box_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_31.jpg" target="_blank">?</a></span>

							</div>
						</div>
                        
                        <legend>Filter Box Content</legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Box background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_box_bg_color" id="t1d_filter_box_box_bg_color" value="<?php echo $t1d_filter_box_box_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_32.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Filter Title color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_box_filter_title_color" id="t1d_filter_box_box_filter_title_color" value="<?php echo $t1d_filter_box_box_filter_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_33.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Filter Name color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_box_filter_name_color" id="t1d_filter_box_box_filter_name_color" value="<?php echo $t1d_filter_box_box_filter_name_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_34.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Filter Name color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_box_filter_name_color_hover" id="t1d_filter_box_box_filter_name_color_hover" value="<?php echo $t1d_filter_box_box_filter_name_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_filter_box_box_separator_color" id="t1d_filter_box_box_separator_color" value="<?php echo $t1d_filter_box_box_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_35.jpg" target="_blank">?</a></span>
							</div>
						</div>

                    </fieldset>

        </div>
        
        <div id="tab-colors-header" class="tab-pane"> 

                    <fieldset>  

                    <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color: <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_36.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_top_area_status" id="t1d_top_area_status" class="form-control">
								    <option value="1"<?php if($t1d_top_area_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_top_area_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_bg_color" id="t1d_top_area_bg_color" value="<?php echo $t1d_top_area_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Fixed Header<br />background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_mini_bg_color" id="t1d_top_area_mini_bg_color" value="<?php echo $t1d_top_area_mini_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_37.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icons color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_icons_color" id="t1d_top_area_icons_color" value="<?php echo $t1d_top_area_icons_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_38.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icons color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_icons_color_hover" id="t1d_top_area_icons_color_hover" value="<?php echo $t1d_top_area_icons_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_link_color" id="t1d_top_area_link_color" value="<?php echo $t1d_top_area_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_39.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_link_color_hover" id="t1d_top_area_link_color_hover" value="<?php echo $t1d_top_area_link_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show separator: <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_40.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_top_area_separator_status" id="t1d_top_area_separator_status" class="form-control">
								    <option value="1"<?php if($t1d_top_area_separator_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_top_area_separator_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_separator_color" id="t1d_top_area_separator_color" value="<?php echo $t1d_top_area_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Top Bar</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color: <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_41.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_top_area_tb_bg_status" id="t1d_top_area_tb_bg_status" class="form-control">
								    <option value="1"<?php if($t1d_top_area_tb_bg_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_top_area_tb_bg_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_bg_color" id="t1d_top_area_tb_bg_color" value="<?php echo $t1d_top_area_tb_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show border bottom: <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_42.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_top_area_tb_bottom_border_status" id="t1d_top_area_tb_bottom_border_status" class="form-control">
								    <option value="1"<?php if($t1d_top_area_tb_bottom_border_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_top_area_tb_bottom_border_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_bottom_border_color" id="t1d_top_area_tb_bottom_border_color" value="<?php echo $t1d_top_area_tb_bottom_border_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_text_color" id="t1d_top_area_tb_text_color" value="<?php echo $t1d_top_area_tb_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_43.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_link_color" id="t1d_top_area_tb_link_color" value="<?php echo $t1d_top_area_tb_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_44.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_link_color_hover" id="t1d_top_area_tb_link_color_hover" value="<?php echo $t1d_top_area_tb_link_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icons color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_icons_color" id="t1d_top_area_tb_icons_color" value="<?php echo $t1d_top_area_tb_icons_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_45.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_top_area_tb_separator_color" id="t1d_top_area_tb_separator_color" value="<?php echo $t1d_top_area_tb_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_46.jpg" target="_blank">?</a></span>
							</div>
						</div>

                    </fieldset>

        </div>
        
        <div id="tab-colors-menu" class="tab-pane"> 

                    <fieldset>  

                        <legend>Main Menu Bar</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm_bg_color_status" id="t1d_mm_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm_bg_color_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_bg_color" id="t1d_mm_bg_color" value="<?php echo $t1d_mm_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_47.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_mm_separator_status" id="t1d_mm_separator_status" class="form-control">
								    <option value="1"<?php if($t1d_mm_separator_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm_separator_status == '0') echo ' selected="selected"';?><?php if($t1d_mm_separator_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_mm_separator_size" id="t1d_mm_separator_size" class="form-control">
								    <option value="1"<?php if($t1d_mm_separator_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_mm_separator_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_mm_separator_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_mm_separator_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_mm_separator_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_mm_separator_color" id="t1d_mm_separator_color" value="<?php echo $t1d_mm_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_48.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border top:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_mm_border_top_status" id="t1d_mm_border_top_status" class="form-control">
								    <option value="1"<?php if($t1d_mm_border_top_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm_border_top_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_mm_border_top_size" id="t1d_mm_border_top_size" class="form-control">
								    <option value="1"<?php if($t1d_mm_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_mm_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_mm_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_mm_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_mm_border_top_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_mm_border_top_color" id="t1d_mm_border_top_color" value="<?php echo $t1d_mm_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_49.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border bottom:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_mm_border_bottom_status" id="t1d_mm_border_bottom_status" class="form-control">
								    <option value="1"<?php if($t1d_mm_border_bottom_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm_border_bottom_status == '0') echo ' selected="selected"';?><?php if($t1d_mm_border_bottom_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_mm_border_bottom_size" id="t1d_mm_border_bottom_size" class="form-control">
								    <option value="1"<?php if($t1d_mm_border_bottom_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_mm_border_bottom_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_mm_border_bottom_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_mm_border_bottom_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_mm_border_bottom_size == '5') echo ' selected="selected"';?>>5</option>
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_mm_border_bottom_color" id="t1d_mm_border_bottom_color" value="<?php echo $t1d_mm_border_bottom_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_50.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Item hover top bar color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_hover_border_top_color" id="t1d_mm_hover_border_top_color" value="<?php echo $t1d_mm_hover_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_51.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend>Home Page Link</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm1_bg_color_status" id="t1d_mm1_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm1_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm1_bg_color_status == '0') echo ' selected="selected"';?><?php if($t1d_mm1_bg_color_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm1_bg_color" id="t1d_mm1_bg_color" value="<?php echo $t1d_mm1_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_52.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm1_bg_hover_color" id="t1d_mm1_bg_hover_color" value="<?php echo $t1d_mm1_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm1_link_color" id="t1d_mm1_link_color" value="<?php echo $t1d_mm1_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_53.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm1_link_hover_color" id="t1d_mm1_link_hover_color" value="<?php echo $t1d_mm1_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Categories Section</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm2_bg_color_status" id="t1d_mm2_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm2_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm2_bg_color_status == '0') echo ' selected="selected"';?><?php if($t1d_mm2_bg_color_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm2_bg_color" id="t1d_mm2_bg_color" value="<?php echo $t1d_mm2_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm2_bg_hover_color" id="t1d_mm2_bg_hover_color" value="<?php echo $t1d_mm2_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm2_link_color" id="t1d_mm2_link_color" value="<?php echo $t1d_mm2_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm2_link_hover_color" id="t1d_mm2_link_hover_color" value="<?php echo $t1d_mm2_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Brands Section</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm3_bg_color_status" id="t1d_mm3_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm3_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm3_bg_color_status == '0') echo ' selected="selected"';?><?php if($t1d_mm3_bg_color_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm3_bg_color" id="t1d_mm3_bg_color" value="<?php echo $t1d_mm3_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm3_bg_hover_color" id="t1d_mm3_bg_hover_color" value="<?php echo $t1d_mm3_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm3_link_color" id="t1d_mm3_link_color" value="<?php echo $t1d_mm3_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm3_link_hover_color" id="t1d_mm3_link_hover_color" value="<?php echo $t1d_mm3_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Custom Links Section</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm4_bg_color_status" id="t1d_mm4_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm4_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm4_bg_color_status == '0') echo ' selected="selected"';?><?php if($t1d_mm4_bg_color_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm4_bg_color" id="t1d_mm4_bg_color" value="<?php echo $t1d_mm4_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm4_bg_hover_color" id="t1d_mm4_bg_hover_color" value="<?php echo $t1d_mm4_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm4_link_color" id="t1d_mm4_link_color" value="<?php echo $t1d_mm4_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm4_link_hover_color" id="t1d_mm4_link_hover_color" value="<?php echo $t1d_mm4_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Custom Menu Section</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm5_bg_color_status" id="t1d_mm5_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm5_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm5_bg_color_status == '0') echo ' selected="selected"';?><?php if($t1d_mm5_bg_color_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm5_bg_color" id="t1d_mm5_bg_color" value="<?php echo $t1d_mm5_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm5_bg_hover_color" id="t1d_mm5_bg_hover_color" value="<?php echo $t1d_mm5_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm5_link_color" id="t1d_mm5_link_color" value="<?php echo $t1d_mm5_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm5_link_hover_color" id="t1d_mm5_link_hover_color" value="<?php echo $t1d_mm5_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Custom Blocks Section</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_mm6_bg_color_status" id="t1d_mm6_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_mm6_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm6_bg_color_status == '0') echo ' selected="selected"';?><?php if($t1d_mm6_bg_color_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm6_bg_color" id="t1d_mm6_bg_color" value="<?php echo $t1d_mm6_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm6_bg_hover_color" id="t1d_mm6_bg_hover_color" value="<?php echo $t1d_mm6_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm6_link_color" id="t1d_mm6_link_color" value="<?php echo $t1d_mm6_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm6_link_hover_color" id="t1d_mm6_link_hover_color" value="<?php echo $t1d_mm6_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Sub-Menu</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_sub_bg_color" id="t1d_mm_sub_bg_color" value="<?php echo $t1d_mm_sub_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_54.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Highlighted Items background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_sub_titles_bg_color" id="t1d_mm_sub_titles_bg_color" value="<?php echo $t1d_mm_sub_titles_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_55.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_sub_text_color" id="t1d_mm_sub_text_color" value="<?php echo $t1d_mm_sub_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_56.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_sub_link_color" id="t1d_mm_sub_link_color" value="<?php echo $t1d_mm_sub_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_57.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_sub_link_hover_color" id="t1d_mm_sub_link_hover_color" value="<?php echo $t1d_mm_sub_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mm_sub_separator_color" id="t1d_mm_sub_separator_color" value="<?php echo $t1d_mm_sub_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_58.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Shadow:
                            <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_59.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_mm_sub_box_shadow" id="t1d_mm_sub_box_shadow" class="form-control">
								    <option value="1"<?php if($t1d_mm_sub_box_shadow == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_mm_sub_box_shadow == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>

                    </fieldset>

        </div>
        
        <div id="tab-colors-midsection" class="tab-pane"> 

                    <fieldset>
                    
                    <legend class="bn"></legend>
                    
                    <div class="form-group">
							<label class="col-sm-2 control-label">Sale Badge color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_box_sale_icon_color" id="t1d_mid_prod_box_sale_icon_color" value="<?php echo $t1d_mid_prod_box_sale_icon_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_60.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">New Product Badge color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_box_new_icon_color" id="t1d_mid_prod_box_new_icon_color" value="<?php echo $t1d_mid_prod_box_new_icon_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_61.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Rating Stars color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_stars_color" id="t1d_mid_prod_stars_color" value="<?php echo $t1d_mid_prod_stars_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_62.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Slider Controls color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_slider_control_color" id="t1d_mid_slider_control_color" value="<?php echo $t1d_mid_slider_control_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_63.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Slider Controls active color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_slider_control_color_active" id="t1d_mid_slider_control_color_active" value="<?php echo $t1d_mid_slider_control_color_active; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div> 

                    <legend>UP Theme Product Slider module</legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_slider_bg_color" id="t1d_mid_prod_slider_bg_color" value="<?php echo $t1d_mid_prod_slider_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_64.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Product name color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_slider_name_color" id="t1d_mid_prod_slider_name_color" value="<?php echo $t1d_mid_prod_slider_name_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_65.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Product description color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_slider_desc_color" id="t1d_mid_prod_slider_desc_color" value="<?php echo $t1d_mid_prod_slider_desc_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_66.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Product price color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_slider_price_color" id="t1d_mid_prod_slider_price_color" value="<?php echo $t1d_mid_prod_slider_price_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_67.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Bottom bar background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_slider_bottom_bar_bg_color" id="t1d_mid_prod_slider_bottom_bar_bg_color" value="<?php echo $t1d_mid_prod_slider_bottom_bar_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_68.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Bottom bar background color active:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_mid_prod_slider_bottom_bar_bg_color_active" id="t1d_mid_prod_slider_bottom_bar_bg_color_active" value="<?php echo $t1d_mid_prod_slider_bottom_bar_bg_color_active; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_69.jpg" target="_blank">?</a></span>
							</div>
						</div>

                    </fieldset>

        </div>
        
        <div id="tab-colors-footer" class="tab-pane"> 

                    <fieldset>
                    
                    <legend class="bn"></legend>
                    
                        <div class="form-group">
							<label class="col-sm-2 control-label">Fade In effect:</label>
							<div class="col-sm-10">
								<select name="t1d_footer_fade_in" id="t1d_footer_fade_in" class="form-control">
								    <option value="1"<?php if($t1d_footer_fade_in == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_footer_fade_in == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>

                    <legend>Features Block <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_70.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_f1_bg_color_status" id="t1d_f1_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_f1_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f1_bg_color_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f1_bg_color" id="t1d_f1_bg_color" value="<?php echo $t1d_f1_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Titles color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f1_title_color" id="t1d_f1_title_color" value="<?php echo $t1d_f1_title_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Subtitles color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f1_subtitle_color" id="t1d_f1_subtitle_color" value="<?php echo $t1d_f1_subtitle_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border top:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_f1_border_top_status" id="t1d_f1_border_top_status" class="form-control">
								    <option value="1"<?php if($t1d_f1_border_top_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f1_border_top_status == '0') echo ' selected="selected"';?><?php if($t1d_f1_border_top_status == '') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_f1_border_top_size" id="t1d_f1_border_top_size" class="form-control">
								    <option value="1"<?php if($t1d_f1_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_f1_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_f1_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_f1_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_f1_border_top_size == '5') echo ' selected="selected"';?>>5</option>  

							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_f1_border_top_color" id="t1d_f1_border_top_color" value="<?php echo $t1d_f1_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Information, Custom Column <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_71.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_f2_bg_color_status" id="t1d_f2_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_f2_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f2_bg_color_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f2_bg_color" id="t1d_f2_bg_color" value="<?php echo $t1d_f2_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Title color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f2_titles_color" id="t1d_f2_titles_color" value="<?php echo $t1d_f2_titles_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f2_text_color" id="t1d_f2_text_color" value="<?php echo $t1d_f2_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f2_link_color" id="t1d_f2_link_color" value="<?php echo $t1d_f2_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f2_link_hover_color" id="t1d_f2_link_hover_color" value="<?php echo $t1d_f2_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link disc color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f2_disc_color" id="t1d_f2_disc_color" value="<?php echo $t1d_f2_disc_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border top:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_f2_border_top_status" id="t1d_f2_border_top_status" class="form-control">
								    <option value="1"<?php if($t1d_f2_border_top_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f2_border_top_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_f2_border_top_size" id="t1d_f2_border_top_size" class="form-control">
								    <option value="1"<?php if($t1d_f2_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_f2_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_f2_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_f2_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_f2_border_top_size == '5') echo ' selected="selected"';?>>5</option>  
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_f2_border_top_color" id="t1d_f2_border_top_color" value="<?php echo $t1d_f2_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Powered by, News, Payment Images, Follow Us <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_72.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_f3_bg_color_status" id="t1d_f3_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_f3_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f3_bg_color_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_bg_color" id="t1d_f3_bg_color" value="<?php echo $t1d_f3_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_text_color" id="t1d_f3_text_color" value="<?php echo $t1d_f3_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_link_color" id="t1d_f3_link_color" value="<?php echo $t1d_f3_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_link_hover_color" id="t1d_f3_link_hover_color" value="<?php echo $t1d_f3_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">"News" word color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_news_word_color" id="t1d_f3_news_word_color" value="<?php echo $t1d_f3_news_word_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">News color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_news_color" id="t1d_f3_news_color" value="<?php echo $t1d_f3_news_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">News color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_news_hover_color" id="t1d_f3_news_hover_color" value="<?php echo $t1d_f3_news_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icons color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f3_icons_color" id="t1d_f3_icons_color" value="<?php echo $t1d_f3_icons_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border top:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_f3_border_top_status" id="t1d_f3_border_top_status" class="form-control">
								    <option value="1"<?php if($t1d_f3_border_top_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f3_border_top_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_f3_border_top_size" id="t1d_f3_border_top_size" class="form-control">
								    <option value="1"<?php if($t1d_f3_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_f3_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_f3_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_f3_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_f3_border_top_size == '5') echo ' selected="selected"';?>>5</option>  
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_f3_border_top_color" id="t1d_f3_border_top_color" value="<?php echo $t1d_f3_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Bottom Custom Block <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_73.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_f4_bg_color_status" id="t1d_f4_bg_color_status" class="form-control">
								    <option value="1"<?php if($t1d_f4_bg_color_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f4_bg_color_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f4_bg_color" id="t1d_f4_bg_color" value="<?php echo $t1d_f4_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f4_text_color" id="t1d_f4_text_color" value="<?php echo $t1d_f4_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f4_link_color" id="t1d_f4_link_color" value="<?php echo $t1d_f4_link_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Link color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_f4_link_hover_color" id="t1d_f4_link_hover_color" value="<?php echo $t1d_f4_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Border top:</label>
							<div class="col-sm-10">
                                Show:
								<select name="t1d_f4_border_top_status" id="t1d_f4_border_top_status" class="form-control">
								    <option value="1"<?php if($t1d_f4_border_top_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_f4_border_top_status == '0') echo ' selected="selected"';?>>No</option>
							    </select>
                                <br />
                                Size (px):
								<select name="t1d_f4_border_top_size" id="t1d_f4_border_top_size" class="form-control">
								    <option value="1"<?php if($t1d_f4_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_f4_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           	    	<option value="3"<?php if($t1d_f4_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_f4_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_f4_border_top_size == '5') echo ' selected="selected"';?>>5</option>  
							    </select>
                                <br />
                                Color:
								<input type="text" name="t1d_f4_border_top_color" id="t1d_f4_border_top_color" value="<?php echo $t1d_f4_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>


                    </fieldset>

        </div>
        
        <div id="tab-colors-prices" class="tab-pane"> 

                    <fieldset>  

                        <div class="form-group">
							<label class="col-sm-2 control-label">Price color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_price_color" id="t1d_price_color" value="<?php echo $t1d_price_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Old price color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_price_old_color" id="t1d_price_old_color" value="<?php echo $t1d_price_old_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>  
                        <div class="form-group">
							<label class="col-sm-2 control-label">New price color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_price_new_color" id="t1d_price_new_color" value="<?php echo $t1d_price_new_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>                       

                    </fieldset>

        </div>
        
        <div id="tab-colors-buttons" class="tab-pane"> 

                    <fieldset>  
                    
                        <legend class="bn"></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label">Button border radius:</label>
							<div class="col-sm-10">
								<select name="t1d_button_border_radius" id="t1d_button_border_radius" class="form-control">
								    <option value="0"<?php if($t1d_button_border_radius == '0') echo ' selected="selected"';?>>0</option>                        
                           	    	<option value="1"<?php if($t1d_button_border_radius == '1') echo ' selected="selected"';?>>1</option>
                           	    	<option value="2"<?php if($t1d_button_border_radius == '2') echo ' selected="selected"';?>>2</option>
                          	    	<option value="3"<?php if($t1d_button_border_radius == '3') echo ' selected="selected"';?>>3</option>
                           	    	<option value="4"<?php if($t1d_button_border_radius == '4') echo ' selected="selected"';?><?php if($t1d_button_border_radius == '') echo ' selected="selected"';?>>4</option>
                           	    	<option value="5"<?php if($t1d_button_border_radius == '5') echo ' selected="selected"';?>>5</option> 
                           	    	<option value="6"<?php if($t1d_button_border_radius == '6') echo ' selected="selected"';?>>6</option>
                           	    	<option value="7"<?php if($t1d_button_border_radius == '7') echo ' selected="selected"';?>>7</option>                           
                           	    	<option value="8"<?php if($t1d_button_border_radius == '8') echo ' selected="selected"';?>>8</option> 
                           	    	<option value="9"<?php if($t1d_button_border_radius == '9') echo ' selected="selected"';?>>9</option>
                           	    	<option value="10"<?php if($t1d_button_border_radius == '10') echo ' selected="selected"';?>>10</option>
                                    <option value="50"<?php if($t1d_button_border_radius == '50') echo ' selected="selected"';?>>50</option>      
							    </select>
							</div>
						</div>
                        
                        <legend>Buttons <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_74.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_button_bg_status" id="t1d_button_bg_status" class="form-control">
									<option value="1"<?php if($t1d_button_bg_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_button_bg_status == '0') echo ' selected="selected"';?>>No</option>    
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_bg_color" id="t1d_button_bg_color" value="<?php echo $t1d_button_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_bg_hover_color" id="t1d_button_bg_hover_color" value="<?php echo $t1d_button_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_text_color" id="t1d_button_text_color" value="<?php echo $t1d_button_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_text_hover_color" id="t1d_button_text_hover_color" value="<?php echo $t1d_button_text_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        
                        <legend>Exclusive Buttons <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_74.jpg" target="_blank">?</a></span></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Show background color:</label>
							<div class="col-sm-10">
								<select name="t1d_button_exclusive_bg_status" id="t1d_button_exclusive_bg_status" class="form-control">
									<option value="1"<?php if($t1d_button_exclusive_bg_status == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_button_exclusive_bg_status == '0') echo ' selected="selected"';?>>No</option>    
								</select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_exclusive_bg_color" id="t1d_button_exclusive_bg_color" value="<?php echo $t1d_button_exclusive_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_exclusive_bg_hover_color" id="t1d_button_exclusive_bg_hover_color" value="<?php echo $t1d_button_exclusive_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_exclusive_text_color" id="t1d_button_exclusive_text_color" value="<?php echo $t1d_button_exclusive_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_button_exclusive_text_hover_color" id="t1d_button_exclusive_text_hover_color" value="<?php echo $t1d_button_exclusive_text_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>

                    </fieldset>

        </div>
        
        <div id="tab-colors-dropdowns" class="tab-pane"> 

                    <fieldset>  

                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_bg_color" id="t1d_dd_bg_color" value="<?php echo $t1d_dd_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                                <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_75.jpg" target="_blank">?</a></span>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Headings color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_headings_color" id="t1d_dd_headings_color" value="<?php echo $t1d_dd_headings_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_text_color" id="t1d_dd_text_color" value="<?php echo $t1d_dd_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Light text color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_light_text_color" id="t1d_dd_light_text_color" value="<?php echo $t1d_dd_light_text_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_links_color" id="t1d_dd_links_color" value="<?php echo $t1d_dd_links_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Links color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_links_hover_color" id="t1d_dd_links_hover_color" value="<?php echo $t1d_dd_links_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icons color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_icons_color" id="t1d_dd_icons_color" value="<?php echo $t1d_dd_icons_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Icons color hover:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_icons_hover_color" id="t1d_dd_icons_hover_color" value="<?php echo $t1d_dd_icons_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Highlighted fields background color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_hli_bg_color" id="t1d_dd_hli_bg_color" value="<?php echo $t1d_dd_hli_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Separator color:</label>
							<div class="col-sm-10">
								<input type="text" name="t1d_dd_separator_color" id="t1d_dd_separator_color" value="<?php echo $t1d_dd_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Shadow:
                            </label>
							<div class="col-sm-10">
								<select name="t1d_dd_shadow" id="t1d_dd_shadow" class="form-control">
								    <option value="1"<?php if($t1d_dd_shadow == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_dd_shadow == '0') echo ' selected="selected"';?>>No</option>
							    </select>
							</div>
						</div>

                    </fieldset>

        </div>
        
        <div id="tab-colors-modal" class="tab-pane"> 

                    <fieldset>  

                        <legend class="bn"></legend>
                        
                        <div class="form-group">
							<label class="col-sm-2 control-label">Background style:<span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_76.jpg" target="_blank">?</a></span>
                            </label>
							<div class="col-sm-10">
								<select name="t1d_modal_bg_style" id="t1d_modal_bg_style" class="form-control">
								    <option value="light"<?php if($t1d_modal_bg_style == 'light') echo ' selected="selected"';?>>Light</option>
                                    <option value="dark"<?php if($t1d_modal_bg_style == 'dark') echo ' selected="selected"';?>>Dark</option>
							    </select>
							</div>
						</div>

                    </fieldset>

        </div>

        
        </div>
        </div>
        
        </div>
        </div> 
          
          
          
          
        
        <div class="tab-pane" id="tab-backgrounds"> 
        <div class="row form-horizontal">  
        
        <div class="col-sm-2">    
        <ul id="background_images_settings_tabs" class="nav nav-pills nav-stacked">
             <li class="active"><a href="#tab-backgrounds-body" data-toggle="tab">Body</a></li>
             <li><a href="#tab-backgrounds-header" data-toggle="tab">Header</a></li>
             <li><a href="#tab-backgrounds-menu" data-toggle="tab">Main Menu</a></li>
             <li><a href="#tab-backgrounds-footer" data-toggle="tab">Footer</a></li>                                       
        </ul> 
        </div>
        
        <div class="col-sm-10">
        <div class="tab-content">
        
        <div id="tab-backgrounds-body" class="tab-pane active">  
        
                    <fieldset>
                     
                        <legend>Body <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_77.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_body" id="t1d_pattern_body" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_body == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_body == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1d_bg_image_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_custom" value="<?php echo $t1d_bg_image_custom; ?>" id="t1d_bg_image_custom" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_position" id="t1d_bg_image_position" class="form-control">
								    <option value="top center"<?php if($t1d_bg_image_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           	    	<option value="top left"<?php if($t1d_bg_image_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           	    	<option value="top right"<?php if($t1d_bg_image_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           	    	<option value="center"<?php if($t1d_bg_image_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           	    	<option value="left"<?php if($t1d_bg_image_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           	    	<option value="right"<?php if($t1d_bg_image_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           	    	<option value="bottom center"<?php if($t1d_bg_image_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           	    	<option value="bottom left"<?php if($t1d_bg_image_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           	    	<option value="bottom right"<?php if($t1d_bg_image_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_repeat" id="t1d_bg_image_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Attachment:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_attachment" id="t1d_bg_image_attachment" class="form-control">
								    <option value="scroll"<?php if($t1d_bg_image_attachment == 'scroll') echo ' selected="selected"';?>><?php echo $text_attachment_s; ?></option>
                                    <option value="fixed"<?php if($t1d_bg_image_attachment == 'fixed') echo ' selected="selected"';?>><?php echo $text_attachment_f; ?></option> 
							    </select>
							</div>
						</div>
                    
                    </fieldset> 
          
        </div>
 
        <div id="tab-backgrounds-header" class="tab-pane">    

                    <fieldset>
                     
                        <legend>Header <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_78.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_k_ta" id="t1d_pattern_k_ta" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_k_ta == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_k_ta == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1d_bg_image_ta_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_ta_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_ta_custom" value="<?php echo $t1d_bg_image_ta_custom; ?>" id="t1d_bg_image_ta_custom" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_ta_position" id="t1d_bg_image_ta_position" class="form-control">
								    <option value="top center"<?php if($t1d_bg_image_ta_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           	    	<option value="top left"<?php if($t1d_bg_image_ta_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           	    	<option value="top right"<?php if($t1d_bg_image_ta_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           	    	<option value="center"<?php if($t1d_bg_image_ta_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           	    	<option value="left"<?php if($t1d_bg_image_ta_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           	    	<option value="right"<?php if($t1d_bg_image_ta_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           	    	<option value="bottom center"<?php if($t1d_bg_image_ta_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           	    	<option value="bottom left"<?php if($t1d_bg_image_ta_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           	    	<option value="bottom right"<?php if($t1d_bg_image_ta_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_ta_repeat" id="t1d_bg_image_ta_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_ta_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_ta_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_ta_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_ta_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Attachment:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_ta_attachment" id="t1d_bg_image_ta_attachment" class="form-control">
								    <option value="scroll"<?php if($t1d_bg_image_ta_attachment == 'scroll') echo ' selected="selected"';?>><?php echo $text_attachment_s; ?></option>
                                    <option value="fixed"<?php if($t1d_bg_image_ta_attachment == 'fixed') echo ' selected="selected"';?>><?php echo $text_attachment_f; ?></option> 
							    </select>
							</div>
						</div>
                    
                    </fieldset>

        </div>
        
        <div id="tab-backgrounds-menu" class="tab-pane">    

                    <fieldset>
                     
                        <legend>Main Menu <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_47.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_k_mm" id="t1d_pattern_k_mm" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_k_mm == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_k_mm == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1d_bg_image_mm_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_mm_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_mm_custom" value="<?php echo $t1d_bg_image_mm_custom; ?>" id="t1d_bg_image_mm_custom" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_mm_repeat" id="t1d_bg_image_mm_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_mm_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_mm_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_mm_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_mm_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div>
                    
                    </fieldset>

        </div>
        
        <div id="tab-backgrounds-footer" class="tab-pane">    

                    <fieldset>
                     
                        <legend>Features Block <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_79.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_k_f1" id="t1d_pattern_k_f1" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_k_f1 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_k_f1 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1d_bg_image_f1_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_f1_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_f1_custom" value="<?php echo $t1d_bg_image_f1_custom; ?>" id="t1d_bg_image_f1_custom" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f1_position" id="t1d_bg_image_f1_position" class="form-control">
								    <option value="top center"<?php if($t1d_bg_image_f1_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           	    	<option value="top left"<?php if($t1d_bg_image_f1_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           	    	<option value="top right"<?php if($t1d_bg_image_f1_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           	    	<option value="center"<?php if($t1d_bg_image_f1_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           	    	<option value="left"<?php if($t1d_bg_image_f1_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           	    	<option value="right"<?php if($t1d_bg_image_f1_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           	    	<option value="bottom center"<?php if($t1d_bg_image_f1_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           	    	<option value="bottom left"<?php if($t1d_bg_image_f1_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           	    	<option value="bottom right"<?php if($t1d_bg_image_f1_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f1_repeat" id="t1d_bg_image_f1_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_f1_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_f1_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_f1_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_f1_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div>

                        <legend>Information, Custom Column <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_80.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_k_f2" id="t1d_pattern_k_f2" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_k_f2 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_k_f2 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-2">                                
                                <a href="" id="t1d_bg_image_f2_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_f2_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_f2_custom" value="<?php echo $t1d_bg_image_f2_custom; ?>" id="t1d_bg_image_f2_custom" />
					        </div>
                            <label class="col-sm-2 control-label">Parallax scrolling effect:</label>
                            <div class="col-sm-6">
								<select name="t1d_bg_image_f2_parallax" id="t1d_bg_image_f2_parallax" class="form-control">
									<option value="1"<?php if($t1d_bg_image_f2_parallax == '1') echo ' selected="selected"';?>>Yes</option>
                                    <option value="0"<?php if($t1d_bg_image_f2_parallax == '0') echo ' selected="selected"';?><?php if($t1d_bg_image_f2_parallax == '') echo ' selected="selected"';?>>No</option> 
								</select>
							</div>
				        </div> 
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f2_position" id="t1d_bg_image_f2_position" class="form-control">
								    <option value="top center"<?php if($t1d_bg_image_f2_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           	    	<option value="top left"<?php if($t1d_bg_image_f2_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           	    	<option value="top right"<?php if($t1d_bg_image_f2_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           	    	<option value="center"<?php if($t1d_bg_image_f2_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           	    	<option value="left"<?php if($t1d_bg_image_f2_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           	    	<option value="right"<?php if($t1d_bg_image_f2_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           	    	<option value="bottom center"<?php if($t1d_bg_image_f2_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           	    	<option value="bottom left"<?php if($t1d_bg_image_f2_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           	    	<option value="bottom right"<?php if($t1d_bg_image_f2_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f2_repeat" id="t1d_bg_image_f2_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_f2_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_f2_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_f2_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_f2_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div> 
                                             
                        <legend>Powered by, News, Payment Images, Follow Us <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_81.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_k_f3" id="t1d_pattern_k_f3" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_k_f3 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_k_f3 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1d_bg_image_f3_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_f3_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_f3_custom" value="<?php echo $t1d_bg_image_f3_custom; ?>" id="t1d_bg_image_f3_custom" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f3_position" id="t1d_bg_image_f3_position" class="form-control">
								    <option value="top center"<?php if($t1d_bg_image_f3_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           	    	<option value="top left"<?php if($t1d_bg_image_f3_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           	    	<option value="top right"<?php if($t1d_bg_image_f3_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           	    	<option value="center"<?php if($t1d_bg_image_f3_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           	    	<option value="left"<?php if($t1d_bg_image_f3_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           	    	<option value="right"<?php if($t1d_bg_image_f3_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           	    	<option value="bottom center"<?php if($t1d_bg_image_f3_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           	    	<option value="bottom left"<?php if($t1d_bg_image_f3_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           	    	<option value="bottom right"<?php if($t1d_bg_image_f3_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f3_repeat" id="t1d_bg_image_f3_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_f3_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_f3_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_f3_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_f3_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div>
                                             
                        <legend>Bottom Custom Block <span class="k_help_tip"><a href="<?php echo HTTP_CATALOG; ?>admin/view/image/321cart_img/help_up_theme/cas_82.jpg" target="_blank">?</a></span></legend>

                        <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<select name="t1d_pattern_k_f4" id="t1d_pattern_k_f4" class="form-control">
									<option value="none"selected="selected">none</option>
									<?php for ($i = 1; $i <= 75; $i++) { 
										($t1d_pattern_k_f4 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
                                    <?php for ($i = 101; $i <= 379; $i++) { 
										($t1d_pattern_k_f4 == $i) ? $bgcr = 'selected' : $bgcr = '';
									?>
									<option value="<?php echo $i; ?>" <?php echo $bgcr; ?>><?php echo $i; ?></option>
									<?php } ?>
								</select>
                                <span class="k_help">Select a pattern number.</span>
							</div>
						</div>
                        <div class="form-group">
					        <label class="col-sm-2 control-label">Upload your own pattern or background image:</label>
					        <div class="col-sm-10">                                
                                <a href="" id="t1d_bg_image_f4_thumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $t1d_bg_image_f4_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="t1d_bg_image_f4_custom" value="<?php echo $t1d_bg_image_f4_custom; ?>" id="t1d_bg_image_f4_custom" />
					        </div>
				        </div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f4_position" id="t1d_bg_image_f4_position" class="form-control">
								    <option value="top center"<?php if($t1d_bg_image_f4_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           	    	<option value="top left"<?php if($t1d_bg_image_f4_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           	    	<option value="top right"<?php if($t1d_bg_image_f4_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           	    	<option value="center"<?php if($t1d_bg_image_f4_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           	    	<option value="left"<?php if($t1d_bg_image_f4_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           	    	<option value="right"<?php if($t1d_bg_image_f4_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           	    	<option value="bottom center"<?php if($t1d_bg_image_f4_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           	    	<option value="bottom left"<?php if($t1d_bg_image_f4_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           	    	<option value="bottom right"<?php if($t1d_bg_image_f4_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
							    </select>
							</div>
						</div>
                        <div class="form-group">
							<label class="col-sm-2 control-label">Repeat:</label>
							<div class="col-sm-10">
								<select name="t1d_bg_image_f4_repeat" id="t1d_bg_image_f4_repeat" class="form-control">
								    <option value="repeat"<?php if($t1d_bg_image_f4_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                                    <option value="repeat-x"<?php if($t1d_bg_image_f4_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                                    <option value="repeat-y"<?php if($t1d_bg_image_f4_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                                    <option value="no-repeat"<?php if($t1d_bg_image_f4_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>
							    </select>
							</div>
						</div>

                    </fieldset>

        </div>



        <div class="vtabs-content">            
        <table class="form">
        
					<tr>
					    <td>
                        <br /><div>Transparent patterns:</div><br />
                        
                        <div style="float:left;margin-bottom:20px">
                        <?php for ($bgp = 1; $bgp <= 75; $bgp++) { ?>
                            <div class="ptn"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/patterns/admin_thumb/p<?php echo $bgp; ?>.png"><span class="k_help ptn_nr"><?php echo $bgp; ?></span></div> 
						<?php } ?>	
						</div>

                        <div style="float:left;margin-bottom:20px">Non-transparent patterns:</div>   
                        
                        <div style="float:left;">
                        <?php for ($bgp = 101; $bgp <= 379; $bgp++) { ?>
                            <div class="ptn"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/up-theme/image/patterns/admin_thumb/p<?php echo $bgp; ?>.png"><span class="k_help ptn_nr"><?php echo $bgp; ?></span></div> 
						<?php } ?>	
						</div> 
                            
					    </td>
					</tr>
                    
        </table>  
        </div>
        
        </div>
        </div>
        
        </div>
        </div> 
        
        
        
        
        <div class="tab-pane" id="tab-fonts"> 
        <div class="row form-horizontal">  

        <div class="col-sm-12">
        <div class="tab-content">
        
                    <fieldset>

                        <a href="http://www.google.com/webfonts/" target="_blank" class="link" style="margin-left:0">Google Web Fonts Collection &raquo;</a>
                        
                        <div class="table-responsive">
                        
							<table class="table table-hover">
								<thead>
									<tr>
                                    <th class="left" width="20%"></th>
									<th class="left" width="20%">Name:</th>
									<th class="left" width="20%"><?php echo $text_weight; ?></th>
									<th class="left" width="20%"><?php echo $text_size; ?></th>
									<th class="left" width="20%"><?php echo $text_uppercase; ?></th>
									</tr>
								</thead>
                                <tbody>
                                    <tr>
									<td>Body:</td>
									<td>
                                    <select name="t1d_body_font" id="t1d_body_font" class="form-control">
                                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                                        <?php ($vlfont == $t1d_body_font)?$cf='selected':$cf=''; ?>
                                        <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                                        <?php } ?>                            
                                    </select>
                                    </td>
                                    <td></td>
                                    <td>
                                    <select name="t1d_body_font_size" id="t1d_body_font_size" class="form-control">
                                        <option value="10"<?php if($t1d_body_font_size == '10') echo ' selected="selected"';?>>10px</option>
                                        <option value="11"<?php if($t1d_body_font_size == '11') echo ' selected="selected"';?>>11px</option>
								        <option value="12"<?php if($t1d_body_font_size == '12') echo ' selected="selected"';?><?php if($t1d_body_font_size == '') echo ' selected="selected"';?>>12px</option>
                           	            <option value="13"<?php if($t1d_body_font_size == '13') echo ' selected="selected"';?>>13px</option>      
                           	            <option value="14"<?php if($t1d_body_font_size == '14') echo ' selected="selected"';?>>14px</option>      
                           	            <option value="15"<?php if($t1d_body_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           	            <option value="16"<?php if($t1d_body_font_size == '16') echo ' selected="selected"';?>>16px</option>
                           	            <option value="17"<?php if($t1d_body_font_size == '17') echo ' selected="selected"';?>>17px</option>      
                           	            <option value="18"<?php if($t1d_body_font_size == '18') echo ' selected="selected"';?>>18px</option>
                           	            <option value="19"<?php if($t1d_body_font_size == '19') echo ' selected="selected"';?>>19px</option>      
                           	            <option value="20"<?php if($t1d_body_font_size == '20') echo ' selected="selected"';?>>20px</option>
                           	            <option value="22"<?php if($t1d_body_font_size == '22') echo ' selected="selected"';?>>22px</option>      
                           	            <option value="24"<?php if($t1d_body_font_size == '24') echo ' selected="selected"';?>>24px</option>
							        </select>
                                    </td>
                                    <td>
                                    <select name="t1d_body_font_uppercase" id="t1d_body_font_uppercase" class="form-control">
								        <option value="1"<?php if($t1d_body_font_uppercase == '1') echo ' selected="selected"';?>>Yes</option>
                                        <option value="0"<?php if($t1d_body_font_uppercase == '0') echo ' selected="selected"';?>>No</option>
							        </select>
                                    </td>
                                    </tr>
                                    
                                    <tr>
									<td>Small text:</td>
									<td></td>
                                    <td></td>
                                    <td>
                                    <select name="t1d_small_font_size" id="t1d_small_font_size" class="form-control">
                                        <option value="10"<?php if($t1d_small_font_size == '10') echo ' selected="selected"';?>>10px</option>
                                        <option value="11"<?php if($t1d_small_font_size == '11') echo ' selected="selected"';?>>11px</option>
								        <option value="12"<?php if($t1d_small_font_size == '12') echo ' selected="selected"';?>>12px</option>
                           	            <option value="13"<?php if($t1d_small_font_size == '13') echo ' selected="selected"';?>>13px</option>      
                           	            <option value="14"<?php if($t1d_small_font_size == '14') echo ' selected="selected"';?>>14px</option>      
                           	            <option value="15"<?php if($t1d_small_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           	            <option value="16"<?php if($t1d_small_font_size == '16') echo ' selected="selected"';?>>16px</option>
                           	            <option value="17"<?php if($t1d_small_font_size == '17') echo ' selected="selected"';?>>17px</option>      
                           	            <option value="18"<?php if($t1d_small_font_size == '18') echo ' selected="selected"';?>>18px</option>
							        </select>
                                    </td>
                                    <td></td>
                                    </tr>
                                   
                                    <tr>
                                    <td>Headings and Product Name:</td>
									<td>
                                    <select name="t1d_title_font" id="t1d_title_font" class="form-control">
                                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                                        <?php ($vlfont == $t1d_title_font)?$cf='selected':$cf=''; ?>
                                        <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                                        <?php } ?>                            
                                    </select>
                                    </td>
                                    <td>
                                    <select name="t1d_title_font_weight" id="t1d_title_font_weight" class="form-control">
								        <option value="normal"<?php if($t1d_title_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                                        <option value="bold"<?php if($t1d_title_font_weight == 'bold') echo ' selected="selected"';?><?php if($t1d_title_font_weight == '') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>
                                        <option value="900"<?php if($t1d_title_font_weight == '900') echo ' selected="selected"';?>><?php echo $text_fat; ?></option>
							        </select>
                                    </td>
                                    <td></td>
                                    <td>
                                    <select name="t1d_title_font_uppercase" id="t1d_title_font_uppercase" class="form-control">
								        <option value="1"<?php if($t1d_title_font_uppercase == '1') echo ' selected="selected"';?>>Yes</option>
                                        <option value="0"<?php if($t1d_title_font_uppercase == '0') echo ' selected="selected"';?>>No</option>
							        </select>
                                    </td>
                                    </tr>
                                    
                                    <tr>
                                    <td>Price:</td>
									<td>
                                    <select name="t1d_price_font" id="t1d_price_font" class="form-control">
                                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                                        <?php ($vlfont == $t1d_price_font)?$cf='selected':$cf=''; ?>
                                        <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                                        <?php } ?>                            
                                    </select>
                                    </td>
                                    <td>
                                    <select name="t1d_price_font_weight" id="t1d_price_font_weight" class="form-control">
								        <option value="normal"<?php if($t1d_price_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                                        <option value="bold"<?php if($t1d_price_font_weight == 'bold') echo ' selected="selected"';?><?php if($t1d_price_font_weight == '') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>
							        </select>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    </tr>
                                    
                                    <tr>
                                    <td>Buttons:</td>
									<td>
                                    <select name="t1d_button_font" id="t1d_button_font" class="form-control">
                                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                                        <?php ($vlfont == $t1d_button_font)?$cf='selected':$cf=''; ?>
                                        <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                                        <?php } ?>                            
                                    </select>
                                    </td>
                                    <td>
                                    <select name="t1d_button_font_weight" id="t1d_button_font_weight" class="form-control">
								        <option value="normal"<?php if($t1d_button_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                                        <option value="bold"<?php if($t1d_button_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>
							        </select>
                                    </td>
                                    <td>
                                    <select name="t1d_button_font_size" id="t1d_button_font_size" class="form-control">
                                        <option value="10"<?php if($t1d_button_font_size == '10') echo ' selected="selected"';?>>10px</option>
                                        <option value="11"<?php if($t1d_button_font_size == '11') echo ' selected="selected"';?>>11px</option>
								        <option value="12"<?php if($t1d_button_font_size == '12') echo ' selected="selected"';?>>12px</option>
                           	            <option value="13"<?php if($t1d_button_font_size == '13') echo ' selected="selected"';?>>13px</option>      
                           	            <option value="14"<?php if($t1d_button_font_size == '14') echo ' selected="selected"';?>>14px</option>      
                           	            <option value="15"<?php if($t1d_button_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           	            <option value="16"<?php if($t1d_button_font_size == '16') echo ' selected="selected"';?>>16px</option>
                           	            <option value="17"<?php if($t1d_button_font_size == '17') echo ' selected="selected"';?>>17px</option>      
                           	            <option value="18"<?php if($t1d_button_font_size == '18') echo ' selected="selected"';?>>18px</option>
							        </select>
                                    </td>
                                    <td></td>
                                    </tr>
                                                                   
                                    <tr>
                                    <td>Main Menu Bar:</td>
									<td>
                                    <select name="t1d_main_menu_font" id="t1d_main_menu_font" class="form-control">
                                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                                        <?php ($vlfont == $t1d_main_menu_font)?$cf='selected':$cf=''; ?>
                                        <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                                        <?php } ?>                            
                                    </select>
                                    </td>
                                    <td>
                                    <select name="t1d_mm_font_weight" id="t1d_mm_font_weight" class="form-control">
								        <option value="normal"<?php if($t1d_mm_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                                        <option value="bold"<?php if($t1d_mm_font_weight == 'bold') echo ' selected="selected"';?><?php if($t1d_mm_font_weight == '') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>
                                        <option value="900"<?php if($t1d_mm_font_weight == '900') echo ' selected="selected"';?>><?php echo $text_fat; ?></option>
							        </select>
                                    </td>
                                    <td>
                                    <select name="t1d_mm_font_size" id="t1d_mm_font_size" class="form-control">
                                        <option value="10"<?php if($t1d_mm_font_size == '10') echo ' selected="selected"';?>>10px</option>
                                        <option value="11"<?php if($t1d_mm_font_size == '11') echo ' selected="selected"';?>>11px</option>
								        <option value="12"<?php if($t1d_mm_font_size == '12') echo ' selected="selected"';?>>12px</option>
                           	            <option value="13"<?php if($t1d_mm_font_size == '13') echo ' selected="selected"';?>>13px</option>      
                           	            <option value="14"<?php if($t1d_mm_font_size == '14') echo ' selected="selected"';?><?php if($t1d_mm_font_size == '') echo ' selected="selected"';?>>14px</option>      
                           	            <option value="15"<?php if($t1d_mm_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           	            <option value="16"<?php if($t1d_mm_font_size == '16') echo ' selected="selected"';?>>16px</option>
                           	            <option value="17"<?php if($t1d_mm_font_size == '17') echo ' selected="selected"';?>>17px</option>
                           	            <option value="18"<?php if($t1d_mm_font_size == '18') echo ' selected="selected"';?>>18px</option>
                           	            <option value="19"<?php if($t1d_mm_font_size == '19') echo ' selected="selected"';?>>19px</option>      
                           	            <option value="20"<?php if($t1d_mm_font_size == '20') echo ' selected="selected"';?>>20px</option>
                           	            <option value="22"<?php if($t1d_mm_font_size == '22') echo ' selected="selected"';?>>22px</option>      
                           	            <option value="24"<?php if($t1d_mm_font_size == '24') echo ' selected="selected"';?>>24px</option>
							        </select>
                                    </td>
                                    <td>
                                    <select name="t1d_mm_font_uppercase" id="t1d_mm_font_uppercase" class="form-control">
								        <option value="1"<?php if($t1d_mm_font_uppercase == '1') echo ' selected="selected"';?>>Yes</option>
                                        <option value="0"<?php if($t1d_mm_font_uppercase == '0') echo ' selected="selected"';?>>No</option>
							        </select>
                                    </td>
                                    </tr>

                                </tbody>
							</table>
                        
                        </div>                    
                        
                    </fieldset>
        
        </div>
        </div>
        
        </div>
        </div>
        
        
        
        <div class="tab-pane" id="tab-skins"> 
        <div class="row form-horizontal">  

        <div class="col-sm-12">
        <div class="tab-content">
        
            <label><?php echo $entry_skin; ?></label>           
            <select name="t1d_skin" class="form-control">
                 <option value="skin1-default"<?php if($t1d_skin == 'skin1-default') echo ' selected="selected"';?>>1 - Default</option>
                 <option value="skin2-accessories"<?php if($t1d_skin == 'skin2-accessories') echo ' selected="selected"';?>>2 - Accessories</option>
                 <option value="skin3-baby"<?php if($t1d_skin == 'skin3-baby') echo ' selected="selected"';?>>3 - Baby</option>
                 <option value="skin4-bicycle"<?php if($t1d_skin == 'skin4-bicycle') echo ' selected="selected"';?>>4 - Bicycle</option>
                 <option value="skin5-black-white"<?php if($t1d_skin == 'skin5-black-white') echo ' selected="selected"';?>>5 - Black-White</option> 
                 <option value="skin6-books"<?php if($t1d_skin == 'skin6-books') echo ' selected="selected"';?>>6 - Books</option> 
                 <option value="skin7-cosmetics"<?php if($t1d_skin == 'skin7-cosmetics') echo ' selected="selected"';?>>7 - Cosmetics</option>
                 <option value="skin8-electronics"<?php if($t1d_skin == 'skin8-electronics') echo ' selected="selected"';?>>8 - Electronics</option>
                 <option value="skin9-fashion"<?php if($t1d_skin == 'skin9-fashion') echo ' selected="selected"';?>>9 - Fashion</option>
                 <option value="skin10-furniture"<?php if($t1d_skin == 'skin10-furniture') echo ' selected="selected"';?>>10 - Furniture</option> 
                 <option value="skin11-gadgets"<?php if($t1d_skin == 'skin11-gadgets') echo ' selected="selected"';?>>11 - Gadgets</option>
                 <option value="skin12-games"<?php if($t1d_skin == 'skin12-games') echo ' selected="selected"';?>>12 - Games</option>
                 <option value="skin13-garden"<?php if($t1d_skin == 'skin13-garden') echo ' selected="selected"';?>>13 - Garden</option>
                 <option value="skin14-luxury"<?php if($t1d_skin == 'skin14-luxury') echo ' selected="selected"';?>>14 - Luxury</option>
                 <option value="skin15-market"<?php if($t1d_skin == 'skin15-market') echo ' selected="selected"';?>>15 - Market</option> 
                 <option value="skin16-minimal"<?php if($t1d_skin == 'skin16-minimal') echo ' selected="selected"';?>>16 - Minimal</option> 
                 <option value="skin17-movies"<?php if($t1d_skin == 'skin17-movies') echo ' selected="selected"';?>>17 - Movies</option>
                 <option value="skin18-organic"<?php if($t1d_skin == 'skin18-organic') echo ' selected="selected"';?>>18 - Organic</option>
                 <option value="skin19-perfume"<?php if($t1d_skin == 'skin19-perfume') echo ' selected="selected"';?>>19 - Perfume</option>
                 <option value="skin20-petsupplies"<?php if($t1d_skin == 'skin20-petsupplies') echo ' selected="selected"';?>>20 - PetSupplies</option>
                 <option value="skin21-restaurant"<?php if($t1d_skin == 'skin21-restaurant') echo ' selected="selected"';?>>21 - Restaurant</option>
                 <option value="skin22-sport"<?php if($t1d_skin == 'skin22-sport') echo ' selected="selected"';?>>22 - Sport</option>
                 <option value="skin23-suits"<?php if($t1d_skin == 'skin23-suits') echo ' selected="selected"';?>>23 - Suits</option>
                 <option value="skin24-tools"<?php if($t1d_skin == 'skin24-tools') echo ' selected="selected"';?>>24 - Tools</option>
                 <option value="skin25-toys"<?php if($t1d_skin == 'skin25-toys') echo ' selected="selected"';?>>25 - Toys</option> 
                 <option value="skin26-tshirts"<?php if($t1d_skin == 'skin26-tshirts') echo ' selected="selected"';?>>26 - Tshirts</option> 
                 <option value="skin27-tuning"<?php if($t1d_skin == 'skin27-tuning') echo ' selected="selected"';?>>27 - Tuning</option>
                 <option value="skin28-vintage"<?php if($t1d_skin == 'skin28-vintage') echo ' selected="selected"';?>>28 - Vintage</option>
                 <option value="skin29-watches"<?php if($t1d_skin == 'skin29-watches') echo ' selected="selected"';?>>29 - Watches</option>
                 <option value="skin30-wines"<?php if($t1d_skin == 'skin30-wines') echo ' selected="selected"';?>>30 - Wines</option>
                 <option value="skin31-clean-design"<?php if($t1d_skin == 'skin31-clean-design') echo ' selected="selected"';?>>31 - Clean Design</option>                    
            </select> 
            
            <p><br /><br />
            This option loads the color scheme for the selected skin. If you want to make your store have the same settings, like the skin in our demo (layout, main menu, etc.), please copy the settings of a theme modules from our demo.
            </p>
            <p><br />
            We provide access to the admin sections:
            </p>
            <p>
            Extensions › Modules
            <br />
            System › Design › Layouts
            <br />
            System › Design › Banners
            </p>
            <p><br />
            Access to the admin panel for each skin:
            </p>
            <p>
            Username: demo
            <br />
            Password: demo
            </p>
        
        </div>
        </div>
        
        </div>
        </div> 
        
        




        <!-- -->         
        </div>  
        
        
    </form>
    </div>
  </div>
</div>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script>
<script type="text/javascript" src="view/javascript/poshytip/jquery.poshytip.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/poshytip/tip-twitter/tip-twitter.css" />

<?php echo $footer; ?>
