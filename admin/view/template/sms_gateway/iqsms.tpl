<div class="form-group">
    <label class="col-sm-4 control-label" for="iqsms-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="iqsms-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="iqsms-user"><?php echo $entry_user; ?></label>
    <div class="col-sm-8"><input type="text" name="iqsms[user]" id="iqsms-user" value="<?php echo $user; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="iqsms-pass"><?php echo $entry_pass; ?></label>
    <div class="col-sm-8"><input type="password" name="iqsms[pass]" id="iqsms-pass" value="<?php echo $pass; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="iqsms-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8">
        <select name="iqsms[sender]" id="iqsms-sender" class="form-control">
            <option value="TEST">TEST</option>
            <?php foreach($senders as $item) { ?>
            <option value="<?php echo $item; ?>"<?php if ($item == $sender) { ?> selected="true"<?php } ?>><?php echo $item; ?></option>
            <?php } ?>
        </select>
    </div>
</div>