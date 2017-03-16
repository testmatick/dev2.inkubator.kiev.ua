<?php

/************copyright**************/
/*                                 */
/*   site:  http://microdata.pro   */
/*   email: info@microdata.pro     */
/*                                 */
/************copyright**************/

?>
<?php if($status && $a && $b && $c && $d){ ?>
<?php if(isset($breadcrumbs) && $breadcrumbs && !is_array($breadcrumbs)){ ?><?php echo $breadcrumbs; ?><?php } ?>
<?php if($config_company and $a){ ?>
<!--microdatapro <?php echo $microdata_version; ?> company start -->
<?php if($config_company_syntax == "ld" or $config_company_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Organization",
"url": "<?php echo $microdata_base_url; ?>",
"name": "<?php echo $microdata_name; ?>",
"email": "<?php echo $microdata_email; ?>",
"logo": "<?php echo $microdata_logo; ?>",
<?php if($company_meta_description){ ?>"description": "<?php echo $company_meta_description; ?>",<?php } ?>
<?php if ($microdata_address_1 && $microdata_address_2 && $microdata_address_3){ ?>
"address": {
"@type": "PostalAddress",
"addressLocality": "<?php echo $microdata_address_1; ?>",
"postalCode": "<?php echo $microdata_address_2; ?>",
"streetAddress": "<?php echo $microdata_address_3; ?>"
},
<?php } ?>
<?php if($company_rating_count and $company_show_rating){ ?>
"aggregateRating": {
"@type": "AggregateRating",
"ratingValue": "<?php echo $company_rating_value; ?>",
"reviewCount": "<?php echo $company_rating_count; ?>"
},<?php } ?>			  
"potentialAction": {
"@type": "SearchAction",
"target": "<?php echo $microdata_base_url; ?>index.php?route=product/search&search={search_term_string}",
"query-input": "required name=search_term_string"
}<?php if ($microdata_phones){ ?>,	  
"contactPoint" : [
<?php $pi = 1; foreach($microdata_phones as $phone){ ?>{
"@type" : "ContactPoint",
"telephone" : "<?php echo $phone; ?>",
"contactType" : "customer service"
}<?php if($pi != count($microdata_phones)){ ?>,<?php } ?><?php $pi++; } ?>]<?php } ?><?php if ($microdata_groups){ ?>,
"sameAs" : [
<?php $gi = 1; foreach($microdata_groups as $group){ ?>
"<?php echo $group; ?>"<?php if($gi != count($microdata_groups)){ ?>,<?php } ?>
<?php $gi++; } ?>
]<?php } ?>	  
}	  
</script>
<?php } ?>
<?php if($config_company_syntax == "md" or $config_company_syntax == "all"){ ?>
<span itemscope itemtype="http://schema.org/Organization">
<meta itemprop="name" content="<?php echo $microdata_name; ?>" />
<link itemprop="url" href="<?php echo $microdata_base_url; ?>" />
<link itemprop="logo" href="<?php echo $microdata_logo; ?>" />
<?php if($company_meta_description){ ?><meta itemprop="description" content="<?php echo $company_meta_description; ?>" /><?php } ?>
<meta itemprop="email" content="<?php echo $microdata_email; ?>" />
<?php if ($microdata_address_1 && $microdata_address_2 && $microdata_address_3){ ?>
<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
<meta itemprop="addressLocality" content="<?php echo $microdata_address_1; ?>" />			  
<meta itemprop="postalCode" content="<?php echo $microdata_address_2; ?>" />
<meta itemprop="streetAddress" content="<?php echo $microdata_address_3; ?>" />
</span>
<?php } ?>
<?php if ($microdata_phones){ ?>
<?php foreach($microdata_phones as $phone){ ?>
<meta itemprop="telephone" content="<?php echo $phone; ?>" />
<?php } ?>
<?php } ?>
<?php if($company_rating_count){ ?>
<span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
<meta itemprop="ratingValue" content="<?php echo $company_rating_value; ?>">
<meta itemprop="reviewCount" content="<?php echo $company_rating_count; ?>">
</span>
<?php } ?>
<?php if ($microdata_groups){ ?>
<?php foreach($microdata_groups as $group){ ?>
<link itemprop="sameAs" href="<?php echo $group; ?>" />
<?php } ?>
<?php } ?>
<form itemprop="potentialAction" itemscope itemtype="http://schema.org/SearchAction">
<meta itemprop="target" content="<?php echo $microdata_base_url; ?>index.php?route=product/search&search={search_term_string}"/>
<input itemprop="query-input" type="text" required name="search_term_string" style="display:none;"/>
</form>		  
</span>
<?php } ?>
<!--microdatapro <?php echo $microdata_version; ?> company end -->
<?php } ?>
<?php if($microdata_route_product && $config_product_page && isset($product_info) and $b){ ?>
<!--microdatapro <?php echo $microdata_version; ?> product start --> 
<?php if($config_item_syntax == "ld" or $config_item_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Product",
"url": "<?php echo $microdata_url; ?>",
<?php if(isset($microdata_breadcrumbs)){ ?>
<?php if(isset($microdata_breadcrumbs[count($microdata_breadcrumbs)-2]['text']) && (count($microdata_breadcrumbs)-2) != 0){ ?>
"category": "<?php echo $microdata_breadcrumbs[count($microdata_breadcrumbs)-2]['text']; ?>",
<?php } ?>
<?php } ?>
<?php if(isset($microdata_popup) && !empty($microdata_popup)){ ?>
"image": "<?php echo $microdata_popup; ?>",
<?php } ?>
<?php if(isset($microdata_manufacturer) && !empty($microdata_manufacturer)){ ?>
"brand": "<?php echo $microdata_manufacturer; ?>",
"manufacturer": "<?php echo $microdata_manufacturer; ?>",
<?php } ?><?php if(isset($microdata_model) && !empty($microdata_model)){ ?>
"model": "<?php echo $microdata_model; ?>",
<?php } ?><?php if(isset($microdata_upc) && !empty($microdata_upc)){ ?>
"gtin12": "<?php echo $microdata_upc; ?>",
<?php } ?><?php if(isset($microdata_ean) && !empty($microdata_ean)){ ?>
"gtin8": "<?php echo $microdata_ean; ?>",
<?php } ?><?php if(isset($microdata_isbn) && !empty($microdata_isbn)){ ?>
"productID": "<?php echo $microdata_isbn; ?>",
<?php } ?><?php if(isset($microdata_mpn) && !empty($microdata_mpn)){ ?>
"mpn": "<?php echo $microdata_mpn; ?>",
<?php } ?><?php if(isset($microdata_sku) && !empty($microdata_sku)){ ?>
"sku": "<?php echo $microdata_sku; ?>",
<?php } ?><?php if(isset($microdata_review_total) and !empty($microdata_review_total)){ ?>
"aggregateRating": {
"@type": "AggregateRating",
"ratingValue": "<?php echo $microdata_total_rating_value; ?>",
"reviewCount": "<?php echo $microdata_review_total; ?>"
},<?php } ?><?php if(isset($microdata_description) and !empty($microdata_description)){ ?>
"description": "<?php echo $microdata_description; ?>",
<?php } ?><?php if(isset($microdata_heading_title) and !empty($microdata_heading_title)){ ?>
"name": "<?php echo $microdata_heading_title; ?>",
<?php } ?>
"offers": {
"@type": "Offer",
<?php if(isset($microdata_stock)){ ?>
"availability": "http://schema.org/<?php echo ($microdata_stock > 0)?"InStock":"OutOfStock"; ?>",
<?php } ?>
<?php if(isset($microdata_price) && !empty($microdata_price)){ ?>
"price": "<?php echo $microdata_price; ?>",
<?php } ?>
"priceCurrency": "<?php echo $microdata_code; ?>"
}<?php if (isset($microdata_reviews) && $microdata_reviews && $config_product_reviews){ ?>,
"review": [
<?php $ri = 1; foreach ($microdata_reviews as $review_item){ ?>
{
"@type": "Review",
"author": "<?php echo $review_item['author']; ?>",
"datePublished": "<?php echo $review_item['date_added']; ?>",
"description": "<?php echo $review_item['text']; ?>",
"reviewRating": {
"@type": "Rating",
"bestRating": "5",
"ratingValue": "<?php echo $review_item['rating']; ?>",
"worstRating": "1"
}
}<?php if($ri != count($microdata_reviews)){ ?>,<?php } ?><?php $ri++; } ?>
]<?php } ?>
<?php if(isset($microdata_products_json) && $microdata_products_json && $config_product_related){ ?>
,"isRelatedTo": [ 
<?php echo $microdata_products_json; ?>	
]
<?php } ?>
<?php if (isset($microdata_attribute_groups)) { ?>
<?php if ($microdata_attribute_groups && $config_product_attribute) { ?>
,"additionalProperty":[
<?php $ag = 1; foreach ($microdata_attribute_groups as $attribute_group) { ?>
<?php $ai = 1; foreach ($attribute_group['attribute'] as $attribute) { ?>
{
"@type": "PropertyValue",
"name": "<?php echo $attribute['name']; ?>",
"value": "<?php echo $attribute['text']; ?>"
}<?php if($ai != count($attribute_group['attribute']) or $ag != count($microdata_attribute_groups)){ ?>,<?php } ?>
<?php $ai++; } ?>
<?php $ag++; } ?>
]
<?php } ?>
<?php } ?>
}
</script>
<?php } ?>	
<?php if($config_item_syntax == "md" or $config_item_syntax == "all"){ ?>
<span itemscope itemtype="http://schema.org/Product">
<meta itemprop="name" content="<?php echo $microdata_heading_title; ?>" />
<link itemprop="url" href="<?php echo $microdata_url; ?>" />
<?php if(isset($microdata_popup) && !empty($microdata_popup)){ ?>
<link itemprop="image" href="<?php echo $microdata_popup; ?>" />
<?php } ?><?php if(isset($microdata_manufacturer) && !empty($microdata_manufacturer)){ ?>
<meta itemprop="brand" content="<?php echo $microdata_manufacturer; ?>" />
<meta itemprop="manufacturer" content="<?php echo $microdata_manufacturer; ?>" />
<?php } ?><?php if(isset($microdata_model) && !empty($microdata_model)){ ?>
<meta itemprop="model" content="<?php echo $microdata_model; ?>" />
<?php } ?><?php if(isset($microdata_upc) && !empty($microdata_upc)){ ?>
<meta itemprop="gtin12" content="<?php echo $microdata_upc; ?>" />
<?php } ?><?php if(isset($microdata_ean) && !empty($microdata_ean)){ ?>
<meta itemprop="gtin8" content="<?php echo $microdata_ean; ?>" />
<?php } ?><?php if(isset($microdata_isbn) && !empty($microdata_isbn)){ ?>
<meta itemprop="productID" content="<?php echo $microdata_isbn; ?>" />
<?php } ?><?php if(isset($microdata_mpn) && !empty($microdata_mpn)){ ?>
<meta itemprop="mpn" content="<?php echo $microdata_mpn; ?>" />
<?php } ?><?php if(isset($microdata_sku) && !empty($microdata_sku)){ ?>
<meta itemprop="sku" content="<?php echo $microdata_sku; ?>" />
<?php } ?><?php if(isset($microdata_breadcrumbs)){ ?><?php if(isset($microdata_breadcrumbs[count($microdata_breadcrumbs)-2]['text']) && (count($microdata_breadcrumbs)-2) != 0){ ?>
<meta itemprop="category" content="<?php echo $microdata_breadcrumbs[count($microdata_breadcrumbs)-2]['text']; ?>" />
<?php } ?><?php } ?><?php if(isset($microdata_review_total) and !empty($microdata_review_total)){ ?>
<span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
<meta itemprop="ratingValue" content="<?php echo $microdata_total_rating_value; ?>">
<meta itemprop="reviewCount" content="<?php echo $microdata_review_total; ?>">
</span>
<?php } ?>
<span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
<meta itemprop="priceCurrency" content="<?php echo $microdata_code; ?>" />
<?php if(isset($microdata_price) && !empty($microdata_price)){ ?>
<meta itemprop="price" content="<?php echo $microdata_price; ?>" />
<?php } ?>
<?php if(isset($microdata_stock)){ ?>
<link itemprop="availability" href="http://schema.org/<?php echo ($microdata_stock > 0)?"InStock":"OutOfStock"; ?>" />
<?php } ?>
</span>
<meta itemprop="description" content="<?php echo $microdata_description; ?>" />	  
<?php if (isset($microdata_reviews) && $microdata_reviews && $config_product_reviews){ ?>
<?php foreach($microdata_reviews as $review_item){ ?>
<span itemprop="review" itemscope itemtype="http://schema.org/Review">
<meta itemprop="author" content="<?php echo $review_item['author']; ?>" />
<meta itemprop="datePublished" content="<?php echo $review_item['date_added']; ?>" />
<span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
<meta itemprop="worstRating" content = "1" />
<meta itemprop="ratingValue" content="<?php echo $review_item['rating']; ?>" />
<meta itemprop="bestRating" content="5" />
</span>
<meta itemprop="description" content="<?php echo $review_item['text']; ?>" />
</span>
<?php }?>
<?php } ?>
<?php if(isset($microdata_products_microdata) && $microdata_products_microdata && $config_product_related){ ?>
<?php echo $microdata_products_microdata; ?>
<?php } ?>
<?php if (isset($microdata_attribute_groups) && $microdata_attribute_groups && $config_product_attribute) { ?>
<?php foreach ($microdata_attribute_groups as $attribute_group) { ?>
<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
<span itemprop="additionalProperty" itemscope itemtype="http://schema.org/PropertyValue">
<meta itemprop="value" content="<?php echo $attribute['text']; ?>" />
<meta itemprop="name" content="<?php echo $attribute['name']; ?>" />
</span>
<?php } ?>
<?php } ?>
<?php } ?>
</span>
<?php } ?>
<?php if($echo){ ?><div class="mdp-description"><?php echo $echo; ?></div><?php } ?>
<!--microdatapro <?php echo $microdata_version; ?> product end -->
<?php } ?>
<?php if(isset($microdata_route_category) && $microdata_route_category && $config_category_page && $category_info and $c){ ?>
<!--microdatapro <?php echo $microdata_version; ?> category start -->
<?php if(isset($microdata_products_json) && isset($microdata_products_microdata) && $microdata_products_json and $microdata_products_microdata){ ?>
<?php if($min_max){ ?><?php echo $min_max; ?><?php } ?>
<?php if($config_item_syntax == "ld" or $config_item_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "ItemList",
"name": "<?php echo $microdata_heading_title; ?>",
"url": "<?php echo $microdata_url; ?>",
<?php if($microdata_description){ ?>"description": "<?php echo $microdata_description; ?>",<?php } ?>
"numberOfItems": "<?php echo $microdata_products_json_cont; ?>",
"itemListElement": [
<?php echo $microdata_products_json; ?>
]
}			
</script>
<?php } ?>
<?php if($config_item_syntax == "md" or $config_item_syntax == "all"){ ?>
<span itemtype="http://schema.org/ItemList" itemscope>
<?php if($microdata_description){ ?><meta itemprop="description" content="<?php echo $microdata_description; ?>" /><?php } ?>
<link itemprop="url" href="<?php echo $microdata_url; ?>" />
<meta itemprop="name" content="<?php echo $microdata_heading_title; ?>" />
<meta itemprop="numberOfItems" content="<?php echo $microdata_products_json_cont; ?>" />
<?php echo $microdata_products_microdata; ?>
</span>	  
<?php } ?>
<?php } ?>
<?php if($echo){ ?><div class="mdp-description"><?php echo $echo; ?></div><?php } ?>
<!--microdatapro <?php echo $microdata_version; ?> category end -->
<?php } ?>
<?php if($microdata_route_manufacturer && $config_manufacturer_page and $d){ ?>
<!--microdatapro <?php echo $microdata_version; ?> manufacturer start -->
<?php if($microdata_products_json and $microdata_products_microdata){ ?>
<?php if($min_max){ ?><?php echo $min_max; ?><?php } ?>
<?php if($config_item_syntax == "ld" or $config_item_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "ItemList",
"name": "<?php echo $microdata_heading_title; ?>",
"url": "<?php echo $microdata_url; ?>",
<?php if($microdata_description){ ?>"description": "<?php echo $microdata_description; ?>",<?php } ?>
"numberOfItems": "<?php echo count($microdata_products_json); ?>",
"itemListElement": [
<?php echo $microdata_products_json; ?>
]
}
</script> 
<?php } ?>
<?php if($config_item_syntax == "md" or $config_item_syntax == "all"){ ?>
<span itemtype="http://schema.org/ItemList" itemscope>
<?php if($microdata_description){ ?><meta itemprop="description" content="<?php echo $microdata_description; ?>" /><?php } ?>
<link itemprop="url" href="<?php echo $microdata_url; ?>" />
<meta itemprop="name" content="<?php echo $microdata_heading_title; ?>" />
<meta itemprop="numberOfItems" content="<?php echo count($microdata_products_microdata); ?>" />
<?php echo $microdata_products_microdata; ?>	
</span>			
<?php } ?>
<?php } ?>
<?php if($echo){ ?><div class="mdp-description"><?php echo $echo; ?></div><?php } ?>
<!--microdatapro <?php echo $microdata_version; ?> manufacturer end -->
<?php } ?>
<?php if($microdata_route_special && $config_special_page and $a and $d){ ?>
<!--microdatapro <?php echo $microdata_version; ?> special start -->
<?php if($microdata_products_json and $microdata_products_microdata){ ?>
<?php if($min_max){ ?><?php echo $min_max; ?><?php } ?>
<?php if($config_item_syntax == "ld" or $config_item_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "ItemList",
"url": "<?php echo $microdata_url; ?>",
"name": "<?php echo $microdata_heading_title; ?>",
<?php if($microdata_description){ ?>"description": "<?php echo $microdata_description; ?>",<?php } ?>
"numberOfItems": "<?php echo count($microdata_products_json); ?>",
"itemListElement": [
<?php echo $microdata_products_json; ?>
]
}
</script>
<?php } ?>
<?php if($config_item_syntax == "md" or $config_item_syntax == "all"){ ?>
<span itemscope itemtype="http://schema.org/ItemList">
<?php if($microdata_description){ ?><meta itemprop="description" content="<?php echo $microdata_description; ?>" /><?php } ?>
<link itemprop="url" href="<?php echo $microdata_url; ?>" />
<meta itemprop="name" content="<?php echo $microdata_heading_title; ?>" />
<meta itemprop="numberOfItems" content="<?php echo count($microdata_products_json); ?>" />
<?php echo $microdata_products_microdata; ?>	
</span>			
<?php } ?>		  
<?php } ?>
<?php if($microdata_description){ ?><div class="mdp-description"><?php echo $microdata_description; ?></div><?php } ?>
<!--microdatapro <?php echo $microdata_version; ?> special end -->
<?php } ?>
<?php if($microdata_route_information && $config_information_page && $information_info and $c and $d){ ?>
<!--microdatapro <?php echo $microdata_version; ?> information start -->
<?php if($config_item_syntax == "ld" or $config_item_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "NewsArticle",
"mainEntityOfPage":{
"@type":"WebPage",
"@id": "<?php echo $microdata_url; ?>"
},
"headline": "<?php echo $microdata_heading_title; ?>",
"image": {
"@type": "ImageObject",
"url": "<?php echo $microdata_image; ?>",
"width": "<?php echo $image_width; ?>",
"height": "<?php echo $image_height; ?>"
},
"datePublished": "<?php echo $date_published; ?>",
"dateModified": "<?php echo $date_published; ?>",
"author": "<?php echo $author; ?>",					  
"publisher": {
"@type": "Organization",
"name": "<?php echo $microdata_name; ?>",
"logo": {
"@type": "ImageObject",
"url": "<?php echo $microdata_image; ?>"
}
},
"description":"<?php echo $microdata_description; ?>"
}
</script>
<?php } ?>
<?php if($config_item_syntax == "md" or $config_item_syntax == "all"){ ?>
<span itemscope itemtype="http://schema.org/NewsArticle">
<meta itemscope itemprop="mainEntityOfPage"  itemType="https://schema.org/WebPage" itemid="<?php echo $microdata_url; ?>"/>
<meta itemprop="headline" content="<?php echo $microdata_heading_title; ?>" />
<span itemprop="author" itemscope itemtype="https://schema.org/Person"><meta itemprop="name" content="<?php echo $author; ?>" /></span>
<meta itemprop="description" content="<?php echo $microdata_description; ?>">
<span itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
<link itemprop="contentUrl" href="<?php echo $microdata_image; ?>" />
<link itemprop="url" href="<?php echo $microdata_image; ?>">
<meta itemprop="width" content="<?php echo $image_width; ?>">
<meta itemprop="height" content="<?php echo $image_height; ?>">
</span>
<span itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
<?php if ($microdata_address_1 && $microdata_address_2 && $microdata_address_3){ ?>
<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
<meta itemprop="addressLocality" content="<?php echo $microdata_address_1; ?>" />			  
<meta itemprop="postalCode" content="<?php echo $microdata_address_2; ?>" />
<meta itemprop="streetAddress" content="<?php echo $microdata_address_3; ?>" />
</span>
<?php } ?>			  
<?php if ($microdata_phones){ ?>
<?php foreach($microdata_phones as $phone){ ?>
<meta itemprop="telephone" content="<?php echo $phone; ?>" />
<?php } ?>
<?php } ?>			  
<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
<link itemprop="url" href="<?php echo $microdata_image; ?>">
<link itemprop="contentUrl" href="<?php echo $microdata_image; ?>" />
</span>
<meta itemprop="name" content="<?php echo $microdata_name; ?>" />
</span>
<meta itemprop="datePublished" content="<?php echo $date_published; ?>" />
<meta itemprop="dateModified" content="<?php echo $date_published; ?>" />
</span>		 
<?php } ?>
<!--microdatapro <?php echo $microdata_version; ?> information end -->
<?php } ?>
<?php } ?>