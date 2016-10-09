<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-cartsms" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>

            <h1><i class="fa fa-envelope-o"></i> <?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo v_menu_setting; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cartsms">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sms_lang"><?php echo ucfirst(trim(v_customersms_langversion)); ?></label>
                        <div class="col-sm-10">
                            <select name="sms_lang" class="form-control">
                                <?php echo $lang; ?>
                            </select>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sms_timezone"><?php echo ucfirst(trim(v_sendsms_timezone2)); ?></label>
                        <div class="col-sm-10">
                            <select name="sms_timezone" class="form-control">
                                <?php 
                                foreach($timezone as $row){
                                $selected = "";
                                if($timezone_actual == $row)
                                {
                                $selected = " selected";
                                }
                                echo '<option value="'.$row.'"'.$selected.'>'.$row.'</option>';
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">
            <div id="fb-root"></div>
            <script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=529113080511289&version=v2.0";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            
            <h1><?php echo v_about_about; ?></h1><img style="float:right;" alt="CartSMS" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAToAAAA4CAYAAABt/TTjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozQ0I4NzQwQzA0RTExMUUzODJDMTk2RkI1MkJFMzdDNSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozQ0I4NzQwRDA0RTExMUUzODJDMTk2RkI1MkJFMzdDNSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjNDQjg3NDBBMDRFMTExRTM4MkMxOTZGQjUyQkUzN0M1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjNDQjg3NDBCMDRFMTExRTM4MkMxOTZGQjUyQkUzN0M1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+TzT8FwAABixJREFUeNrsndtx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" />

            <p>
                <b><?php echo v_about_version_oc.number_format(SMS_VERSION, 2); ?></b><br/>
                <?php echo v_about_copyright; ?><br/><br/>

                <b><?php echo v_about_supported_text_oc; ?></b> <?php echo v_about_supported_version_oc ?><br/><br/>

                <b><?php echo v_about_developer; ?></b><br/>
                <?php echo v_about_topefekt; ?><br/><br/>

                <b><?php echo v_about_address; ?></b><br/>
                <?php echo v_about_street; ?><br/>
                <?php echo v_about_city; ?><br/>
                <?php echo v_about_state; ?><br/>
                <?php echo v_about_vat; ?><br/><br/>

                <b><?php echo v_about_phone; ?></b><br/>
                <?php echo v_about_phonenr; ?><br/><br/>

                <b><?php echo v_about_mail; ?></b><br/>
                <a href="mailto:<?php echo v_about_mailsales; ?>"><?php echo v_about_mailsales; ?></a><br/>
                <a href="mailto:<?php echo v_about_mailsupport; ?>"><?php echo v_about_mailsupport; ?></a><br/><br/>

                <b><?php echo v_about_web; ?></b><br/>
                <a href="http://<?php echo v_about_website_name_oc; ?>"><?php echo v_about_website_name_oc; ?><br/></a><br/>
                
                <b>Facebook:</b><br/>
                <div class="fb-like" data-href="https://www.facebook.com/cartsms" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                <br/><br/>

                <b><?php echo v_about_manual_text; ?></b><br/>
                <a href="http://<?php echo v_about_manual_url_oc; ?>"><?php echo v_about_manual_url_oc; ?></a><br/><br/><br/>
                <img alt="TOPefekt" src="data:image/gif;base64,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" />
            </p>
        </div>
    </div>
</div>

<?php echo $footer; ?>