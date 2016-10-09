<div class="form-group">
    <label class="col-sm-4 control-label" for="sms_ru-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="sms_ru-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="sms_ru-secret"><?php echo $entry_secret; ?></label>
    <div class="col-sm-8"><input type="password" name="sms_ru[secret]" id="sms_ru-secret" value="<?php echo $secret; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="sms_ru-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="sms_ru[sender]" id="sms_ru-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>