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
                <h3 class="panel-title"><i class="fa fa-eraser"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $text_occache; ?></label>
                        <div class="col-sm-10">
                            <a href="<?php echo $refresh; ?>" data-toggle="tooltip" title="<?php echo $button_clearef; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clearef; ?></a>&emsp;
                            <a href="<?php echo $clearlog; ?>" data-toggle="tooltip" title="<?php echo $button_clearlog; ?>" class="btn btn-info"><i class="fa fa-eraser"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clearlog; ?></a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $text_system; ?></label>
                        <div class="col-sm-10">
                            <button type="button" id="button-clear-sys" data-isfile='0' data-file="<?php echo $mod_system; ?>" class="btn btn-primary"><i class="fa fa-cogs"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clear; ?></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $text_vqcache; ?></label>
                        <div class="col-sm-10">
                            <button type="button" id="button-clear-vq" data-isfile='0' data-file="<?php echo $mod_vqcache; ?>" class="btn btn-primary"><i class="fa fa-puzzle-piece"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clear; ?></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $text_mode; ?></label>
                        <div class="col-sm-10">
                            <button type="button" id="button-clear-mod" data-isfile='1' data-file="<?php echo $mod_cache; ?>" class="btn btn-primary"><i class="fa fa-puzzle-piece"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clear; ?></button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $text_image; ?></label>
                        <div class="col-sm-10">
                            <button type="button" id="button-clear-img" data-isfile='0' data-file="<?php echo $mod_image; ?>" class="btn btn-primary"><i class="fa fa-image"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clear; ?></button>
                        </div>
                    </div>
                </form>
                <h4><?php echo $entry_header; ?></h4>
            </div>
        </div>
        <div style="text-align:center;">Cache cleaner by <a target="_blank" href="http://instup.com">Instup.com</a></div><br>
    </div>
    <?php echo $footer; ?>
<script>
    $('button[id^="button-clear"]').on('click', function(e){
        e.preventDefault();
        var file = $(this).attr('data-file');
        var is_file = $(this).attr('data-isfile');
        $.ajax({
            url: 'index.php?route=cache/cleaner/delete&token=<?php echo $token; ?>',
            dataType: 'json',
            type:"POST",
            data:{'file':file, 'is_file':is_file},
            success: function(json) {
                window.location.replace('index.php?route=cache/cleaner&token=<?php echo $token; ?>');
            }
        });
    });
</script>