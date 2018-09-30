<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>调单管理</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style type="text/css">
.fcontent input,.fcontent select{width: 200px;}
.fcontent textarea {width: 80%; }
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>序号</label><input  id="q_seqNo" name="seqNo" type="text" maxlength="10" qtype="string" comparison="like" /></li>
			<li><label>服务商编码</label><input  id="q_channelCode" name="channelCode" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>外部调单号</label><input  id="q_cupsReviewId" name="cupsReviewId" type="text" maxlength="40" qtype="string" comparison="like" /></li>
			<li><label>交易流水号</label><input  id="q_transSeq" name="transSeq" type="text" maxlength="12" qtype="string" comparison="like" /></li>
			<li><label>清算日期</label><input  id="q_stlmDate" name="stlmDate" type="text" xtype="date" qtype="string" comparison="eq" /></li>
			<li><label>商户代码</label><input  id="q_mid" name="mid" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>调单期限 从</label>
				<input  id="q_limitTimeBgn" name="limitTime" type="text" xtype="datetime" qtype="string" comparison="ge" />
				至<input  id="q_limitTimeEnd" name="limitTime" type="text" xtype="datetime" qtype="string" comparison="le" />
			</li>
			<li><label>状态</label><select id="q_status" name="status" ctype="TXN_SLIP_STATUS" multiple="multiple" comparison="eq" ></select></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>
<!-- 新增 -->
<div id="addDiv" style="display: none;">
	<form id="addForm" action="#">
		<table id="addtable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
				
		</table>
	</form><!-- #addForm -->
</div><!-- #addDiv  -->

<!-- 修改 -->
<div id="updDiv" style="display: none;">
	<form id="updForm" action="#">
		<input id="u_version" name="version" type="hidden" />
		<table id="updtable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
				
		</table>
	</form><!-- #updForm -->
</div><!-- #updDiv -->

<!-- 审核 -->
<div id="audDiv" style="display: none;">
	<form id="audForm" action="#">
		<input id="au_version" name="version" type="hidden" />
		<table id="audtable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
			
		</table>
	</form><!-- #audForm -->
</div><!-- #audDiv -->

<!-- 处理结果反馈记录 -->
<div id="updResDiv" style="display: none;">
	<form id="updResForm" action="#">
		<input id="ur_version" name="version" type="hidden" />
		<table id="updrestable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
					
		</table>
	</form><!-- #updResForm -->
</div><!-- #updResDiv -->

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
<div id="viewtabs" style="border: none;">
	<ul>
   	<li id="infotab" ><a href="#viewtabs-1">调单信息</a></li>
   	<li id="histab"><a href="#viewtabs-2">操作记录</a></li>
 	</ul>
 	<div id="viewtabs-1">
 		<form id="viewForm" action="#">
			<input name="version" type="hidden" />
			<table id="viewtable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
			</table>
		</form><!-- #viewForm -->
 	</div><!-- #viewtabs-1 -->
 	<div id="viewtabs-2">
 		<!-- 查询条件 -->
		<div id="his_queryCondition">
		<form id="his_queryForm" name="queryForm" action="#" method="post">
			<input type="hidden" name="seqNo" id="his_q_seqNo" class="param" />
			<ul class="qry-ul">
				<li><label>状态</label><select id="his_q_status" name="status" ctype="TXN_SLIP_STATUS" multiple="multiple" comparison="eq" ></select></li>
				<li><input class='bt' id="his_queryBtn" value="查询" type="button"/></li>
				<li><input value="重置" class='bt' type="reset" /></li>
			</ul>
		</form>
		</div>
		<!-- 列表 -->
		<div id="his_table"></div>
 	</div><!-- #viewtabs-2 -->
</div>
</div>

