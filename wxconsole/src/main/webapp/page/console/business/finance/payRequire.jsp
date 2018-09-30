<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>付款申请管理</title>
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
		<!-- <input type="hidden" name="status" value="08,02,01" comparison="eq" ftype="list" /> -->
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
<!-- 新增 -->
<div id="addDiv" style="display: none;">
<form id="addForm" action="#">
<input type="hidden" class="cdnInput" id="a_accntBankStringList" name="accntBankStringList" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel">申请表编号</td>
	<td class="fcontent"><input class="cdnInput" id="a_payBillNo" name="payBillNo" maxLength="60" type="text" /><div id="a_payBillNoTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>开始日期</td>
	<td class="fcontent"><input class="cdnInput" id="a_bgnSday" name="bgnSday" type="text" xtype="date" /><div id="a_bgnSdayTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>结束日期</td>
	<td class="fcontent"><input class="cdnInput" id="a_endSday" name="endSday" type="text" xtype="date" /><div id="a_endSdayTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>申请类型</td>
	<td class="fcontent"><select class="cdnInput" id="a_payReqType" name="payReqType" ctype="PAY_REQ_TYPE" ></select><div id="a_payReqTypeTip"/></td>
</tr>
<tr>
	<td class="flabel">备注</td>
	<td class="fcontent"><textarea class="cdnInput" id="a_remark" name="remark" ></textarea></td>
</tr>
</table>
<table id="addMchntTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>商户付款申请</caption>
<tr>
	<td class="flabel"><font color="red">*</font>付款账户</td>
	<td class="fcontent"><select class="cdnInput" id="a_bankAccntId" name="bankAccntId" ></select><div id="a_bankAccntIdTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>支付机构</td>
	<td class="fcontent"><input class="cdnInput" id="a_bankId" name="bankId" maxLength="15" type="text" value="1230000001" readonly="readonly" /><div id="a_bankIdTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>商户开户行</td>
	<td class="fcontent"><input class="cdnInput" id="a_accntBankStringListDesc" name="accntBankStringListDesc"  type="text" /><div id="a_accntBankStringListTip"/></td>
</tr>
</table>
<table id="addChannelTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>服务商付款申请</caption>
<tr>
	<td class="flabel"><font color="red">*</font>服务商编号</td>
	<td class="fcontent"><input class="cdnInput" id="a_channelCode" name="channelCode" maxLength="15" type="text" /><div id="a_channelCodeTip"/></td>
</tr>
<tr>
	<td class="flabel">服务商名称</td>
	<td class="fcontent"><input class="cdnInput" id="a_channelName" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>强扣金额(元)</td>
	<td class="fcontent"><input class="cdnInput" id="a_minusAmt" xtype="money" name="minusAmt" type="text"  maxLength="20"/></td>
</tr>
<tr>
	<td class="flabel">其他金额(元)</td>
	<td class="fcontent"><input class="cdnInput" id="a_otherAmt" xtype="money" name="otherAmt" type="text"  maxLength="20"/></td>
</tr>
</table>

</form>
</div>
<!-- 提交 -->
<div id="updDiv" style="display: none;">
<form id="updForm" action="#">
<input name="version" type="hidden" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel">序号</td>
	<td class="fcontent"><input class="cdnInput" id="u_seqNo" name="seqNo" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">申请表编号</td>
	<td class="fcontent"><input class="cdnInput" id="u_payBillNo" name="payBillNo" type="text" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">开始日期</td>
	<td class="fcontent"><input class="cdnInput" id="u_bgnSday" name="bgnSday" type="text" xtype="date" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">结束日期</td>
	<td class="fcontent"><input class="cdnInput" id="u_endSday" name="endSday" type="text" xtype="date" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">支付机构号</td>
	<td class="fcontent"><input class="cdnInput" id="u_bankId" name="bankId" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">申请类型</td>
	<td class="fcontent"><input class="cdnInput" id="u_payReqType" name="payReqTypeDesc" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">商户开户行</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntBankStringListDesc" name="accntBankStringListDesc" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">强扣金额</td>
	<td class="fcontent"><input class="cdnInput" id="u_minusAmt" name="minusAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">其他金额</td>
	<td class="fcontent"><input class="cdnInput" id="u_otherAmt" name="otherAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">应付金额</td>
	<td class="fcontent"><input class="cdnInput" id="u_realAmt" name="realAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">实付金额</td>
	<td class="fcontent"><input class="cdnInput" id="u_bankRealAmt" name="bankRealAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">状态</td>
	<td class="fcontent"><input class="cdnInput" id="u_status" name="statusDesc" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">审核人</td>
	<td class="fcontent"><input class="cdnInput" id="u_audUser" name="audUser" maxLength="30" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">审核意见</td>
	<td class="fcontent"><textarea class="cdnInput" id="u_audRemark" name="audRemark" readonly="readonly" ></textarea></td>
