<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-category-wall" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category-wall" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-category_wall_title"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
					<?php $language_id = $language['language_id']; ?>
						<div class="input-group pull-left">    
                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                            <input type="text" name="category_wall[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($category_wall[$language['language_id']]) ? $category_wall[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
						</div>
				<?php } ?>
            </div>
          </div>           
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-ca_id"><?php echo $entry_categories_per_row; ?></label>
            <div class="col-sm-10">
              <select name="ca_id" id="input-ca_id" class="form-control">
              <?php for ($i=4; $i<=6; $i++) { ?>
                <option value="ca<?php echo $i; ?>" <?php if ($ca_id=="ca".$i) {echo "selected=\"selected\"";}; ?>><?php echo $i; ?></option>
              <?php }; ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status_caticons"><?php echo $entry_status_caticons; ?></label>
            <div class="col-sm-10">
              <select name="status_caticons" id="input-status_caticons" class="form-control">
                <option value="1" <?php if ($status_caticons == '1') {echo "selected=\"selected\"";}; ?>><?php echo $text_yes; ?></option>
				<option value="0" <?php if ($status_caticons == '0') {echo "selected=\"selected\"";}; ?>><?php echo $text_no; ?></option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status_subcategories"><?php echo $entry_status_subcategories; ?></label>
            <div class="col-sm-10">
              <select name="status_subcategories" id="input-status_subcategories" class="form-control">
                <option value="1" <?php if ($status_subcategories == '1') {echo "selected=\"selected\"";}; ?>><?php echo $text_yes; ?></option>
				<option value="0" <?php if ($status_subcategories == '0') {echo "selected=\"selected\"";}; ?>><?php echo $text_no; ?></option>
              </select>
            </div>
          </div>       
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>