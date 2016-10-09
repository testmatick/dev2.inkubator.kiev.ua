<div class="form-group">
    <label class="col-sm-4 control-label" for="atompark-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="atompark-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="atompark-public_key"><?php echo $entry_public_key; ?></label>
    <div class="col-sm-8"><input type="text" name="atompark[public_key]" id="atompark-public_key" value="<?php echo $public_key; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="atompark-private_key"><?php echo $entry_private_key; ?></label>
    <div class="col-sm-8"><input type="text" name="atompark[private_key]" id="atompark-private_key" value="<?php echo $private_key; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="atompark-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="atompark[sender]" id="atompark-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="atompark-currency"><?php echo $entry_currency; ?></label>
    <div class="col-sm-8">
        <select name="atompark[currency]" class="form-control" >
            <option value="USD"<?php if ($currency == 'USD'){ ?> selected="true"<?php } ?>>USD</option>
            <option value="UAH"<?php if ($currency == 'UAH'){ ?> selected="true"<?php } ?>>UAH</option>
            <option value="RUB"<?php if ($currency == 'RUB'){ ?> selected="true"<?php } ?>>RUB</option>
        </select>
    </div>
</div>