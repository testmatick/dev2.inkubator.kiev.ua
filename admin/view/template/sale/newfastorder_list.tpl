<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
       <div class="pull-right">
      <div class="buttons">
	  <a class="btn btn-primary" onclick="$('#form').attr('action', '<?php echo $update; ?>'); $('#form').submit();" class="button"><span  data-toggle="tooltip" title="<?php echo $status_done; ?>" ><i class="fa fa-plus"></i></span></a>
	  <a class="btn btn-danger" onclick="$('form').submit();" class="button"><span><?php echo $button_delete; ?><i class="fa fa-trash-o fa-fw"></i></span></a>
		<a class="button btn btn-primary" href="<?php echo $fastorder_setting ?>"><span><?php echo $button_fastorder_setting;?></span></a></div>
	</div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="content">
   
    <div class="container-fluid">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>

              <td class="left"><?php if ($sort == 'fast_id') { ?>
                <a href="<?php echo $sort_fast_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo "Номер"; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_fast_id; ?>"><?php echo "Номер"; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
             
			  <td class="center"><?php echo $text_comment_buyer; ?></td>
			  <td class="center"><?php echo $number_order_id; ?></td>
			  <td class="center"><?php echo $product_name_fast; ?></td>
			  <td class="center"><?php echo $text_total_all; ?></td>
			  <td class="center"><?php echo $text_newfastorder_url; ?></td>
			  <td class="center"><?php echo $text_comment; ?></td>
			  <td class="center"><?php if ($sort == 'username') { ?>
                <a href="<?php echo $sort_username; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_manager; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_username; ?>"><?php echo $text_manager; ?></a>
                <?php } ?></td>
			 
              <td class="right"><?php echo $text_status; ?></td>
              <td class="right"><?php echo $text_added; ?></td>
              <td class="right"><?php echo $text_modified; ?></td>
              <td class="right"><?php echo $text_action; ?></td>
            </tr>
            </tr>
          </thead>
          <tbody>
            <?php if ($newfastorders) { ?>
            <?php foreach ($newfastorders as $newfastorder) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($newfastorder['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $newfastorder['newfastorder_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $newfastorder['newfastorder_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $newfastorder['newfastorder_id']; ?></td>
              <td class="left" style="min-width:180px;">
				<div class="firstname"><i class="fa fa-user fa-fw"></i> <?php echo $newfastorder['name']; ?></div>
				<div class="telephone"><i class="fa fa-phone fa-fw"></i><?php echo $newfastorder['telephone']; ?></div>
				<div class="email"><i class="fa fa-envelope-o fa-fw"></i> <?php echo $newfastorder['email_buyer']; ?></div>
			  </td>            
              <td class="left"><?php echo utf8_substr(strip_tags($newfastorder['comment_buyer']),0,50); ?></td>
             
              
              <td class="center"><a href="index.php?route=sale/order/edit&token=<?php echo $token;?>&order_id=<?php echo $newfastorder['order_id']?>"><?php echo $text_number_order_id_;?><?php echo $newfastorder['order_id']; ?></a></td>
              <td class="left">
			  
				<?php foreach ($orders_products as $result_prod){ ?>
					<?php if($newfastorder['order_id'] == $result_prod['order_id']){ ?>
						<div class="product_name"><a href="index.php?route=catalog/product/update&token=<?php echo $token;?>&product_id=<?php echo $result_prod['product_id'];?>"><?php echo $result_prod['product_name'];?></a></div>
						<div class="product_model"><?php echo $result_prod['model'];?></div>
						<img style="max-height:50px;" src="<?php echo $result_prod['product_image']; ?>"/>
						<div class="price_fast"><?php echo $result_prod['price'];?> x <?php echo $result_prod['quantity'];?> = <?php echo $result_prod['total'];?></div>	
					<?php } ?>	
				<?php } ?>
			  </td>
			 <style>
				.price_fast {
					display: block;
					min-width: 180px;
				}
				.product_model{
					font-weight:bold;
				}
			 </style>
				<td class="right" style="font-weight:bold;"><?php echo $newfastorder['total']; ?></td>
              <td class="left"><a href="<?php echo $newfastorder['url_site']; ?>" target="_blank"><?php echo utf8_substr(strip_tags(html_entity_decode($newfastorder['url_site'], ENT_QUOTES, 'UTF-8')), 0, 50) . '....'; ?></td>
			  <td class="left"><?php echo utf8_substr(strip_tags($newfastorder['comment']),0,50); ?></td> 
			  <td class="right"><?php echo $newfastorder['username']; ?></td>
           <?php if ($newfastorder['status'] == $status_done) { ?>
              <td class="right" style="background:#0BED0B;"><?php echo $newfastorder['status']; ?></td>
            <?php } else { ?>
              <td class="right" style="background:#EDB40B;"><?php echo $newfastorder['status']; ?></td>
            <?php } ?>
              <td class="right"><?php echo $newfastorder['date_added']; ?></td>
             <td class="right"><?php echo $newfastorder['date_modified']; ?></td>
              <td class="text-right"><a href="<?php echo $newfastorder['action']; ?>" data-toggle="tooltip" title="<?php echo $text_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