</tr>
</table>

<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>付款账户</caption>
<tr>
	<td class="flabel">付款账户编号</td>
	<td class="fcontent"><input class="cdnInput" id="u_bankAccntId" name="bankAccntId" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">行号</td>
	<td class="fcontent"><input class="cdnInput" id="u_bankNo" name="bankNo" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">账号</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntNo" name="accntNo" type="text" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">支行名</td>
	<td class="fcontent"><input class="cdnInput" id="u_bankName" name="bankName" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">总行名</td>
	<td class="fcontent"><input class="cdnInput" id="u_bankTitle" name="bankTitle" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">账户名称</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntName" name="accntName" type="text" readonly="readonly" /></td>
</tr>
</table>

<table id="updChannelTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>服务商配置</caption>
<tr>
	<td class="flabel">服务商编号</td>
	<td class="fcontent"><input class="cdnInput" id="u_channelCode" name="channelCode" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">服务商行号</td>
	<td class="fcontent"><input class="cdnInput" id="u_chnlBankNo" name="chnlBankNo" type="text" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">服务商账号</td>
	<td class="fcontent"><input class="cdnInput" id="u_chnlAccntNo" name="chnlAccntNo" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">服务商银行名称</td>
	<td class="fcontent"><input class="cdnInput" id="u_chnlBankName" name="chnlBankName" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">服务商账户名</td>
	<td class="fcontent"><input class="cdnInput" id="u_chnlAccntName" name="chnlAccntName" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">服务商持卡人证件号</td>
	<td class="fcontent"><input class="cdnInput" id="u_chnlPersonCardNo" name="chnlPersonCardNo" type="text" readonly="readonly" /></td>
</tr>
</table>
</form>
</div>

<!-- 审核 -->
<div id="audDiv" style="display: none;">
<form id="audForm" action="#">
<input name="version" type="hidden" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
    <td class="flabel">序号</td>
    <td class="fcontent"><input class="cdnInput" id="au_seqNo" name="seqNo" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">申请表编号</td>
    <td class="fcontent"><input class="cdnInput" id="au_payBillNo" name="payBillNo" type="text" readonly="readonly"/></td>
</tr>
<tr>
    <td class="flabel">开始日期</td>
    <td class="fcontent"><input class="cdnInput" id="au_bgnSday" name="bgnSday" type="text" xtype="date" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">结束日期</td>
    <td class="fcontent"><input class="cdnInput" id="au_endSday" name="endSday" type="text" xtype="date" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">支付机构号</td>
    <td class="fcontent"><input class="cdnInput" id="au_bankId" name="bankId" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">申请类型</td>
    <td class="fcontent"><input class="cdnInput" id="au_payReqType" name="payReqTypeDesc" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">商户开户行</td>
	<td class="fcontent"><input class="cdnInput" id="au_accntBankStringListDesc" name="accntBankStringListDesc" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">清算金额</td>
    <td class="fcontent"><input class="cdnInput" id="au_stlmAmt" name="stlmAmt" xtype="money" type="text" readonly="readonly"/></td>
</tr>
<tr>
    <td class="flabel">流量费</td>
    <td class="fcontent"><input class="cdnInput" id="au_flowFee" name="flowFee" xtype="money" type="text" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">强扣金额</td>
	<td class="fcontent"><input class="cdnInput" id="au_minusAmt" name="minusAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">应付金额</td>
    <td class="fcontent"><input class="cdnInput" id="au_realAmt" name="realAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">实付金额</td>
    <td class="fcontent"><input class="cdnInput" id="au_bankRealAmt" name="bankRealAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">清算笔数</td>
    <td class="fcontent"><input class="cdnInput" id="au_stlmCount" name="stlmCount" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">交易金额</td>
    <td class="fcontent"><input class="cdnInput" id="au_transAmt" name="transAmt" xtype="money" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">状态</td>
    <td class="fcontent"><input class="cdnInput" id="au_status" name="statusDesc" type="text" readonly="readonly" /></td>
