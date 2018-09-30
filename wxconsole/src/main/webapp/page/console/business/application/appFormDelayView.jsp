<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户延迟结算信息详情</title>
<jsp:include page="/page/console/business/include/link.jsp"></jsp:include>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="formGroup"  qtype="string" value="04" comparison="eq"/>
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
		<td class="qlabel">状态:</td>
		<td class="qinput">
			<select id="q_status" name="status" comparison="eq" qtype="string" ></select>
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
<!-- 详情框 -->
<div id="viewDialog" class="detailDialog" style="display: none;">
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
			<td class="finput"><input id="v-formCodeDesc" type="text" name="formCodeDesc" maxLength="255" readonly="readonly" />
			</td>
		</tr>
		<tr >
			<td class="flabel">状态</td>
			<td class="finput"><input id="v-statusDesc" type="text" name="statusDesc" maxLength="255" readonly="readonly" />
			</td>
		</tr>
		<tr >
			<td class="flabel">一级代理审核人</td>
			<td class="finput"><input id="v-chnlAudAcc" type="text" name="chnlAudAcc" maxLength="255" readonly="readonly" />
			</td>
		</tr>
		<tr >
			<td class="flabel">一级代理审核时间</td>
			<td class="finput"><input id="v-chnlAudTime" type="text" name="chnlAudTime" xtype="datetime" maxLength="255" readonly="readonly" />
			</td>
		</tr>
		<tr >
			<td class="flabel">一级代理审核意见</td>
			<td class="finput"><textarea id="v-chnlAudRemark" type="text" name="chnlAudRemark" maxLength="255" readonly="readonly"></textarea>
			</td>
		</tr>
		<tr >
			<td class="flabel">管控台审核人</td>
			<td class="finput"><input id="v-sysAudRemark" type="text" name="sysAudAcc" maxLength="255" readonly="readonly" />
			</td>
		</tr>
		<tr >
			<td class="flabel">管控台审核时间</td>
			<td class="finput"><input id="v-sysAudTime" type="text" name="sysAudTime" xtype="datetime"  maxLength="255" readonly="readonly" />
			</td>
		</tr>
		<tr >
			<td class="flabel">管控台审核意见</td>
			<td class="finput"><textarea id="v-sysAudRemark" type="text" name="sysAudRemark" maxLength="255" readonly="readonly"></textarea>
			</td>
		</tr>
		<tr >
			<td class="flabel">变更说明</td>
			<td class="finput"><textarea id="v-remark" type="text" name="remark" maxLength="255" readonly="readonly"></textarea>
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
	$('#viewDialog').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 800,
		height : 500
	});
	
	$('#viewDialog').dialog("option","buttons",
			{
			'关闭' : function() {
				$(this).dialog('close');
			}
		});
	
	//详情弹出框
	var view= function(record, id) {
		if (!record) {
			alert('请选择一条记录');
			return;
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
					$('#viewDialog').dialog('open');
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
					name : "详情查看",
					bclass : 'page_excel',
					id : 'cel',
					onpress : view
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