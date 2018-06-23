/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    config.language = 'vi';
    config.height = '200px';
    // config.uiColor = '#AADC6E';

    config.filebrowserImageBrowseUrl = '/Content/utils/ckfinder/ckfinder.html?type=' + Username;
    config.filebrowserImageUploadUrl = '/Content/utils/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=' + Username;

  config.toolbar_Full =
[
	{ name: 'clipboard', items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
	//{ name: 'forms', items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select'] },
    { name: 'insert', items: ['Image', 'Table', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe'] },
	'/',
	{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike', '-','RemoveFormat' ] },
	{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'Link', 'Unlink', 'Anchor'] },
	'/',
	{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
	{ name: 'colors', items : [ 'TextColor','BGColor' ] }
];

};