</tr>
</table>
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>付款账户</caption>
<tr>
    <td class="flabel">付款账户编号</td>
    <td class="fcontent"><input class="cdnInput" id="au_bankAccntId" name="bankAccntId" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">行号</td>
    <td class="fcontent"><input class="cdnInput" id="au_bankNo" name="bankNo" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">账号</td>
    <td class="fcontent"><input class="cdnInput" id="au_accntNo" name="accntNo" type="text" readonly="readonly"/></td>
</tr>
<tr>
    <td class="flabel">支行名</td>
    <td class="fcontent"><input class="cdnInput" id="au_bankName" name="bankName" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">总行名</td>
    <td class="fcontent"><input class="cdnInput" id="au_bankTitle" name="bankTitle" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">账户名称</td>
    <td class="fcontent"><input class="cdnInput" id="au_accntName" name="accntName" type="text" readonly="readonly" /></td>
</tr>
</table>

<table id="audChannelTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>服务商配置</caption>
<tr>
    <td class="flabel">服务商编号</td>
    <td class="fcontent"><input class="cdnInput" id="au_channelCode" name="channelCode" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">服务商行号</td>
    <td class="fcontent"><input class="cdnInput" id="au_chnlBankNo" name="chnlBankNo" type="text" readonly="readonly"/></td>
</tr>
<tr>
    <td class="flabel">服务商账号</td>
    <td class="fcontent"><input class="cdnInput" id="au_chnlAccntNo" name="chnlAccntNo" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">服务商银行名称</td>
    <td class="fcontent"><input class="cdnInput" id="au_chnlBankName" name="chnlBankName" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">服务商账户名</td>
    <td class="fcontent"><input class="cdnInput" id="au_chnlAccntName" name="chnlAccntName" type="text" readonly="readonly" /></td>
</tr>
<tr>
    <td class="flabel">服务商持卡人证件号</td>
    <td class="fcontent"><input class="cdnInput" id="au_chnlPersonCardNo" name="chnlPersonCardNo" type="text" readonly="readonly" /></td>
</tr>
</table>
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<caption>审核信息</caption>
<tr>
    <td class="flabel"><font color="red">*</font>审核意见</td>
    <td class="fcontent"><textarea class="cdnInput" id="au_audRemark" name="audRemark" maxLength="200"></textarea><div id="au_audRemarkTip"></div></td>
</tr>
</table>
</form>
</div>

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
			<td class="flabel">其他金额</td>
			<td class="fcontent"><input class="cdnInput" id="v_otherAmt" name="otherAmt" xtype="money" type="text" readonly="readonly" /></td>
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

<!-- 预览界面 -->
<div id="preViewDiv" style="display: none;">
	<iframe id="printFrame" style="width:98%;height:98%;border-width:0px;"></iframe>
</div>

<!-- 添加差错关联 -->
<div id="addRelDiv" style="display: none;">
	<!-- 查询条件 -->
	<div id="ar_errrel_queryCondition">
		<form id="ar_errrel_queryForm" name="queryForm" action="#" method="post">
			<input type="hidden" name="payReqSeq" id="ar_errrel_q_seqNo" qtype="string" class="param" />
			<input type="hidden" name="channelCode" id="ar_errrel_q_channelCode" qtype="string" class="param" />
			<ul class="qry-ul">
				<!-- <li><label>清算日期</label><input id="ar_errrel_q_stlmDate" xtype="date" name="stlmDate" type="text" class="param" /></li>
				<li><label>中心流水号</label><input id="ar_errrel_q_transSeq" name="transSeq" type="text" class="param" /></li> -->
				<li><input class='bt' id="ar_errrel_queryBtn" value="查询" type="button"/></li>
				<li><input value="重置" class='bt' type="reset" /></li>
			</ul>
		</form>
	</div>
	<!-- 列表 -->
	<div id="ar_errrel_table"></div>
