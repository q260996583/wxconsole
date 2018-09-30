<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户账户查询</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style type="text/css">
.fcontent input,.fcontent select,.fcontent textarea{width: 200px;}
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>商户号</label><input  id="q_mid" name="mid" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>
<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
	<form id="viewForm" action="#">
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">记录号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_balSeqNo" name="balSeqNo" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">商户号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_mid" name="mid" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">余额</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">记录创建人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_recAcc" name="recAcc" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">记录创建时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_recTime" xtype="datetime" name="recTime" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">备注</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="v_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdOrg" name="lastUpdOrg" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdTime" xtype="datetime" name="lastUpdTime" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">最后更新人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdUser" name="lastUpdUser" maxLength="30" type="text" /></td>
		</tr>
	</table>
	</form>
</div>
<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	list:'mhtBalancePage.action',
	excel:'mhtBalancePageExcel.action'
};

$(function() {
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '商户账户详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'lastUpdTime', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
			 {name: "详细信息", bclass: 'grid_edit',  id : 'cel',  onpress : view },{separator : true }
			,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [
			 { display : '序号', dataIndex : 'balSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '余额', dataIndex : 'balance', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '备注', dataIndex : 'remark', width : 80, align : 'center', sortable:true }
			,{ display : '记录创建时间', dataIndex : 'recTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '记录创建账号', dataIndex : 'recAcc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
});
//-->
</script>
</body>