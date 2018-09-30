<%@ page language="java" contentType="text/html; charset=utf-8" %>
<link type="text/css" rel="stylesheet" href="r/plugins/kindEditor/themes/default/default.css" />
<script type="text/javascript" src="r/plugins/kindEditor/kindeditor-all.js"></script>
<!-- 内容编辑器 -->
<div id="kindEditor" style="display: none;">
	<form action="#" id="kindContentForm">
		<textarea id="kindContentTextarea" style="width: 100%; border: 1px solid #e5e5e5; "></textarea>
	</form>
</div>
<div id="kindPreviewer" style="display: none">
	<form id="kindPreviewForm" action="#" method="post" target="_blank">
		<textarea id="kindPreviewTextarea" readonly style="width: 100%; border: 1px solid #e5e5e5; "></textarea>
	</form>
</div>
<script type="text/javascript">
var curr_textarea;
$('#kindEditor').dialog({autoOpen: false, bgiframe: true, modal: false
	,title: '内容编辑', buttons:{
		'保存': function() {
			kindEditor.sync();
			$('#'+curr_textarea).val($('#kindContentTextarea').val());
			$(this).dialog('close'); 
		}
		,'关闭': function(){ $(this).dialog('close'); }		
	}
});
$('#kindEditor').fullScreen();

$('#kindPreviewer').dialog({autoOpen: false, bgiframe: true, modal: false
	,title: '内容预览', buttons:{
		'关闭': function(){ $(this).dialog('close'); }		
	}
});
$('#kindPreviewer').fullScreen();
// 绑定预览
var bindKindPreview = function( options ) {
	$('#'+options.btnId).click(function(){
		curr_textarea = options.textareaId;
		$('#kindPreviewTextarea').val($('#'+curr_textarea).val());
		kindPreviewer.html($('#'+curr_textarea).val());
		kindPreviewer.readonly(true);
		curr_textarea = options.textareaId;
		$('#kindPreviewer').dialog('open');
	});
	var uploadUrl;
	if (options.uploadUrl) {
		uploadUrl = options.uploadUrl;
	} else {
		uploadUrl = 'uploadImgInKindEditor.action';
	}
	KindEditor.ready(function(K) {
        window.kindPreviewer = K.create('#kindPreviewTextarea',{uploadJson : uploadUrl,filePostName:'upload'});
	});
};

// 绑定编辑器
var bindKindEditor = function( options ) {
	$('#'+options.btnId).click(function(){
		curr_textarea = options.textareaId;
		$('#kindContentTextarea').val($('#'+curr_textarea).val());
		kindEditor.html($('#'+curr_textarea).val());
		$('#kindEditor').dialog('open');
	});
	var uploadUrl;
	if (options.uploadUrl) {
		uploadUrl = options.uploadUrl;
	} else {
		uploadUrl = 'uploadImgInKindEditor.action';
	}
	KindEditor.ready(function(K) {
        window.kindEditor = K.create('#kindContentTextarea',{uploadJson : uploadUrl,filePostName:'upload'});
	});
};
</script>
