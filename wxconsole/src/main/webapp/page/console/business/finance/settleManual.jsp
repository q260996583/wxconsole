<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>清算人工调整</title>
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
			<li><label>清算时间从</label><input id="q_bgnSday" name="stlmDate" type="text" xtype="time" qtype="string" comparison="ge" /></li>
			<li><label>到</label><input id="q_endSday" name="stlmDate" type="text" xtype="time" qtype="string" comparison="le" /></li>
			<li><label>商户号</label><input  id="q_mid" name="mid" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>状态</label><select id="q_status" name="status" ctype="MHT_BAL_UPD_STATUS" multiple="multiple" comparison="eq" ></select></li>
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
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel"><font color="red">*</font>商户号</td>
		<td class="fcontent"><input class="cdnInput" id="a_mid" name="mid" maxLength="15" type="text" /><div id="a_midTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>交易日期</td>
		<td class="fcontent"><input class="cdnInput" id="a_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /><div id="a_stlmDateTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>调整金额</td>
		<td class="fcontent"><input class="cdnInput" id="a_balance" xtype="money" name="balance" maxLength="12" type="text" /><div id="a_balanceTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>调整原因</td>
		<td class="fcontent"><textarea class="cdnInput" id="a_remark" name="remark" ></textarea></td>
	</tr>
</table>
</form>
</div>

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
<div id="viewtabs" style="border: none;">
	<ul>
    	<li id="v_baseinfotab" ><a href="#viewtabs-1">基本信息</a></li>
    	<li id="v_transreltab"><a href="#viewtabs-2">关联交易</a></li>
  	</ul>
	<div id="viewtabs-1">
	<form id="viewForm" action="#">
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">记录号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_logSeqNo" name="logSeqNo" maxLength="15" type="text" /></td>
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
			<td class="flabel">交易日期</td>
			<td class="fcontent"><input class="cdnInput" id="v_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整金额</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_oprUser" name="oprUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_oprTime" xtype="datetime" name="oprTime" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整原因</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="v_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">审核时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_audTime" xtype="datetime" name="audTime" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">审核人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_audUser" name="audUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">审核意见</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="v_audRemark" name="audRemark" maxLength="400" type="text"></textarea></td>
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
	<div id="viewtabs-2">
  		<!-- 查询条件 -->
		<div id="transrel_queryCondition">
			<form id="transrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="logSeqNo" id="transrel_q_logSeqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>交易日期</label><input id="transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="transrel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="transrel_table"></div>
  	</div>
</div>
</div>

<!-- 关联界面 -->
<div id="updRelDiv" style="display: none;">
<div id="updReltabs" style="border: none;">
	<ul>
    	<li id="ur_baseinfotab" ><a href="#updReltabs-1">基本信息</a></li>
    	<li id="ur_transreltab"><a href="#updReltabs-2">关联交易</a></li>
  	</ul>
	<div id="updReltabs-1">
	<form id="updRelForm" action="#">
	<input id="ur_version" type="hidden" name="version" />
	<input id="ur_version" type="hidden" name="oprType" />
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">记录号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_logSeqNo" name="logSeqNo" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作类型</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_oprTypeDesc" name="oprTypeDesc" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">商户号</td>
			<td class="fcontent"><input class="cdnInput" id="ur_mid" name="mid" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">交易日期</td>
			<td class="fcontent"><input class="cdnInput" id="ur_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整金额</td>
			<td class="fcontent"><input class="cdnInput" id="ur_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整原因</td>
			<td class="fcontent"><textarea class="cdnInput" id="ur_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">审核时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_audTime" xtype="datetime" name="audTime" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">审核人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_audUser" name="audUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">审核意见</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="ur_audRemark" name="audRemark" maxLength="400" type="text"></textarea></td>
		</tr>
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_lastUpdTime" xtype="datetime" name="lastUpdTime" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_lastUpdUser" name="lastUpdUser" maxLength="30" type="text" /></td>
		</tr>
	</table>
	</form>
	</div>
	<div id="updReltabs-2">
  		<!-- 查询条件 -->
		<div id="ur_transrel_queryCondition">
			<form id="ur_transrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="logSeqNo" id="ur_transrel_q_logSeqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>交易日期</label><input id="ur_transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="ur_transrel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="ur_transrel_table"></div>
  	</div>
