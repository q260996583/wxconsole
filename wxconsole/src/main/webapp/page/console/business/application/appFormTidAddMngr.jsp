<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>终端变更信息审核</title>
<jsp:include page="/page/console/business/include/link.jsp"></jsp:include>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="formGroup"  qtype="string" value="03" comparison="eq"/>
	<input type="hidden" name="status" value="03"  qtype="string" comparison="eq" />
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">商户号:</td>
		<td class="qinput">
			<input type="text" name="mainCode" comparison="eq" qtype="string" />
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff"  colspan="6" align="center">
		<input id="querybutton" class="bt" value="查询"  type="button">
		<input class="bt" value="重置" type="reset" />
	  </td>
	</tr>
</table>
</form>
</div>
<div id="table"></div>
<!-- 审核框 -->
<div id="auditDialog" class="detailDialog" style="display: none;">
	<!-- 申请单变更内容 -->
	<div class="titleDiv">
		<div class="dtitle">终端信息</div>
	</div>
	<div id="tidTable"></div>
	<div id="formContent">
	</div>
	<!-- 申请单信息 -->
	<div class="titleDiv">
		<div class="dtitle">申请单信息</div>
	</div>
	<form id="form1" >
		<input type="hidden" name="seqNo" />
		<input type="hidden" name="version" />
		<input type="hidden" name="mainCode" />
		<input type="hidden" name="mainType" />
		<input type="hidden" name="formCode" />
		<table id="appFormInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
			<tr >
			<td class="flabel">表单类型</td>
			<td class="finput"><input type="text" name="formCodeDesc" maxLength="255" readonly="readonly" /><div id="formCodeDescTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">变更说明</td>
			<td class="finput"><textarea type="text" name="remark" maxLength="255" readonly="readonly"></textarea><div id="remarkTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>审核意见</td>
			<td class="finput"><textarea type="text" id="sysAudRemark" name="sysAudRemark" maxLength="255"></textarea><div id="sysAudRemarkTip"></div>
			</td>
		</tr>
		</table>
	</form>
</div>
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

