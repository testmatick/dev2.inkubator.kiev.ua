<?php

/************copyright**************/
/*                                 */
/*   site:  http://microdata.pro   */
/*   email: info@microdata.pro     */
/*                                 */
/************copyright**************/

?>
<?php if($prices && count($prices) > 1){ ?>
<?php if($config_item_syntax == "ld" or $config_item_syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Product",
"name": "<?php echo $microdata_heading_title; ?>",
"description": "<?php echo $microdata_description; ?>",	
"url": "<?php echo $microdata_url; ?>",
<?php if($microdata_category_rating){ ?>"aggregateRating": { 
"@type": "AggregateRating", 
"ratingValue": "<?php echo $microdata_category_rating; ?>", 
"reviewCount": "<?php echo $microdata_category_rating_count; ?>"
},<?php } ?>
"offers": { 
"@type": "AggregateOffer", 
"priceCurrency": "<?php echo $microdata_code; ?>",
"lowPrice": "<?php echo min($prices); ?>",
"highPrice": "<?php echo max($prices); ?>",
"offerCount": "<?php echo count($prices); ?>"
}
}		  
</script>
<?php } ?>
<?php if($config_item_syntax == "md" or $config_item_syntax == "all"){ ?>
<span itemscope itemtype="http://schema.org/Product">
<meta itemprop="name" content="<?php echo $microdata_heading_title; ?>" />
<link itemprop="url" href="<?php echo $microdata_url; ?>" />
<meta itemprop="description" content="<?php echo $microdata_description; ?>" />
<?php if($microdata_category_rating){ ?><span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
<meta itemprop="ratingValue" content="<?php echo $microdata_category_rating; ?>">
<meta itemprop="reviewCount" content="<?php echo $microdata_category_rating_count; ?>">
</span><?php } ?>
<span itemtype="http://schema.org/AggregateOffer" itemscope itemprop="offers">
<meta content="<?php echo count($prices); ?>" itemprop="offerCount">
<meta content="<?php echo max($prices); ?>" itemprop="highPrice">
<meta content="<?php echo min($prices); ?>" itemprop="lowPrice">
<meta content="<?php echo $microdata_code; ?>" itemprop="priceCurrency">
</span>
</span>
<?php } ?>
<?php } ?>