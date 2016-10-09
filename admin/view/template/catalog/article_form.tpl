<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-article" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
<a onclick="apply();" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-pencil"></i></a>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-article" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active in" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
		<input type="text" name="article_description[<?php echo $language['language_id']; ?>][name]" id="input-name<?php echo $language['language_id']; ?>" value="<?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['name'] : ''; ?>" class="form-control" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                  <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-short-description<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_short_description; ?>"><?php echo $entry_short_description; ?></span></label>
                    <div class="col-sm-10">
                      <textarea name="article_description[<?php echo $language['language_id']; ?>][short_description]" placeholder="<?php echo $entry_short_description; ?>" id="input-short-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['short_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="article_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
		<label class="col-sm-2 control-label" for="input-seo-title<?php echo $language['language_id']; ?>"><?php echo $entry_seo_title; ?></label>
                <div class="col-sm-10">
		<input type="text" name="article_description[<?php echo $language['language_id']; ?>][seo_title]" id="input-seo-title<?php echo $language['language_id']; ?>" value="<?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['seo_title'] : ''; ?>" class="form-control" />
                        </div>
                  </div>
                  <div class="form-group">
		<label class="col-sm-2 control-label" for="input-seo-h1<?php echo $language['language_id']; ?>"><?php echo $entry_seo_h1; ?></label>  
                <div class="col-sm-10">
		<input type="text" name="article_description[<?php echo $language['language_id']; ?>][seo_h1]" id="input-seo-h1<?php echo $language['language_id']; ?>" value="<?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['seo_h1'] : ''; ?>" class="form-control" />
                      </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="article_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="article_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
		<label class="col-sm-2 control-label" for="input-related-title<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_related_title; ?>"><?php echo $entry_related_title; ?></span></label>
                <div class="col-sm-10">
		<input type="text" name="article_description[<?php echo $language['language_id']; ?>][related_title]" id="input-related-title<?php echo $language['language_id']; ?>" value="<?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['related_title'] : ''; ?>" class="form-control" />
                      </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
        <div class="tab-pane fade" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-parent"><span data-toggle="tooltip" title="<?php echo $help_parent; ?>"><?php echo $entry_parent; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="path" value="<?php echo $path; ?>" id="input-parent" class="form-control" />
                  <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $article_store)) { ?>
                        <input type="checkbox" name="article_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="article_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $article_store)) { ?>
                        <input type="checkbox" name="article_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="article_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-product" class="form-control" />
              <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products as $product) { ?>
                <div id="product-related<?php echo $product['product_id']; ?>" class="drag"><i class="fa fa-minus-circle"></i> <i class="sort-related fa fa-arrow-up"></i> <?php echo $product['name']; ?>
                  <input type="hidden" name="product[]" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>                
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-alternative-link"><span data-toggle="tooltip" title="<?php echo $help_alternative_link; ?>"><?php echo $entry_alternative_link; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="alternative_link" value="<?php echo $alternative_link; ?>" id="input-alternative-link" class="form-control" />     
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_image; ?>"><?php echo $entry_image; ?></span></label>
                <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div>
              <div class="form-group">
		<label class="col-sm-2 control-label" for="input-sort-order"><span data-toggle="tooltip" title="<?php echo $help_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>
                <div class="col-sm-3">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
              <div class="form-group">
		<label class="col-sm-2 control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="col-sm-3">
		<div class="input-group date">
                  <input type="text" name="date_added" value="<?php echo $date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <div class="form-group">
		<label class="col-sm-2 control-label" for="input-viewed"><?php echo $entry_viewed; ?></label>
                <div class="col-sm-3">
                  <input type="text" name="viewed" value="<?php echo $viewed; ?>" placeholder="<?php echo $entry_viewed; ?>" id="input-viewed" class="form-control" />
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
            </div>
            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="article_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($article_layout[0]) && $article_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="article_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($article_layout[$store['store_id']]) && $article_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<div class="art_apply">
	<div class="notice"><i class="fa fa-check-square"></i></div>
</div>
<?php if ($success) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
		$('.art_apply .notice').fadeIn(1000).delay(2000).fadeOut(1000);
});
//--></script>
<?php } ?>

<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
<?php if ($ckeditor) { ?>
ckeditorInit('input-short-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } else { ?>
$('#input-short-description<?php echo $language['language_id']; ?>').summernote({
<?php if ($lang) { ?>
	height: 150,
	lang:'<?php echo $lang; ?>'
<?php } else { ?>
	height: 150
<?php } ?>
});
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
$('input[name=\'path\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					article_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['article_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'path\']').val(item['label']);
		$('input[name=\'parent_id\']').val(item['value']);
	}
});

// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');
		
		$('#product-related' + item['value']).remove();
		
		$('#product-related').append('<div id="product-related' + item['value'] + '" class="drag"><i class="fa fa-minus-circle"></i> <i class="sort-related fa fa-arrow-up"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
	}	
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>

<script type="text/javascript"><!--
    $('#product-related').on('click', '.sort-related', function () {
        var current = $(this).parent();
        var prev = current.prev();
        swap(current, prev);
        return false;
    });
function swap(a, b) {
    if (a.size() > 0 && b.size() > 0) {
        a.insertBefore(b);
    }
}
//--></script>

<script type="text/javascript"><!--
function apply() {
	$('#form-article').append('<input type="hidden" name="apply" value="1" />');
	$('#form-article').submit();
}
//--></script>

<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>

<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>