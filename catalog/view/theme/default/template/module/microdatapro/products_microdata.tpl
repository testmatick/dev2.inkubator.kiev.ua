<?php

/************copyright**************/
/*                                 */
/*   site:  http://microdata.pro   */
/*   email: info@microdata.pro     */
/*                                 */
/************copyright**************/

?>
<?php $pri = 1; foreach($microdata_products as $product){ ?>
<?php if($related_block){ ?>
<span id="related-product-<?php echo $pri; ?>" itemprop="isRelatedTo" itemscope itemtype="http://schema.org/Product">
<?php }else{ ?>
<span itemprop="itemListElement" itemscope itemtype="http://schema.org/Product">
<?php } ?>
<meta itemprop="name" content="<?php echo $product['name']; ?>" />
<meta itemprop="description" content="<?php echo $product['microdata_description']; ?>" />
<link itemprop="url" href="<?php echo $product['href']; ?>" />
<link itemprop="image" href="<?php echo $product['thumb']; ?>" />
<span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
<meta itemprop="priceCurrency" content="<?php echo $microdata_code; ?>" />
<meta itemprop="price" content="<?php echo $product['microdata_price']; ?>" />
</span>	   
</span>	
<?php $pri++; } ?>