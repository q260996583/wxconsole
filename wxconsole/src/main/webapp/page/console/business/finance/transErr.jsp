<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>差错明细管理</title>
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
			<li><label>差错类型</label><select id="q_errType" name="errType" maxlength="60" qtype="string" comparison="eq" ctype="ERR_TYPE"  multiple="multiple"></select></li>
			<li><label>状态</label><select id="q_status" name="status" maxlength="60" qtype="string" comparison="eq" ctype="ERR_STATUS"  multiple="multiple"></select></li>
			<li><label>退货标识</label><select id="q_returnFlag" name="returnFlag" maxlength="60" qtype="string" comparison="eq" ctype="RETURN_FLAG"  multiple="multiple"></select></li>
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
		<caption>差错信息</caption>
		<tr>
		    <td class="flabel">序号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_errSeq" name="errSeq" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">差错交易类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_errTypeDesc" name="errTypeDesc" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">差错金额</td>
			<td class="fcontent"><input class="cdnInput" id="v_errAmt" name="errAmt" xtype="money" type="text" readonly="readonly" /></td>
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
		    <td class="flabel">系统跟踪号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_errSystemTraceNo" name="errSystemTraceNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易传输时间</td>
		    <td class="fcontent"><input class="cdnInput" id="v_txnTransTime" name="txnTransTime" type="text" xtype="datetime" readonly="readonly" /></td>
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
		    <td class="flabel">服务点条件码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_pointCondCode" name="pointCondCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易返回码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_respCode" name="respCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务点输入方式</td>
		    <td class="fcontent"><input class="cdnInput" id="v_pointEntryCode" name="pointEntryCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应收手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_orgReceiveFeeAmt" name="orgReceiveFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_orgPayFeeAmt" name="orgPayFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">分期付款附加手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_addintionFeeAmt" name="addintionFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">持卡人交易手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_cardPersonFeeAmt" name="cardPersonFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应收费用</td>
		    <td class="fcontent"><input class="cdnInput" id="v_receiveAmt" name="receiveAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付费用</td>
		    <td class="fcontent"><input class="cdnInput" id="v_payAmt" name="payAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">差错原因</td>
		    <td class="fcontent"><input class="cdnInput" id="v_errReason" name="errReason" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">接收/转出机构标志码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transferOutOrgCode" name="transferOutOrgCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">转出卡号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transferOutCard" name="transferOutCard" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">转入机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transferInOrgCode" name="transferInOrgCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">转入卡号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transferInCard" name="transferInCard" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">受理/发卡方标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_orgTypeDesc" name="orgTypeDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">原交易匹配标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mateFlagDesc" name="mateFlagDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">交易地域标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transAreaCode" name="transAreaCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">ECI标识</td>
		    <td class="fcontent"><input class="cdnInput" id="v_eciFlag" name="eciFlag" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">处理状态</td>
		    <td class="fcontent"><input class="cdnInput" id="v_statusDesc" name="statusDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">付款单号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_payReqSeq" name="payReqSeq" type="text" readonly="readonly" /></td>
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
		<caption>原交易信息</caption>
		<tr>
		    <td class="flabel">上一笔交易检索参考号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_referenceNum" name="referenceNum" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">商户号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mid" name="mid" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">主帐号</td>
			<td class="fcontent"><input class="cdnInput" id="v_pan" name="pan" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易日期时间</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transTime" name="transTime" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易系统追踪号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_systemTraceId" name="systemTraceId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易清算日期</td>
		    <td class="fcontent"><input class="cdnInput" id="v_pospStmt" name="pospStmt" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">商户类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_mcc" name="mcc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">终端标识号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_tid" name="tid" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">授权标识应答码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_authRespCode" name="authRespCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">接收机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_receiveOrgCode" name="receiveOrgCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">发卡银行标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_cardBankNo" name="cardBankNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">卡序列号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_cardSeqNum" name="cardSeqNum" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">终端读取能力</td>
		    <td class="fcontent"><input class="cdnInput" id="v_tidReadAblity" name="tidReadAblity" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">IC卡条件代码</td>
		    <td class="fcontent"><input class="cdnInput" id="v_icCondCode" name="icCondCode" type="text" readonly="readonly" /></td>
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
<!-- 添加备注 -->
<div id="remarkDiv" style="display: none;">
	<form id="remarkForm" action="#">
	<input type="hidden" name="version" />
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<caption>差错信息</caption>
	<tr>
	    <td class="flabel">序号</td>
	    <td class="fcontent"><input class="cdnInput" id="r_errSeq" name="errSeq" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
		<td class="flabel">差错金额</td>
		<td class="fcontent"><input class="cdnInput" id="r_errAmt" name="errAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">差错交易类型</td>
	    <td class="fcontent"><input class="cdnInput" id="r_errTypeDesc" name="errTypeDesc" type="text" readonly="readonly"/></td>
	</tr>
	<tr>
	    <td class="flabel">系统跟踪号</td>
	    <td class="fcontent"><input class="cdnInput" id="r_errSystemTraceNo" name="errSystemTraceNo" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">交易传输时间</td>
	    <td class="fcontent"><input class="cdnInput" id="r_txnTransTime" name="txnTransTime" type="text" xtype="datetime" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">交易返回码</td>
	    <td class="fcontent"><input class="cdnInput" id="r_respCode" name="respCode" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">应收手续费</td>
	    <td class="fcontent"><input class="cdnInput" id="r_orgReceiveFeeAmt" name="orgReceiveFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">应付手续费</td>
	    <td class="fcontent"><input class="cdnInput" id="r_orgPayFeeAmt" name="orgPayFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">分期付款附加手续费</td>
	    <td class="fcontent"><input class="cdnInput" id="r_addintionFeeAmt" name="addintionFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">持卡人交易手续费</td>
	    <td class="fcontent"><input class="cdnInput" id="r_cardPersonFeeAmt" name="cardPersonFeeAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">应收费用</td>
	    <td class="fcontent"><input class="cdnInput" id="r_receiveAmt" name="receiveAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">应付费用</td>
	    <td class="fcontent"><input class="cdnInput" id="r_payAmt" name="payAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">差错原因</td>
	    <td class="fcontent"><input class="cdnInput" id="r_errReason" name="errReason" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">处理状态</td>
	    <td class="fcontent"><input class="cdnInput" id="r_statusDesc" name="statusDesc" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">付款单号</td>
	    <td class="fcontent"><input class="cdnInput" id="r_payReqSeq" name="payReqSeq" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">备注</td>
	    <td class="fcontent"><textarea class="cdnInput" id="r_remark" name="remark" type="text"></textarea></td>
	</tr>
	</table>
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<caption>原交易关联信息</caption>
	<tr>
	    <td class="flabel">商户号</td>
	    <td class="fcontent"><input class="cdnInput" id="r_mid" name="mid" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
		<td class="flabel">主帐号</td>
		<td class="fcontent"><input class="cdnInput" id="r_pan" name="pan" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">商户类型</td>
	    <td class="fcontent"><input class="cdnInput" id="r_mcc" name="mcc" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易检索参考号</td>
	    <td class="fcontent"><input class="cdnInput" id="r_referenceNum" name="referenceNum" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易系统追踪号</td>
	    <td class="fcontent"><input class="cdnInput" id="r_systemTraceId" name="systemTraceId" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易日期时间</td>
	    <td class="fcontent"><input class="cdnInput" id="r_transTime" name="transTime" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易清算日期</td>
	    <td class="fcontent"><input class="cdnInput" id="r_pospStmt" name="pospStmt" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易金额</td>
	    <td class="fcontent"><input class="cdnInput" id="r_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	</table>
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<caption>记录信息</caption>
	<tr>
	    <td class="flabel">记录创建时间</td>
	    <td class="fcontent"><input class="cdnInput" id="r_recTime" name="recTime" xtype="datetime" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">记录创建人</td>
	    <td class="fcontent"><input class="cdnInput" id="r_recAcc" name="recAcc" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">最后更新时间</td>
	    <td class="fcontent"><input class="cdnInput" id="r_lastUptTime" name="recTime" xtype="datetime" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">最后更新人</td>
	    <td class="fcontent"><input class="cdnInput" id="r_lastUptAcc" name="lastUptAcc" type="text" readonly="readonly" /></td>
	</tr>
	</table>
	</form>
