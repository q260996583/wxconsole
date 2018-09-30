<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>银联追偿清算查询</title>
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
			<li><label>商户号</label><input id="q_mid" name="mid" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>服务商号</label><input id="q_channelCode" name="channelCode" type="text" maxlength="60" qtype="string" comparison="eq" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input id="resetBtn" value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
<div id="viewtabs" style="border: none;">
	<ul>
    	<li id="baseinfotab" ><a href="#viewtabs-1">基本信息</a></li>
    	<li id="oridtltab"><a href="#viewtabs-2">原交易信息</a></li>
  	</ul>
  	<div id="viewtabs-1">
  		<form id="viewForm" action="#">
  		<input type="hidden" name="version" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>追偿清算信息</caption>
		<tr>
		    <td class="flabel">序号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_seqNo" name="seqNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">代理机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_agentOrgCode" name="agentOrgCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">发送机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_sendOrgCode" name="sendOrgCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">终端标识号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_tid" name="tid" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">商户号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mid" name="mid" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_channelCode" name="channelCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">系统跟踪号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_systemTraceNo" name="systemTraceNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易传输时间</td>
		    <td class="fcontent"><input class="cdnInput" id="v_txnTransTime" name="txnTransTime" type="text" xtype="datetime" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">主帐号</td>
			<td class="fcontent"><input class="cdnInput" id="v_pan" name="pan" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">报文类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_packetType" name="packetType" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易处理码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_procCode" name="procCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">商户类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mcc" name="mcc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">正确商户类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mcc" name="mcc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">追偿类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_indemnityTypeDesc" name="indemnityTypeDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">检索参考号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_referenceNum" name="referenceNum" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务点条件码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_pointCondCode" name="pointCondCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">接收机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_receiveOrgCode" name="receiveOrgCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易返回码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_respCode" name="respCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易系统追踪号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_systemTraceId" name="systemTraceId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务点输入方式</td>
		    <td class="fcontent"><input class="cdnInput" id="v_pointEntryCode" name="pointEntryCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付追偿手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_orgPayFeeAmt" name="orgPayFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应收追偿手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_orgReceiveFeeAmt" name="orgReceiveFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">追偿转接清算费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_switchFeeAmt" name="switchFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">发卡银行标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_cardBankNo" name="cardBankNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易地域标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transAreaCode" name="transAreaCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">终端类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_tidType" name="tidType" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">合规特殊计费标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_feeFlag" name="feeFlag" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">标准化清算倍数</td>
		    <td class="fcontent"><input class="cdnInput" id="v_stlmTimes" name="stlmTimes" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">原交易匹配标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mateFlagDesc" name="mateFlagDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">来源文件</td>
		    <td class="fcontent"><input class="cdnInput" id="v_fileName" name="fileName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_remark" name="remark" type="text"></textarea></td>
		</tr>
		</table>
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>记录信息</caption>
		<tr>
		    <td class="flabel">记录创建时间</td>
		    <td class="fcontent"><input class="cdnInput" id="v_recTime" name="recTime" xtype="datetime" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">记录创建人</td>
		    <td class="fcontent"><input class="cdnInput" id="v_recAcc" name="recAcc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">最后更新时间</td>
		    <td class="fcontent"><input class="cdnInput" id="v_lastUptTime" name="recTime" xtype="datetime" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">最后更新人</td>
		    <td class="fcontent"><input class="cdnInput" id="v_lastUptAcc" name="lastUptAcc" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		</form>
  	</div>
  	<div id="viewtabs-2">
  		<!-- 查询条件 -->
		<div id="ori_queryCondition" style="display:none">
			<form id="ori_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="ori_seqNo" class="param" />
				<ul class="qry-ul">
					<li><input class='bt' id="ori_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="ori_table"></div>
  	</div>
</div>
</div>
<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<jsp:include page="/page/console/business/include/dialog_postrans.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	list:'cupsIndemnityPage.action',
	excel:'cupsIndemnityPageExcel.action',
	ori:'selectCupsIndemnityOriTrans.action'
};

