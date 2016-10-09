<?php if ($show_path) { ?>
<h2><?php echo $path_title; ?></h2>
<?php } ?>
<?php if ($type == 'blogs') { ?>
    <ul>
    <?php foreach ($tltblogs as $tltblog) { ?>
    <li><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></li>
    <?php } ?>
    </ul>
<?php } elseif ($type == 'tags') { ?>
    <ul>
    <?php foreach ($tlttags as $tlttag) { ?>
    <li><a href="<?php echo $tlttag['href']; ?>"><?php echo $tlttag['title']; ?></a></li>
    <?php } ?>
    </ul>
<?php } else { ?>
    <div class="row">
        <div class="col-sm-6">
            <ul>
                <li><?php echo $heading_blogs; ?></li>
                <ul>
                    <?php foreach ($tltblogs as $tltblog) { ?>
                    <li><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </ul>
        </div>
        <div class="col-sm-6">
    		<ul>
            	<li><?php echo $heading_tags; ?></li>
                <ul>
                    <?php foreach ($tlttags as $tlttag) { ?>
                    <li><a href="<?php echo $tlttag['href']; ?>"><?php echo $tlttag['title']; ?></a></li>
                    <?php } ?>
                </ul>
    		</ul>
    	</div>
    </div>
<?php } ?>