var initPage = function(type){
	var formCode = 'tidAdd';
	var $div = $('<div id="' + formCode + 'Div"></div>');
	var $attachTable = $('<table class="ftable" width="100%" cellspacing="1" cellpadding="1"  bgcolor="#8392a5"></table>');
	var $attachTitleDiv = $('<div />').addClass('titleDiv').append($('<div />').addClass('dtitle').html('附件信息'));
	$attachTable.attr('id',formCode+'AttachTable');
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
	    		var ffb = new FieldBuilder(fileFields);
				var fileRowFields = processRow(fileFields);
				// 生成附件表单
	        	ffb.buildTableFormFields($attachTable.attr('id'),fileRowFields);
			} else {
				alert('获取域定义失败 失败原因是'+fData.syserror);
			}
		}});
	jQuery.jyform.components();
	var fb = new FieldBuilder();
	fb.bindFileEvent(jQuery.jyform.getRootPath());
}
</script>
<script>
$(document).ready(function() {
	$('#q_formCode').ajaxSelect({url:'findAppFormDefByFormGroup.action?formGroup=03',valueField:'formCode',displayField:'formName',blank:true});
	$('#q_status').ajaxSelect({url:'findSecCodeList.action?codeType=APP_FORM_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$.formValidator.initConfig({							
		onerror : function(msg) {
			alert(msg);
		}
	});

	var list=[
		        {id:"sysAudRemark",formValidator:{empty:false},inputValidator:{min:1,max:255,onerror:"审核意见必填"}},
		   	];
	$.someAuthentication(list);
	
	$('#auditDialog').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 800,
		height : 500
	});
	
	$('#auditDialog').dialog("option","buttons",
			{'通过' : function() {
				if ($.formValidator.pageIsValid('1')) {
					$.ajaxForm({
						formId : 'form1',
						url : "doCheckAppFormTidAdd.action",
						success : function(data) {
							if (data.success) {
								$('#table').flexRemoveData(data.root[0]);
								$('#auditDialog').dialog('close');
								alert('审核成功！');
								// $('#querybutton').trigger('click');
							} else {
								alert('更新失败 原因是'+ data.syserr);
							}
						}
					});
				} else {
					return false;
				}
			},
			'驳回' : function() {
				if ($.formValidator.pageIsValid('1')) {
					$.ajaxForm({
						formId : 'form1',
						url : "doRejectAppFormTidAdd.action",
						success : function(data) {
							if (data.success) {
								$('#table').flexRemoveData(data.root[0]);
								$('#auditDialog').dialog('close');
								alert('驳回成功！');
								// $('#querybutton').trigger('click');
							} else {
								alert('更新失败 原因是'+ data.syserr);
							}
						}
					});
				} else {
					return false;
				}
			},
			'关闭' : function() {
				$(this).dialog('close');
			}
		});
	
	//审核弹出框
	var audit= function(record, id) {
		if (!record) {
			alert('请选择一条记录');
			return;
		}
		if(record.status != '03' ) {
			alert('此申请单尚未通过一级代理审核');
		}
		var formCode = record.formCode;
		$('#form1').fillFormObject({obj:record});
		$.ajax({url:'findAppFormTidAddDetailsById.action',data:{jsonObject:$.toJSON(record)}
			,dataType : 'json'
			,success:function(data) {
				if (data.success) {
					var tidAddList = data.root[0].tidAddList;
					var fileList = data.root[0].fileList;
					// 填充表单
					var tData = new Object();
					tData.success = true;
					tData.root = tidAddList;
					tData.totalProperty = tidAddList.length;
					$('#tidTable').refreshWithData(tData);
					// 填充附件表单值
					jQuery.jyform.fillFileForm(formCode+'AttachTable',fileList,map[formCode]);
					$('#auditDialog').dialog('open');
				} else {
					alert('获取申请单内容失败 原因是'+ data.syserr);
				}
			}
		});
	};	

	$('#table').flexigrid({ 
		url : 'findAppFormTidAdd.action',
		buttons : [
				{
					name : "审核",
					bclass : 'page_excel',
					show:'ROLE_APP_TID_ADD_AUD',
					id : 'cel',
					onpress : audit
				}],
		 
		width : 400,
		dir : "desc",
		sort : "seqNo",											
		usepager : true,
		colModel : [ {
			display : '序号',												
			dataIndex : 'seqNo',
			align : 'center',
			sortable:true
		},{
			display : '商户号',												
			dataIndex : 'mainCode',											
			sortable:true
		},{
			display : '表单类型',												
			dataIndex : 'formCodeDesc',											
			sortable:true
		},{
			display : '状态',											
			dataIndex : 'statusDesc',											
			sortable:true
		},{
			display : '创建人',										
			dataIndex : 'recAcc',						
			sortable:true
		},{
			display : '创建时间',										
			dataIndex : 'recTime',						
			sortable:true,
			render: fmtTime
		}]
	});
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	$('#tidTable').flexigrid({
	    url : '',
		width : 400,
		checkbox : false,
		usepager : false,					
		colModel : [
				{
					display : '终端号',
					width : 100,
					dataIndex : 'tid',
					align : 'center'
				},
				{
					display : '终端品牌',
					width : 100,
					dataIndex : 'tidBrand',
					align : 'center'
				},
				{
					display : '终端类型',
					width : 100,
					dataIndex : 'tidTypeDesc',
					align : 'center'
				},
				{
					display : '终端型号',
					width : 100,
					dataIndex : 'tidModel',
					align : 'center'
				},
				{
					display : '安装地址',
					width : 100,
					dataIndex : 'address',
					align : 'center'
				},
				{
					display : 'SIM卡号',
					width : 100,
					dataIndex : 'reserved1',
					align : 'center'
				},
				{
					display : 'SN号',
					width : 100,
					dataIndex : 'snCode',
					align : 'center'
				}]
	});	
	
	//初始化查询;
	$('#querybutton').click();
	
	initPage('03');
});
</script>
</body>
</html>