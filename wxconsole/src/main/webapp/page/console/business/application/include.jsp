<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div style="display:none"><input id="include_refNo"/></div>
<script>
var map = {};
var convertToFormField = function(fields) {
	var fieldsArray = new Array();
	$.each(fields,function(i,n){
		if( !n.displayOnly ) {
			if( n.xtype != 'img' && n.xtype != 'file' ) {
				n.name = n.jcode; 
				//n.value = n.fldVal;
				n.desc = n.fldName;
				fieldsArray.push(n);
			}
		}
	});
	return fieldsArray;
}


var convertToFileField = function(fields) {
	var fieldsArray = new Array();
	$.each(fields,function(i,n){
		if( !n.displayOnly ) {
			if( n.xtype == 'img' || n.xtype == 'file' ) {
				n.name = n.fldId; 
				//n.value = n.fldVal;
				n.desc = n.fldName;
				fieldsArray.push(n);
			}
		}
	});
	return fieldsArray;
}

var convertToDisplayField = function(fields) {
	var fieldsArray = new Array();
	$.each(fields,function(i,n){
		if( n.displayOnly ) {
			n.name = n.jcode; 
			//n.value = n.fldVal;
			n.desc = n.fldName;
			fieldsArray.push(n);
		}
	});
	return fieldsArray;
}

// 根据col定义分行,大于12换行
var processRow = function(fields){
	var formField = new Array();
	var rows = 0;
	var rowField = new Array();
	$.each(fields,function(i,n){
		if( n.col + rows > 12 ) {
			formField.push(rowField);
			rowField = new Array();
			rows = 0;
		}
		rows = n.col + rows;
		rowField.push(n);
	});
	formField.push(rowField);
	return formField;
}

// Bind Preview Event
var bindPreview = function() {
	$('.preview-old').click(function(){
		var fid = $(this).attr('fileId');
		var oldPath = $('#'+fid).val();
		if ( oldPath ) {
			window.open(oldPath);
		}
	});
	$('.preview-new').click(function(){
		var fid = $(this).attr('fileId');
		var medSeq = $('#'+fid).val();
		var athType = $('#'+fid).attr('name');
		var mid = $('#include_refNo').val();
		if ( medSeq ) {
			window.open('attach/' + mid + '_upd_'+athType+'_'+medSeq);
		}
	});
};

var initPage = function(type){
	// 获取页面所包含的表单类型
	$.ajax({url:'findAppFormDefByFormGroup.action?formGroup='+type,
		dataType : 'json',
		success:function(data) {
			if ( data.success ) {
				var list = data.root;
				for ( var i=0;i<list.length;i++ ) {
					var formCode = list[i].formCode;
					var $div = $('<div id="' + formCode + 'Div"></div>');
					var $infoTitleDiv = $('<div />').addClass('titleDiv').append($('<div />').addClass('dtitle').html('变更信息'));
					var $infoTable = $('<table class="ftable" width="100%" cellspacing="1" cellpadding="1"  bgcolor="#8392a5"></table>');
					$infoTable.attr('id',formCode+'Table');
					var $tr = $('<tr><td></td><td>原始信息</td><td>修改后信息</td></tr>');
					var $attachTitleDiv = $('<div />').addClass('titleDiv').append($('<div />').addClass('dtitle').html('附件信息'));
					var $attachTable = $('<table class="ftable" width="100%" cellspacing="1" cellpadding="1"  bgcolor="#8392a5"></table>');
					$attachTable.attr('id',formCode+'AttachTable');
					$infoTable.append($tr);
					$div.append($infoTitleDiv);
					$div.append($infoTable);
					$div.append($attachTitleDiv);
					$div.append($attachTable);
					$('#formContent').append($div);
					$.ajax({url:'findFieldByFormCode.action?formCode='+formCode
						,dataType : 'json'
						,async: false
						,success:function(fData) {
							if ( fData.success ) {
								orginalFields = fData.root;
					    		// 转换成formField 
					    		formFields = convertToFormField(orginalFields);
					    		map[formCode] = formFields;
					    		var fileFields = convertToFileField(orginalFields);
					    		var fb = new FieldBuilder(formFields);
					    		var ffb = new FieldBuilder(fileFields);
								var formRowFields = processRow(formFields);
								var fileRowFields = processRow(fileFields);
								// 生成比较表单
					        	fb.buildCompareFields($infoTable.attr('id'),formRowFields);
					        	bindPreview();
								// 生成附件表单
					        	ffb.buildTableFormFields($attachTable.attr('id'),fileRowFields);
							} else {
								alert('获取域定义失败 失败原因是'+fData.syserror);
							}
						}});		
				}
				jQuery.jyform.components();
				var fb = new FieldBuilder();
				fb.bindFileEvent(jQuery.jyform.getRootPath());
			} else {
				alert('获取表单定义失败 失败原因是'+data.syserror);
			}												
		}
	});
	
	
}
</script>