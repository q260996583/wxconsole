<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>风控金额延迟清算管理</title>
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
<!-- 新增 -->
<div id="addDiv" style="display: none;">
<form id="addForm" action="#">
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel"><font color="red">*</font>商户号</td>
		<td class="fcontent"><input class="cdnInput" id="a_mid" name="mid" maxLength="15" type="text" /><div id="a_midTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>清算日期</td>
		<td class="fcontent"><input class="cdnInput" id="a_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /><div id="a_stlmDateTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>延迟清算金额</td>
		<td class="fcontent"><input class="cdnInput" id="a_balance" xtype="money" name="balance" maxLength="12" type="text" /><div id="a_balanceTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>备注</td>
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
			<td class="flabel">清算日期</td>
			<td class="fcontent"><input class="cdnInput" id="v_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">延迟清算金额</td>
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
			<td class="flabel">操作原因</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="v_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">出账处理付款单序号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_payReqSeq" name="payReqSeq" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">延迟清算标识</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lockStatusDesc" name="lockStatusDesc" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">原记录序号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_oriLogSeqNo" name="oriLogSeqNo" maxLength="20" type="text" /></td>
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
	<div id="viewtabs-2">
  		<!-- 查询条件 -->
		<div id="transrel_queryCondition">
			<form id="transrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="logSeqNo" id="transrel_q_logSeqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
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
			<td class="fcontent"><input class="cdnInput" readonly id="ur_mid" name="mid" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">清算日期</td>
			<td class="fcontent"><input class="cdnInput" id="ur_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">延迟清算金额</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_oprUser" name="oprUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_oprTime" xtype="datetime" name="oprTime" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">延迟清算原因</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="ur_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">出账处理付款单序号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_payReqSeq" name="payReqSeq" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ur_lastUpdOrg" name="lastUpdOrg" maxLength="30" type="text" /></td>
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
					<li><label>清算日期</label><input id="ur_transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
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

<!-- 解冻界面 -->
<div id="unlockDiv" style="display: none;">
<div id="unlocktabs" style="border: none;">
	<ul>
    	<li id="ul_baseinfotab" ><a href="#unlocktabs-1">基本信息</a></li>
    	<li id="ul_transreltab"><a href="#unlocktabs-2">关联交易</a></li>
  	</ul>
	<div id="unlocktabs-1">
	<form id="unlockForm" action="#">
	<input id="ul_version" type="hidden" name="version" />
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">记录号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_logSeqNo" name="logSeqNo" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作类型</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_oprTypeDesc" name="oprTypeDesc" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">商户号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_mid" name="mid" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">清算日期</td>
			<td class="fcontent"><input class="cdnInput" id="ul_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">延迟清算金额</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_oprUser" name="oprUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_oprTime" xtype="datetime" name="oprTime" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">延迟清算原因</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="ul_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">出账处理付款单序号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_payReqSeq" name="payReqSeq" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_lastUpdOrg" name="lastUpdOrg" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_lastUpdTime" xtype="datetime" name="lastUpdTime" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="ul_lastUpdUser" name="lastUpdUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>解除延迟清算原因</td>
			<td class="fcontent"><textarea class="cdnInput" id="ul_unlock_remark"></textarea></td>
		</tr>
	</table>
	</form>
	</div>
	<div id="unlocktabs-2">
  		<!-- 查询条件 -->
		<div id="ul_transrel_queryCondition">
			<form id="ul_transrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="logSeqNo" id="ul_transrel_q_logSeqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="ul_transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="ul_transrel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="ul_transrel_table"></div>
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

