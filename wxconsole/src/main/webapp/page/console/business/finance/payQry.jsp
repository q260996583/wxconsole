<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>付款申请查询</title>
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
			<li><label>申请表编号</label><input  id="q_payBillNo" name="payBillNo" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>开始日期</label><input  id="q_bgnSday" name="bgnSday" type="text" xtype="date" qtype="string" comparison="ge" /></li>
			<li><label>结束日期</label><input  id="q_endSday" name="endSday" type="text" xtype="date" qtype="string" comparison="le" /></li>
			<li><label>付款账户</label><select  id="q_bankAccntId" name="bankAccntId" qtype="string" comparison="eq" ></select></li>
			<li><label>申请类型</label><select id="q_payReqType" name="payReqType" ctype="PAY_REQ_TYPE" multiple="multiple" comparison="eq" ></select></li>
			<li><label>状态</label><select id="q_status" name="status" ctype="PAY_REQ_STATUS" multiple="multiple" comparison="eq" ></select></li>
			<li><label>备注</label><input id="q_remark" name="remark" type="text" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
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
    	<li id="mchntdtltab"><a href="#viewtabs-2">商户汇总</a></li>
    	<li id="transdtltab"><a href="#viewtabs-3">交易明细</a></li>
    	<li id="settledtltab"><a href="#viewtabs-4">出账明细</a></li>
    	<li id="errdtltab"><a href="#viewtabs-5">差错明细</a></li>
  	</ul>
  	<div id="viewtabs-1">
  		<form id="viewForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
		    <td class="flabel">序号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_seqNo" name="seqNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">申请表编号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_payBillNo" name="payBillNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">开始日期</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bgnSday" name="bgnSday" type="text" xtype="date" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">结束日期</td>
		    <td class="fcontent"><input class="cdnInput" id="v_endSday" name="endSday" type="text" xtype="date" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">支付机构号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankId" name="bankId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">申请类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_payReqType" name="payReqTypeDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">商户开户行</td>
			<td class="fcontent"><input class="cdnInput" id="v_accntBankStringListDesc" name="accntBankStringListDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">强扣金额</td>
			<td class="fcontent"><input class="cdnInput" id="v_minusAmt" name="minusAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_realAmt" name="realAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">实付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankRealAmt" name="bankRealAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">状态</td>
		    <td class="fcontent"><input class="cdnInput" id="v_status" name="statusDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_remark" name="remark" type="text" readonly="readonly"></textarea></td>
		</tr>
		</table>
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>付款账户</caption>
		<tr>
		    <td class="flabel">付款账户编号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankAccntId" name="bankAccntId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">行号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankNo" name="bankNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_accntNo" name="accntNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">支行名</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankName" name="bankName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">总行名</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankTitle" name="bankTitle" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账户名称</td>
		    <td class="fcontent"><input class="cdnInput" id="v_accntName" name="accntName" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		
		<table id="viewChannelTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>服务商配置</caption>
		<tr>
		    <td class="flabel">服务商编号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_channelCode" name="channelCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商行号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlBankNo" name="chnlBankNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">服务商账号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlAccntNo" name="chnlAccntNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商银行名称</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlBankName" name="chnlBankName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商账户名</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlAccntName" name="chnlAccntName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商持卡人证件号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlPersonCardNo" name="chnlPersonCardNo" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>审核信息</caption>
		<tr>
			<td class="flabel">审核时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_audTime" name="audTime" type="text" xtype="time" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">审核人</td>
			<td class="fcontent"><input class="cdnInput" id="v_audUser" name="audUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">审核意见</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_audRemark" name="audRemark" readonly="readonly" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">确认时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_secAudTime" name="secAudTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">确认用户</td>
			<td class="fcontent"><input class="cdnInput" id="v_secAudUser" name="secAudUser" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">确认意见</td>
			<td class="fcontent"><textarea class="cdnInput" id="v_secAudRemark" name="secAudRemark" readonly="readonly"></textarea></td>
		</tr>
		</table>
		
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>更新信息</caption>
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" id="v_lastUpdOrg" name="lastUpdOrg" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">最后更新用户</td>
			<td class="fcontent"><input class="cdnInput" id="v_lastUpdUser" name="lastUpdUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_lastUpdTime" name="lastUpdTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">创建用户</td>
			<td class="fcontent"><input class="cdnInput" id="v_createUser" name="createUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">创建时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_createTime" name="createTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		</table>
		</form>
  	</div>
  	<div id="viewtabs-2">
  		<!-- 查询条件 -->
		<div id="mchntdtl_queryCondition">
			<form id="mchntdtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="mchntdtl_q_seqNo" class="param" />
				<ul class="qry-ul">
					<li><label>商户号</label><input id="mchntdtl_q_mid" name="mid" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="mchntdtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="mchntdtl_table"></div>
  	</div>
  	<div id="viewtabs-3">
  		<!-- 查询条件 -->
		<div id="transdtl_queryCondition">
			<form id="transdtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="mhtApplySt" value="03,04,05,02,09,10,11" ftype="list" qtype="string" comparison="eq" />
				<input type="hidden" name="seqNo" id="transdtl_q_seqNo" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input  id="transdtl_q_stlmDate" name="stlmDate" type="text" xtype="date" qtype="string" comparison="eq" /></li>
					<li><label>交易流水号</label><input  id="transdtl_q_transSeq" name="transSeq" type="text" maxlength="12" qtype="string" comparison="like" /></li>
			
					<li><input class='bt' id="transdtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="transdtl_table"></div>
  	</div>
  	<div id="viewtabs-4">
  		<!-- 查询条件 -->
		<div id="settledtl_queryCondition">
			<form id="settledtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="settledtl_q_seqNo" class="param" />
				<ul class="qry-ul">
					<li><label>商户号</label><input id="settledtl_q_mid" name="mid" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="settledtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="settledtl_table"></div>
  	</div>
  	<div id="viewtabs-5">
  		<!-- 查询条件 -->
		<div id="errdtl_queryCondition">
			<form id="errdtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name=payReqSeq id="errdtl_q_seqNo" type="text" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>商户号</label><input id="errdtl_q_mid" name="mid" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="errdtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="errdtl_table"></div>
  	</div>
