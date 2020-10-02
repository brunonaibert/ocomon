/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.language = 'pt-br';
	config.uiColor = '#CCCCCC';
	config.height = 100;
	config.toolbarCanCollapse = true;
    
    
	config.toolbarGroups = [
		
		
		{ name: 'styles', groups: [ 'styles' ] },
        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'paragraph' ] },
        '/',
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
        { name: 'colors', groups: [ 'colors' ] },
        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: ['selection', 'spellchecker', 'editing' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] }
		
		
	];

	config.removeButtons = 'Underline,Subscript,Superscript,SpecialChar,Anchor,Strike,Blockquote,About,Language,Iframe,Flash,Emoticon';
};
