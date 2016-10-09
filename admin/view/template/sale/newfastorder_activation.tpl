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
      <h1><?php echo $heading_title_fastorder; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
   <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><?php echo $error_warning; ?></div>
  <?php } ?>
    <div class="alert alert-danger deactivation" style="display:none"></div>
	<div class="alert alert-success" style="display:none"></div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title_activation; ?></h3>
		</div>
	</div>
	<div class="panel-body text-center">
<div class="panel-callback" style="width: 300px;">
	<form id="myForm" method="post">
		
			<div class="title-activation text-center"><?php echo $add_activation_key;?></div>	
			<div class="panel-body-callback text-center">
				<input style="width:100%" id="license_key" name="license_key" class="input form-control" type="text"/>
				<div class="btn-cont">	
					<button id="submit1" class="btn btn-info" name="submitButton"><?php echo $activated_btn;?></button>
				</div>
			</div>
		
		
	</form>
</div>



<script type="text/javascript">
$('#submit1').bind('click',function() {
function test() {	
var license_key = $('#license_key').val();
	$.post('index.php?route=sale/newfastorder/activation&token=<?php echo $token; ?>', 'license_key=' + license_key);
	}
});
</script>
<style>
.btn-cont {
	margin-top:10px;
	margin-bottom:10px;
}
.panel-callback {
	border:1px solid #ddd;
	background:#fff;
	border-radius:5px;
	display:inline-block;
	margin:5px 25px;
}
.panel-body-callback {

	padding:10px;
}
.title-activation {
	font-size:14px;
	color:#000;
	padding:10px;
	background:#eee
}
#myForm label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
	color: red;
    font-style: italic;
}
#myForm input.error {
    border: 1px dotted red;
}
</style>
<div class="panel-callback" style="width: 300px;">
	<form id="deactivation" method="post">
		<div style="text-align:center;">
		<div class="title-activation text-center"><?php echo $enter_deactivation_key;?></div>	
			<div class="panel-body-callback text-center">
			<input id="license_key_deactivation" name="license_key_deactivation" class="input form-control" type="text"/>
				<div class="btn-cont">	
					<a class="btn btn-info" id="submitChangeStatus"><?php echo $btn_deactivation;?></a>
				</div>
			</div>
		</div>
	</form>
</div>
			<script type="text/javascript">
			$('#submitChangeStatus').bind('click',function() {
				var license_key_deactivation = $('#license_key_deactivation').val();
				var success = 'false';
					$.ajax({
						type:'get',
						dataType:'json',
						data:'license_key_deactivation=' + license_key_deactivation,
						url:'index.php?route=sale/newfastorder/deactivation&token=<?php echo $token; ?>',			
						success: function(json){
						console.log(json);
							if (json['error']) {
							$('.alert-success').hide('slow');
								$('.deactivation').html(json['error']);
								$('.deactivation').fadeIn('slow');
							}
							if (json['success']) {
							$('.deactivation').hide('slow');
							$('.alert.alert-success').html(json['success']);
							$('.alert.alert-success').fadeIn('slow');
							}
							
							
						}
					});				
			
			});
			</script>
  
  <div style="margin:0 auto; width: 500px; text-align: justify;" id="output"></div>
</div>

</div>

<?php echo $footer; ?>