</div>
</div>

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
	accntdtl:'payReqAccntQryDetail.action',
	accntdtlExcel:'payReqAccntQryDetailExcel.action',
	transdtl:'payReqTransQryDetail.action',
	transdtlExcel:'payReqTransQryDetailExcel.action',
	list:'payReqQryPage.action',
	excel:'payReqQryPageExcel.action',
	listAccBank:'listAccBank.action',
	loglist:'payApplyQryBalanceLogPage.action',
	loglistExcel:'payApplyQryBalanceLogPageExcel.action',
	logrel:'payApplyQryBalanceLogRelPage.action',
	logrelExcel:'payApplyQryBalanceLogRelPageExcel.action',
	settlerel:'payApplyQrySettlePage.action',
	settlerelExcel:'payApplyQrySettlePageExcel.action',
	settleAdjust:'payApplyQryFindSettleAdjustDtl.action',
	settleAdjustExcel:'payApplyQryFindSettleAdjustDtlExcel.action',
	listErr:'payReqPayErrRelPage.action',
	listErrExcel:'payReqPayErrRelPageExcel.action',
	exportNetPay:'payApplyExportNetPay.action'
};

var bankAccntBox = function(options) {
	var opt = $.extend({
		valueField:'bankAccntId',
		displayField:'bankName',
		render:function(res){return res.bankName;},
		failedMsg:'获取支付账户失败!'
	},options);
	if ( !opt.url ) {
		opt.url = 'findBankAccntCombo.action';
	}
	jQuery.jyform.ajaxSelectBox(opt);
};

