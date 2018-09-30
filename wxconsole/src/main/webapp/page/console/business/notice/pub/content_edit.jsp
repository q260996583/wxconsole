<%@ page language="java" contentType="text/html; charset=utf-8" %>
<link rel="stylesheet" href="r/plugins/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="r/plugins/codemirror/addon/hint/show-hint.css">

<script src="r/plugins/codemirror/lib/codemirror.js"></script>

<script src="r/plugins/codemirror/addon/fold/xml-fold.js"></script>
<script src="r/plugins/codemirror/addon/edit/matchtags.js"></script>
<script src="r/plugins/codemirror/addon/edit/closetag.js"></script>
<script src="r/plugins/codemirror/addon/selection/active-line.js"></script>
<script src="r/plugins/codemirror/addon/selection/selection-pointer.js"></script>

<script src="r/plugins/codemirror/addon/hint/show-hint.js"></script>
<script src="r/plugins/codemirror/addon/hint/xml-hint.js"></script>
<script src="r/plugins/codemirror/addon/hint/html-hint.js"></script>

<script src="r/plugins/codemirror/mode/xml/xml.js"></script>
<script src="r/plugins/codemirror/mode/javascript/javascript.js"></script>
<script src="r/plugins/codemirror/mode/css/css.js"></script>
<script src="r/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<style>
<!--
.CodeMirror {border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5;}
-->
</style>
<!-- 内容编辑器 -->
<div id="contentEditor" style="display: none;">
	<form action="#" id="contentForm" name="contentForm" >
		<textarea id="contentTextarea" style="width: 100%; border: 1px solid #e5e5e5; "></textarea>
	</form>
	<br />
	<form id="file-upload-form-ineditor" action="uploadImgInEditor.action" enctype="multipart/form-data" method="post" target="uploadImageInEditorTarget" >
	图片上传：
	<input id="file-upload-ineditor" name="upload" type="file" accept="image/*" placeholder="选择图片"  />
	<a class='bt' id="file-upload-ineditor-submit" type="button" href="javascript:void(0);">上传图片</a>
	<br/>
	图片URL：
	<input id="file-upload-imageurl" type="text" style="width: 300px; " />
	<a class='bt' id="file-upload-imageurl-preview" type="button" href="javascript:void(0);">预览</a>
	</form>
</div>
<div style="display: none">
<form id="previewForm" name="previewForm" action="#" method="post" target="_blank">
	<input name="jsonObject" id="previewForm_jsonObject" />
</form>
<textarea id="contentTemplate">
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<link href="res/img/favicon.ico" rel="icon" />
	<title>公告 - 上海申鑫</title>
	<!-- Bootstrap core CSS -->
    <link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
 </head>
<body>
  <div class="container">
	<div class="row">
		<!-- 替换图片地址  -->
		<img src="..." alt="显示文字" class="img-responsive" /> 
	</div>
	<!-- 
	<div class="row">
		<h4>标题</h4>
		<hr />
		<p>文字文字文字文字</p>	
	</div>
	 -->
</div>
</body>  
</html>
</textarea>

</div>
<script type="text/javascript">
var curr_textarea = false;

var previewUrl = 'findNoticePreview.action';
var contentName = 'actHtml';
var editor = false;

$('#contentEditor').dialog({autoOpen: false, bgiframe: true, modal: false
	,title: '内容编辑', buttons:{
		'预览': function() {
			$('#contentTextarea').val(editor.getValue());
			$('#previewForm_jsonObject').val($.toJSON($.jyform.jsonForm({formId:'contentForm'})));
			$('#previewForm')[0].submit();
		}
		,'保存': function() {
			$('#'+curr_textarea).val(editor.getValue());
			$(this).dialog('close'); 
		}
		,'模板': function() {
			editor.setValue($('#contentTemplate').val());
		}
		,'关闭': function(){ $(this).dialog('close'); }		
	}
});
$('#contentEditor').fullScreen();

// 绑定预览
var bindPreview = function( options ) {
	var _btn = options.btn;
	var _textarea = options.compId;
	var _fldName = options.fldId;
	var _previewUrl = options.previewUrl;
	if (!_previewUrl) {
		_previewUrl = previewUrl;
	}
	contentName = _fldName ? _fldName : contentName;
	$('#contentTextarea').attr('name', contentName);
	
	$('#'+_btn).click(function() {
		$('#contentTextarea').val($('#'+_textarea).val());
		$('#previewForm_jsonObject').val($.toJSON($.jyform.jsonForm({formId:'contentForm'})));
		$('#previewForm').attr('action', previewUrl);
		$('#previewForm')[0].submit();
	});
};

// 绑定编辑器
var bindEditor = function( options ) {
	var _btn = options.btn;
	var _textarea = options.compId;
	var _fldName = options.fldId;
	
	contentName = _fldName ? _fldName : contentName;
	$('#contentTextarea').attr('name', contentName);
	$('#'+_btn).click(function() {
		curr_textarea = _textarea ;
		// $('#contentTextarea').val($('#'+curr_textarea).val());
		$("#file-upload-form-ineditor")[0].reset();
		$('#file-upload-imageurl').val('');
		$('#contentEditor').dialog('open');
		if ( editor == false ) {
			editor = CodeMirror.fromTextArea(document.getElementById("contentTextarea"), {
			    lineNumbers: true, lineWrapping: true, mode: "text/html" , styleActiveLine: true, 
			    extraKeys: {"Alt-/": "autocomplete"}, matchTags: {bothTags: true}, autoCloseTags: true
			});
		}
		//console.log(_textarea + ':' + $('#'+_textarea).val().length );
		if ( $('#'+_textarea).val() && $('#'+_textarea).val().length > 0 ) {
			//console.log(1);
			editor.setValue($('#'+_textarea).val());
		} else {
			//console.log(2);
			editor.setValue($('#contentTemplate').val());				
		}
	});
};

$('#file-upload-ineditor-submit').click(function() {
	if ( $('#file-upload-ineditor').val() ) {
		$("#file-upload-form-ineditor")[0].submit();
	} else {
		alert('请选择文件');
	}
});
$('#file-upload-imageurl-preview').click(function() {
	if ( $('#file-upload-imageurl').val() ) {
		window.open($('#file-upload-imageurl').val());
	}
});
var evalJSON = function(src){
	if (typeof (JSON) == 'object' && JSON.parse)
        return eval("[" + src + "]")[0];
    return eval("(" + src + ")");
} ;
var loadFileInEditor = function() {
	var data= $('#uploadImageInEditorTarget').contents().find("body").html();
	if(data!=""){
		data = frameCtx(data);
		// console.log(data);
		var dataObj = evalJSON(data);
		if(dataObj) {
			if(dataObj.success){
				alert('操作成功');
				var path = dataObj.root[0].medPath;
				$('#file-upload-imageurl').val(path);
			} else {
				 alert('操作失败 原因是'+ dataObj.syserr); 
			}
		}
	}
};
</script>
<iframe style="display:none" name="uploadImageInEditorTarget" id="uploadImageInEditorTarget" onload="loadFileInEditor()"></iframe>