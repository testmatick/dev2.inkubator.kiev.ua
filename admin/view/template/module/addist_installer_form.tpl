<div class="modal fade" id="download-modal" tabindex="-1" role="dialog" aria-labelledby="download-modal-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="download-modal-label"><?php echo $heading; ?></h4>
            </div>
            <?php if (!empty($error)){ ?>
            <div style="padding: 10px 10px 0px;">
                <?php foreach($error as $item) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $item; ?> <button type="button" class="close" data-dismiss="alert">×</button></div>
                <?php } ?>
            </div>
            
            <?php } else { ?>
            <div id="modal-body" class="modal-body">
                <form action="<?php echo $action; ?>" method="post" id="form-download" onsubmit="return checkForm();" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="input-customer"><?php echo $entry_customer; ?></label>
                        <div class="col-sm-9"><input type="text" id="input-customer" value="<?php echo $customer; ?>" readonly="true" class="form-control" /></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-9"><input type="text" id="input-email" value="<?php echo $email; ?>" readonly="true" class="form-control" /></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="input-release"><?php echo $entry_release; ?></label>
                        <div class="col-sm-9">
                            <div class="btn-group" data-toggle="buttons" style="width: 100%;">
                                <select name="download[release]" id="input-release" class="form-control radio">
                                    <?php foreach($releases as $release_item){ ?>
                                    <option value="<?php echo $release_item; ?>"<?php if ($release_item == $release){ ?> selected="true"<?php } ?>><?php echo $release_item; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="input-trial"><?php echo $entry_type; ?></label>
                        <div class="col-sm-9">
                            <div class="btn-group" data-toggle="buttons" style="width: 100%;">
                                <select name="download[trial]" id="input-trial" class="form-control radio" onchange="selectType($(this).val())">
                                    <option value="0"<?php if ($trial == 0){ ?> selected=""<?php } ?>><?php echo $text_full; ?></option>
                                    <option value="1"<?php if ($trial == 1){ ?> selected=""<?php } ?>><?php echo $text_trial; ?></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group license_fields"<?php if ($trial == 1) { ?> style="display: none;"<?php } ?>>
                        <label class="col-sm-3 control-label" for="input-market_id"><?php echo $addist_entry_market; ?></label>
                        <div class="col-sm-9">
                            <select name="download[market_id]" id="input-market_id" onchange="changeMarket()" class="form-control">
                                <?php foreach ($markets as $id=>$market) { ?>
                                <option value="<?php echo $id; ?>"<?php if ($id==$market_id){ ?> selected="true"<?php } ?>><?php echo $market['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group license_fields"<?php if ($trial == 1) { ?> style="display: none;"<?php } ?>>
                        <label class="col-sm-3 control-label" for="input-order_id"><?php echo $addist_entry_order_id; ?></label>
                        <div class="col-sm-9 input-group">
                            <input type="text" name="download[order_id]" id="input-order_id" value="<?php echo $order_id; ?>" data-bind="value:replyNumber" class="form-control" />
                            <span class="input-group-btn">
                                <a href="<?php echo $markets[1]['order_link']; ?>" id="order-link" class="btn btn-warning" target="_blank"><i class="fa fa-search"></i> <?php echo $addist_text_get_order_id; ?></a>
                            </span>
                        </div>
                    </div>
                    <input type="hidden" name="download[extension_id]" id="input-extension_id" value="<?php echo $extension_id; ?>" />
                    <input type="hidden" name="download[mail]" id="input-mail" value="0" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>  <?php echo $text_close; ?></button>
                <button type="button" class="btn btn-primary" onclick="sendFile()"><i class="fa fa-send"></i>  <?php echo $text_send; ?></button>
                <button type="button" class="btn btn-primary" onclick="downloadFile()"><i class="fa fa-download"></i> <?php echo $text_download; ?></button>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
<script type="text/javascript">
var trial = <?php echo $trial ? '1' : '0'; ?>;

function reposition()
{
    var modal = jQuery('.modal'),
    dialog = modal.find('.modal-dialog');
    modal.css('display', 'block');
    dialog.css("margin-top", Math.max(0, (jQuery(window).height() - dialog.height()) / 2));
}

function sendFile()
{
    jQuery('#input-mail').attr('value','1');
    jQuery('#form-download').submit();
}

function downloadFile()
{
    jQuery('#input-mail').attr('value','0');
    jQuery('#form-download').submit();
}

function selectType(type)
{
    if (type == 1)
    {
        jQuery('.license_fields').hide();
    }
    else
    {
        jQuery('.license_fields').show();
    }
    
    trial = type;
    reposition();
}

function changeMarket()
{
    var markets = JSON.parse('<?php echo json_encode($markets); ?>');
    var market_id = jQuery('#input-market_id').val();
    jQuery('#order-link').attr('href',markets[market_id]['order_link']);
}

function checkForm()
{
    if (trial == 0 && (jQuery('#input-market_id').val() == '' || jQuery('#input-order_id').val() == ''))
    {
        alert('<?php echo $addist_error_form; ?>');
        return false;
    }
}

jQuery(document).ready(function() {
    jQuery('.modal').on('show.bs.modal', reposition);
    jQuery(window).on('resize', function() {jQuery('.modal:visible').each(reposition);});
    initRadioBtn('#form-download select.radio');
});
</script>