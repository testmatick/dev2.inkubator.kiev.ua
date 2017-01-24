 <?php if ($manufactureres) { ?>

 <div class="box catalog">

  <div class="box-heading"><?php echo $heading_title; ?></div>

  <div class="box-content">

    <div class="box-category" id="catalog">

	<ul>

       <?php foreach ($manufactureres as $manufacturer ) { ?>

         <li class = "toplevel">
		 
		  <?php if ($manufacturer['manufacturer_id'] == $active_manufacturer) {?>
		  
		   <a data-url="<?php echo $manufacturer['manufacturer_id']; ?>" class="active"><span class="pl">+  </span><?php echo $manufacturer['name']; ?></a>
		  
		   <? } else {  ?> 
		   
		    <a data-url="<?php echo $manufacturer['manufacturer_id']; ?>" class="close"><span class="pl">+  </span><?php echo $manufacturer['name']; ?></a>
		  
		 <?php } ?> 
		
         
        
		    <?php if ($manufacturer['products']) { ?>		

				<ul  <?php if ($manufacturer['manufacturer_id'] == $active_manufacturer) echo "style=display:block;"; else echo "style=display:none;"; ?> >

					<?php foreach ($manufacturer['products'] as $product) { ?>

						<li<?php if (!$product['qty']){?> class="zeroqauntity"<?php } ?>>

							<?php if ($product['product_id'] == $product_id) { ?>

								<a title="<?php echo $product['name']; ?>"class="active" data-url="<?php echo $product['image']; ?>"><?php echo $product['name']; ?><?php if ($product['special']){?><span class="special">&nbsp;<?php echo $text_special; ?></span><?php } ?></a>

								<?php } else { ?>

								<a  onclick="location.href=<?php echo '\'' . $product['href'] . '\''; ?>" title="<?php echo $product['name']; ?>" data-url="<?php echo $product['image']; ?>"><?php echo $product['name']; ?><?php if ($product['special']){?><span class="special">&nbsp;<?php echo $text_special; ?></span><?php } ?></a>

							<?php } ?>

						</li>

						<?php } ?>

					</ul>

				<?php } ?>

			</li>

			<?php } ?>

		</ul>

    </div>

  </div>

</div>


<script type="text/javascript"><!--
$(document).ready(function () {

		$('#catalog > ul > li > a.active').live('click', function () {
			$(this).find('.pl').html('+  ');
			$(this).removeClass('active').addClass('close').next('ul').hide();
		});  
		
	 $('#catalog > ul > li > a.close').live('click', function () {	
		$(this).scrollTop(300);
		var position = ($(this)).position();
       
		
		$('#catalog > ul > li > a.active').find('.pl').html('+  ');
		$('#catalog > ul > li > a.active').removeClass('active').addClass('close').next('ul').hide();
		$(this).find('.pl').html('-  ');
		$(this).removeClass('close').addClass('active').next('ul').show();
		
	<?php if ($uptop) { ?>
	
        var destination = $(this).offset().top;
		
        $("body:not(:animated)").animate({ scrollTop: destination }, 300);
		$("html").animate({ scrollTop: destination }, 300);
	<?php } ?>
		
		});  
		
	

	 $('#catalog > ul > li > ul > li > a').live("hover", function(){
	 
	 if ($(this).hasClass("pop")) {
	  	return;
	 } else {
	 
	     thubn = $(this).attr('data-url');
	
		 if (thubn) {
			 $(this).addClass("pop");
			 $(this).append('<div class="micropopup"><img src="' + thubn + '"></div>');
		 };
		 
	 }
	 
	 });
	

});
//--></script> 

<?php } ?>