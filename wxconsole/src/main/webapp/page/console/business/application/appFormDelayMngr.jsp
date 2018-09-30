<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户延迟结算信息审核</title>
<jsp:include page="/page/console/business/include/link.jsp"></jsp:include>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="formGroup"  qtype="string" value="04" comparison="eq"/>
	<input type="hidden" name="status" value="03"  qtype="string" comparison="eq" />
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">商户号:</td>
		<td class="qinput">
			<input type="text" name="mainCode" comparison="eq" qtype="string" />
		</td>
		<td class="qlabel">表单类型:</td>
		<td class="qinput">
			<select id="q_formCode" name="formCode" comparison="eq" qtype="string" ></select>
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
<jsp:include page="/page/console/business/application/include.jsp"></jsp:include>
<script>
$(document).ready(function() {
	$('#q_formCode').ajaxSelect({url:'findAppFormDefByFormGroup.action?formGroup=04',valueField:'formCode',displayField:'formName',blank:true});
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
						url : "doCheckAppFormDelay.action",
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
						url : "doRejectAppFormDelay.action",
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
		$.ajax({url:'findAppFormDelayDetailsById.action',data:{jsonObject:$.toJSON(record)}
			,dataType : 'json'
			,success:function(data) {
				if (data.success) {
					var newBean = data.root[0].newBean;
					var oldBean = data.root[0].oldBean;
					var fileList = data.root[0].fileList;
					// 填充表单
					jQuery.jyform.fillCompareForm(formCode+'Table',oldBean,newBean,map[formCode]);
					// 填充附件表单值
					jQuery.jyform.fillFileForm(formCode+'AttachTable',fileList,map[formCode]);
					$('#'+record.formCode+'Div').siblings().hide();
					$('#'+record.formCode+'Div').show();
					$('#auditDialog').dialog('open');
				} else {
					alert('获取申请单内容失败 原因是'+ data.syserr);
				}
			}
		});
	};	

	$('#table').flexigrid({ 
		url : 'findAppFormDelay.action',
		buttons : [
				{
					name : "审核",
					bclass : 'page_excel',
					show:'ROLE_APP_MHT_DELAY_AUD',
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
	
	//初始化查询;
	$('#querybutton').click();
	
	initPage('04');
});
</script>
</body>
</html>