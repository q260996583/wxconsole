<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>出款情况查询</title>
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
		<input type="hidden" name="applyState" value="02,11,10" ftype="list" comparison="eq"/>
		<ul class="qry-ul">
			<li><label>商户号</label><input id="q_mid" name="mid" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>商户名称</label><input id="q_merName" name="merName" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>出款时间从</label><input id="q_bgnSday" name="applyTime" type="text" xtype="datetime" qtype="string" comparison="ge" /></li>
			<li><label>到</label><input id="q_endSday" name="applyTime" type="text" xtype="datetime" qtype="string" comparison="le" /></li>
			<li><label>出款状态</label>
				<select id="q_applyState" name="applyState" type="text" comparison="eq">
					<option value="">不限</option>
					<option value="02">出款成功</option>
					<option value="10">不出账</option>
					<option value="11">出款失败</option>
				</select></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>


<!-- 商户明细详情界面 -->
<div id="viewMchntDiv" style="display: none;">
<div id="viewMchnttabs" style="border: none;">
	<ul>
    	<li id="vm_baseinfoTab" ><a href="#viewMchnttabs-1">基本信息</a></li>
    	<li id="vm_settleTab"><a href="#viewMchnttabs-2">交易结算款</a></li>
    	<li id="vm_riskTab"><a href="#viewMchnttabs-3">风控调整款</a></li>
    	<li id="vm_stlmTab"><a href="#viewMchnttabs-4">清算调整款</a></li>
    	<li id="vm_balanceTab"><a href="#viewMchnttabs-5">结算调整款</a></li>
  	</ul>
  	<div id="viewMchnttabs-1">
  		<form id="viewMchntForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
		    <td class="flabel">序号</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_dtlNo" name="dtlNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">开始日期</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_bgnSday" xtype="date" name="bgnSday" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">结束日期</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_endSday" xtype="date" name="mid" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商编号</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_channelCode" name="channelCode" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">商户编号</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_mid" name="mid" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">商户名称</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_merName" name="merName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易笔数</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_stlmCount" name="stlmCount" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易金额</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_feeAmt" name="feeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">清算金额</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_stlmAmt" name="stlmAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易结算款</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_settleAmt" name="settleAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">风控调整款</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_riskAjAmt" name="riskAjAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">清算调整款</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_stlmAjAmt" name="stlmAjAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">结算调整款</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_settleAjAmt" name="settleAjAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_realAmt" name="realAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">实付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_bankRealAmt" name="bankRealAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">状态</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_applyStateDesc" name="applyStateDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="vm_remark" name="remark" type="text" readonly="readonly"></textarea></td>
		</tr>
		</table>
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>付款账户</caption>
		<tr>
		    <td class="flabel">账户类型</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_accntTypeDesc" name="accntTypeDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账户名称</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_accntName" name="accntName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">开户人证件号</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_cardPersonNo" name="cardPersonNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">支行名</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_bankBranchNoDesc" name="bankBranchNoDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">总行名</td>
		    <td class="fcontent"><input class="cdnInput" id="vm_bankTitleDesc" name="bankTitleDesc" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		</form>
  	</div>
  	<div id="viewMchnttabs-2">
  		<!-- 查询条件 -->
		<div id="settle_queryCondition">
			<form id="settle_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="oprType" value="01" qtype="string" comparison="eq" />
				<input type="hidden" name="seqNo" id="settle_q_seqNo" class="param" />
				<input type="hidden" name="mid" id="settle_q_mid" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="settle_q_stlmDate"  name="stlmDate" type="text" xtype="date" qtype="string" comparison="eq" /></li>
					<li><input class='bt' id="settle_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="settle_table"></div>
  	</div>
  	<div id="viewMchnttabs-3">
  		<!-- 查询条件 -->
		<div id="risk_queryCondition">
			<form id="risk_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="oprType" value="02,03,04,05" ftype="list" qtype="string" comparison="eq" />
				<input type="hidden" name="seqNo" id="risk_q_seqNo" class="param" />
				<input type="hidden" name="mid" id="risk_q_mid" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="risk_q_stlmDate"  name="stlmDate" type="text" xtype="date" qtype="string" comparison="eq" /></li>
					<li><input class='bt' id="risk_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="risk_table"></div>
  	</div>
  	<div id="viewMchnttabs-4">
  		<!-- 查询条件 -->
		<div id="stlm_queryCondition">
			<form id="stlm_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="oprType" value="06" qtype="string" comparison="eq" />
				<input type="hidden" name="seqNo" id="stlm_q_seqNo" class="param" />
				<input type="hidden" name="mid" id="stlm_q_mid" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="stlm_q_stlmDate"  name="stlmDate" type="text" xtype="date" qtype="string" comparison="eq" /></li>
					<li><input class='bt' id="stlm_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="stlm_table"></div>
  	</div>
  	<div id="viewMchnttabs-5">
  		<!-- 查询条件 -->
		<div id="balance_queryCondition">
			<form id="balance_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="oprType" value="07" qtype="string" comparison="eq" />
				<input type="hidden" name="seqNo" id="balance_q_seqNo" class="param" />
				<input type="hidden" name="mid" id="balance_q_mid" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="balance_q_stlmDate"  name="stlmDate" type="text" xtype="date" class="param"/></li>
					<li><input class='bt' id="balance_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="balance_table"></div>
  	</div>