</div>

<div id="addDiv" style="display:none;">
	<form id="addForm" action="#">
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>差错信息</caption>
		<tr>
		    <td class="flabel"><font color="red">*</font>差错交易类型</td>
		    <td class="fcontent"><select class="cdnInput" id="a_errType" name="errType" ctype="ERR_TYPE"></select><div id="a_errTypeTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>差错金额</td>
			<td class="fcontent"><input class="cdnInput" id="a_errAmt" name="errAmt" xtype="money" type="text" maxLength="13" /><div id="a_errAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">代理机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_agentOrgCode" name="agentOrgCode" type="text" maxLength="11"/><div id="a_agentOrgCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">发送机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_sendOrgCode" name="sendOrgCode" type="text" maxLength="11"/><div id="a_sendOrgCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">系统跟踪号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_errSystemTraceNo" name="errSystemTraceNo" type="text" maxLength="6"/><div id="a_errSystemTraceNoTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">交易传输时间</td>
		    <td class="fcontent"><input class="cdnInput" id="a_txnTransTime" name="txnTransTime" type="text" maxLength="15"/><div id="a_txnTransTimeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">报文类型</td>
		    <td class="fcontent"><input class="cdnInput" id="a_packetType" name="packetType" type="text" maxLength="4"/><div id="a_packetTypeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">交易处理码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_procCode" name="procCode" type="text" maxLength="6"/><div id="a_procCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">服务点条件码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_pointCondCode" name="pointCondCode" type="text" maxLength="2"/><div id="a_pointCondCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">交易返回码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_respCode" name="respCode" type="text" maxLength="2"/><div id="a_respCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">服务点输入方式</td>
		    <td class="fcontent"><input class="cdnInput" id="a_pointEntryCode" name="pointEntryCode" type="text" maxLength="3"/><div id="a_pointEntryCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">应收手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="a_orgReceiveFeeAmt" name="orgReceiveFeeAmt" xtype="money" type="text" maxLength="13"/><div id="a_orgReceiveFeeAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">应付手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="a_orgPayFeeAmt" name="orgPayFeeAmt" xtype="money" type="text" maxLength="13"/><div id="a_orgPayFeeAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">分期付款附加手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="a_addintionFeeAmt" name="addintionFeeAmt" xtype="money" type="text" maxLength="13"/><div id="a_addintionFeeAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">持卡人交易手续费</td>
		    <td class="fcontent"><input class="cdnInput" id="a_cardPersonFeeAmt" name="cardPersonFeeAmt" xtype="money" type="text" maxLength="13"/><div id="a_cardPersonFeeAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">应收费用</td>
		    <td class="fcontent"><input class="cdnInput" id="a_receiveAmt" name="receiveAmt" xtype="money" type="text" maxLength="13"/><div id="a_receiveAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">应付费用</td>
		    <td class="fcontent"><input class="cdnInput" id="a_payAmt" name="payAmt" xtype="money" type="text" maxLength="13"/><div id="a_payAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">差错原因码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_errReason" name="errReason" type="text" maxLength="4"/><div id="a_errReasonTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">接收/转出机构标志码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transferOutOrgCode" name="transferOutOrgCode" type="text" maxLength="11"/><div id="a_transferOutOrgCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">转出卡号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transferOutCard" name="transferOutCard" type="text" maxLength="19"/><div id="a_transferOutCardTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">转入机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transferInOrgCode" name="transferInOrgCode" type="text" maxLength="11"/><div id="a_transferInOrgCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">转入卡号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transferInCard" name="transferInCard" type="text" maxLength="19"/><div id="a_transferInCardTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">交易地域标识</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transAreaCode" name="transAreaCode" type="text" maxLength="1"/><div id="a_transAreaCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">ECI标识</td>
		    <td class="fcontent"><input class="cdnInput" id="a_eciFlag" name="eciFlag" type="text" maxLength="2"/><div id="a_eciFlagTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">受理/发卡方标识</td>
		    <td class="fcontent"><select class="cdnInput" id="a_orgType" name="orgType" ctype="RESE_FLAG"></select><div id="a_orgTypeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">来源文件</td>
		    <td class="fcontent"><input class="cdnInput" id="a_fileName" name="fileName" type="text" maxLength="400"/><div id="a_fileNameTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="a_remark" name="remark" type="text" maxLength="400"></textarea><div id="a_remarkTip"/></td>
		</tr>
	</table>
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>原交易关联信息</caption>
		<tr>
		    <td class="flabel"><font color="red">*</font>上一笔交易检索参考号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_referenceNum" name="referenceNum" type="text" maxLength="12"/><div id="a_referenceNumTip"/></td>
		</tr>
		<tr>
		    <td class="flabel"><font color="red">*</font>商户号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_mid" name="mid" type="text" readonly="readonly" maxLength="15"/><div id="a_midTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>主帐号</td>
			<td class="fcontent"><input class="cdnInput" id="a_pan" name="pan" type="text"  readonly="readonly" maxLength="19"/><div id="a_panTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易日期时间</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transTime" name="transTime" type="text" readonly="readonly" /><div id="a_transTimeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易系统追踪号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_systemTraceId" name="systemTraceId" type="text" readonly="readonly" /><div id="a_systemTraceIdTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易清算日期</td>
		    <td class="fcontent"><input class="cdnInput" id="a_pospStmt" name="pospStmt" type="text" readonly="readonly" /><div id="a_pospStmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">上一笔交易金额</td>
		    <td class="fcontent"><input class="cdnInput" id="a_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /><div id="a_transAmtTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">商户类型</td>
		    <td class="fcontent"><input class="cdnInput" id="a_mcc" name="mcc" type="text" readonly="readonly" readonly="readonly" maxLength="4"/><div id="a_mccTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">终端标识号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_tid" name="tid" type="text" readonly="readonly" readonly="readonly"/><div id="a_tidTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">授权标识应答码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_authRespCode" name="authRespCode" type="text" maxLength="6"/><div id="a_authRespCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">接收机构标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_receiveOrgCode" name="receiveOrgCode" type="text" maxLength="11"/><div id="a_receiveOrgCodeTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">发卡银行标识码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_cardBankNo" name="cardBankNo" type="text" maxLength="11"/><div id="a_cardBankNoTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">卡序列号</td>
		    <td class="fcontent"><input class="cdnInput" id="a_cardSeqNum" name="cardSeqNum" type="text" maxLength="3"/><div id="a_cardSeqNumTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">终端读取能力</td>
		    <td class="fcontent"><input class="cdnInput" id="a_tidReadAblity" name="tidReadAblity" type="text" maxLength="1"/><div id="a_tidReadAblityTip"/></td>
		</tr>
		<tr>
		    <td class="flabel">IC卡条件代码</td>
		    <td class="fcontent"><input class="cdnInput" id="a_icCondCode" name="icCondCode" type="text" maxLength="1"/><div id="a_icCondCodeTip"/></td>
		</tr>
	</table>
	</form>