<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	add:'addRiskLockAmt.action',
	unlock:'unlockRiskLockAmt.action',
	listUnRel:'riskLockAmtUnRelPage.action',
	addRel:'addRiskLockAmtRel.action',
	delRel:'delRiskLockAmtRel.action',
	list:'riskLockAmtPage.action',
	excel:'riskLockAmtPageExcel.action',
	listRel:'riskLockAmtRelPage.action',
	excelRel:'riskLockAmtRelPageExcel.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_mid").formValidator({validatorgroup:"1", onshow: "请选择商户号"})
		.inputValidator({min:15,onerrormin:"商户号必填", max:15, onerrormax:'商户号应为15位'}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"服务商内部商户号仅能输入数字，字母"});
	$("#a_stlmDate").formValidator({validatorgroup:"1", onshow: "请选择清算日期"})
		.inputValidator({min:1,onerrormin:"清算日期必填"});
	$("#a_balance").formValidator({validatorgroup:"1", onshow: "请输入调整金额"})
		.inputValidator({min:0,onerrormin:"延迟清算金额必须填写且为正数", max:999999999999, onerrormax:'延迟清算金额取值在0~999999999999',type:'value'}) /* 数字检查 */ 
	$("#a_remark").formValidator({validatorgroup:"1", onshow: "请填写冻结原因"})
		.inputValidator({min:1,onerrormin:"延迟清算原因必填", max:400, onerrormax:'延迟清算原因最多400位'});
	
	$.formValidator.initConfig({ validatorgroup:"2", formid:"unlockForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#ul_unlock_remark").formValidator({validatorgroup:"2", onshow: "请填写解冻原因"})
		.inputValidator({min:1,onerrormin:"解除延迟清算原因必填", max:400, onerrormax:'解除延迟清算原因最多400位'});
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '新增金额延迟清算', buttons:{
		'新增' : function() {
			if($.formValidator.pageIsValid('1')) {
				$.ajaxForm({formId : 'addForm', url : urls.add,
				success : function(data) {
					if (data.success) { 
						$('#addDiv').dialog('close'); alert('操作成功,商户余额剩余'+data.root[0].finalAmt/100+'元'); 
						if ( data.root && data.root[0] ) $('#table').flexAddData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 450
	, title: '风控金额延迟结算详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// updRelForm
	$('#updRelDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 450
	, title: '风控金额延迟结算交易配置', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// unlockForm
	$('#unlockDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '解除风控金额延迟结算', buttons:{
		'解除延迟结算' : function() {
			if($.formValidator.pageIsValid('2')) {
				var record = new Object();
				record.logSeqNo = $('#ul_logSeqNo').val();
				record.version = $('#ul_version').val();
				$.ajax({url:urls.unlock ,data:{jsonObject:$.toJSON(record),remark:$('#ul_unlock_remark').val()},
					type:'POST', dataType:'json',
					success : function(data) {
						if (data.success) { 
							$('#unlockDiv').dialog('close'); alert('操作成功,商户余额剩余'+data.root[0].finalAmt/100+'元'); 
							if ( data.root && data.root[0] ) $('#queryBtn').click();
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
	
	// UNLOCK
	var unlock = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('unlockForm');
		$.jyform.fillForm('unlockForm', record);
		$('#ul_transrel_q_logSeqNo').val(record.logSeqNo);
		$('#ul_transrel_queryBtn').click();
		$('#unlockDiv').dialog('open');
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
		url : urls.list, height: 330, sort : 'lastUpdTime', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
			 {name: "新增延迟结算", show:'ROLE_RISK_AMT_ADD', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
			,{name: "解除延迟结算", show:'ROLE_RISK_AMT_UNLOCK', bclass: 'grid_add', id: 'txt', onpress : unlock },{separator : true }
			,{name: "配置关联交易", show:'ROLE_RISK_AMT_REL', bclass: 'grid_add', id: 'txt', onpress : rel },{separator : true }
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
			,{ display : '延迟结算标识', dataIndex : 'lockStatusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '原记录序号', dataIndex : 'oriLogSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#transrel_table').flexigrid({
		url : urls.listRel, height: 330, sort : '', checkbox : false, usepager : true, 
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
	
	$('#ul_transrel_table').flexigrid({
		url : urls.listRel, height: 330, sort : '', checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#ul_transrel_table').flexFile(urls.excelRel);} }
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
		url : urls.listRel, height: 330, sort : '', checkbox : true, usepager : true, 
		buttons : [
			{name: "新增关联交易", show:'ROLE_RISK_AMT_REL', bclass: 'grid_add', id: 'txt', onpress : addRel },{separator : true }
		   ,{name: "删除关联交易", show:'ROLE_RISK_AMT_REL', bclass: 'grid_add', id: 'txt', onpress : delRel },{separator : true }
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
		url : urls.listUnRel, height: 330, sort : '', checkbox : true, usepager : true, 
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
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('#transrel_queryBtn').click(function(){$.queryTable({formId : 'transrel_queryForm', tableId : 'transrel_table'});});
	
	$('#unlockDiv').fullScreen();
	$('#unlocktabs').tabs(); $('#unlocktabs').fixTabInDialog('unlockDiv');
	
	$('#ul_transrel_queryBtn').click(function(){$.queryTable({formId : 'ul_transrel_queryForm', tableId : 'ul_transrel_table'});});
	
	$('#updRelDiv').fullScreen();
	$('#updReltabs').tabs(); $('#updReltabs').fixTabInDialog('updRelDiv');
	
	$('#ur_transrel_queryBtn').click(function(){$.queryTable({formId : 'ur_transrel_queryForm', tableId : 'ur_transrel_table'});});
	
	$('#ar_transrel_queryBtn').click(function(){$.queryTable({formId : 'ar_transrel_queryForm', tableId : 'ar_transrel_table'});});
	
	$('.bt').button();
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	midDialogBind('a_mid', function(data) { $('#a_mid').val(data.mid); });
	
});
//-->
</script>
</body>