<div class="form-group">
    <label class="col-sm-4 control-label" for="websms-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="websms-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="websms-user"><?php echo $entry_user; ?></label>
    <div class="col-sm-8"><input type="text" name="websms[user]" id="websms-user" value="<?php echo $user; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="websms-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="websms[sender]" id="websms-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="websms-apikey"><?php echo $entry_apikey; ?></label>
    <div class="col-sm-8"><input type="password" name="websms[apikey]" id="websms-apikey" value="<?php echo $apikey; ?>" class="form-control" /></div>
</div>