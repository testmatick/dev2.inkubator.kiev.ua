<?php echo $header; ?>
<?php if((float)VERSION < 2) { ?>
<script   src="https://code.jquery.com/jquery-1.9.1.min.js"   integrity="sha256-wS9gmOZBqsqWxgIVgA8Y9WcQOa7PgSIX+rPA0VL2rbQ="   crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<?php } else { echo $column_left; } ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-seopage" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1>SEO | <p>Full Inde</p><span>X</span></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
		<div class="alert alert-danger error_robots" style="display:none"><i class="fa fa-exclamation-circle"></i> <?php echo $error_robots; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
		<div class="alert alert-danger error_noindex" style="display:none"><i class="fa fa-exclamation-circle"></i> <?php echo $error_noindex; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-seopage" class="form-horizontal">
                
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home"><i class="fa fa-link" aria-hidden="true"></i>  <?php echo $header_1;?></a></li>
                        <li><a data-toggle="tab" href="#menu1"><i class="fa fa-code" aria-hidden="true"></i>  Meta</a></li>
                        <li><a data-toggle="tab" href="#menu2"><i class="fa fa-exchange" aria-hidden="true"></i>  Redirect</a></li>
                        <li><a data-toggle="tab" href="#menu3"><i class="fa fa-file-o" aria-hidden="true"></i>  H1/Content</a></li>
                        <li class="hidden"><a data-toggle="tab" href="#menu4"><i class="fa fa-bug" aria-hidden="true"></i>  Test</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane in active">
                           
                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_google; ?>"><?php echo $entry_google; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_google) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_google" value="1" <?php if ($seopage_google) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_google) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_google" value="0" <?php if (!$seopage_google) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>									
                            </div>

                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_yandex; ?>"><?php echo $entry_yandex; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary yes <?php if ($seopage_yandex) { echo 'active'; } ?> " <?php if (!$seopage_yandex) { echo 'disabled'; } ?>>
                                        <input type="radio" class="yes" name="seopage_yandex" value="1" <?php if ($seopage_yandex) { echo 'checked="checked"'; } ?> <?php if (!$seopage_yandex) { echo 'disabled'; } ?>>
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary no <?php if (!$seopage_yandex) { echo 'active'; } ?> ">
                                        <input type="radio" class="no" name="seopage_yandex" value="0" <?php if (!$seopage_yandex) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>										
                            </div>

                            <div class="form-group follow delborder" id="follow">
                                <div class="col-sm-9 col-sm-offset-3 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_follow) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_follow" value="1" <?php if ($seopage_follow) { echo 'checked="checked"'; } ?> />
                                        <?php echo 'follow'; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_follow) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_follow" value="0" <?php if (!$seopage_follow) { echo 'checked="checked"'; } ?> />
                                        <?php echo 'nofollow'; ?>
                                    </label>
                                </div>									
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="seopage_canonicals"><span data-toggle="tooltip" title="<?php echo $help_canonicals; ?>"><?php echo $entry_canonicals; ?></span></label>
								
                                <label class="col-sm-2 control-label">category & etc...</label>
                                <div class="col-sm-7">
                                    <input type="text" name="seopage_canonicals" value="<?php echo $seopage_canonicals; ?>" id="seopage_canonicals" class="form-control" />
                                    <span class="help-block"><?php echo $text_canonicals; ?></span>
                                </div>								
                                <label class="col-sm-2 control-label col-sm-offset-3">product</label>
                                <div class="col-sm-7">
                                    <input type="text" name="seopage_canonicals_p" value="<?php echo $seopage_canonicals_p; ?>" id="seopage_canonicals_p" class="form-control" />
                                    <span class="help-block"><?php echo $text_canonicals; ?></span>
                                </div>								
                                <label class="col-sm-2 control-label col-sm-offset-3">home</label>
                                <div class="col-sm-7">
                                    <input type="text" name="seopage_canonicals_h" value="<?php echo $seopage_canonicals_h; ?>" id="seopage_canonicals_h" class="form-control" />
                                    <span class="help-block"><?php echo $text_canonicals; ?></span>
                                </div>
								
                             <label class="col-sm-2 control-label col-sm-offset-3"><?php echo $entry_description_canonical; ?></label>
                                <div class="col-sm-7 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_description_canonical) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_description_canonical" value="1" <?php if ($seopage_description_canonical) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_description_canonical) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_description_canonical" value="0" <?php if (!$seopage_description_canonical) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>							
                            </div>

                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_canonical_pattern; ?>"><?php echo $entry_canonical_pattern; ?></span></label>
                                <div class="col-sm-9">
                                    <input type="text" name="seopage_canonical_pattern" value="<?php echo $seopage_canonical_pattern; ?>" id="seopage_canonical_pattern" class="form-control" />
                                    <span class="help-block"><?php echo $text_star; ?></span>
                                </div>
                            </div>						

                        </div>	

                        <div id="menu1" class="tab-pane">

                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label" for="seopage_metapattern"><span data-toggle="tooltip" title="<?php echo $help_metapattern; ?>"><?php echo $entry_metapattern; ?></span></label>
                                <div class="col-sm-9">
                                    <input type="text" name="seopage_metapattern" value="<?php echo $seopage_metapattern; ?>" id="seopage_metapattern" class="form-control" />
                                    <span class="help-block"><?php echo $text_metapattern; ?></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_page; ?>"><?php echo $entry_page; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_page) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_page" value="1" <?php if ($seopage_page) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_page) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_page" value="0" <?php if (!$seopage_page) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>								
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Meta Title → name</label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_title_to_name) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_title_to_name" value="1" <?php if ($seopage_title_to_name) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_title_to_name) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_title_to_name" value="0" <?php if (!$seopage_title_to_name) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>								
                            </div>

                        </div>


                        <div id="menu2" class="tab-pane">		

                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_301; ?>"><?php echo $entry_301; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_301) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_301" value="1" <?php if ($seopage_301) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_301) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_301" value="0" <?php if (!$seopage_301) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>									
                            </div>	

                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_301; ?>"><?php echo $entry_review_301; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_review_301) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_review_301" value="1" <?php if ($seopage_review_301) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_review_301) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_review_301" value="0" <?php if (!$seopage_review_301) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>									
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_seopro_tags; ?>"><?php echo $entry_seopro_tags; ?></span></label>
                                <div class="col-sm-9">
                                    <input type="text" name="seopage_seopro_tags" value="<?php echo $seopage_seopro_tags; ?>" id="seopage_seopro_tags" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="seopage_redirects"><span data-toggle="tooltip" title="<?php echo $help_redirects; ?>"><?php echo $entry_redirects; ?></span></label>

								<label class="col-sm-2 control-label">category & etc...</label>
                                <div class="col-sm-7">
                                    <input type="text" name="seopage_redirects" value="<?php echo $seopage_redirects; ?>" id="seopage_redirects" class="form-control" />
                                    <span class="help-block"><?php echo $text_redirects; ?></span>
                                </div>								
                                <label class="col-sm-2 control-label col-sm-offset-3">product</label>
                                <div class="col-sm-7">
                                    <input type="text" name="seopage_redirects_p" value="<?php echo $seopage_redirects_p; ?>" id="seopage_redirects_p" class="form-control" />
                                    <span class="help-block"><?php echo $text_redirects; ?></span>
                                </div>								
                                <label class="col-sm-2 control-label col-sm-offset-3">home</label>
                                <div class="col-sm-7">
                                    <input type="text" name="seopage_redirects_h" value="<?php echo $seopage_redirects_h; ?>" id="seopage_redirects_h" class="form-control" />
                                    <span class="help-block"><?php echo $text_redirects; ?></span>
                                </div>
                            </div>

                            <div class="form-group delborder">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_redirect_pattern; ?>"><?php echo $entry_redirect_pattern; ?></span></label>
                                <div class="col-sm-9">
                                    <input type="text" name="seopage_redirect_pattern" value="<?php echo $seopage_redirect_pattern; ?>" id="seopage_redirect_pattern" class="form-control" />
                                    <span class="help-block"><?php echo $text_star; ?></span>
                                </div>
                            </div>

                        </div>


                        <div id="menu3" class="tab-pane">
						
						    <div class="form-group">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_description; ?>"><?php echo $entry_description; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_description) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_description" value="1" <?php if ($seopage_description) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_description) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_description" value="0" <?php if (!$seopage_description) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>									
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_h1; ?>"><?php echo $entry_h1; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_h1) { echo 'active'; } ?> ">
                                        <input type="radio" class="yes1" name="seopage_h1" value="1" <?php if ($seopage_h1) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_h1) { echo 'active'; } ?> ">
                                        <input type="radio" class="no1" name="seopage_h1" value="0" <?php if (!$seopage_h1) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>								
                            </div>

                            <div class="form-group delborder h11">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_span; ?>"><?php echo $entry_span; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_span) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_span" value="1" <?php if ($seopage_span) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_span) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_span" value="0" <?php if (!$seopage_span) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
                            </div>
							
                            <div class="form-group delborder h11">
                                <label class="col-sm-3 control-label" for="seopage_pattern"><span data-toggle="tooltip" title="<?php echo $help_pattern; ?>"><?php echo $entry_pattern; ?></span></label>
                                <div class="col-sm-9">
                                    <input type="text" name="seopage_pattern" value="<?php echo $seopage_pattern; ?>" id="seopage_pattern" class="form-control" />
                                    <span class="help-block"><?php echo $text_pattern; ?></span>
                                </div>
                            </div>		
							
                            <div class="form-group delborder h11">
                                <label class="col-sm-3 control-label" for="seopage_style"><span data-toggle="tooltip" title="<?php echo $help_style; ?>"><?php echo $entry_style; ?></span></label>
                                <div class="col-sm-9">
                                    <textarea type="text" name="seopage_style" id="seopage_style" class="form-control" rows="6"><?php echo $seopage_style; ?></textarea>
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_sortlimit; ?>"><?php echo $entry_sortlimit; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_sortlimit) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_sortlimit" value="1" <?php if ($seopage_sortlimit) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_sortlimit) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_sortlimit" value="0" <?php if (!$seopage_sortlimit) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_page; ?>"><?php echo $entry_review_page; ?></span></label>
                                <div class="col-sm-9 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_review_page) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_review_page" value="1" <?php if ($seopage_review_page) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_review_page) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_review_page" value="0" <?php if (!$seopage_review_page) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group buttons">
                                <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_hide; ?>"><?php echo $entry_hide; ?></span></label>

								<label class="col-sm-2 control-label"><?php echo $top; ?></label>
                                <div class="col-sm-7 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_hide_content_top) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_content_top" value="1" <?php if ($seopage_hide_content_top) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_hide_content_top) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_content_top" value="0" <?php if (!$seopage_hide_content_top) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>								


								
                                <label class="col-sm-2 control-label col-sm-offset-3"><?php echo $left; ?></label>
                                <div class="col-sm-7 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_hide_column_left) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_column_left" value="1" <?php if ($seopage_hide_column_left) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_hide_column_left) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_column_left" value="0" <?php if (!$seopage_hide_column_left) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>


								
                                <label class="col-sm-2 control-label col-sm-offset-3"><?php echo $right; ?></label>
                                <div class="col-sm-7 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_hide_column_right) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_column_right" value="1" <?php if ($seopage_hide_column_right) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_hide_column_right) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_column_right" value="0" <?php if (!$seopage_hide_column_right) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>


								
                                <label class="col-sm-2 control-label col-sm-offset-3"><?php echo $bottom; ?></label>
                                <div class="col-sm-7 btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary  <?php if ($seopage_hide_content_bottom) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_content_bottom" value="1" <?php if ($seopage_hide_content_bottom) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="btn btn-primary <?php if (!$seopage_hide_content_bottom) { echo 'active'; } ?> ">
                                        <input type="radio" name="seopage_hide_content_bottom" value="0" <?php if (!$seopage_hide_content_bottom) { echo 'checked="checked"'; } ?> />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
								
                            </div>

                        </div>
						
						<div id="menu4" class="tab-pane">						
							<div class="form-group delborder">
								<label class="col-sm-2 control-label" for="seopage_redirect_list"><?php echo $redirect_list; ?></label>
								<div class="col-sm-10">
									<textarea type="text" name="seopage_redirect_list" id="seopage_redirect_list" class="form-control" rows="12" readonly><?php echo $seopage_redirect_list; ?></textarea>
									<span class="pull-right"><i id="redirect_list_edit" class="fa fa-pencil-square-o"></i></span>							
								</div>
							</div>
							
							<div class="col-sm-5"><input type="text" id="from" class="form-control" /></div>
							<div class="col-sm-1"><span class="go">→</span></div>
							<div class="col-sm-5"><input type="text" id="to" class="form-control" /></div>
							
							<div class="col-sm-1"><div id="add" class="btn btn-primary"><i class="fa fa-arrow-circle-o-right"></i></div></div>
						
						</div>

                    </div>
                </form>
            </div>
        </div>
    </div>