<script type="text/javascript" src="r/js/tpl/fieldBuilder.js"></script>
<jsp:include page="pub/txnslipreview_fld.jsp" />
<jsp:include page="/page/console/business/revslip/dialog_postrans.jsp"></jsp:include>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<script type="text/javascript">
var basePath = '<%=basePath %>';
var urls = {
	add:'salesSlipReviewAdd.action',
	upd:'salesSlipReviewUpdate.action',
	del:'salesSlipReviewDelete.action',
	send:'salesSlipReviewSend.action',
	finish:'salesSlipReviewFinish.action',
	reject:'salesSlipReviewReject.action',
	updres:'salesSlipReviewUpdateResult.action',
	dupcheck:'salesSlipReviewDuplicateCheck.action',
	txnlist:'salesSlipReviewTxnGrid.action',
	hislist:'salesSlipReviewHistoryGrid.action',
	hisexcel:'salesSlipReviewHistoryExcel.action',
	list:'salesSlipReviewGrid.action',
	excel:'salesSlipReviewExcel.action'
};
var fb = new FieldBuilder(fields);

$(function() {
	fb.buildTableFormFields('addtable',[
	 "cupsReviewId"
	,{name:"transSeq",id:"a_transSeq"}
	,"channelCode"
	,{name:"pospStmt",id:"a_pospStmt"}
	,"stlmDate"
	,"mid"
	,"tid"
	,{name:"pan",id:"a_pan"}
	,"transAmt"
	,"limitTime"
	,"remark"
	], {});
	
	fb.buildTableFormFields('updtable',[
 	 {name:"seqNo",readonly:"readonly"}
 	,"cupsReviewId"
 	,{name:"transSeq",id:"u_transSeq"}
 	,"channelCode"
 	,{name:"pospStmt",id:"u_pospStmt"}
 	,"stlmDate"
 	,"mid"
 	,"tid"
 	,{name:"pan",id:"u_pan"}
 	,"transAmt"
 	,"limitTime"
 	,"remark"
 	], {});
	
	fb.buildTableFormFields('audtable',[
	 ["seqNo","cupsReviewId"]
	,["channelCode","pospStmt"]
	,["transSeq","stlmDate"]
	,["mid","tid"]
	,["pan","transAmt"]
	,["limitTime","recTime"]
	,["merName","merPhone"]
	,{name:"address",cols:2}
	,["docTransferName","txnResultDesc"]
	,["docTransferPhone","docTransferEmail"]
	,{name:"attachmentList",cols:2}
	,["statusDesc","lastUptTime"]
	,["auditTime","submitTime"]
	,[{name:"auditInfo", readonly:false},"procResult"]
	,"remark"
	], {readonly:'readonly'});
	
	fb.buildTableFormFields('updrestable',[
	 ["seqNo","cupsReviewId"]
	,["channelCode","pospStmt"]
	,["transSeq","stlmDate"]
	,["mid","tid"]
	,["pan","transAmt"]
	,["limitTime","recTime"]
	,["merName","merPhone"]
	,{name:"address",cols:2}
	,["docTransferName","txnResultDesc"]
	,["docTransferPhone","docTransferEmail"]
	,{name:"attachmentList",cols:2}
	,["statusDesc","lastUptTime"]
	,["auditTime","submitTime"]
	,["auditInfo","procResult"]
	,"remark"
	,{name:"cupsResult",readonly:false}
	], {readonly:'readonly'});
	
	fb.buildTableFormFields('viewtable',[
		 ["seqNo","cupsReviewId"]
		,["channelCode","pospStmt"]
		,["transSeq","stlmDate"]
		,["mid","tid"]
		,["pan","transAmt"]
		,["limitTime","recTime"]
		,["merName","merPhone"]
		,{name:"address",cols:2}
		,["docTransferName","txnResultDesc"]
		,["docTransferPhone","docTransferEmail"]
		,{name:"attachmentList",cols:2}
		,["statusDesc","lastUptTime"]
		,["auditTime","submitTime"]
		,["auditInfo","procResult"]
		,["cupsResult","remark"]
		], {readonly:'readonly'});
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('addForm','1');
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('updForm','2');
	$.formValidator.initConfig({ validatorgroup:"3", formid:"audForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('audForm','3');
	$.formValidator.initConfig({ validatorgroup:"4", formid:"updResForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('updResForm','4');
	// bind event
	fb.bindFileEvent(basePath);
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 380
	, title: '新增调单申请', buttons:{
		'新增' : function() {
			if($.formValidator.pageIsValid('1')) {
				$.ajaxForm({formId : 'addForm', url : urls.add,
				success : function(data) {
					if (data.success) { 
						$('#addDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexAddData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// updForm
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '修改调单申请', buttons:{
		'保存修改' : function() {
			if($.formValidator.pageIsValid('2')) {
				$.ajaxForm({formId : 'updForm', url : urls.upd,
				success : function(data) {
					if (data.success) { 
						$('#updDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// updResForm
	$('#updResDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '调单反馈信息记录', buttons:{
		'保存修改' : function() {
			if($.formValidator.pageIsValid('4')) {
				$.ajaxForm({formId : 'updResForm', url : urls.updres,
				success : function(data) {
					if (data.success) { 
						$('#updResDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// audForm
	$('#audDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '调单申请审核', buttons:{
		'通过' : function() {
			if($.formValidator.pageIsValid('3')) {
				$.ajaxForm({formId : 'audForm', url : urls.finish,
				success : function(data) {
					if (data.success) { 
						$('#audDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'驳回' : function() {
			if($.formValidator.pageIsValid('3')) {
				$.ajaxForm({formId : 'audForm', url : urls.reject,
				success : function(data) {
					if (data.success) { 
						$('#audDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '调单申请详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// ADD
	var add = function() {
		$.jyform.resetForm('addForm');
		$('#addDiv').dialog('open');
	};
	// UPD
	var edit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '01':
			$.jyform.resetForm('updForm');
			$.jyform.fillForm('updForm', record);
			$('#updDiv').dialog('open');
			break;
		default:
			alert("记录状态不能进行修改. ");
		}
	};
	// UPDRES
	var feedback = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '04':
		case '05':
			$.jyform.resetForm('updResForm');
			$.jyform.fillForm('updResForm', record);
			$('#updResDiv').dialog('open');
			break;
		default:
			alert("记录状态不能填写反馈信息. ");
		}
	};
	// AUDIT
	var audit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '03':
			$.jyform.resetForm('audForm');
			$.jyform.fillForm('audForm', record);
			$('#audDiv').dialog('open');
			break;
		default:
			alert("记录状态不能进行处理. ");
		}
	};
	// DEL
	var del = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '01':
			if ( confirm('是否删除记录?') ) {
				$.ajax({url:urls.del, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
					success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
				}});
			}
			break;
		case '09':
			alert("记录已是删除状态. ");
			break;
		default:
			alert("记录状态不允许删除. ");
		}
	};
	// SEND
	var send = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '01':
			if ( confirm('是否下发调单申请?') ) {
				$.ajax({url:urls.send, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
					success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
				}});
			}
			break;
		default:
			alert("记录状态不允许下发. ");
		}
	};
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		
		$('#his_q_seqNo').val(record.seqNo);
		$('#his_queryBtn').click();
		
		$('#viewDiv').dialog('open');
		$('#infotab > a').click();
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'seqNo', dir: 'DESC', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		 {name: "新增", show:'ROLE_TXN_SLIPREV_ADD', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		,{name: "修改", show:'ROLE_TXN_SLIPREV_UPD', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "删除", show:'ROLE_TXN_SLIPREV_DEL', bclass: 'grid_del',  id : 'cel',  onpress : del },{separator : true }
		,{name: "下发", show:'ROLE_TXN_SLIPREV_SEND', bclass: 'grid_edit',  id : 'cel',  onpress : send },{separator : true }
		,{name: "调单处理", show:'ROLE_TXN_SLIPREV_AUD|ROLE_TXN_SLIPREV_REJ', bclass: 'grid_edit',  id : 'cel',  onpress : audit },{separator : true }
		,{name: "反馈记录", show:'ROLE_TXN_SLIPREV_UPDRES', bclass: 'grid_edit',  id : 'cel',  onpress : feedback },{separator : true }
	  ,{name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
 		 { display : '编号', dataIndex : 'seqNo', width : 60, align : 'center', sortable:true }
 		,{ display : '外部调单标识', dataIndex : 'cupsReviewId', width : 120, align : 'center', sortable:true }
 		,{ display : '交易流水号', dataIndex : 'transSeq', width : 120, align : 'center', sortable:true }
 		,{ display : '交易日期', dataIndex : 'pospStmt', width : 100, align : 'center', sortable:true, render:fmtDate }
 		,{ display : '清算日期', dataIndex : 'stlmDate', width : 100, align : 'center', sortable:true, render:fmtDate }
 		,{ display : '调单期限', dataIndex : 'limitTime', width : 140, align : 'center', sortable:true, render:fmtTime }
 		,{ display : '服务商', dataIndex : 'channelName', width : 120, align : 'center', sortable:true }
 		,{ display : '商户代码', dataIndex : 'mid', width : 140, align : 'center', sortable:true }
 		,{ display : '商户名称', dataIndex : 'merName', width : 140, align : 'center', sortable:true }
 		,{ display : '终端标识码', dataIndex : 'tid', width : 100, align : 'center', sortable:true }
 		,{ display : '状态', dataIndex : 'statusDesc', width : 100, align : 'center', sortable:true }
		]
	});
	
	$('#his_table').flexigrid({
		url : urls.hislist, height: 330, sort : 'lastUptTime', dir:'DESC', checkbox : false, usepager : true, 
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#his_table').flexFile(urls.hisexcel,{seqNo:$('#his_q_seqNo').val()}); }}
		],
		colModel : [
		 { display : '编号', dataIndex : 'seqNo', width : 80, align : 'center', sortable:true }
		,{ display : '外部调单标识', dataIndex : 'cupsReviewId', width : 80, align : 'center', sortable:true }
		,{ display : '交易流水号', dataIndex : 'transSeq', width : 80, align : 'center', sortable:true }
		,{ display : '调单期限', dataIndex : 'limitTime', width : 80, align : 'center', sortable:true, render:fmtTime }
		,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
		,{ display : '备注', dataIndex : 'remark', width : 80, align : 'center', sortable:true }
		,{ display : '审核意见', dataIndex : 'auditInfo', width : 80, align : 'center', sortable:true }
		,{ display : '调单处理结果', dataIndex : 'procResult', width : 80, align : 'center', sortable:true }
		,{ display : '银联处理结果', dataIndex : 'cupsResult', width : 80, align : 'center', sortable:true }
		,{ display : '操作人', dataIndex : 'lastUptAcc', width : 80, align : 'center', sortable:true }
		,{ display : '操作时间', dataIndex : 'lastUptTime', width : 80, align : 'center', sortable:true, render:fmtTime }            
		]
	});	
	
	// 初始化页面控件
	$.jyform.components();
	// bind postrans dialog
	postransDialogBind('a_transSeq', function(data){
		$.jyform.fillForm('addForm', data);
		$('#a_pan').val(data.cardId);
		$('#a_pospStmt').datepicker('setDate',frmTime(data.stlmDate));
	});
	
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		//wxb
		var startTime=$("#q_limitTimeBgn").val();
		var endTime=$("#q_limitTimeEnd").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能晚于结束日期！");
				return false;
			}
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	$('#his_queryBtn').click(function(){$.queryTable({formId : 'his_queryForm', tableId : 'his_table'});});
	
});
//-->
</script>
</body>