<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
 <div class="page-header">
    <div class="container-fluid">
       <div class="pull-right">
      <div class="buttons">
		  <a class="btn btn-primary" onclick="$('#form').submit();" class="button"><span  data-toggle="tooltip" title="<?php echo $button_save; ?>" ><i class="fa fa-save"></i></span></a>
		  <a class="btn btn-default" onclick="location = '<?php echo $cancel; ?>';" class="button"><span  data-toggle="tooltip" title="<?php echo $button_cancel; ?>" ><i class="fa fa-reply"></i></span></a>
	  </div>
    </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="box">
    <div class="content">
      <div id="tabs" class="htabs"></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <table class="table table-bordered table-hover">
				<tbody>
					 <tr>
              <td><span class="required">*</span> <?php echo $text_id; ?></td>
              <td><input type="text" name="fast_id" value="<?php echo $newfastorder_id; ?>"  disabled/></td>
            </tr>
            <tr>
              <td> <?php echo $text_name; ?></td>
              <td><input type="text" name="name" value="<?php echo $name; ?>"  disabled/></td>
            </tr>
            <tr>
              <td><?php echo $text_telephone; ?></td>
              <td><input type="text" name="telephone" value="<?php echo $telephone; ?>"  disabled/></td>
            </tr>
            <tr>
              <td> <?php echo $text_comment; ?></td>
              <td><textarea style="width: 50%" rows="4" cols="40" name="comment"   ><?php echo $comment; ?></textarea></td>
            </tr>
			<tr>
              <td> <?php echo $text_comment_buyer; ?></td>
              <td><textarea style="width: 50%" rows="4" cols="40" name="comment_buyer"   disabled><?php echo $comment_buyer; ?></textarea></td>
            </tr>
			<tr>
			<tr>
				<td><?php echo $text_manager_form;?></td>
				<td>
					<select name="username">
					<?php if ($username !='') { ?>
					<option value="<?php echo $username ;?>"><?php echo $username; ?></option>
					<?php } else { ?>
					<option value="<?php echo $logged; ?>"><?php echo $logged; ?></option>
					<?php } ?>
					<?php foreach ($users as $user){?>
					<option value="<?php echo $user['username']?>"><?php echo $user['username']?></option>
					<?php }?>
					</select>
				</td>
			</tr>
            <tr>
              <td> <?php echo $text_status; ?></td>
            <td><select name="status_id">

                <?php if ($status_id == '0') { ?>
                <option value="0" selected="selected"><?php echo $status_wait; ?></option>
                <option value="1" ><?php echo $status_done; ?></option>
                <?php } else { ?>
                <option value="0" ><?php echo $status_wait; ?></option>
                <option value="1" selected="selected"><?php echo $status_done; ?></option>
                <?php } ?>
 
              </select></td>
            </tr>
            <tr>
              <td> <?php echo $text_added; ?></td>
              <td><input type="text" name="date_added" value="<?php echo $date_added; ?>"  disabled/>
	      </td>
            </tr>
            <tr>
              <td> <?php echo $text_modified; ?></td>
              <td><input type="text" name="date_modified" value="<?php echo $date_modified; ?>"  disabled/>
	      </td>
            </tr>
				</tbody>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
//--></script> 
<?php echo $footer; ?>