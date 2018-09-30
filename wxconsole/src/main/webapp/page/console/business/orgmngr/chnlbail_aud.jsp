<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
<head>
<title><f:message key="application.title" />服务商保证金审核</title>
<jsp:include page="/js/linkpage.jsp" />
<style>
<!--
.fcontent input,.fcontent select,.fcontent textarea{width: 200px; padding:0;}
.ftable {position: relative;}

.rate-table { border-top: 1px solid #8db2e3; border-left: 1px solid #8db2e3; border-right: 1px solid #8db2e3;}
.rate-table > thead > tr { background-color: #dfe8f6; border-top: 1px solid #8db2e3;}
.rate-table > tbody { border-bottom: 1px solid #8db2e3; }
.rate-table > tbody > tr:hover {background-color: #d5effc;}
.rate-table > thead > tr > th{ border-right: 1px solid #8db2e3; border-bottom: 1px solid #8db2e3; height: 24px; padding: 5px 0 0; white-space: nowrap;}
.rate-table > tbody > tr > td{ border-bottom: 1px solid #8db2e3; border-right: 1px dotted #8db2e3; text-align: center; }

.rate-input {width: 40px; padding: 0 2px;}
.text-right {text-align: right;}
.text-center {text-align: center;}
a.add-rate-data,a.add-rate-data:hover,a.rate-mcc-btn,a.rate-mcc-btn:hover{text-decoration: none;}
a.rate-mcc-btn,a.add-rate-data{ display: inline-block; width: 22px; font-size: 18px; margin: 0 auto; padding: 2px 4px; border-radius: 3px; text-align: center; font-size: 12px;
	background-color: #f6f6f6; border: 1px solid #dddddd; border-radius: 3px; color: #0073ea; }
a.rate-mcc-btn:hover,a.add-rate-data:hover{ background-color: #0073ea; border: 1px solid #0073ea; color: #ffffff;}

.opr-line{padding: 0.2em 0.5em; }
.opr-line > input.opr-btn{height: 24px; padding-top: 0.2em!important; font-size: 12px!important; line-height: 12px!important; max-width: 100px;}
.opr-line input { height: 20px; max-width: 60px;} 

.rate-input:read-only{border: 0;}
.rate-input:-moz-read-only{border: 0;}
-->
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>记录编号</label><input  id="q_recNo" name="recNo" type="text" maxlength="10" qtype="string" comparison="like" /></li>
			<li><label>服务商号</label><input  id="q_channelCode" name="channelCode" type="text" maxlength="20" qtype="string" comparison="like" /></li>
			<li><label>服务商名称</label><input  id="q_channelName" name="channelName" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>

<!-- 审核界面 -->
<div id="updDiv" style="display: none;">
<form id="updForm" action="#">
	<input type="hidden" name="version" />
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel">记录编号</td>
		<td class="fcontent"><input class="cdnInput" id="u_recNo" name="recNo" maxLength="10" type="text" readonly="readonly" /><div id="u_recNoTip"/></td>
	</tr>
	<tr>
		<td class="flabel">服务商编号</td>
		<td class="fcontent"><input class="cdnInput" id="u_channelCode" name="channelCode" maxLength="20" type="text" readonly="readonly"  /><div id="u_channelCodeTip"/></td>
	</tr>
	<tr>
		<td class="flabel">服务商名称</td>
		<td class="fcontent"><input class="cdnInput" id="u_channelName" name="channelName" maxLength="20" type="text" readonly="readonly" /><div id="u_channelNameTip"/></td>
	</tr>
	<tr>
		<td class="flabel">创建时间</td>
		<td class="fcontent"><input class="cdnInput" id="u_recTime" name="recTime" maxLength="14" type="text" xtype="datetime" readonly="readonly"/><div id="u_recTimeTip"/></td>
	</tr>
	<tr>
		<td class="flabel">创建人</td>
		<td class="fcontent"><input class="cdnInput" id="u_recUser" name="recUser" maxLength="30" type="text" readonly="readonly" /><div id="u_recUserTip"/></td>
	</tr>
	<tr>
		<td class="flabel">修改前金额</td>
		<td class="fcontent"><input class="cdnInput" id="u_beginAmt" name="beginAmt" maxLength="20" type="text" readonly="readonly" xtype="money"/><div id="u_beginAmtTip"/></td>
	</tr>
	<tr>
		<td class="flabel">操作金额</td>
		<td class="fcontent"><input class="cdnInput" id="u_oprAmt" name="oprAmt" maxLength="20" type="text" xtype="money" readonly="readonly"/><div id="u_oprAmtTip"/></td>
	</tr>
	<tr>
		<td class="flabel">修改后金额</td>
		<td class="fcontent"><input class="cdnInput" id="u_endAmt" name="endAmt" maxLength="20" type="text" readonly="readonly" xtype="money"/><div id="u_endAmtTip"/></td>
	</tr>
	<tr>
		<td class="flabel">审核时间</td>
		<td class="fcontent"><input class="cdnInput" id="u_audTime" name="audTime" maxLength="14" type="text" xtype="datetime" readonly="readonly"/><div id="u_audTimeTip"/></td>
	</tr>
	<tr>
		<td class="flabel">审核人</td>
		<td class="fcontent"><input class="cdnInput" id="u_audUser" name="audUser" maxLength="30" type="text" readonly="readonly" /><div id="u_audUserTip"/></td>
	</tr>
	<tr>
	<td class="flabel"><font color="red">*</font>审核意见</td>
		<td class="fcontent"><textarea class="cdnInput" id="u_audRemark" name="audRemark" maxLength="600" ></textarea><div id="u_audRemarkTip"/></td>
	</tr>
	</table>
	</form>
</div>

<script type="text/javascript">
// <!--
var urls = {
	audit:'doAuditChnlBailRec.action',
	deny: 'doDenyChnlBailRec.action',
	list:'findChnlBailRecToAudit.action',
	excel:'findChnlBailRecToAuditExcel.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#u_audRemark").formValidator({validatorgroup:"2", onshow: "请输入审核意见"})
		.inputValidator({min:1,onerrormin:"审核意见必须填写", max:600, onerrormax:'审核意见最大长度为600'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	
	// updForm
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width: 800, height: 550
	, title: '服务商保证金审核', buttons:{
		'审核通过' : function() {
			if($.formValidator.pageIsValid('2')) {
				$.ajaxForm({formId : 'updForm', url : urls.audit,
				success : function(data) {
					if (data.success) { 
						$('#updDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'审核驳回' : function() {
			if($.formValidator.pageIsValid('2')) {
				$.ajaxForm({formId : 'updForm', url : urls.deny,
				success : function(data) {
					if (data.success) { 
						$('#updDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});

	$('#updtabs').tabs(); $('#updtabs').fixTabInDialog('updDiv');
		
	// UPD
	var edit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updForm');
		$.jyform.fillForm('updForm', record);
		$('#updDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'recNo', checkbox : false, usepager : true, dbClickRecord: edit,
		buttons : [
		 {name: "审核", show:'ROLE_CHNL_BAIL_AUD_AUDIT', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 { display: '记录编号', dataIndex: 'recNo', width: 80, align: 'center', sortable: true }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 140, align: 'center', sortable: true }
		,{ display: '服务商名称', dataIndex: 'channelName', width: 200, align: 'center', sortable: true }
		,{ display: '修改前金额', dataIndex: 'bgnAmt', width: 140, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '操作金额', dataIndex: 'oprAmt', width: 200, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '修改后金额', dataIndex: 'endAmt', width: 140, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '创建时间', dataIndex: 'recTime', width: 140, align: 'center', sortable: true, render: fmtTime }
		,{ display: '创建人', dataIndex: 'recUser', width: 80, align: 'center', sortable: true }
		]
	});
	
	$.jyform.components(); $('.bt').button();
	$('input[readonly=readonly]').css({'background':'#f2f2f2','border':'0'});
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
});
//-->
</script>
</body>