</div>
<!-- 关联界面 -->
<div id="updRelDiv" style="display: none;">
<div id="updReltabs" style="border: none;">
	<ul>
    	<li id="ur_baseinfotab" ><a href="#updReltabs-1">基本信息</a></li>
    	<li id="ur_errreltab"><a href="#updReltabs-2">关联差错</a></li>
  	</ul>
	<div id="updReltabs-1">
	<form id="updRelForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
		    <td class="flabel">序号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_seqNo" name="seqNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">申请表编号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_payBillNo" name="payBillNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">开始日期</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bgnSday" name="bgnSday" type="text" xtype="date" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">结束日期</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_endSday" name="endSday" type="text" xtype="date" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">支付机构号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bankId" name="bankId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">申请类型</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_payReqType" name="payReqTypeDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">商户开户行</td>
			<td class="fcontent"><input class="cdnInput" id="ur_accntBankStringListDesc" name="accntBankStringListDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">强扣金额</td>
			<td class="fcontent"><input class="cdnInput" id="ur_minusAmt" name="minusAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">其他金额</td>
			<td class="fcontent"><input class="cdnInput" id="ur_otherAmt" name="otherAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_realAmt" name="realAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">实付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bankRealAmt" name="bankRealAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">状态</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_status" name="statusDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="ur_remark" name="remark" type="text" readonly="readonly"></textarea></td>
		</tr>
		</table>
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>付款账户</caption>
		<tr>
		    <td class="flabel">付款账户编号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bankAccntId" name="bankAccntId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">行号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bankNo" name="bankNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_accntNo" name="accntNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">支行名</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bankName" name="bankName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">总行名</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_bankTitle" name="bankTitle" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账户名称</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_accntName" name="accntName" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		
		<table id="viewChannelTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>服务商配置</caption>
		<tr>
		    <td class="flabel">服务商编号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_channelCode" name="channelCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商行号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_chnlBankNo" name="chnlBankNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">服务商账号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_chnlAccntNo" name="chnlAccntNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商银行名称</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_chnlBankName" name="chnlBankName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商账户名</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_chnlAccntName" name="chnlAccntName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商持卡人证件号</td>
		    <td class="fcontent"><input class="cdnInput" id="ur_chnlPersonCardNo" name="chnlPersonCardNo" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>审核信息</caption>
		<tr>
			<td class="flabel">审核时间</td>
			<td class="fcontent"><input class="cdnInput" id="ur_audTime" name="audTime" type="text" xtype="time" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">审核人</td>
			<td class="fcontent"><input class="cdnInput" id="ur_audUser" name="audUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">审核意见</td>
		    <td class="fcontent"><textarea class="cdnInput" id="ur_audRemark" name="audRemark" readonly="readonly" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">确认时间</td>
			<td class="fcontent"><input class="cdnInput" id="ur_secAudTime" name="secAudTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">确认用户</td>
			<td class="fcontent"><input class="cdnInput" id="ur_secAudUser" name="secAudUser" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">确认意见</td>
			<td class="fcontent"><textarea class="cdnInput" id="ur_secAudRemark" name="secAudRemark" readonly="readonly"></textarea></td>
		</tr>
		</table>
		
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>更新信息</caption>
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" id="ur_lastUpdOrg" name="lastUpdOrg" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">最后更新用户</td>
			<td class="fcontent"><input class="cdnInput" id="ur_lastUpdUser" name="lastUpdUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" id="ur_lastUpdTime" name="lastUpdTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">创建用户</td>
			<td class="fcontent"><input class="cdnInput" id="ur_createUser" name="createUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">创建时间</td>
			<td class="fcontent"><input class="cdnInput" id="ur_createTime" name="createTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		</table>
		</form>
	</div>
	<div id="updReltabs-2">
  		<!-- 查询条件 -->
		<div id="ur_errrel_queryCondition">
			<form id="ur_errrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="payReqSeq" id="ur_errrel_q_seqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<!-- <li><label>清算日期</label><input id="ur_errrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li> -->
					<li><input class='bt' id="ur_errrel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="ur_errrel_table"></div>
	</div>
