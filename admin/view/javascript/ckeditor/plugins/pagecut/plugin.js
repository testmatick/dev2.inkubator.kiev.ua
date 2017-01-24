CKEDITOR.plugins.add( 'pagecut',
{
    init: function( editor )
    {	    
           
	
            editor.addCommand( 'insertPagecut',
            {
                exec: function( editor )
                {                                    
                    var element = CKEDITOR.dom.element.createFromHtml( '<div class="pagecut" contenteditable="true"><ul><li></li></ul></div>' );
                    editor.insertElement( element );
                }
            });
            
            editor.ui.addButton( 'Pagecut',
            {
                label: 'Вставить маркированный список',
                command: 'insertPagecut',
                icon: this.path + 'images/icon.png'
            } );
    }
} );