</div>

<!-- 手工退货 -->
<div id="returnDiv" style="display: none;">
	<form id="returnForm" action="#">
	<input type="hidden" name="version" />
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<caption>差错信息</caption>
	<tr>
	    <td class="flabel">序号</td>
	    <td class="fcontent"><input class="cdnInput" id="re_errSeq" name="errSeq" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
		<td class="flabel">差错金额</td>
		<td class="fcontent"><input class="cdnInput" id="re_errAmt" name="errAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
		<td class="flabel">退货金额</td>
		<td class="fcontent"><input class="cdnInput" id="re_backAmt" name="backAmt" xtype="money" type="text" /></td>
	</tr>
	<tr>
	    <td class="flabel">差错交易类型</td>
	    <td class="fcontent"><input class="cdnInput" id="re_errTypeDesc" name="errTypeDesc" type="text" readonly="readonly"/></td>
	</tr>
	<tr>
	    <td class="flabel">系统跟踪号</td>
	    <td class="fcontent"><input class="cdnInput" id="re_errSystemTraceNo" name="errSystemTraceNo" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">交易传输时间</td>
	    <td class="fcontent"><input class="cdnInput" id="re_txnTransTime" name="txnTransTime" type="text" xtype="datetime" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">交易返回码</td>
	    <td class="fcontent"><input class="cdnInput" id="re_respCode" name="respCode" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">差错原因</td>
	    <td class="fcontent"><input class="cdnInput" id="re_errReason" name="errReason" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">处理状态</td>
	    <td class="fcontent"><input class="cdnInput" id="re_statusDesc" name="statusDesc" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">付款单号</td>
	    <td class="fcontent"><input class="cdnInput" id="re_payReqSeq" name="payReqSeq" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">备注</td>
	    <td class="fcontent"><textarea class="cdnInput" id="re_remark" name="remark" type="text"></textarea></td>
	</tr>
	</table>
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<caption>原交易关联信息</caption>
	<tr>
	    <td class="flabel">商户号</td>
	    <td class="fcontent"><input class="cdnInput" id="re_mid" name="mid" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
		<td class="flabel">主帐号</td>
		<td class="fcontent"><input class="cdnInput" id="re_pan" name="pan" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">商户类型</td>
	    <td class="fcontent"><input class="cdnInput" id="re_mcc" name="mcc" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易检索参考号</td>
	    <td class="fcontent"><input class="cdnInput" id="re_referenceNum" name="referenceNum" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易系统追踪号</td>
	    <td class="fcontent"><input class="cdnInput" id="re_systemTraceId" name="systemTraceId" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易日期时间</td>
	    <td class="fcontent"><input class="cdnInput" id="re_transTime" name="transTime" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易清算日期</td>
	    <td class="fcontent"><input class="cdnInput" id="re_pospStmt" name="pospStmt" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">上一笔交易金额</td>
	    <td class="fcontent"><input class="cdnInput" id="re_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /></td>
	</tr>
	</table>
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<caption>记录信息</caption>
	<tr>
	    <td class="flabel">记录创建时间</td>
	    <td class="fcontent"><input class="cdnInput" id="re_recTime" name="recTime" xtype="datetime" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">记录创建人</td>
	    <td class="fcontent"><input class="cdnInput" id="re_recAcc" name="recAcc" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">最后更新时间</td>
	    <td class="fcontent"><input class="cdnInput" id="re_lastUptTime" name="recTime" xtype="datetime" type="text" readonly="readonly" /></td>
	</tr>
	<tr>
	    <td class="flabel">最后更新人</td>
	    <td class="fcontent"><input class="cdnInput" id="re_lastUptAcc" name="lastUptAcc" type="text" readonly="readonly" /></td>
	</tr>
	</table>
	</form>
