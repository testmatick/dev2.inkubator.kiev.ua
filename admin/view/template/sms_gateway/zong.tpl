<div class="form-group">
    <label class="col-sm-4 control-label" for="zong-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="zong-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="zong-user"><?php echo $entry_user; ?></label>
    <div class="col-sm-8"><input type="text" name="zong[user]" id="zong-user" value="<?php echo $user; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="zong-pass"><?php echo $entry_pass; ?></label>
    <div class="col-sm-8"><input type="password" name="zong[pass]" id="zong-pass" value="<?php echo $pass; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="zong-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="zong[sender]" id="zong-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="zong-unicode"><?php echo $entry_unicode; ?></label>
    <div class="col-sm-8">
        <select id="zong-unicode" name="zong[unicode]" class="form-control">
            <option value="0"><?php echo $text_no; ?></option>
            <option value="1"><?php echo $text_yes; ?></option>
        </select>
    </div>
</div>