</div>
</div>

<!-- 详情界面 -->
<div id="viewTransRelDiv" style="display: none;">
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

<!-- 详情界面 -->
<div id="viewSettleDtlDiv" style="display: none;">
	<!-- 查询条件 -->
	<div id="settlerel_queryCondition">
		<form id="settlerel_queryForm" name="queryForm" action="#" method="post">
			<input type="hidden" name="seqNo" id="settlerel_q_logSeqNo" class="param" />
			<ul class="qry-ul">
				<li><label>清算日期</label><input id="settlerel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
				<li><input class='bt' id="settlerel_queryBtn" value="查询" type="button"/></li>
				<li><input value="重置" class='bt' type="reset" /></li>
			</ul>
		</form>
	</div>
	<!-- 列表 -->
	<div id="settlerel_table"></div>
</div>

<!-- 详情界面 -->
<div id="viewBalanceAjDtlDiv" style="display: none;">
	<!-- 查询条件 -->
	<div id="balanceAj_queryCondition">
		<form id="balanceAj_queryForm" name="queryForm" action="#" method="post">
			<input type="hidden" name="seqNo" id="balanceAj_q_seqNo" class="param" />
			<input type="hidden" name="mid" id="balanceAj_q_mid" class="param" />
			<ul class="qry-ul">
				<li><label>清算日期</label><input id="balanceAj_q_stlmDate"  name="stlmDate" type="text" xtype="date" class="param"/></li>
				<li><input class='bt' id="balanceAj_queryBtn" value="查询" type="button"/></li>
				<li><input value="重置" class='bt' type="reset" /></li>
			</ul>
		</form>
	</div>
	<!-- 列表 -->
	<div id="balanceAj_table"></div>
</div>
<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	accntdtl:'payMchntDtlAccntQryDetail.action',
	accntdtlExcel:'payMchntDtlAccntQryDetailExcel.action',
	transdtl:'payMchntDtlTransQryDetail.action',
	transdtlExcel:'payMchntDtlTransQryDetailExcel.action',
	loglist:'payMchntDtlQryBalanceLogPage.action',
	loglistExcel:'payMchntDtlQryBalanceLogPageExcel.action',
	logrel:'payMchntDtlQryBalanceLogRelPage.action',
	logrelExcel:'payMchntDtlQryBalanceLogRelPageExcel.action',
	settlerel:'payMchntDtlQrySettlePage.action',
	settlerelExcel:'payMchntDtlQrySettlePageExcel.action',
	settleAdjust:'payMchntDtlQryFindSettleAdjustDtl.action',
	settleAdjustExcel:'payMchntDtlQryFindSettleAdjustDtlExcel.action'
};

