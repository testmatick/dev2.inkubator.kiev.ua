<?php if((isset($_GET['route']) && !isset($_SESSION[$_GET['route']]))) { ?>
<script type="text/javascript">
	$(document).ready(function () {
		$("#popup-message").modal();
		
	});
</script> 
<?php } ?>
<div class="modal fade up-theme-modal-popup pm" id="popup-message" tabindex="-1" role="dialog" aria-labelledby="modal-search" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <?php echo $up_theme_popup_message; ?>
      </div>
    </div>
  </div>
</div>
<?php if(isset($_GET['route'])) {
	$_SESSION[$_GET['route']] = 1;	
	}
?>