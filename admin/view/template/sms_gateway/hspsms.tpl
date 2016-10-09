<div class="form-group">
    <label class="col-sm-4 control-label" for="hspsms-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="hspsms-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="hspsms-user"><?php echo $entry_user; ?></label>
    <div class="col-sm-8"><input type="text" name="hspsms[user]" id="hspsms-user" value="<?php echo $user; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="hspsms-apikey"><?php echo $entry_apikey; ?></label>
    <div class="col-sm-8"><input type="text" name="hspsms[apikey]" id="hspsms-apikey" value="<?php echo $apikey; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="hspsms-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="hspsms[sender]" id="hspsms-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="hspsms-type"><?php echo $entry_type; ?></label>
    <div class="col-sm-8">
        <select name="hspsms[type]" class="form-control" >
            <option value="TRANS">Transactional</option>
            <option value="PROMO" <?php if ($type == 'PROMO'){ ?>selected="true"<?php } ?>>Promotional</option>
        </select>
    </div>
</div>