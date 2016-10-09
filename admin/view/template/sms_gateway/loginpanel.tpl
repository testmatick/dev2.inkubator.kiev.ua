<div class="form-group">
    <label class="col-sm-4 control-label" for="loginpanel-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="loginpanel-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="loginpanel-user"><?php echo $entry_user; ?></label>
    <div class="col-sm-8"><input type="text" name="loginpanel[user]" id="loginpanel-user" value="<?php echo $user; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="loginpanel-pass"><?php echo $entry_pass; ?></label>
    <div class="col-sm-8"><input type="password" name="loginpanel[pass]" id="loginpanel-pass" value="<?php echo $pass; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="loginpanel-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="loginpanel[sender]" id="loginpanel-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="loginpanel-channel"><?php echo $entry_channel; ?></label>
    <div class="col-sm-8">
        <select name="loginpanel[channel]" class="form-control" >
            <option value="Promo">Promo</option>
            <option value="Trans" <?php if ($channel == 'Trans'){ ?>selected="true"<?php } ?>>Trans</option>
        </select>
    </div>
</div>