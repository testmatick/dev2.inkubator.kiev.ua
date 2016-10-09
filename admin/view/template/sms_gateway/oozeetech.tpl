<div class="form-group">
    <label class="col-sm-4 control-label" for="oozeetech-balance"><?php echo $entry_balance; ?></label>
    <div class="col-sm-8"><input type="text" id="oozeetech-balance" value="<?php echo $balance; ?>" class="form-control" onkeydown="return false;" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="oozeetech-username"><?php echo $entry_username; ?></label>
    <div class="col-sm-8"><input type="text" name="oozeetech[username]" id="oozeetech-username" value="<?php echo $username; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="oozeetech-password"><?php echo $entry_password; ?></label>
    <div class="col-sm-8"><input type="password" name="oozeetech[password]" id="oozeetech-password" value="<?php echo $password; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="oozeetech-sender"><?php echo $entry_sender; ?></label>
    <div class="col-sm-8"><input type="text" name="oozeetech[sender]" id="oozeetech-sender" value="<?php echo $sender; ?>" class="form-control" /></div>
</div>
<div class="form-group">
    <label class="col-sm-4 control-label" for="oozeetech-route"><?php echo $entry_route; ?></label>
    <div class="col-sm-8">
        <select name="oozeetech[route]" class="form-control" >
            <option value="route3">Route 3</option>
            <option value="route1" <?php if ($route == 'route1'){ ?>selected="true"<?php } ?>>Route 1</option>
            <option value="route2" <?php if ($route == 'route2'){ ?>selected="true"<?php } ?>>Route 2</option>
        </select>
    </div>
</div>