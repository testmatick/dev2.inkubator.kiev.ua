<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-article" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-article" class="form-horizontal">

      <ul class="nav nav-tabs" id="language">
        <?php foreach ($languages as $language) { ?>
        <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
        <?php } ?>
      </ul>

      <div class="tab-content">
        <?php foreach ($languages as $language) { ?>
        <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
	<div class="form-group">
          <label class="col-sm-3 control-label" for="input-module-heading<?php echo $language['language_id']; ?>"><?php echo $entry_heading; ?></label>
            <div class="col-sm-9">
            <input type="text" name="article_module_heading<?php echo $language['language_id']; ?>" value="<?php echo isset(${'article_module_heading' . $language['language_id']}) ? ${'article_module_heading' . $language['language_id']} : ''; ?>" id="input-module-heading<?php echo $language['language_id']; ?>" class="form-control" />
            </div>
          </div>

	   <div class="form-group">
            <label class="col-sm-3 control-label" for="input-articles-title<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_articles_title; ?>"><?php echo $entry_articles_title; ?></span></label>
            <div class="col-sm-9">
		<input type="text" name="article_module_title<?php echo $language['language_id']; ?>" value="<?php echo isset(${'article_module_title' . $language['language_id']}) ? ${'article_module_title' . $language['language_id']} : ''; ?>" id="input-articles-title<?php echo $language['language_id']; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-articles-metadescription<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_articles_metadescription; ?>"><?php echo $entry_articles_metadescription; ?></span></label>
            <div class="col-sm-9">
		<textarea name="article_module_metadescription<?php echo $language['language_id']; ?>" rows="5" id="input-articles-metadescription<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset(${'article_module_metadescription' . $language['language_id']}) ? ${'article_module_metadescription' . $language['language_id']} : ''; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-description<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_description; ?>"><?php echo $entry_description; ?></span></label>
            <div class="col-sm-9">
              <textarea name="articles_description<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset(${'articles_description' . $language['language_id']}) ? ${'articles_description' . $language['language_id']} : ''; ?></textarea>
            </div>
          </div>

               </div>
        <?php } ?>
      </div>

	  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-thumb-category"><span data-toggle="tooltip" title="<?php echo $help_article_thumb_category; ?>"><?php echo $entry_article_thumb_category; ?></span></label>
            <div class="col-sm-9">
		<div class="row">
		<div class="col-sm-6">
		<input type="text" name="article_thumb_category_width" value="<?php echo $article_thumb_category_width; ?>" id="input-category-width" class="form-control" placeholder="<?php echo $help_width; ?>" /></div>
		
		<div class="col-sm-6">
		<input type="text" name="article_thumb_category_height" value="<?php echo $article_thumb_category_height; ?>" id="input-category-height" class="form-control" placeholder="<?php echo $help_height; ?>" /></div>
		</div>
            </div>
          </div>

	  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-thumb"><span data-toggle="tooltip" title="<?php echo $help_article_thumb; ?>"><?php echo $entry_article_thumb; ?></span></label>
            <div class="col-sm-9">
		<div class="row">
		<div class="col-sm-6">
		<input type="text" name="article_thumb_width" value="<?php echo $article_thumb_width; ?>" id="input-thumb-width" class="form-control" placeholder="<?php echo $help_width; ?>" /></div>
		 
		<div class="col-sm-6"><input type="text" name="article_thumb_height" value="<?php echo $article_thumb_height; ?>" id="input-thumb-height" class="form-control" placeholder="<?php echo $help_height; ?>" /></div>
		</div>
            </div>
          </div>

	  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-image"><span data-toggle="tooltip" title="<?php echo $help_article_image; ?>"><?php echo $entry_article_image; ?></span></label>
            <div class="col-sm-9">
		<div class="row">
		<div class="col-sm-6">
		<input type="text" name="article_image_width" value="<?php echo $article_image_width; ?>" id="input-image-width" class="form-control" placeholder="<?php echo $help_width; ?>" /></div>
		 
		<div class="col-sm-6"><input type="text" name="article_image_height" value="<?php echo $article_image_height; ?>" id="input-image-height" class="form-control" placeholder="<?php echo $help_height; ?>" /></div>
		</div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-show-date"><?php echo $entry_show_date; ?></label>
            <div class="col-sm-9">
              <div class="checkbox">
                <label>
                  <?php if ($article_show_date) { ?>
                  <input type="checkbox" name="article_show_date" value="1" checked="checked" id="input-article-show-date" />
                  <?php } else { ?>
                  <input type="checkbox" name="article_show_date" value="1" id="input-article-show-date" />
                  <?php } ?>
                  &nbsp; </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-show-views"><?php echo $entry_show_views; ?></label>
            <div class="col-sm-9">
              <div class="checkbox">
                <label>
                  <?php if ($article_show_views) { ?>
                  <input type="checkbox" name="article_show_views" value="1" checked="checked" id="input-article-show-views" />
                  <?php } else { ?>
                  <input type="checkbox" name="article_show_views" value="1" id="input-article-show-views" />
                  <?php } ?>
                  &nbsp; </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-show-readmore"><?php echo $entry_show_readmore; ?></label>
            <div class="col-sm-9">
              <div class="checkbox">
                <label>
                  <?php if ($article_show_readmore) { ?>
                  <input type="checkbox" name="article_show_readmore" value="1" checked="checked" id="input-article-show-readmore" />
                  <?php } else { ?>
                  <input type="checkbox" name="article_show_readmore" value="1" id="input-article-show-readmore" />
                  <?php } ?>
                  &nbsp; </label>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-show-latest"><span data-toggle="tooltip" title="<?php echo $help_show_latest; ?>"><?php echo $entry_show_latest; ?></span></label>
            <div class="col-sm-9">
              <div class="checkbox">
                <label>
                  <?php if ($article_show_latest) { ?>
                  <input type="checkbox" name="article_show_latest" value="1" checked="checked" id="input-article-show-latest" />
                  <?php } else { ?>
                  <input type="checkbox" name="article_show_latest" value="1" id="input-article-show-latest" />
                  <?php } ?>
                  &nbsp; </label>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-show-root"><span data-toggle="tooltip" title="<?php echo $help_show_root; ?>"><?php echo $entry_show_root; ?></span></label>
            <div class="col-sm-9">
              <select name="article_show_root" id="input-show-root" class="form-control">
                <?php foreach ($articles_root_types as $type_id => $name) { ?>
                <?php if ($type_id == $article_show_root) { ?>
                <option value="<?php echo $type_id; ?>" selected="selected"><?php echo $name; ?></option>
                <?php } else { ?>
                <option value="<?php echo $type_id; ?>"><?php echo $name; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>

	  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-limit"><?php echo $entry_article_limit; ?></label>
            <div class="col-sm-9"><input type="text" name="article_page_limit" value="<?php echo $article_page_limit; ?>" id="input-article-limit" class="form-control" />
            </div>
          </div>

	  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-article-social"><span data-toggle="tooltip" title="<?php echo $help_social; ?>"><?php echo $entry_social; ?></span></label>
            <div class="col-sm-9"><textarea name="article_social" cols="80" rows="5" id="input-article-social" class="form-control"><?php echo $article_social; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-9">
              <select name="article_status" id="input-status" class="form-control">
                <?php if ($article_status) { ?>
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
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
<?php if ($ckeditor) { ?>
ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } else { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({
<?php if ($lang) { ?>
	height: 300,
	lang:'<?php echo $lang; ?>'
<?php } else { ?>
	height: 300
<?php } ?>
});
<?php } ?>
<?php } ?>
//--></script>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
<?php echo $footer; ?>