</div>
</div>
<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<jsp:include page="/page/console/business/include/dialog_sysCode.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	add:'addPayReq.action',
	upd:'#',
	submit:'submitPayReq.action',
	delete:'deletePayReq.action',
	audit:'firstAuditPayReq.action',
	deny:'denyPayReq.action',
	accntdtl:'payReqAccntDetail.action',
	accntdtlExcel:'payReqAccntDetailExcel.action',
	transdtl:'payReqTransDetail.action',
	transdtlExcel:'payReqTransDetailExcel.action',
	list:'payReqPage.action',
	excel:'findStlmPayReqExcel.action',
	listAccBank:'listAccBank.action',
	loglist:'payReqBalanceLogPage.action',
	loglistExcel:'payReqBalanceLogPageExcel.action',
	logrel:'payReqBalanceLogRelPage.action',
	logrelExcel:'payReqBalanceLogRelPageExcel.action',
	settlerel:'payReqSettlePage.action',
	settlerelExcel:'payReqSettlePageExcel.action',
	settleAdjust:'payReqFindSettleAdjustDtl.action',
	settleAdjustExcel:'payReqFindSettleAdjustDtlExcel.action',
	listErr:'payReqPayErrRelPage.action',
	listErrExcel:'payReqPayErrRelPageExcel.action',
	listUnrelErr:'payReqPayErrRelUnRelPage.action',
	addErr:'payReqAddRelErr.action',
	delErr:'payReqDelRelErr.action'
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
//商户出账预览
var mchntPreview = function(){
	if($.formValidator.pageIsValid('1')) {
		var dateStart=$('#a_bgnSday').val();
		var dateEnd=$('#a_endSday').val();
		var bankAccntId=$('#a_bankAccntId').val();
		var bankId=$('#a_bankId').val();
		var accntBankStringList = $('#a_accntBankStringList').val();
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!bankAccntId){
			alert("请选择所属银行");
			return;
		}
		if(!accntBankStringList){
			alert("请选择商户开户行");
			return;
		}
		var href="payApplyMchntPreview.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankAccntId="+bankAccntId+"&bankId="+bankId+"&accntBankStringList="+accntBankStringList;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		$('#preViewDiv').dialog('open');
	}
}
//商户出账导出
var mchntExcel = function(){
	if($.formValidator.pageIsValid('1')) {
		var dateStart=$('#a_bgnSday').val();
		var dateEnd=$('#a_endSday').val();
		var bankAccntId=$('#a_bankAccntId').val();
		var bankId=$('#a_bankId').val();
		var accntBankStringList = $('#a_accntBankStringList').val();
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!bankAccntId){
			alert("请选择所属银行");
			return;
		}
		if(!accntBankStringList){
			alert("请选择商户开户行");
			return;
		}
		//var href="payApplyMchntPreview.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankAccntId="+bankAccntId+"&bankId="+bankId+"&accntBankStringList="+accntBankStringList;
		var $form = $('<form></form>');
		$form.attr('action','payApplyMchntPreviewExcel.action');
		$form.attr('method','post');
		$form.attr('target','_blank');
		var $input1 = $('<input type="hidden" name="dateStart" value="'+ dateStart +'"></input>');
		var $input2 = $('<input type="hidden" name="dateEnd" value="'+ dateEnd +'"></input>');
		var $input3 = $('<input type="hidden" name="bankAccntId" value="'+ bankAccntId +'"></input>');
		var $input4 = $('<input type="hidden" name="bankId" value="'+ bankId +'"></input>');
		var $input5 = $('<input type="hidden" name="accntBankStringList" value="'+ accntBankStringList +'"></input>');
		$form.append($input1);
		$form.append($input2);
		$form.append($input3);
		$form.append($input4);
		$form.append($input5);
		$form.submit();
	}
}
//服务商出账预览
var channelPreview = function(){
	if($.formValidator.pageIsValid('1')) {
		var dateStart=$('#a_bgnSday').val();
		var dateEnd=$('#a_endSday').val();
		var channelCode=$('#a_channelCode').val();
		var minusAmt=$('#a_minusAmt').val();
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!channelCode){
			alert("请选择服务商编号");
			return;
		}
		var href;
		if(!minusAmt){
			href="payApplyProxyPreview.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&channelCode="+channelCode;
		} else {
			href="payApplyProxyPreview.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&channelCode="+channelCode+"&minusAmt="+minusAmt*100;
		}
		document.getElementById("printFrame").contentWindow.location.replace(href);
		$('#preViewDiv').dialog('open');
	}
}
//服务商出账预览导出Excel
var channelExcel = function(){
	if($.formValidator.pageIsValid('1')) {
		var dateStart=$('#a_bgnSday').val();
		var dateEnd=$('#a_endSday').val();
		var channelCode=$('#a_channelCode').val();
		var minusAmt=$('#a_minusAmt').val();
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		var href;
		var $form = $('<form></form>');
		$form.attr('action','payApplyProxyPreviewExcel.action');
		$form.attr('target','_blank');
		$form.attr('method','post');
		var $input1 = $('<input type="hidden" name="dateStart" value="'+ dateStart +'"></input>');
		var $input2 = $('<input type="hidden" name="dateEnd" value="'+ dateEnd +'"></input>');
		var $input3 = $('<input type="hidden" name="channelCode" value="'+ channelCode +'"></input>');
		if(minusAmt){
			var $input4 = $('<input type="hidden" name="minusAmt" value="'+ minusAmt*100 +'"></input>');
		} 
		$form.append($input1);
		$form.append($input2);
		$form.append($input3);
		$form.append($input4);
		$form.submit();
	}
}
$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_bgnSday").formValidator({validatorgroup:"1", onshow: "请输入开始日期"})
		.inputValidator({min:8,onerrormin:"开始日期必须填写", max:8, onerrormax:'开始日期最大长度为8'}); 
	$("#a_endSday").formValidator({validatorgroup:"1", onshow: "请输入结束日期"})
		.inputValidator({min:1,onerrormin:"结束日期必须填写", max:8, onerrormax:'结束日期最大长度为8'})
		.compareValidator({desid:'a_bgnSday', operateor:'>=', onerror:'结束日期必须大于等于开始日期. ' });
	$("#a_payReqType").formValidator({validatorgroup:"1", onshow: "请选择申请类型"})
	.inputValidator({min:1,onerrormin:"申请类型必须选择"});
	$("#a_otherAmt").formValidator({validatorgroup:"1", onshow: "其他金额非法"})
	.inputValidator({min:0,max:12,onerror:"其他金额数值过大"}).regexValidator({regexp:"^\\d{0,12}(\\.\\d{0,2})?$",onerrormin:"其他金额非法"});

	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"3", formid:"audForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#au_audRemark").formValidator({validatorgroup:"3", onshow: "请输入审核意见"})
		.inputValidator({min:1,onerrormin:"审核意见必须填写", max:200, onerrormax:'审核意见最大长度为200'}) 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '新增付款申请单', buttons:{
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
		,'预览' : function() {
			if($.formValidator.pageIsValid('1')) {
				if($('#a_payReqType').val() == '01'){
					mchntPreview();
				}else if($('#a_payReqType').val() == '02'){
					channelPreview();
				}else{
					alert('请选择申请类型!');
				}
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
		
	// updForm
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '付款申请单提交', buttons:{
		'提交' : function() {
			if($.formValidator.pageIsValid('2')) {
				$.ajaxForm({formId : 'updForm', url : urls.submit,
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
	
	// audForm
	$('#audDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '付款申请单审核', buttons:{
		'通过' : function() {
			if($.formValidator.pageIsValid('3')) {
				$.ajaxForm({formId : 'audForm', url : urls.audit,
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
				$.ajaxForm({formId : 'audForm', url : urls.deny,
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
	
	// updRelForm
	$('#updRelDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 450
	, title: '差错配置', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// addRelForm
	$('#addRelDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 600
	, title: '添加关联交易', buttons:{
		'添加关联' : function() {
			var record = $('#ar_errrel_table').flexAllSelectData();
			if (!record) {alert("请选择记录"); return;}
			var obj = $('#updRelForm').jsonObject();
			var objstr = $.toJSON(obj);
			$.ajax({url : urls.addErr,dataType : 'json',type : 'POST',
				data : {jsonObject : objstr,jsonArray:$.toJSON(record)},
				success : function(data) {
					if (data.success) { 
						alert('操作成功'); 
						$('#ur_errrel_queryBtn').click();
						$('#addRelDiv').dialog('close');
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
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
	
	// preViewForm
	$('#preViewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 600
	, title: '付款单预览', buttons:{
		'导出Excel' : function(){ 
			if($('#a_payReqType').val() == '01'){
				mchntExcel();
			}else if($('#a_payReqType').val() == '02'){
				channelExcel();
			}else{
				alert('请选择申请类型!');
			} 
		},'关闭' : function() { $(this).dialog('close'); }
	}});
	$('#preViewDiv').fullScreen();
	
	// ADD
	var add = function() {
		$.jyform.resetForm('addForm');
		$('#addDiv').dialog('open');
		$('#addMchntTable').hide();
		$('#addChannelTable').hide();
	};
	// UPD
	var edit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '01':
		case '08':
			$('#updChannelTable').hide();
			$.jyform.resetForm('updForm');
			$.jyform.fillForm('updForm', record);
			if ( record.payReqType == '02' ) { $('#updChannelTable').show(); } 
			if (record.payReqType == '01') {
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
							$('#u_accntBankStringListDesc').val(accntBankStringListDesc);
						}	
					}});
			}
			$('#updDiv').dialog('open');
			break;
		default:
			alert("记录状态不能进行提交. ");
		}
	};
	// AUDIT
	var audit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '02':
			$('#audChannelTable').hide();
				
			$.jyform.resetForm('audForm');
			$.jyform.fillForm('audForm', record);
			if ( record.payReqType == '02' ) { $('#audChannelTable').show(); } 
			if (record.payReqType == '01') {
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
							$('#au_accntBankStringListDesc').val(accntBankStringListDesc);
						}	
					}});
			}
			$('#audDiv').dialog('open');
			break;
		default:
			alert("记录状态不能进行审核. ");
		}
	};
	// DEL
	var del = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		switch (record.status) {
		case '01':
		case '08':
			if ( confirm('是否删除记录?') ) {
				$.ajax({url:urls.delete, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
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
	
	// UPDREL
	var rel = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if (record.payReqType != '02') {
			alert('仅服务商付款单可以进行差错关联操作');
			return false;
		}
		if (record.status != '01' && record.status != '08') {
			alert('仅已生成和已驳回状态的服务商付款单可以进行差错关联操作');
			return false;
		}
		$.jyform.resetForm('updRelForm');
		$.jyform.fillForm('updRelForm', record);
		$('#ur_errrel_q_seqNo').val(record.seqNo);
		$('#ur_errrel_queryBtn').click();
		$('#updRelDiv').dialog('open');
	};
	
	// ADDREL
	var addRel = function(record,id) {
		$('#ar_errrel_q_seqNo').val($('#ur_seqNo').val());
		$('#ar_errrel_q_channelCode').val($('#ur_channelCode').val());
		$('#ar_errrel_queryBtn').click();
		$('#addRelDiv').dialog('open');
	};
	
	var delRel = function(record,id) {
		var record = $('#ur_errrel_table').flexAllSelectData();
		if (!record) {alert("请选择记录"); return;}
		if ( !confirm('是否删除所选交易记录关联?') ) {
			return;
		}
		var obj = $('#updRelForm').jsonObject();
		var objstr = $.toJSON(obj);
		$.ajax({url : urls.delErr,dataType : 'json',type : 'POST',
			data : {jsonObject : objstr,jsonArray:$.toJSON(record)},
			success : function(data) {
				if (data.success) { 
					alert('操作成功'); 
					$('#ur_errrel_queryBtn').click();
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
			}});
	}
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'seqNo', dir : "desc", checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		 {name: "新增", show:'ROLE_FIN_PAYREQ_ADD', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		,{name: "配置关联差错", show:'ROLE_FIN_PAYREQ_ERR_REL', bclass: 'grid_add', id: 'txt', onpress : rel },{separator : true }
		,{name: "提交", show:'ROLE_FIN_PAYREQ_SUB', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "审核", show:'ROLE_FIN_PAYREQ_AUD', bclass: 'grid_edit',  id : 'cel',  onpress : audit },{separator : true }
		,{name: "删除", show:'ROLE_FIN_PAYREQ_DEL', bclass: 'grid_del',  id : 'cel',  onpress : del },{separator : true }
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
	 
	 $('#balanceAj_table').flexigrid({
		url : urls.settleAdjust, height: 330, sort : 'logSeqNo', dir : "desc", checkbox : false, usepager : false, dbClickRecord: viewDtl,
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
	 
	 $('#ur_errrel_table').flexigrid({
			url : urls.listErr, height: 330, sort : 'errSeq', dir : "desc", checkbox : false, usepager : true,
			buttons : [
			   {name: "添加", show:'ROLE_FIN_PAYREQ_ADD', bclass: 'grid_add', id: 'txt', onpress : addRel },{separator : true }
			  ,{name: "删除", show:'ROLE_FIN_PAYREQ_ADD', bclass: 'grid_add', id: 'txt', onpress : delRel },{separator : true }
			  ,{name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#ur_errrel_table').flexFile(urls.listErrExcel); } }
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
	
	 $('#ar_errrel_table').flexigrid({
			url : urls.listUnrelErr, height: 330, sort : 'errSeq', dir : "desc", checkbox : true, usepager : true,
			buttons : [
			   
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
	 
	 $('#ur_errrel_table').flexigrid({
			url : urls.listErr, height: 330, sort : 'errSeq', dir : "desc", checkbox : true, usepager : true,
			buttons : [
				{name: "添加", show:'', bclass: 'grid_add', id: 'txt', onpress : addRel },{separator : true }
				,{name: "删除", show:'', bclass: 'grid_add', id: 'txt', onpress : delRel },{separator : true }
				,{name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#ur_errrel_table').flexFile(urls.listErrExcel); } }
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
	$('#a_payReqType').change(function(){
		if ( $('#a_payReqType').val() == '01' ) { $('#addMchntTable').show();$('#addChannelTable').hide(); }
		if ( $('#a_payReqType').val() == '02' ) { $('#addMchntTable').hide();$('#addChannelTable').show(); }
	});
	
	channelCodeDialogBind('a_channelCode', function(data) { $('#a_channelCode').val(data.channelCode);$('#a_channelName').val(data.channelName); });
	// 
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('#viewSettleDtlDiv').fullScreen();
	
	$('#viewTransRelDiv').fullScreen();
	
	$('#viewMchntDiv').fullScreen();
	$('#viewMchnttabs').tabs(); $('#viewMchnttabs').fixTabInDialog('viewMchntDiv');
	
	$('#viewBalanceAjDtlDiv').fullScreen();
	
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
	
	$('#mchntdtl_queryBtn').click(function(){$.queryTable({formId : 'mchntdtl_queryForm', tableId : 'mchntdtl_table'});});
	$('#settledtl_queryBtn').click(function(){$.queryTable({formId : 'settledtl_queryForm', tableId : 'settledtl_table'});});
	
	$('#settle_queryBtn').click(function(){$.queryTable({formId : 'settle_queryForm', tableId : 'settle_table'});});
	$('#risk_queryBtn').click(function(){$.queryTable({formId : 'risk_queryForm', tableId : 'risk_table'});});
	$('#stlm_queryBtn').click(function(){$.queryTable({formId : 'stlm_queryForm', tableId : 'stlm_table'});});
	$('#balance_queryBtn').click(function(){$.queryTable({formId : 'balance_queryForm', tableId : 'balance_table'});});
	$('#balanceAj_queryBtn').click(function(){$.queryTable({formId : 'balanceAj_queryForm', tableId : 'balanceAj_table'});});
	
	$('#settlerel_queryBtn').click(function(){$.queryTable({formId : 'settlerel_queryForm', tableId : 'settlerel_table'});});
	$('#transrel_queryBtn').click(function(){$.queryTable({formId : 'transrel_queryForm', tableId : 'transrel_table'});});
	$('#errdtl_queryBtn').click(function(){$.queryTable({formId : 'errdtl_queryForm', tableId : 'errdtl_table'});});
	
	$('#updRelDiv').fullScreen();
	$('#updReltabs').tabs(); $('#updReltabs').fixTabInDialog('updRelDiv');
	
	$('#ur_errrel_queryBtn').click(function(){$.queryTable({formId : 'ur_errrel_queryForm', tableId : 'ur_errrel_table'});});
	
	$('#ar_errrel_queryBtn').click(function(){$.queryTable({formId : 'ar_errrel_queryForm', tableId : 'ar_errrel_table'});});
	sysCodeDialogBind('a_accntBankStringListDesc',function(data) {
		var accntBankStringList;
		var accntBankStringListDesc;
		if (isArray(data)) {
			$.each(data,function(i,n){
				if (i==0) {
					accntBankStringList = data[i].codeNo;
					accntBankStringListDesc =  data[i].codeName;
				} else {
					accntBankStringList += "," + data[i].codeNo; 
					accntBankStringListDesc += "," + data[i].codeName;
				}
			});
		} else {
			accntBankStringList = data.codeNo;
			accntBankStringListDesc =  data[i].codeName;
		}
		$('#a_accntBankStringList').val(accntBankStringList);
		$('#a_accntBankStringListDesc').val(accntBankStringListDesc);
	},'BANK_CODE','总行信息','总行号','总行名称',false);
});
//-->
</script>
</body>