</div>
</div>

<!-- 添加交易关联 -->
<div id="addRelDiv" style="display: none;">
<!-- 查询条件 -->
<div id="ar_transrel_queryCondition">
	<form id="ar_transrel_queryForm" name="queryForm" action="#" method="post">
		<input type="hidden" name="logSeqNo" id="ar_transrel_q_logSeqNo" qtype="string" class="param" />
		<ul class="qry-ul">
			<li><label>清算日期</label><input id="ar_transrel_q_stlmDate" xtype="date" name="stlmDate" type="text" class="param" /></li>
			<li><label>中心流水号</label><input id="ar_transrel_q_transSeq" name="transSeq" type="text" class="param" /></li>
			<li><input class='bt' id="ar_transrel_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="ar_transrel_table"></div>
</div>

<!-- 审核界面 -->
<div id="audDiv" style="display: none;">
<div id="audtabs" style="border: none;">
	<ul>
    	<li id="au_baseinfotab" ><a href="#audtabs-1">基本信息</a></li>
    	<li id="au_transreltab"><a href="#audtabs-2">关联交易</a></li>
  	</ul>
	<div id="audtabs-1">
	<form id="audForm" action="#">
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">记录号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_logSeqNo" name="logSeqNo" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作类型</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_oprTypeDesc" name="oprTypeDesc" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">商户号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_mid" name="mid" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">交易日期</td>
			<td class="fcontent"><input class="cdnInput" id="au_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整金额</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_oprUser" name="oprUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_oprTime" xtype="datetime" name="oprTime" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整原因</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="au_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="au_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>审核意见</td>
			<td class="fcontent"><textarea class="cdnInput" id="au_audRemark" name="audRemark" maxLength="400" type="text"></textarea></td>
		</tr>
	</table>
	</form>
	</div>
	<div id="audtabs-2">
  		<!-- 查询条件 -->
		<div id="transrel_queryCondition">
			<form id="au_transrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="logSeqNo" id="au_transrel_q_logSeqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="au_transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="au_transrel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="au_transrel_table"></div>
  	</div>
</div>
</div>

