jQuery(document).ready(function(){
    jQuery('[data-toggle="tooltip"]').tooltip({html:true});
    
    initRadioBtn('select.radio');
});

function initRadioBtn(selector)
{
    jQuery(selector).each(function(){
        var select = this;
        var html = '<div class="btn-group" data-toggle="buttons" style="width: 100%">';
        if (jQuery(this).children('option').length > 0 && jQuery(this).children('option').length < 5){
            var class_name = ' col-sm-' + (12/jQuery(this).children('option').length).toString();
            jQuery(this).children('option').each(function(){
                html += '<label class="btn btn-default'+(this.hasAttribute('selected') ? ' active' : '')+class_name+'">';
                html += '<input type="radio" name="'+jQuery(select).attr('name')+'" id="'+jQuery(select).attr('id')+'-'+jQuery(this).attr('value')+'" value="'+jQuery(this).attr('value')+'" autocomplete="off" onchange="'+jQuery(select).attr('onchange')+'" '+(this.hasAttribute('selected') ? 'checked' : '')+'> '+jQuery(this).html();
                html += '</label>';
            });
        }
        html += '</div>';
        jQuery(this).replaceWith(html);
    });
}

function initMultiSelect(selector,text_all,text_title)
{
    jQuery(selector).each(function(){
        var all = jQuery(this).attr('multiselect-text-all') ? jQuery(this).attr('multiselect-text-all') : text_all;
        var title = jQuery(this).attr('multiselect-text-button') ? jQuery(this).attr('multiselect-text-button') : text_title;
        jQuery(this).multiselect({
            maxHeight: 200,
            buttonWidth: '100%',
            includeSelectAllOption: !jQuery(this).hasClass('no-select-all'),
            selectAllText: all,
            buttonText: function(options, select) {
                return title;
            },
        });
    });
}