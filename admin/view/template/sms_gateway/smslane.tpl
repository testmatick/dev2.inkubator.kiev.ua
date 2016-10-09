<div class="form-group">
    <label class="col-sm-4 control-label" for="smslane-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="smslane-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="smslane-user"><?php echo $entry_user; ?></label>
    <div class="col-sm-8"><input type="text" name="smslane[user]" id="smslane-user" value="<?php echo $user; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="smslane-pass"><?php echo $entry_pass; ?></label>
    <div class="col-sm-8"><input type="password" name="smslane[pass]" id="smslane-pass" value="<?php echo $pass; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="smslane-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="smslane[sender]" id="smslane-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="smslane-gwid"><?php echo $entry_gwid; ?></label>
    <div class="col-sm-8">
        <select name="smslane[gwid]" class="form-control" >
            <option value="0">Promo</option>
            <option value="2" <?php if ($gwid == 2){ ?>selected="true"<?php } ?>>Trans</option>
        </select>
    </div>
</div>