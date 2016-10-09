<div class="form-group">
    <label class="col-sm-4 control-label" for="bestsmsdeal_com-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="bestsmsdeal_com-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="bestsmsdeal_com-key"><?php echo $entry_key; ?></label>
    <div class="col-sm-8"><input type="text" name="bestsmsdeal_com[key]" id="bestsmsdeal_com-key" value="<?php echo $key; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="bestsmsdeal_com-campaign"><?php echo $entry_campaign; ?></label>
    <div class="col-sm-8"><input type="text" name="bestsmsdeal_com[campaign]" id="bestsmsdeal_com-campaign" value="<?php echo $campaign; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="bestsmsdeal_com-routeid"><?php echo $entry_routeid; ?></label>
    <div class="col-sm-8">
        <select name="bestsmsdeal_com[routeid]" id="bestsmsdeal_com-routeid" class="form-control">
            <option value="5"<?php if ($routeid == 5){ ?> selected=""<?php } ?>>Trans</option>
            <option value="7"<?php if ($routeid == 7){ ?> selected=""<?php } ?>>Promo</option>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="bestsmsdeal_com-senderid"><?php echo $entry_senderid; ?></label>
    <div class="col-sm-8"><input type="text" name="bestsmsdeal_com[senderid]" id="bestsmsdeal_com-senderid" value="<?php echo $senderid; ?>" class="form-control" /></div>
</div>