$(function() {
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '详细信息', buttons:{
		'关闭' : function() { $(this).dialog('close'); }
	}});
	
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#ori_seqNo').val(record.seqNo);
		$('#ori_queryBtn').click();
		$('#viewDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'errSeq', dir : "desc", checkbox : true, usepager : true, dbClickRecord: view,
		buttons : [
		  {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#table').flexFile(urls.excel); } }
		],
		colModel : [ 
       	  	 { display : '序号', dataIndex : 'seqNo', width : 80, align : 'center', sortable:true }
			,{ display : '代理机构标识码', dataIndex : 'agentOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '发送机构标识码', dataIndex : 'sendOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '系统跟踪号', dataIndex : 'systemTraceNo', width : 80, align : 'center', sortable:true }
			,{ display : '交易传输时间', dataIndex : 'txnTransTime', width : 80, align : 'center', sortable:true }
			,{ display : '应付追偿手续费', dataIndex : 'orgPayFeeAmt', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '应收追偿手续费', dataIndex : 'orgReceiveFeeAmt', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '追偿转接清算费', dataIndex : 'switchFeeAmt', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '服务商编号', dataIndex : 'channelCode', width : 120, align : 'center', sortable:true }
			,{ display : '原交易匹配标识', dataIndex : 'mateFlagDesc', width : 120, align : 'center', sortable:true }
			,{ display : '终端标识号', dataIndex : 'tid', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 80, align : 'center', sortable:true }
			//,{ display : '主帐号', dataIndex : 'pan', width : 80, align : 'center', sortable:true }
			,{ display : '交易金额', dataIndex : 'transAmt', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '报文类型', dataIndex : 'packetType', width : 80, align : 'center', sortable:true }
			,{ display : '交易处理码(3域)', dataIndex : 'procCode', width : 80, align : 'center', sortable:true }
			,{ display : '商户类型', dataIndex : 'mcc', width : 80, align : 'center', sortable:true }
			,{ display : '正确商户类型', dataIndex : 'realMcc', width : 80, align : 'center', sortable:true }
			,{ display : '追偿类型', dataIndex : 'indemnityTypeDesc', width : 80, align : 'center', sortable:true }
			,{ display : '检索参考号', dataIndex : 'referenceNum', width : 80, align : 'center', sortable:true }
			,{ display : '服务点条件码', dataIndex : 'pointCondCode', width : 80, align : 'center', sortable:true }
			,{ display : '接收机构标识码', dataIndex : 'receiveOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '交易返回码', dataIndex : 'respCode', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易系统追踪号', dataIndex : 'systemTraceId', width : 80, align : 'center', sortable:true }
			,{ display : '服务点输入方式', dataIndex : 'pointEntryCode', width : 80, align : 'center', sortable:true }
			,{ display : '发卡银行标识码', dataIndex : 'cardBankNo', width : 80, align : 'center', sortable:true }
			,{ display : '交易地域标识', dataIndex : 'transAreaCode', width : 80, align : 'center', sortable:true }
			,{ display : '终端类型', dataIndex : 'tidType', width : 80, align : 'center', sortable:true }
			,{ display : '合规特殊计费标识', dataIndex : 'feeFlag', width : 80, align : 'center', sortable:true }
			,{ display : '标准化清算倍数', dataIndex : 'stlmTimes', width : 80, align : 'center', sortable:true }
			,{ display : '最后修改人', dataIndex : 'lastUptAcc', width : 80, align : 'center', sortable:true }
			,{ display : '最后修改时间', dataIndex : 'lastUptTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '记录生成时间', dataIndex : 'recTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '记录创建人', dataIndex : 'recAcc', width : 80, align : 'center', sortable:true }
			,{ display : '来源文件名', dataIndex : 'fileName', width : 80, align : 'center', sortable:true }
			,{ display : '备注', dataIndex : 'remark', width : 80, align : 'center', sortable:true }
			//,{ display : '处理状态', dataIndex : 'status', width : 120, align : 'center', sortable:true }
			//,{ display : '付款单号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
		]
	});
	
	$('#ori_table').flexigrid({ 
		url : urls.ori, height: 330, dir : "desc", sort : "transSeq", usepager : true, 
		buttons : [
		],
		colModel : [
			 { display: '中心交易流水', dataIndex: 'transSeq', align: 'center', sortable:true }
			,{ display: '终端交易流水', dataIndex: 'tidSeq', align: 'center' }
			,{ display: '本系统清算日', dataIndex: 'pospStmt', sortable:true, render: fmtDate }
			,{ display: '中心交易时间', dataIndex: 'transTime', sortable:true, render: fmtTime }
			,{ display: '中心交易类型', dataIndex: 'transCodeZh', align: 'center' }
			,{ display: '交易金额(元)', dataIndex: 'transAmtDesc', sortable:true }
			,{ display: '商户名称', dataIndex: 'merName', sortable:true }
			,{ display: '终端号', dataIndex: 'tid', align: 'center' }
			,{ display: '主帐号', dataIndex: 'pan', align: 'center' }
			,{ display: '交易状态', dataIndex: 'transStZh', align: 'center' }
			,{ display: '本地应答信息', dataIndex: 'respCodeLocalZh', align: 'center', render: function(row, value) { if ( row.respCodeLocal != '00' ) { return '<font style="color:red;">' + value + '</font>'; } return value; } }
			,{ display: '数字签名', dataIndex: 'signsZh', align: 'center' }
			,{ display: '冲正标志', dataIndex: 'rollbackFlagZh', align: 'center' }
			,{ display: '撤销标志', dataIndex: 'cancelFlagZh', align: 'center' }
			,{ display: '借贷标记', dataIndex: 'debitCreditFlagDesc', align: 'center' }
			]
		});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();	
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	$('.bt').button();
	$('#ori_queryBtn').click(function(){$.queryTable({formId : 'ori_queryForm', tableId : 'ori_table'});});
	midDialogBind('q_mid', function(data) { $('#q_mid').val(data.mid); });
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	channelCodeDialogBind('q_channelCode', function(data) { $('#q_channelCode').val(data.channelCode); });
});
//-->
</script>
</body>