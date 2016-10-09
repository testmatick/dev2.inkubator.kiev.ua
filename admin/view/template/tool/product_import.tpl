<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
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
	<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
		
		  <ul class="nav nav-tabs">
			<li class="active"><a href="#tab-productdata" data-toggle="tab"><?php echo $tab_producttab; ?></a></li>
			<li><a href="#tab-reviewdata" data-toggle="tab"><?php echo $tab_reviewdata; ?></a></li>
		  </ul>
		  <div class="tab-content">
			<div class="tab-pane active in" id="tab-productdata">
			<form action="<?php echo $importproduct; ?>" method="post" enctype="multipart/form-data" id="form-importproduct" class="form-horizontal">
			  <div class="form-group">
				<label class="control-label col-lg-2" for="input-import"><?php echo $entry_import; ?></label>
				<div class="col-lg-10">
				   <input style="height:37px; margin-top:5px;" type="file" name="import" value=""/>	
				</div>
			  </div>
			  <div class="form-group">
				<label class="control-label col-lg-2" for="input-import"><?php echo $text_importtype; ?></label>
				 <div class="col-lg-10">
					<select class="form-control" name="importtype">
					  <option value="1"><?php echo $text_productid; ?></option>
					  <option value="2"><?php echo $text_model; ?></option>
					</select>
					<b>Note: </b><b><i>Import your products according to Product ID Or Model (Model must be unique).</i></b>
				 </div>
			  </div>
			  <div class="form-group">
				<label class="control-label col-lg-2" for="input-name"><?php echo $entry_store; ?></label>
				<div class="col-lg-10">
					<select class="form-control" name="store_id">
					 <option value="0"><?php echo $text_default; ?></option>
					 <?php foreach($stores as $store){ ?>	
						<option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
					  <?php } ?>
					</select>
					<b>Import your products according to Store.</b>
				</div>
			  </div>
			  <div class="form-group">
				<label class="control-label col-lg-2" for="input-language"><?php echo $entry_language; ?></label>
				 <div class="col-lg-10">
					<select class="form-control" name="language_id">
					 <?php foreach($languages as $language){ ?>
						<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
					  <?php } ?>
					</select>
					<b>Import your products according to Language.</b>
				 </div>
			  </div>
			  <!-- Import Button -->
			  <div class="col-sm-12" style="text-align:right;">
				<button  style="width:84%;" onclick="$('#form-importproduct').submit()"; type="button" class="ourbtn btn btn-primary form-control"><i class="fa fa-upload"></i> Import</button>
			  </div>
			</form>
		    </div>
			<div class="tab-pane" id="tab-reviewdata">
				<hr />
				<form action="<?php echo $productreviewaction; ?>" method="post" enctype="multipart/form-data" id="productreview" class="form-horizontal">
					<div class="form-group">
						<!-- Product Review File Import Input -->
						<label class="col-sm-2 control-label" for="input-languagex"><?php echo $text_import_productreview; ?></label>
						<div class="col-lg-10">
						  <input type="file" name="import" value="" />
						</div>
					</div>
					<div class="clearfix"></div>
					<!-- Import Button -->
					<div class="col-sm-6 tbpadding">
						<button onclick="$('#productreview').submit()"; type="button" class="ourbtn btn btn-primary form-control"><i class="fa fa-upload"></i> Import</button>
					</div>
				</form>
			</div>
		 </div>
	  </div>
    </div>
 </div>
</div>
<?php echo $footer; ?>