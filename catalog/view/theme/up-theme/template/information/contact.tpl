<?php echo $header; ?>
<?php global $config; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    
      <h1><?php echo $heading_title; ?></h1>
      
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <?php if ($image) { ?>
            <div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <div class="col-sm-3"><legend><?php echo $store; ?></legend>
              <address>
              <?php echo $address; ?>
              </address>
              <!--
              <?php if ($geocode) { ?>
              <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
              <?php } ?>
              -->
            </div>
            <div class="col-sm-2">
            <legend><?php echo $text_telephone; ?></legend>
              <?php echo $telephone; ?><br>
               <?php echo $telephone2; ?><br>
                <?php echo $telephone3; ?>
              <?php if ($fax) { ?>
              <legend><?php echo $text_fax; ?></legend>
              <?php echo $fax; ?>
              <?php } ?>
            </div>
            <div class="col-sm-2">
              <?php if ($open) { ?>
              <legend><?php echo $text_open; ?></legend>
              <?php echo $open; ?>
              <?php } ?>
            </div>
            <div class="col-sm-2">
              <?php if ($comment) { ?>
              <legend><?php echo $text_comment; ?></legend>
              <?php echo $comment; ?>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?>
                  <strong><?php echo $text_telephone2; ?></strong>
                  <?php echo $location['telephone2']; ?>
                  <strong><?php echo $text_telephone3; ?></strong>
                  <?php echo $location['telephone3']; ?>
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>


<?php if($config->get('t1o_contact_map_status')== 1) { 
    $t1o_contact_map_ll = $config->get('t1o_contact_map_ll');
    $t1o_contact_map_type = $config->get('t1o_contact_map_type');
?>  
  <h3><?php echo $text_location; ?></h3>    
  <div class="contact-map">
  <div id="map_div"></div>
  </div>
<script src="//maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	//------- Google Maps ---------//
	// Creating a LatLng object containing the coordinate for the center of the map
	var latlng = new google.maps.LatLng(<?php echo $t1o_contact_map_ll; ?>);
	 
	// Creating an object literal containing the properties we want to pass to the map  
	var options = {  
		zoom: 15, // This number can be set to define the initial zoom level of the map
		center: latlng,
		mapTypeId: google.maps.MapTypeId.<?php echo $t1o_contact_map_type; ?> // This value can be set to define the map type ROADMAP/SATELLITE/HYBRID/TERRAIN
	};  
	// Calling the constructor, thereby initializing the map  
	var map = new google.maps.Map(document.getElementById('map_div'), options);  
	
	// Define Marker properties
	var image = new google.maps.MarkerImage(
		//Image file name
		'catalog/view/theme/up-theme/image/map_marker.png',
		// This marker is 129 pixels wide by 42 pixels tall.
		new google.maps.Size(57, 76),
		// The origin for this image is 0,0.
		new google.maps.Point(0,0),
		// The anchor for this image is the base of the flagpole at 18,42.
		new google.maps.Point(30, 76)
	);

	// Add Marker
	var marker1 = new google.maps.Marker({
		position: new google.maps.LatLng(<?php echo $t1o_contact_map_ll; ?>), 
		map: map,
		icon: image // This path is the custom pin to be shown. Remove this line and the proceeding comma to use default pin
	});	
	
	// Add listener for a click on the pin
	google.maps.event.addListener(marker1, 'click', function() {
        infowindow1.open(map, marker1);
	    });

	// Add information window
	var infowindow1 = new google.maps.InfoWindow({  
		content:  '<div> </div>'
	}); 
	
});
</script> 
<?php } ?> 

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h3><?php echo $text_contact; ?></h3>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
