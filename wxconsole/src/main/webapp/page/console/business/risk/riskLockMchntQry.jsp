<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>风控冻结商户查询</title>
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
			<li><label>操作时间从</label><input  id="q_bgnTime" name="lastUpdTime" xtype="time" type="text" maxlength="60" qtype="string" comparison="ge" /></li>
			<li><label>到</label><input  id="q_endTime" name="lastUpdTime" xtype="time" type="text" maxlength="60" qtype="string" comparison="le" /></li>
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
		<td class="fcontent"><input class="cdnInput" readonly id="v_seqNo" name="seqNo" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">操作类型</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_oprTypeDesc" name="oprTypeDesc" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mid" name="mid" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">操作人</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdUser" name="lastUpdUser" maxLength="30" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">操作时间</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdTime" xtype="datetime" name="lastUpdTime" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">操作原因</td>
		<td class="fcontent"><textarea class="cdnInput" readonly id="v_remark" name="remark" ></textarea></td>
	</tr>
</table>
</form>
</div>
<script type="text/javascript">
var urls = {
	list:'riskLockMchntPage.action',
	excel:'riskLockMchntPageExcel.action',
};

$(function() {
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '风控冻结商户详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
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
		 	 { display : '序号', dataIndex : 'seqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 80, align : 'center', sortable:true }
			,{ display : '操作人', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '操作原因', dataIndex : 'remark', width : 180, align : 'center', sortable:true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	
	//$('#viewDiv').fullScreen();
	
	$('.bt').button();
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	midDialogBind('a_mid', function(data) { $('#a_mid').val(data.mid); });
	
});
//-->
</script>
</body>