</div>

<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<jsp:include page="/page/console/business/include/dialog_postrans.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	list:'transErrPage.action',
	excel:'transErrPageExcel.action',
	del:'doMarkDeleteErr.action',
	mchnt:'doMarkMchntProErr.action',
	wchnl:'doMarkWaitChnlProErr.action',
	chnl:'doMarkChnlProErr.action',
	ori:'selectErrOriTrans.action',
	addRemark:'doAddRemarkErr.action',
	add:'doInsertTransErr.action',
	manual:'doManualReturnErr.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_errType").formValidator({validatorgroup:"1", onshow: "请输入开始日期"})
		.inputValidator({min:1,onerrormin:"差错类型必须填写"}); 
	$("#a_errAmt").formValidator({validatorgroup:"1", onshow: "请输入实付金额"})
		.inputValidator({min:0,onerrormin:"差错金额必须填写", max:999999999999, onerrormax:'差错金额取值在0~999999999999',type:'value'}) /* 数字检查 */ 
	$("#a_referenceNum").formValidator({validatorgroup:"1", onshow: "请选择上一笔交易"})
		.inputValidator({min:6,onerrormin:"上一笔交易检索参考号必须填写", max:6, onerrormax:'上一笔交易检索参考号6位'}); 
	$("#a_mid").formValidator({validatorgroup:"1", onshow: "请填写商户号"})
		.inputValidator({min:1,onerrormin:"商户号必须填写", max:15, onerrormax:'商户号15位'}); 
	$("#a_pan").formValidator({validatorgroup:"1", onshow: "请填写主账号"})
		.inputValidator({min:1,onerrormin:"主账号必须填写", max:19, onerrormax:'主账号19位'}); 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"returnForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#re_backAmt").formValidator({validatorgroup:"2", onshow: "请输入实付金额"})
	.inputValidator({min:1,onerrormin:"退货必须填写", max:999999999999, onerrormax:'差错金额取值在1~999999999999',type:'value'}) /* 数字检查 */ 
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '详细信息', buttons:{
		'关闭' : function() { $(this).dialog('close'); }
	}});
	
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
		, title: '新增差错明细', buttons:{
			'新增' : function() { 
				if($.formValidator.pageIsValid('1')) {
					$.ajaxForm({formId : 'addForm', url : urls.add,
						success : function(data) {
							if (data.success) {
								$('#addDiv').dialog('close');
								$('#table').flexAddData(data.root[0]);
								alert('操作成功');
							} else {
								alert(data.syserr);
							}
						}
					});
				} else { return false; }},
			'关闭' : function() { $(this).dialog('close'); }
		}});
	
	$('#remarkDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
		, title: '填写备注信息', buttons:{
			'更新' : function() { 
				$.ajaxForm({formId : 'remarkForm', url : urls.addRemark,
					success : function(data) {
						if (data.success) {
							$('#remarkDiv').dialog('close');
							$('#table').flexModifyData(data.root[0]);
							alert('操作成功');
						} else {
							alert(data.syserr);
						}
					}
				});
			},
			'关闭' : function() { $(this).dialog('close'); }
		}});
	
	
	$('#returnDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
		, title: '手工退货信息', buttons:{
			'发起退货' : function() { 
				if(!confirm('确认要发起手工退货?')){
					return false;
				}
				if($.formValidator.pageIsValid('2')) {
					$.ajaxForm({formId : 'returnForm', url : urls.manual,
						success : function(data) {
							if (data.success) {
								$('#returnDiv').dialog('close');
								$('#table').flexModifyData(data.root[0]);
								alert('操作成功');
							} else {
								alert(data.syserr);
								return false;
							}
						}
					});
				} else { return false; }},
			'关闭' : function() { $(this).dialog('close'); }
		}});
	
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#ori_seqNo').val(record.errSeq);
		$('#ori_queryBtn').click();
		$('#viewDiv').dialog('open');
	};
	
	var add = function(record,id) {
		$.jyform.resetForm('addForm');
		$('#addDiv').dialog('open');
	};
	
	var remark = function(record,id) {
		var list = $('#table').flexAllSelectData();
		if (!list || list.length == 0) {alert("请选择一条记录"); return;}
		if (list.length > 1) {
			alert("修改备注仅支持单条操作"); return;
		}
		record = list[0];
		$.jyform.resetForm('remarkForm');
		$.jyform.fillForm('remarkForm', record);
		$('#remarkDiv').dialog('open');
	};
	
	//无需处理
	var del = function(record,id){
		var record = $('#table').flexAllSelectData();
		if(!record){ alert('请选择一条记录'); return false; }
		if(confirm('确认要标记为无需处理?')){
			$.ajax({url : urls.del,dataType : 'json',type : 'POST',
				data : {jsonArray:$.toJSON(record)},
				success : function(data) {
					if (data.success) { 
						alert(data.syserr);
						$('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
		}
	};
	
	//商户分润已处理
	var mchnt = function(record,id) {
		var record = $('#table').flexAllSelectData();
		if(!record){ alert('请选择一条记录'); return false; }
		if(confirm('确认要标记为商户清算已处理?')) {
			$.ajax({url : urls.mchnt,dataType : 'json',type : 'POST',
				data : {jsonArray:$.toJSON(record)},
				success : function(data) {
					if (data.success) { 
						alert(data.syserr);
						$('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
		}
	};
	//待服务商分润处理
	var wchnl = function(record,id) {
		var record = $('#table').flexAllSelectData();
		if(!record){ alert('请选择一条记录'); return false; }
		if(confirm('确认要标记为待服务商分润处理?')){
			$.ajax({url : urls.wchnl,dataType : 'json',type : 'POST',
				data : {jsonArray:$.toJSON(record)},
				success : function(data) {
					if (data.success) { 
						alert(data.syserr);
						$('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
		}
	};
	
	//服务商分润已处理
	var chnl = function(record,id){
		var record = $('#table').flexAllSelectData();
		if(!record){ alert('请选择一条记录'); return false; }
		if(confirm('确认要标记为服务商分润已处理?')) {
			$.ajax({url : urls.chnl,dataType : 'json',type : 'POST',
				data : {jsonArray:$.toJSON(record)},
				success : function(data) {
					if (data.success) { 
						alert(data.syserr);
						$('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
		}
	};
	
	//手工退货
	var manual = function(record,id){
		var list = $('#table').flexAllSelectData();
		if (!list || list.length == 0) {alert("请选择一条记录"); return;}
		if (list.length > 1) {
			alert("手工退货仅支持单条操作"); return;
		}
		record = list[0];
		$.jyform.resetForm('returnForm');
		$.jyform.fillForm('returnForm', record);
		$('#returnDiv').dialog('open');
	};
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'errSeq', dir : "desc", checkbox : true, usepager : true, dbClickRecord: view,
		buttons : [
		   //{name: "新增", show:'', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		   {name: "无需处理", show:'', bclass: 'grid_add', id: 'txt', onpress : del },{separator : true }
		  ,{name: "商户清算已处理", show:'', bclass: 'grid_add', id: 'txt', onpress : mchnt },{separator : true }
		  ,{name: "待服务商分润处理", show:'', bclass: 'grid_add', id: 'txt', onpress : wchnl },{separator : true }
		  ,{name: "发起手工退货", show:'', bclass: 'grid_add', id: 'txt', onpress : manual },{separator : true }
		  //,{name: "服务商分润处理", show:'', bclass: 'grid_add', id: 'txt', onpress : chnl },{separator : true }
		  ,{name: "填写备注", show:'', bclass: 'grid_add', id: 'txt', onpress : remark },{separator : true }
		  ,{name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#table').flexFile(urls.excel); } }
		],
		colModel : [ 
       	  	 { display : '序号', dataIndex : 'errSeq', width : 80, align : 'center', sortable:true }
			,{ display : '差错类型', dataIndex : 'errTypeDesc', width : 180, align : 'center', sortable:true }
			,{ display : '原交易匹配标识', dataIndex : 'mateFlagDesc', width : 80, align : 'center', sortable:true }
			,{ display : '退货标识', dataIndex : 'returnFlagDesc', width : 80, align : 'center', sortable:true }
			,{ display : '处理状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			//,{ display : '代理机构标识码', dataIndex : 'agentOrgCode', width : 80, align : 'center', sortable:true }
			//,{ display : '发送机构标识码', dataIndex : 'sendOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 80, align : 'center', sortable:true }
			,{ display : '服务商号', dataIndex : 'channelCode', width : 180, align : 'center', sortable:true }
			,{ display : '系统跟踪号', dataIndex : 'errSystemTraceNo', width : 80, align : 'center', sortable:true }
			,{ display : '交易传输时间', dataIndex : 'txnTransTime', width : 80, align : 'center', sortable:true ,render: fmtTime10 }
			,{ display : '主帐号', dataIndex : 'pan', width : 80, align : 'center', sortable:true }
			,{ display : '差错金额', dataIndex : 'errAmt', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '应收手续费', dataIndex : 'orgReceiveFeeAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '应付手续费', dataIndex : 'orgPayFeeAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '分期付款附加手续费', dataIndex : 'addintionFeeAmt', width : 80, align : 'center', sortable:true,render: fmtMoney }
			,{ display : '持卡人交易手续费', dataIndex : 'cardPersonFeeAmt', width : 80, align : 'center', sortable:true,render: fmtMoney }
			,{ display : '应收费用', dataIndex : 'receiveAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '应付费用', dataIndex : 'payAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '差错原因', dataIndex : 'errReason', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易日期时间', dataIndex : 'transTime', width : 80, align : 'center', sortable:true,render: fmtTime10 }
			,{ display : '上一笔交易清算日期', dataIndex : 'pospStmt', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易金额', dataIndex : 'transAmt', width : 80, align : 'center', sortable:true,render: fmtMoney }
			,{ display : '上一笔交易检索参考号', dataIndex : 'referenceNum', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易系统追踪号', dataIndex : 'systemTraceId', width : 80, align : 'center', sortable:true }
			,{ display : '交易返回码', dataIndex : 'respCode', width : 80, align : 'center', sortable:true }
			//,{ display : '报文类型', dataIndex : 'packetType', width : 80, align : 'center', sortable:true }
			//,{ display : '交易处理码(3域)', dataIndex : 'procCode', width : 80, align : 'center', sortable:true }
			//,{ display : '商户类型', dataIndex : 'mcc', width : 80, align : 'center', sortable:true }
			//,{ display : '终端标识号', dataIndex : 'tid', width : 80, align : 'center', sortable:true }
			//,{ display : '服务点条件码', dataIndex : 'pointCondCode', width : 80, align : 'center', sortable:true }
			//,{ display : '授权标识应答码', dataIndex : 'authRespCode', width : 80, align : 'center', sortable:true }
			//,{ display : '接收机构标识码', dataIndex : 'receiveOrgCode', width : 80, align : 'center', sortable:true }
			//,{ display : '发卡银行标识码', dataIndex : 'cardBankNo', width : 80, align : 'center', sortable:true }
			//,{ display : '服务点输入方式', dataIndex : 'pointEntryCode', width : 80, align : 'center', sortable:true }
			//,{ display : '接收/转出机构标志码', dataIndex : 'transferOutOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '转出卡号', dataIndex : 'transferOutCard', width : 80, align : 'center', sortable:true }
			,{ display : '转入机构标识码', dataIndex : 'transferInOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '转入卡号', dataIndex : 'transferInCard', width : 80, align : 'center', sortable:true }
			//,{ display : '卡序列号', dataIndex : 'cardSeqNum', width : 80, align : 'center', sortable:true }
			//,{ display : '终端读取能力', dataIndex : 'tidReadAblity', width : 80, align : 'center', sortable:true }
			//,{ display : 'IC卡条件代码', dataIndex : 'icCondCode', width : 80, align : 'center', sortable:true }
			//,{ display : 'ECI标识', dataIndex : 'eciFlag', width : 80, align : 'center', sortable:true }
			,{ display : '受理/发卡方标识', dataIndex : 'orgTypeDesc', width : 80, align : 'center', sortable:true }
			,{ display : '来源文件', dataIndex : 'fileName', width : 80, align : 'center', sortable:true }
			,{ display : '付款单号', dataIndex : 'payReqSeq', width : 80, align : 'center', sortable:true }
			,{ display : '记录创建时间', dataIndex : 'recTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '记录创建人', dataIndex : 'recAcc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUptTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新人', dataIndex : 'lastUptAcc', width : 80, align : 'center', sortable:true }
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
			,{ display: '退货类型', dataIndex: 'backTypeDesc', align: 'center' }
			]
		});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();	
	$('#viewDiv').fullScreen();
	$('#remarkDiv').fullScreen();
	$('#addDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	$('.bt').button();
	$('#ori_queryBtn').click(function(){$.queryTable({formId : 'ori_queryForm', tableId : 'ori_table'});});
	midDialogBind('q_mid', function(data) { $('#q_mid').val(data.mid); });
	midDialogBind('a_mid', function(data) { $('#a_mid').val(data.mid); });
	postransDialogBind('a_referenceNum', function(data) { 
			$('#a_mid').val(data.mid);
			$('#a_pan').val(data.pan);
			$('#a_referenceNum').val(data.transSeq);
			$('#a_transTime').val(data.stlmDate+data.tidTransTime);
			$('#a_systemTraceId').val(data.transSeq);
			$('#a_pospStmt').val(data.stlmDate);
			$('#a_transAmt').val(data.transAmt/100.00);
			$('#a_mcc').val(data.mcc);
			$('#a_tid').val(data.tid);
			$('#a_authRespCode').val(data.authRespCode);
			$('#a_a_receiveOrgCode').val('');
			$('#a_cardBankNo').val('');
			$('#a_cardSeqNum').val(data.cardSeqNum);
			$('#a_tidReadAblity').val(data.tidReadAblity);
			$('#a_icCondCode').val(data.icCondCode); 
		});
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	$.jyform.dateTimeBox({select:$('#a_txnTransTime'), enabled: true,dateFormat: 'mmdd',altFormat:'mm-dd'});
	channelCodeDialogBind('q_channelCode', function(data) { $('#q_channelCode').val(data.channelCode); });
});
//-->
</script>
</body>