<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	add:'addSettleManul.action',
	upd:'updSettleManul.action',
	del:'delSettleManul.action',
	sub:'submitSettleManul.action',
	check:'checkSettleManul.action',
	reject:'rejectSettleManul.action',
	list:'settleManulUpdPage.action',
	excel:'settleManulUpdPageExcel.action',
	listUnRel:'settleManulUnRelUpdPage.action',
	addRel:'addSettleManulRelUpd.action',
	delRel:'delSettleManulRelUpd.action',
	listRel:'settleManulRelPage.action',
	excelRel:'settleManulRelPageExcel.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { alert(msg); $(obj).focus();} });
	$("#a_mid").formValidator({validatorgroup:"1", onshow: "请选择商户号"})
		.inputValidator({min:15,onerrormin:"商户号必填", max:15, onerrormax:'商户号应为15位'}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"商户号仅能输入数字，字母"});
	$("#a_stlmDate").formValidator({validatorgroup:"1", onshow: "请选择清算日期"})
		.inputValidator({min:1,onerrormin:"交易日期必填"});
	$("#a_balance").formValidator({validatorgroup:"1", onshow: "请输入调整金额"})
		.inputValidator({min:-999999999999,onerrormin:"调整金额必须填写", max:999999999999, onerrormax:'调整金额取值在-999999999999~999999999999',type:'value'}) /* 数字检查 */ 
	$("#a_remark").formValidator({validatorgroup:"1", onshow: "请输入调整原因"})
		.inputValidator({min:1,onerrormin:"调整原因必填", max:400, onerrormax:'调整原因最多400位'});
	$.formValidator.initConfig({ validatorgroup:"2", formid:"addForm", onerror : function(msg,obj) { alert(msg); $(obj).focus();} });
	$("#au_audRemark").formValidator({validatorgroup:"2", onshow: "请输入调整原因"})
		.inputValidator({min:1,onerrormin:"审核意见必填", max:400, onerrormax:'审核意见最多400位'});
	$.formValidator.initConfig({ validatorgroup:"3", formid:"addForm", onerror : function(msg,obj) { alert(msg); $(obj).focus();} });
	$("#ur_mid").formValidator({validatorgroup:"3", onshow: "请选择商户号"})
	.inputValidator({min:15,onerrormin:"商户号必填", max:15, onerrormax:'商户号应为15位'}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"商户号仅能输入数字，字母"});
	$("#ur_stlmDate").formValidator({validatorgroup:"3", onshow: "请选择清算日期"})
		.inputValidator({min:1,onerrormin:"交易日期必填"});
	$("#ur_balance").formValidator({validatorgroup:"3", onshow: "请输入调整金额"})
		.inputValidator({min:-999999999999,onerrormin:"调整金额必须填写", max:999999999999, onerrormax:'调整金额取值在-999999999999~999999999999',type:'value'}) /* 数字检查 */ 
	$("#ur_remark").formValidator({validatorgroup:"3", onshow: "请输入调整原因"})
		.inputValidator({min:1,onerrormin:"调整原因必填", max:400, onerrormax:'调整原因最多400位'});
	
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '新增清算调整', buttons:{
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
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '人工清算调整详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// updRelForm
	$('#updRelDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 450
	, title: '编辑人工清算调整', buttons:{
		'编辑' : function() {
			if($.formValidator.pageIsValid('3')) {
				$.ajaxForm({formId : 'updRelForm', url : urls.upd,
				success : function(data) {
					if (data.success) { 
						$('#updRelDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }},
		'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// audForm
	$('#audDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '人工清算调整审核', buttons:{
		'审核通过' : function() {
			if($.formValidator.pageIsValid('2')) {
				if (!confirm('是否审核通过?')) {
					return;
				}
				$.ajaxForm({formId : 'audForm', url : urls.check,
				success : function(data) {
					if (data.success) { 
						$('#audDiv').dialog('close'); alert('操作成功,商户余额剩余'+data.root[0].finalAmt/100+'元'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'审核驳回' : function() {
			if($.formValidator.pageIsValid('2')) {
				if (!confirm('是否审核驳回?')) {
					return;
				}
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
	
	// addRelForm
	$('#addRelDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 600
	, title: '添加关联交易', buttons:{
		'添加关联' : function() {
			var record = $('#ar_transrel_table').flexAllSelectData();
			if (!record) {alert("请选择记录"); return;}
			var obj = $('#updRelForm').jsonObject();
			var objstr = $.toJSON(obj);
			$.ajax({url : urls.addRel,dataType : 'json',type : 'POST',
				data : {jsonObject : objstr,jsonArray:$.toJSON(record)},
				success : function(data) {
					if (data.success) { 
						alert('操作成功'); 
						$('#ur_transrel_queryBtn').click();
						$('#addRelDiv').dialog('close');
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// ADD
	var add = function() {
		$.jyform.resetForm('addForm');
		$('#addDiv').dialog('open');
	};
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#transrel_q_logSeqNo').val(record.logSeqNo);
		$('#transrel_queryBtn').click();
		$('#viewDiv').dialog('open');
	};
	
	// SUBMIT
	var sub = function(record,id){
		if(!record){
			alert('请选择一条记录');
			return false;
		}
		if ( !confirm('是否提交?') ) {
			return;
		}
		$.ajax({url:urls.sub,
			data:{jsonObject:$.toJSON(record)},dataType:'json',
			success:function(data){
				if(data.success){
					alert('提交成功');
					$('#table').refresh();
				} else{
					alert('提交失败 失败原因是'+data.syserr);
				}												
			}
		});
	};
	
	// DEL
	var del = function(record,id){
		if(!record){
			alert('请选择一条记录');
			return false;
		}
		if ( !confirm('是否删除?') ) {
			return;
		}
		$.ajax({url:urls.del,
			data:{jsonObject:$.toJSON(record)},dataType:'json',
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#table').refresh();
				} else{
					alert('删除失败 失败原因是'+data.syserr);
				}												
			}
		});
	};
	
	// AUD
	var aud = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('audForm');
		$.jyform.fillForm('audForm', record);
		$('#au_transrel_q_logSeqNo').val(record.logSeqNo);
		$('#au_transrel_queryBtn').click();
		$('#audDiv').dialog('open');
	};
	
	// UPDREL
	var rel = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updRelForm');
		$.jyform.fillForm('updRelForm', record);
		$('#ur_transrel_q_logSeqNo').val(record.logSeqNo);
		$('#ur_transrel_queryBtn').click();
		$('#updRelDiv').dialog('open');
	};
	
	// ADDREL
	var addRel = function(record,id) {
		$('#ar_transrel_q_logSeqNo').val($('#ur_logSeqNo').val());
		$('#ar_transrel_queryBtn').click();
		$('#addRelDiv').dialog('open');
	};
	
	var delRel = function(record,id) {
		var record = $('#ur_transrel_table').flexAllSelectData();
		if (!record) {alert("请选择记录"); return;}
		if ( !confirm('是否删除所选交易记录关联?') ) {
			return;
		}
		var obj = $('#updRelForm').jsonObject();
		var objstr = $.toJSON(obj);
		$.ajax({url : urls.delRel,dataType : 'json',type : 'POST',
			data : {jsonObject : objstr,jsonArray:$.toJSON(record)},
			success : function(data) {
				if (data.success) { 
					alert('操作成功'); 
					$('#ur_transrel_queryBtn').click();
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
			}});
	}
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'lastUpdTime', dir : "desc", checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
			 {name: "新增", show:'ROLE_SETTLE_MANUAL_ADD', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
			,{name: "编辑", show:'ROLE_SETTLE_MANUAL_REL', bclass: 'grid_add', id: 'txt', onpress : rel },{separator : true }
			,{name: "删除", show:'ROLE_SETTLE_MANUAL_DEL', bclass: 'grid_add', id: 'txt', onpress : del },{separator : true }
			,{name: "提交", show:'ROLE_SETTLE_MANUAL_SUB', bclass: 'grid_add', id: 'txt', onpress : sub },{separator : true }
			,{name: "审核", show:'ROLE_SETTLE_MANUAL_AUD', bclass: 'grid_add', id: 'txt', onpress : aud },{separator : true }
			,{name: "详细信息", bclass: 'grid_edit',  id : 'cel',  onpress : view },{separator : true }
			,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '审核人', dataIndex : 'audUser', width : 180, align : 'center', sortable:true }
			,{ display : '审核时间', dataIndex : 'audTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#transrel_table').flexigrid({
		url : urls.listRel, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#transrel_table').flexFile(urls.excelRel);} }
		],
		colModel : [
		 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
		,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '发卡行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '发卡方手续费', dataIndex: 'cardFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方封顶值', dataIndex: 'feeCardMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方固定值', dataIndex: 'feeCardVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '总收益', dataIndex: 'totRev', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费率', dataIndex: 'payRate', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费', dataIndex: 'payFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '收单方手续费', dataIndex: 'fftFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户费率', dataIndex: 'realFeeType', width: 80, align: 'center', sortable: true }
		,{ display: '银行品牌服务费', dataIndex: 'bankBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商品牌服务费', dataIndex: 'allBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费清算标', dataIndex: 'brandFeeFlag', width: 80, align: 'center', sortable: true }
		,{ display: '银行实际清算金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费费率', dataIndex: 'realBrandfeeType', width: 80, align: 'center', sortable: true }
		,{ display: '服务商方收益', dataIndex: 'devFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#ur_transrel_table').flexigrid({
		url : urls.listRel, height: 330, sort : 'transTime', dir : "desc", checkbox : true, usepager : true, 
		buttons : [
			{name: "新增关联交易", show:'ROLE_SETTLE_MANUAL_REL', bclass: 'grid_add', id: 'txt', onpress : addRel },{separator : true }
		   ,{name: "删除关联交易", show:'ROLE_SETTLE_MANUAL_REL', bclass: 'grid_add', id: 'txt', onpress : delRel },{separator : true }
		   ,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#ur_transrel_table').flexFile(urls.excelRel);} }
		],
		colModel : [
		 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
		,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '发卡行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '发卡方手续费', dataIndex: 'cardFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方封顶值', dataIndex: 'feeCardMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方固定值', dataIndex: 'feeCardVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '总收益', dataIndex: 'totRev', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费率', dataIndex: 'payRate', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费', dataIndex: 'payFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '收单方手续费', dataIndex: 'fftFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户费率', dataIndex: 'realFeeType', width: 80, align: 'center', sortable: true }
		,{ display: '银行品牌服务费', dataIndex: 'bankBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商品牌服务费', dataIndex: 'allBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费清算标', dataIndex: 'brandFeeFlag', width: 80, align: 'center', sortable: true }
		,{ display: '银行实际清算金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费费率', dataIndex: 'realBrandfeeType', width: 80, align: 'center', sortable: true }
		,{ display: '服务商方收益', dataIndex: 'devFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#ar_transrel_table').flexigrid({
		url : urls.listUnRel, height: 330, sort : 'transTime', dir : "desc", checkbox : true, usepager : true, 
		buttons : [
		],
		colModel : [
		 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
		,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '发卡行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '发卡方手续费', dataIndex: 'cardFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方封顶值', dataIndex: 'feeCardMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方固定值', dataIndex: 'feeCardVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '总收益', dataIndex: 'totRev', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费率', dataIndex: 'payRate', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费', dataIndex: 'payFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '收单方手续费', dataIndex: 'fftFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户费率', dataIndex: 'realFeeType', width: 80, align: 'center', sortable: true }
		,{ display: '银行品牌服务费', dataIndex: 'bankBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商品牌服务费', dataIndex: 'allBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费清算标', dataIndex: 'brandFeeFlag', width: 80, align: 'center', sortable: true }
		,{ display: '银行实际清算金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费费率', dataIndex: 'realBrandfeeType', width: 80, align: 'center', sortable: true }
		,{ display: '服务商方收益', dataIndex: 'devFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#au_transrel_table').flexigrid({
		url : urls.listRel, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#au_transrel_table').flexFile(urls.excelRel);} }
		],
		colModel : [
		 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
		,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '发卡行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '发卡方手续费', dataIndex: 'cardFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方封顶值', dataIndex: 'feeCardMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方固定值', dataIndex: 'feeCardVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '总收益', dataIndex: 'totRev', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费率', dataIndex: 'payRate', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费', dataIndex: 'payFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '收单方手续费', dataIndex: 'fftFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户费率', dataIndex: 'realFeeType', width: 80, align: 'center', sortable: true }
		,{ display: '银行品牌服务费', dataIndex: 'bankBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商品牌服务费', dataIndex: 'allBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费清算标', dataIndex: 'brandFeeFlag', width: 80, align: 'center', sortable: true }
		,{ display: '银行实际清算金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费费率', dataIndex: 'realBrandfeeType', width: 80, align: 'center', sortable: true }
		,{ display: '服务商方收益', dataIndex: 'devFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('#audDiv').fullScreen();
	$('#audtabs').tabs(); $('#audtabs').fixTabInDialog('audDiv');
	
	$('#transrel_queryBtn').click(function(){$.queryTable({formId : 'transrel_queryForm', tableId : 'transrel_table'});});
	
	$('#updRelDiv').fullScreen();
	$('#updReltabs').tabs(); $('#updReltabs').fixTabInDialog('updRelDiv');
	
	$('#ur_transrel_queryBtn').click(function(){$.queryTable({formId : 'ur_transrel_queryForm', tableId : 'ur_transrel_table'});});
	
	$('#ar_transrel_queryBtn').click(function(){$.queryTable({formId : 'ar_transrel_queryForm', tableId : 'ar_transrel_table'});});
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		//wxb
		var startTime=$("#q_bgnSday").val();
		var endTime=$("#q_endSday").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("开始日期不能晚于结束日期");
				return false;
			}
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	$('#au_transrel_queryBtn').click(function(){$.queryTable({formId : 'au_transrel_queryForm', tableId : 'au_transrel_table'});});
	
	midDialogBind('a_mid', function(data) { $('#a_mid').val(data.mid); });
	
	midDialogBind('ur_mid', function(data) { $('#ur_mid').val(data.mid); });
	
});
//-->
</script>
</body>