<script>
$(document).ready(function () {                            
    $(".yes").change(function () {
        if ($(".yes").prop("checked", true) ) {
            $('#follow').show();
			/*$(".yes").prop("disabled", true);*/
        }
    });
    $(".no").change(function () {
        if ($(".no").prop("checked", true) ) {
            $('#follow').hide();
        }
    });
    if ($(".no").is(":checked")) {
        $('#follow').hide();
    }
	
});

$('#redirect_list_edit').click(function(){
	$('#seopage_redirect_list').prop("readonly", false);
});

$('#add').click(function(){
	if (($('#from').val() != '') && ($('#to').val() != '')){
		var quote = '\n'+$('#from').val()+'→'+$('#to').val();
		$('#seopage_redirect_list').append(quote);
	}
});

$(document).ready(function () {                            
    $(".yes1").change(function () {
        if ($(".yes1").prop("checked", true) ) {
            $('.h11').hide("slow");
        }
    });
    $(".no1").change(function () {
        if ($(".no1").prop("checked", true) ) {
            $('.h11').show("slow");
        }
    });
    if ($(".yes1").is(":checked")) {
        $('.h11').hide();
    }
	
	$.ajax({
		url: '<?php echo HTTP_CATALOG; ?>index.php?route=module/fx',
		dataType: 'text',
		success: function(json) {
			if ( (json == 1) || (json == 12) ) {
				$('.error_robots').show();
			}
			if ( (json == 2) || (json == 12) ) {
				$('.error_noindex').show();
			}
		},
		complete: function(json) {
		   /*	$('.panel-heading').append(json+"!");  */
		},
	});
<?php if((float)VERSION < 2) { ?>
	$('.nav-tabs a').click(function(){
		$(this).tab('show');
	});
	$('[data-toggle="tooltip"]').tooltip();
<?php } ?>

});
</script>
</div>
<style>
<?php if((float)VERSION < 2) { ?>
#menu{display:none}
.page-header{margin-top:0}
.pull-right{padding-top: 15px}
<?php } ?>
h1 p {color:#29D!important; display:inline}
h1 span{color:#FB5151}
#redirect_list_edit{font-size:2em; cursor: pointer;}
.go{font-size:1.8em; text-align:center}
.alert-danger {
  background-color: #FB5151;
  border: none;
  font-size: 1.25em;
  color: #FFF; }
.delborder{border: none!important}
.btn-group > label{padding: 5px 10px;}
.btn-group > label:not(.active){opacity:.5!important;padding: 5px 10px;}
.col-sm-7 > .help-block {margin-bottom: 20px;}
.form-group + .form-group { border-top: 1px solid #ededed; }
.yes:hover{cursor: no-drop}
.form-group {
    padding-top: 15px;
    padding-bottom: 15px;
    margin-bottom: 0;
}
.buttons .btn {margin-bottom:5px}
</style>

<?php echo $footer; ?>