<a href="#" data-toggle="modal" data-target="#modal-search">
<div id="search-block" class="buttons-header up-theme-modal">
<div class="button-i"><i class="fa fa-search"></i></div>
<span class="button-text"><?php echo $text_search; ?></span>
</div>
</a>
<div class="modal fade up-theme-modal" id="modal-search" tabindex="-1" role="dialog" aria-labelledby="modal-search" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      
      <div id="search" class="input-group">
        <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
        <span class="input-group-addon">
          <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
        </span>
      </div>
      
      </div>
    </div>
  </div>
</div>