$(function() {
	
	// viewMchntForm
	$('#viewMchntDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '商户支付明细详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// viewSettleDtlDiv
	$('#viewSettleDtlDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '款项关联交易', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// viewTransRelDiv
	$('#viewTransRelDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '款项关联交易', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// viewBalanceAjDtlDiv
	$('#viewBalanceAjDtlDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '交易结算款详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// VIEWMCHNT
	var viewMchnt = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewMchntForm');
		$.jyform.fillForm('viewMchntForm', record);
		// 交易结算款
		$('#settle_q_seqNo').val(record.reqSeqNo);
		$('#settle_q_mid').val(record.mid);
		$('#settle_queryBtn').click();
		// 风控调整款
		$('#risk_q_seqNo').val(record.reqSeqNo);
		$('#risk_q_mid').val(record.mid);
		$('#risk_queryBtn').click();
		// 清算调整款
		$('#stlm_q_seqNo').val(record.reqSeqNo);
		$('#stlm_q_mid').val(record.mid);
		$('#stlm_queryBtn').click();
		// 结算调整款
		$('#balance_q_seqNo').val(record.reqSeqNo);
		$('#balance_q_mid').val(record.mid);
		$('#balance_queryBtn').click();
		
		$('#viewMchntDiv').dialog('open');
		$('#baseinfotab > a').click();
	};
	
	// VIEWTRANSREL
	var viewTransRel = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$('#transrel_q_logSeqNo').val(record.logSeqNo);
		$('#transrel_queryBtn').click();
		$('#viewTransRelDiv').dialog('open');
	};
	
	// VIEWSETTLEDTL
	var viewSettleDtl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$('#settlerel_q_logSeqNo').val(record.logSeqNo);
		$('#settlerel_queryBtn').click();
		$('#viewSettleDtlDiv').dialog('open');
	};
	
	var viewBalanceAjDtl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$('#balanceAj_q_seqNo').val(record.payReqSeq);
		$('#balanceAj_q_mid').val(record.mid);
		$('#balanceAj_queryBtn').click();
		$('#viewBalanceAjDtlDiv').dialog('open');
	}
	
	var viewDtl = function(record,id) {
		if (record.oprType == '01') {
			// 交易结算款
			viewSettleDtl(record,id);
		} else {
			// 其他
			viewTransRel(record,id);
		}
	}
	
	// datagrid
	$('#table').flexigrid({
		url : urls.accntdtl, height: 330, sort : 'dtlNo', dir : "desc", checkbox : false, usepager : true, dbClickRecord:viewMchnt,
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#table').flexFile(urls.accntdtlExcel,{seqNo:$('#mchntdtl_q_seqNo').val()}); } }
		],
		colModel : [ 
       	 { display: '序号', dataIndex: 'dtlNo', width: 80, align: 'center', sortable: true }
       	,{ display: '开始日期', dataIndex: 'bgnSday', width: 80, align: 'center', sortable: true, render:fmtDate }
   		,{ display: '结束日期', dataIndex: 'endSday', width: 80, align: 'center', sortable: true, render:fmtDate}
   		,{ display: '服务商编号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
   		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
   		,{ display: '商户名称', dataIndex: 'merName', width: 80, align: 'center', sortable: true }
   		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '费率', dataIndex: 'applyFeeRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
   		,{ display: '手续费', dataIndex: 'feeAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '清算金额', dataIndex: 'stlmAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '交易结算款', dataIndex: 'settleAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '风控调整款', dataIndex: 'riskAjAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '清算调整款', dataIndex: 'stlmAjAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '结算调整款', dataIndex: 'settleAjAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '应付金额', dataIndex: 'realAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '实付金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '账户类型', dataIndex: 'accntTypeDesc', width: 80, align: 'center', sortable: true }
   		,{ display: '行号', dataIndex: 'bankNo', width: 80, align: 'center', sortable: true }
   		,{ display: '账户名称', dataIndex: 'accntName', width: 80, align: 'center', sortable: true }
   		,{ display: '账号', dataIndex: 'accntNo', width: 80, align: 'center', sortable: true }
   		,{ display: '支行名', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
   		,{ display: '持卡人证件号', dataIndex: 'cardPersonNo', width: 80, align: 'center', sortable: true }
   		,{ display: '总行名', dataIndex: 'bankTitleDesc', width: 80, align: 'center', sortable: true }
   		,{ display: '出账用户', dataIndex: 'applyUser', width: 80, align: 'center', sortable: true }
   		,{ display: '出账时间', dataIndex: 'applyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
   		,{ display: '出账状态', dataIndex: 'applyStateDesc', width: 80, align: 'center', sortable: true }
   		]
	});
	
	$('#transdtl_table').flexigrid({
		url : urls.transdtl, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, 
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#transdtl_table').flexFile(urls.transdtlExcel,{seqNo:$('#transdtl_q_seqNo').val()}); }}
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
		,{ display: '出账状态', dataIndex: 'mhtApplyStDesc', width: 80, align: 'center', sortable: true }
		,{ display: '出账时间', dataIndex: 'mhtApplyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '出账操作人', dataIndex: 'mhtApplyUser', width: 80, align: 'center', sortable: true }		            
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#settledtl_table').flexigrid({
		url : urls.transdtl, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, 
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#settledtl_table').flexFile(urls.transdtlExcel,{seqNo:$('#settledtl_q_seqNo').val()}); }}
		],
		colModel : [ 
		{ display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
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
		,{ display: '出账状态', dataIndex: 'mhtApplyStDesc', width: 80, align: 'center', sortable: true }
		,{ display: '出账时间', dataIndex: 'mhtApplyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '出账操作人', dataIndex: 'mhtApplyUser', width: 80, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#settle_table').flexigrid({
		url : urls.loglist, height: 330, sort : 'lastUpdTime', dir : "desc", checkbox : false, usepager : true, dbClickRecord: viewDtl,
		buttons : [
			{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#settle_table').flexFile(urls.loglistExcel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#stlm_table').flexigrid({
		url : urls.loglist, height: 330, sort : 'lastUpdTime', dir : "desc", checkbox : false, usepager : true, dbClickRecord: viewDtl,
		buttons : [
			{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#stlm_table').flexFile(urls.loglistExcel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#risk_table').flexigrid({
		url : urls.loglist, height: 330, sort : 'lastUpdTime', dir : "desc", checkbox : false, usepager : true, dbClickRecord: viewDtl,
		buttons : [
			{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#risk_table').flexFile(urls.loglistExcel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#balance_table').flexigrid({
		url : urls.loglist, height: 330, sort : 'lastUpdTime', dir : "desc", checkbox : false, usepager : false, dbClickRecord: viewBalanceAjDtl,
		buttons : [
			{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#balance_table').flexFile(urls.loglistExcel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#transrel_table').flexigrid({
		url : urls.logrel, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#transrel_table').flexFile(urls.logrelExcel);} }
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
	
	$('#settlerel_table').flexigrid({
		url : urls.settlerel, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#settledtl_table').flexFile(urls.settlerelExcel);} }
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
	
	$('#balanceAj_table').flexigrid({
		url : urls.settleAdjust, height: 330, sort : 'lastUpdTime', dir : "desc", checkbox : false, usepager : false, dbClickRecord: viewDtl,
		buttons : [
			{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#balanceAj_table').flexFile(urls.settleAdjustExcel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();	
	
	$('#viewSettleDtlDiv').fullScreen();
	
	$('#viewTransRelDiv').fullScreen();
	
	$('#viewMchntDiv').fullScreen();
	$('#viewBalanceAjDtlDiv').fullScreen();
	
	$('#viewMchnttabs').tabs(); $('#viewMchnttabs').fixTabInDialog('viewMchntDiv');
	
	$('.bt').button();
	
	$('#settle_queryBtn').click(function(){$.queryTable({formId : 'settle_queryForm', tableId : 'settle_table'});});
	$('#risk_queryBtn').click(function(){$.queryTable({formId : 'risk_queryForm', tableId : 'risk_table'});});
	$('#stlm_queryBtn').click(function(){$.queryTable({formId : 'stlm_queryForm', tableId : 'stlm_table'});});
	$('#balance_queryBtn').click(function(){$.queryTable({formId : 'balance_queryForm', tableId : 'balance_table'});});
	$('#balanceAj_queryBtn').click(function(){$.queryTable({formId : 'balanceAj_queryForm', tableId : 'balanceAj_table'});});
	
	$('#settlerel_queryBtn').click(function(){$.queryTable({formId : 'settlerel_queryForm', tableId : 'settlerel_table'});});
	$('#transrel_queryBtn').click(function(){$.queryTable({formId : 'transrel_queryForm', tableId : 'transrel_table'});});
	
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
	$('#transdtl_queryBtn').click(function(){$.queryTable({formId : 'transdtl_queryForm', tableId : 'transdtl_table'});});
	$('#settledtl_queryBtn').click(function(){$.queryTable({formId : 'settledtl_queryForm', tableId : 'settledtl_table'});});
	$('#queryBtn').click();
});
//-->
</script>
</body>