$(function() {
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '付款申请单详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});	
	
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
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#mchntdtltab').hide(); $('#transdtltab').hide();$('#settledtltab').hide();$('#errdtltab').hide();
		if (record.payReqType == '01') { 
			$('#mchntdtltab').show();
			$.ajax({url:urls.listAccBank ,data:{payReqNo:record.seqNo}, type:'POST', dataType:'json',
				success:function(data){
					if (data.success) {
						if (isArray(data.root)) {
							$.each(data.root,function(i,n){
								if (i==0) {
									accntBankStringList = data.root[i].accntBankNo;
									accntBankStringListDesc = data.root[i].accntBankNoDesc;
								} else {
									accntBankStringList += "," + data.root[i].accntBankNo; 
									accntBankStringListDesc += "," + data.root[i].accntBankNoDesc; 
								}
							});
						} else {
							accntBankStringList = data.root.accntBankNo;
							accntBankStringListDesc = data.root.accntBankNoDesc;
						}
						//record.accntBankStringList = accntBankStringList;
						//record.accntBankStringListDesc = accntBankStringListDesc;
						$('#v_accntBankStringListDesc').val(accntBankStringListDesc);
					}	
				}});
			$('#mchntdtl_q_seqNo').val(record.seqNo);
			$('#mchntdtl_queryBtn').click();
		}
		if (record.payReqType == '02') { 
			$('#settledtltab').show();
			$('#settledtl_q_seqNo').val(record.seqNo);
			$('#settledtl_queryBtn').click();
			$('#errdtltab').show();
			$('#errdtl_q_seqNo').val(record.seqNo);
			$('#errdtl_queryBtn').click();
		}
		$('#viewDiv').dialog('open');
		$('#baseinfotab > a').click();
	};
	
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
		url : urls.list, height: 330, sort : 'seqNo,payBillNo', dir : "desc,desc", checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		   {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 { display: '序号', dataIndex: 'seqNo', width: 80, align: 'center', sortable: true }
		,{ display: '申请表编号', dataIndex: 'payBillNo', width: 120, align: 'center', sortable: true }
		,{ display: '申请类型', dataIndex: 'payReqTypeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '开始日期', dataIndex: 'bgnSday', width: 100, align: 'center', sortable: true, render: fmtDate  }
		,{ display: '结束日期', dataIndex: 'endSday', width: 100, align: 'center', sortable: true, render: fmtDate  }
		,{ display: '付款账户', dataIndex: 'bankAccntIdDesc', width: 80, align: 'center', sortable: true }
		,{ display: '服务商', dataIndex: 'channelCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '审核人', dataIndex: 'audUser', width: 100, align: 'center', sortable: true }
		,{ display: '审核意见', dataIndex: 'audRemark', width: 100, align: 'center', sortable: true }
		,{ display: '应付金额', dataIndex: 'realAmt', width: 90, align: 'right', sortable: true, render: fmtMoney }
		,{ display: '实付金额', dataIndex: 'bankRealAmt', width: 90, align: 'right', sortable: true, render: fmtMoney }
		,{ display: '状态', dataIndex: 'statusDesc', width: 80, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'remark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#mchntdtl_table').flexigrid({
		url : urls.accntdtl, height: 330, sort : 'dtlNo', dir : "desc", checkbox : false, usepager : true, dbClickRecord:viewMchnt,
		buttons : [
		  	 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#mchntdtl_table').flexFile(urls.accntdtlExcel,{seqNo:$('#mchntdtl_q_seqNo').val()}); } }
		 	,{name: "导出网银文件", bclass: 'grid_edit',  id : 'cel',  onpress : function() { $('#mchntdtl_table').flexFile(urls.exportNetPay,{reqSeqNo:$('#v_seqNo').val()}); } },{separator : true }
		 	,{name: "导出中信网银文件", bclass: 'grid_edit',  id : 'cel',  onpress : function() { $('#mchntdtl_table').flexFile(urls.exportNetPay + "?bankId=zx"); } },{separator : true }
		 ],
		colModel : [ 
       	 { display: '序号', dataIndex: 'dtlNo', width: 80, align: 'center', sortable: true }
       	,{ display: '起始日期', dataIndex: 'bgnSday', width: 80, align: 'center', sortable: true, render:fmtDate }
       	,{ display: '结束日期', dataIndex: 'endSday', width: 80, align: 'center', sortable: true, render:fmtDate }
   		,{ display: '服务商编号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
   		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
   		,{ display: '商户名称', dataIndex: 'merName', width: 80, align: 'center', sortable: true }
   		,{ display: '交易笔数', dataIndex: 'stlmCount', width: 80, align: 'center', sortable: true}
   		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
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
	
	$('#errdtl_table').flexigrid({
		url : urls.listErr, height: 330, sort : 'errSeq', dir : "desc", checkbox : false, usepager : true,
		buttons : [
		  {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#errdtl_table').flexFile(urls.listErrExcel); } }
		],
		colModel : [ 
       	  	 { display : '差错序号', dataIndex : 'errSeq', width : 80, align : 'center', sortable:true }
			,{ display : '差错类型', dataIndex : 'errTypeDesc', width : 180, align : 'center', sortable:true }
			,{ display : '原交易匹配标识', dataIndex : 'mateFlagDesc', width : 80, align : 'center', sortable:true }
			,{ display : '处理状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			//,{ display : '代理机构标识码', dataIndex : 'agentOrgCode', width : 80, align : 'center', sortable:true }
			//,{ display : '发送机构标识码', dataIndex : 'sendOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 80, align : 'center', sortable:true }
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
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	bankAccntBox({selectId:'q_bankAccntId',emptyOpt:true});
	bankAccntBox({selectId:'a_bankAccntId',emptyOpt:true});
	$.jyform.components();	
	channelCodeDialogBind('a_channelCode', function(data) { $('#a_channelCode').val(data.channelCode);$('#a_channelName').val(data.channelName); });
	// 
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('#viewSettleDtlDiv').fullScreen();
	
	$('#viewTransRelDiv').fullScreen();
	
	$('#viewMchntDiv').fullScreen();
	$('#viewBalanceAjDtlDiv').fullScreen();
	
	$('#viewMchnttabs').tabs(); $('#viewMchnttabs').fixTabInDialog('viewMchntDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		//wxb
		var startTime=$("#q_bgnSday").val(); 
		var endTime=$("#q_endSday").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能晚于结束日期！");
				return false;
			}
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	$('#settle_queryBtn').click(function(){$.queryTable({formId : 'settle_queryForm', tableId : 'settle_table'});});
	$('#risk_queryBtn').click(function(){$.queryTable({formId : 'risk_queryForm', tableId : 'risk_table'});});
	$('#stlm_queryBtn').click(function(){$.queryTable({formId : 'stlm_queryForm', tableId : 'stlm_table'});});
	$('#balance_queryBtn').click(function(){$.queryTable({formId : 'balance_queryForm', tableId : 'balance_table'});});
	$('#balanceAj_queryBtn').click(function(){$.queryTable({formId : 'balanceAj_queryForm', tableId : 'balanceAj_table'});});
	
	$('#settlerel_queryBtn').click(function(){$.queryTable({formId : 'settlerel_queryForm', tableId : 'settlerel_table'});});
	$('#transrel_queryBtn').click(function(){$.queryTable({formId : 'transrel_queryForm', tableId : 'transrel_table'});});
	$('#errdtl_queryBtn').click(function(){$.queryTable({formId : 'errdtl_queryForm', tableId : 'errdtl_table'});});
	
	$('#mchntdtl_queryBtn').click(function(){$.queryTable({formId : 'mchntdtl_queryForm', tableId : 'mchntdtl_table'});});
	$('#transdtl_queryBtn').click(function(){$.queryTable({formId : 'transdtl_queryForm', tableId : 'transdtl_table'});});
	$('#settledtl_queryBtn').click(function(){$.queryTable({formId : 'settledtl_queryForm', tableId : 'settledtl_table'});});
	
});
//-->
</script>
</body>