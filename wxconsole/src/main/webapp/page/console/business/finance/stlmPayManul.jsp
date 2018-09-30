<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>付款申请管理</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style type="text/css">
.fcontent input,.fcontent select,.fcontent textarea{width: 80%;}
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
table .fdisplay {  
  width: 120px;
  height: 20px;
  padding-right: .8em;
  text-align:center
}
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<!-- <input type="hidden" name="status" value="08,02,01" comparison="eq" ftype="list" /> -->
		<ul class="qry-ul">
			<li><label>开始日期</label><input  id="q_bgnSday" name="stlmDate" type="text" xtype="date" qtype="string" comparison="ge" /></li>
			<li><label>结束日期</label><input  id="q_endSday" name="stlmDate" type="text" xtype="date" qtype="string" comparison="le" /></li>
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
	<td class="fdisplay" colspan="10">收益和损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">公司部分</td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">客户或代理商承担</td>
	<td class="fdisplay" colspan="2">公司实际收益或损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" id="a_feeIncomeCom" name="feeIncomeCom" xtype="money" maxLength="20"/><div id="a_feeIncomeComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fdisplay">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" id="a_feeIncomePe" name="feeIncomePe" xtype="money" maxLength="20"/><div id="a_feeIncomePeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" id="a_consumCancelCom" name="consumCancelCom" xtype="money" maxLength="20"/><div id="a_consumCancelComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)消费撤销:</td>
	<td class="fcontent"><input type="text" id="a_consumCancelChnl" name="consumCancelChnl" xtype="money" maxLength="20"/><div id="a_consumCancelChnlTip"></div></td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" id="a_consumCancelPe" name="consumCancelPe" xtype="money" maxLength="20"/><div id="a_consumCancelPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" id="a_returnCom" name="returnCom" xtype="money" maxLength="20"/><div id="a_returnComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)联机退货:</td>
	<td class="fcontent"><input type="text" id="a_returnChnl" name="returnChnl" xtype="money" maxLength="20"/><div id="a_returnChnlTip"></div></td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" id="a_returnPe" name="returnPe" xtype="money" maxLength="20"/><div id="a_returnPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" id="a_manulReturnCom" name="manulReturnCom" xtype="money" maxLength="20"/><div id="a_manulReturnComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)手工退货:</td>
	<td class="fcontent"><input type="text" id="a_manulReturnChnl" name="manulReturnChnl" xtype="money" maxLength="20"/><div id="a_manulReturnChnlTip"></div></td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" id="a_manulReturnPe" name="manulReturnPe" xtype="money" maxLength="20"/><div id="a_manulReturnPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" id="a_brandFeeCom" name="brandFeeCom" xtype="money" maxLength="20"/><div id="a_brandFeeComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)品牌费:</td>
	<td class="fcontent"><input type="text" id="a_brandFeeChnl" name="brandFeeChnl" xtype="money" maxLength="20"/><div id="a_brandFeeChnlTip"></div></td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" id="a_brandFeePe" name="brandFeePe" xtype="money" maxLength="20"/><div id="a_brandFeePeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" id="a_chargeBackCom" name="chargeBackCom" xtype="money" maxLength="20"/><div id="a_chargeBackComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)退单:</td>
	<td class="fcontent"><input type="text" id="a_chargeBackChnl" name="chargeBackChnl" xtype="money" maxLength="20"/><div id="a_chargeBackChnlTip"></div></td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" id="a_chargeBackPe" name="chargeBackPe" xtype="money" maxLength="20"/><div id="a_chargeBackPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" id="a_replyCom" name="replyCom" xtype="money" maxLength="20"/><div id="a_replyComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)调单回复:</td>
	<td class="fcontent"><input type="text" id="a_replyChnl" name="replyChnl" xtype="money" maxLength="20"/><div id="a_replyChnlTip"></div></td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" id="a_replyPe" name="replyPe" xtype="money" maxLength="20"/><div id="a_replyPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" id="a_interestCom" name="interestCom" xtype="money" maxLength="20"/><div id="a_interestComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)利息:</td>
	<td class="fcontent"><input type="text" id="a_interestChnl" name="interestChnl" xtype="money" maxLength="20"/><div id="a_interestChnlTip"></div></td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" id="a_interestPe" name="interestPe" xtype="money" maxLength="20"/><div id="a_interestPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" id="a_bankFeeCom" name="bankFeeCom" xtype="money" maxLength="20"/><div id="a_bankFeeComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)银行手续费:</td>
	<td class="fcontent"><input type="text" id="a_bankFeeChnl" name="bankFeeChnl" xtype="money" maxLength="20"/><div id="a_bankFeeChnlTip"></div></td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" id="a_bankFeePe" name="bankFeePe" xtype="money" maxLength="20"/><div id="a_bankFeePeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" id="a_elseGetCom" name="elseGetCom" xtype="money" maxLength="20"/><div id="a_elseGetComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)差错处理费用:</td>
	<td class="fcontent"><input type="text" id="a_elseGetChnl" name="elseGetChnl" xtype="money" maxLength="20"/><div id="a_elseGetChnlTip"></div></td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" id="a_elseGetPe" name="elseGetPe" xtype="money" maxLength="20"/><div id="a_elseGetPeTip"></div></td>
</tr>
<!-- <tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_peSumCom" name="peSumCom" xtype="money"/><div id="a_peSumComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_peSumChnl" name="peSumChnl" xtype="money"/><div id="a_peSumChnlTip"></div></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_peSumPe" name="peSumPe" xtype="money"/><div id="a_peSumPeTip"></div></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="10">差错帐</td>
</tr>
<tr>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="a_unilatElse" name="unilatElse" xtype="money" maxLength="20"/><div id="a_unilatElseTip"></div></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="a_unilatCom" name="unilatCom" xtype="money" maxLength="20"/><div id="a_unilatComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="a_unilatChnl" name="unilatChnl" xtype="money" maxLength="20"/><div id="a_unilatChnlTip"></div></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="a_unilatPe" name="unilatPe" xtype="money" maxLength="20"/><div id="a_unilatPeTip"></div></td>
</tr>
<tr>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="a_exceptionElse" name="exceptionElse" xtype="money" maxLength="20"/><div id="a_exceptionElseTip"></div></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="a_exceptionCom" name="exceptionCom" xtype="money" maxLength="20"/><div id="a_exceptionComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="a_exceptionChnl" name="exceptionChnl" xtype="money" maxLength="20"/><div id="a_exceptionChnlTip"></div></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="a_exceptionPe" name="exceptionPe" xtype="money" maxLength="20"/><div id="a_exceptionPeTip"></div></td>
</tr>
<!-- <tr>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_errorSumElse" name="errorSumElse" xtype="money"/><div id="a_errorSumElseTip"></div></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_errorSumCom" name="errorSumCom" xtype="money"/><div id="a_errorSumComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_errorSumChnl" name="errorSumChnl" xtype="money"/><div id="a_errorSumChnlTip"></div></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="a_errorSumPe" name="errorSumPe" xtype="money"/><div id="a_errorSumPeTip"></div></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="10">银行收付情况</td>
</tr>
<tr>
	<td class="flabel">清算资金日初余额:</td>
	<td class="fcontent"><input type="text" id="a_stlmBgnAmt" name="stlmBgnAmt" xtype="money" maxLength="20"/><div id="a_stlmBgnAmtTip"></div></td>
	<td class="flabel">清算入账资金:</td>
	<td class="fcontent"><input type="text" id="a_stlmInAmt" name="stlmInAmt" xtype="money" maxLength="20"/><div id="a_stlmInAmtTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">清算出账资金:</td>
	<td class="fcontent"><input type="text" id="a_stlmOutAmt" name="stlmOutAmt" xtype="money" maxLength="20"/><div id="a_stlmOutAmtTip"></div></td>
	<td class="flabel">清算资金余额:</td>
	<td class="fcontent"><input type="text" id="a_stlmEndAmt" name="stlmEndAmt" xtype="money" maxLength="20"/><div id="a_stlmEndAmtTip"></div></td>
</tr>
<tr>
	<td class="flabel">公司调拨日初余额:</td>
	<td class="fcontent"><input type="text" id="a_comBgnAmt" name="comBgnAmt" xtype="money" maxLength="20"/><div id="a_comBgnAmtTip"></div></td>
	<td class="flabel">公司调入资金:</td>
	<td class="fcontent"><input type="text" id="a_comInAmt" name="comInAmt" xtype="money" maxLength="20"/><div id="a_comInAmtTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">公司调出资金:</td>
	<td class="fcontent"><input type="text" id="a_comOutAmt" name="comOutAmt" xtype="money" maxLength="20"/><div id="a_comOutAmtTip"></div></td>
	<td class="flabel">公司调拨余额:</td>
	<td class="fcontent"><input type="text" id="a_comEndAmt" name="comEndAmt" xtype="money" maxLength="20"/><div id="a_comEndAmtTip"></div></td>
</tr>
<tr>
	<td class="flabel">银行存款日初余额:</td>
	<td class="fcontent"><input type="text" id="a_bankBgnAmt" name="bankBgnAmt" xtype="money" maxLength="20"/><div id="a_bankBgnAmtTip"></div></td>
	<td class="flabel">入账资金:</td>
	<td class="fcontent"><input type="text" id="a_bankInAmt" name="bankInAmt" xtype="money" maxLength="20"/><div id="a_bankInAmtTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">出账资金:</td>
	<td class="fcontent"><input type="text" id="a_bankOutAmt" name="bankOutAmt" xtype="money" maxLength="20"/><div id="a_bankOutAmtTip"></div></td>
	<td class="flabel">日结余额:</td>
	<td class="fcontent"><input type="text" id="a_bankEndAmt" name="bankEndAmt" xtype="money" maxLength="20"/><div id="a_bankEndAmtTip"></div></td>
</tr>
</table>
</form>
</div>

<!-- 修改 -->
<div id="updDiv" style="display: none;">
<form id="updForm" action="#">
<input type="hidden" name="version" />
<input type="hidden" name="stlmDate" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="fdisplay" colspan="10">收益和损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">公司部分</td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">客户或代理商承担</td>
	<td class="fdisplay" colspan="2">公司实际收益或损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" id="u_feeIncomeCom" name="feeIncomeCom" xtype="money"/><div id="u_feeIncomeComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fdisplay">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" id="u_feeIncomePe" name="feeIncomePe" xtype="money" readonly="readonly"/><div id="u_feeIncomePeTip"></div></td>
</tr>
<!-- <tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" id="u_consumCancelCom" name="consumCancelCom" xtype="money" readonly="readonly"/><div id="u_consumCancelComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)消费撤销:</td>
	<td class="fcontent"><input type="text" id="u_consumCancelChnl" name="consumCancelChnl" xtype="money" readonly="readonly"/><div id="u_consumCancelChnlTip"></div></td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" id="u_consumCancelPe" name="consumCancelPe" xtype="money" readonly="readonly"/><div id="u_consumCancelPeTip"></div></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" id="u_returnCom" name="returnCom" xtype="money"/><div id="u_returnComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)联机退货:</td>
	<td class="fcontent"><input type="text" id="u_returnChnl" name="returnChnl" xtype="money"/><div id="u_returnChnlTip"></div></td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" id="u_returnPe" name="returnPe" xtype="money" readonly="readonly"/><div id="u_returnPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" id="u_manulReturnCom" name="manulReturnCom" xtype="money"/><div id="u_manulReturnComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)手工退货:</td>
	<td class="fcontent"><input type="text" id="u_manulReturnChnl" name="manulReturnChnl" xtype="money"/><div id="u_manulReturnChnlTip"></div></td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" id="u_manulReturnPe" name="manulReturnPe" xtype="money" readonly="readonly"/><div id="u_manulReturnPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" id="u_brandFeeCom" name="brandFeeCom" xtype="money"/><div id="u_brandFeeComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)品牌费:</td>
	<td class="fcontent"><input type="text" id="u_brandFeeChnl" name="brandFeeChnl" xtype="money"/><div id="u_brandFeeChnlTip"></div></td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" id="u_brandFeePe" name="brandFeePe" xtype="money" readonly="readonly"/><div id="u_brandFeePeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" id="u_chargeBackCom" name="chargeBackCom" xtype="money"/><div id="u_chargeBackComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)退单:</td>
	<td class="fcontent"><input type="text" id="u_chargeBackChnl" name="chargeBackChnl" xtype="money"/><div id="u_chargeBackChnlTip"></div></td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" id="u_chargeBackPe" name="chargeBackPe" xtype="money" readonly="readonly"/><div id="u_chargeBackPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" id="u_replyCom" name="replyCom" xtype="money"/><div id="u_replyComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)调单回复:</td>
	<td class="fcontent"><input type="text" id="u_replyChnl" name="replyChnl" xtype="money"/><div id="u_replyChnlTip"></div></td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" id="u_replyPe" name="replyPe" xtype="money" readonly="readonly"/><div id="u_replyPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" id="u_interestCom" name="interestCom" xtype="money"/><div id="u_interestComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)利息:</td>
	<td class="fcontent"><input type="text" id="u_interestChnl" name="interestChnl" xtype="money"/><div id="u_interestChnlTip"></div></td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" id="u_interestPe" name="interestPe" xtype="money" readonly="readonly"/><div id="u_interestPeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" id="u_bankFeeCom" name="bankFeeCom" xtype="money"/><div id="u_bankFeeComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)银行手续费:</td>
	<td class="fcontent"><input type="text" id="u_bankFeeChnl" name="bankFeeChnl" xtype="money"/><div id="u_bankFeeChnlTip"></div></td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" id="u_bankFeePe" name="bankFeePe" xtype="money" readonly="readonly"/><div id="u_bankFeePeTip"></div></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" id="u_elseGetCom" name="elseGetCom" xtype="money"/><div id="u_elseGetComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)差错处理费用:</td>
	<td class="fcontent"><input type="text" id="u_elseGetChnl" name="elseGetChnl" xtype="money"/><div id="u_elseGetChnlTip"></div></td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" id="u_elseGetPe" name="elseGetPe" xtype="money" readonly="readonly"/><div id="u_elseGetPeTip"></div></td>
</tr>
<!-- <tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_peSumCom" name="peSumCom" xtype="money"/><div id="u_peSumComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_peSumChnl" name="peSumChnl" xtype="money"/><div id="u_peSumChnlTip"></div></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_peSumPe" name="peSumPe" xtype="money"/><div id="u_peSumPeTip"></div></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="10">差错帐</td>
</tr>
<tr>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="u_unilatElse" name="unilatElse" xtype="money"/><div id="u_unilatElseTip"></div></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="u_unilatCom" name="unilatCom" xtype="money"/><div id="u_unilatComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="u_unilatChnl" name="unilatChnl" xtype="money"/><div id="u_unilatChnlTip"></div></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" id="u_unilatPe" name="unilatPe" xtype="money" readonly="readonly"/><div id="u_unilatPeTip"></div></td>
</tr>
<tr>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="u_exceptionElse" name="exceptionElse" xtype="money"/><div id="u_exceptionElseTip"></div></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="u_exceptionCom" name="exceptionCom" xtype="money"/><div id="u_exceptionComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="u_exceptionChnl" name="exceptionChnl" xtype="money"/><div id="u_exceptionChnlTip"></div></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" id="u_exceptionPe" name="exceptionPe" xtype="money" readonly="readonly"/><div id="u_exceptionPeTip"></div></td>
</tr>
<!-- <tr>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_errorSumElse" name="errorSumElse" xtype="money"/><div id="u_errorSumElseTip"></div></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_errorSumCom" name="errorSumCom" xtype="money"/><div id="u_errorSumComTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_errorSumChnl" name="errorSumChnl" xtype="money"/><div id="u_errorSumChnlTip"></div></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" id="u_errorSumPe" name="errorSumPe" xtype="money"/><div id="u_errorSumPeTip"></div></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="10">银行收付情况</td>
</tr>
<tr>
	<td class="flabel">清算资金日初余额:</td>
	<td class="fcontent"><input type="text" id="u_stlmBgnAmt" name="stlmBgnAmt" xtype="money"/><div id="u_stlmBgnAmtTip"></div></td>
	<td class="flabel">清算入账资金:</td>
	<td class="fcontent"><input type="text" id="u_stlmInAmt" name="stlmInAmt" xtype="money" readonly="readonly"/><div id="u_stlmInAmtTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">清算出账资金:</td>
	<td class="fcontent"><input type="text" id="u_stlmOutAmt" name="stlmOutAmt" xtype="money" readonly="readonly"/><div id="u_stlmOutAmtTip"></div></td>
	<td class="flabel">清算资金余额:</td>
	<td class="fcontent"><input type="text" id="u_stlmEndAmt" name="stlmEndAmt" xtype="money" readonly="readonly"/><div id="u_stlmEndAmtTip"></div></td>
</tr>
<tr>
	<td class="flabel">公司调拨日初余额:</td>
	<td class="fcontent"><input type="text" id="u_comBgnAmt" name="comBgnAmt" xtype="money"/><div id="u_comBgnAmtTip"></div></td>
	<td class="flabel">公司调入资金:</td>
	<td class="fcontent"><input type="text" id="u_comInAmt" name="comInAmt" xtype="money"/><div id="u_comInAmtTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">公司调出资金:</td>
	<td class="fcontent"><input type="text" id="u_comOutAmt" name="comOutAmt" xtype="money"/><div id="u_comOutAmtTip"></div></td>
	<td class="flabel">公司调拨余额:</td>
	<td class="fcontent"><input type="text" id="u_comEndAmt" name="comEndAmt" xtype="money" readonly="readonly"/><div id="u_comEndAmtTip"></div></td>
</tr>
<tr>
	<td class="flabel">银行存款日初余额:</td>
	<td class="fcontent"><input type="text" id="u_bankBgnAmt" name="bankBgnAmt" xtype="money" readonly="readonly"/><div id="u_bankBgnAmtTip"></div></td>
	<td class="flabel">入账资金:</td>
	<td class="fcontent"><input type="text" id="u_bankInAmt" name="bankInAmt" xtype="money" readonly="readonly"/><div id="u_bankInAmtTip"></div></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">出账资金:</td>
	<td class="fcontent"><input type="text" id="u_bankOutAmt" name="bankOutAmt" xtype="money" readonly="readonly"/><div id="u_bankOutAmtTip"></div></td>
	<td class="flabel">日结余额:</td>
	<td class="fcontent"><input type="text" id="u_bankEndAmt" name="bankEndAmt" xtype="money" readonly="readonly"/><div id="u_bankEndAmtTip"></div></td>
</tr>
</table>
</form>
</div>

<!-- 审核 -->
<div id="audDiv" style="display: none;">
<form id="audForm" action="#">
<input type="hidden" name="version" />
<input type="hidden" name="stlmDate" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="fdisplay" colspan="10">收益和损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">公司部分</td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">客户或代理商承担</td>
	<td class="fdisplay" colspan="2">公司实际收益或损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" name="feeIncomeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fdisplay">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" name="feeIncomePe" xtype="money" readonly="readonly"/></td>
</tr>
<!-- <tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelPe" xtype="money" readonly="readonly"/></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeeChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" name="interestCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)利息:</td>
	<td class="fcontent"><input type="text" name="interestChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" name="interestPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeeChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">差错帐</td>
</tr>
<tr>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">银行收付情况</td>
</tr>
<tr>
	<td class="flabel">清算资金日初余额:</td>
	<td class="fcontent"><input type="text" name="stlmBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">清算入账资金:</td>
	<td class="fcontent"><input type="text" name="stlmInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">清算出账资金:</td>
	<td class="fcontent"><input type="text" name="stlmOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">清算资金余额:</td>
	<td class="fcontent"><input type="text" name="stlmEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">公司调拨日初余额:</td>
	<td class="fcontent"><input type="text" name="comBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">公司调入资金:</td>
	<td class="fcontent"><input type="text" name="comInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">公司调出资金:</td>
	<td class="fcontent"><input type="text" name="comOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">公司调拨余额:</td>
	<td class="fcontent"><input type="text" name="comEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">银行存款日初余额:</td>
	<td class="fcontent"><input type="text" name="bankBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">入账资金:</td>
	<td class="fcontent"><input type="text" name="bankInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">出账资金:</td>
	<td class="fcontent"><input type="text" name="bankOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">日结余额:</td>
	<td class="fcontent"><input type="text" name="bankEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>审核意见</td>
	<td class="fcontent" colspan="9"><textarea class="cdnInput" id="audRemark" name="audRemark" maxLength="400"></textarea><div id="audRemarkTip"/></td>
</tr>
</table>
</form>
</div>

<!-- 提交 -->
<div id="subDiv" style="display: none;">
<form id="subForm" action="#">
<input type="hidden" name="version" />
<input type="hidden" name="stlmDate" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="fdisplay" colspan="10">收益和损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">公司部分</td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">客户或代理商承担</td>
	<td class="fdisplay" colspan="2">公司实际收益或损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" name="feeIncomeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fdisplay">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" name="feeIncomePe" xtype="money" readonly="readonly"/></td>
</tr>
<!-- <tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelPe" xtype="money" readonly="readonly"/></td>
</tr> -->
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeeChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" name="interestCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)利息:</td>
	<td class="fcontent"><input type="text" name="interestChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" name="interestPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeeChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">差错帐</td>
</tr>
<tr>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">银行收付情况</td>
</tr>
<tr>
	<td class="flabel">清算资金日初余额:</td>
	<td class="fcontent"><input type="text" name="stlmBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">清算入账资金:</td>
	<td class="fcontent"><input type="text" name="stlmInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">清算出账资金:</td>
	<td class="fcontent"><input type="text" name="stlmOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">清算资金余额:</td>
	<td class="fcontent"><input type="text" name="stlmEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">公司调拨日初余额:</td>
	<td class="fcontent"><input type="text" name="comBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">公司调入资金:</td>
	<td class="fcontent"><input type="text" name="comInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">公司调出资金:</td>
	<td class="fcontent"><input type="text" name="comOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">公司调拨余额:</td>
	<td class="fcontent"><input type="text" name="comEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">银行存款日初余额:</td>
	<td class="fcontent"><input type="text" name="bankBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">入账资金:</td>
	<td class="fcontent"><input type="text" name="bankInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">出账资金:</td>
	<td class="fcontent"><input type="text" name="bankOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">日结余额:</td>
	<td class="fcontent"><input type="text" name="bankEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
</table>
</form>
</div>

<!-- 查看 -->
<div id="viewDiv" style="display: none;">
<form id="viewForm" action="#">
<input type="hidden" name="version" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel" colspan="5">日期:</td>
	<td class="fcontent" colspan="5"><input type="text" name="stlmDate" xtype="date" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">收益和损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">公司部分</td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="fdisplay" colspan="2">客户或代理商承担</td>
	<td class="fdisplay" colspan="2">公司实际收益或损失</td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" name="feeIncomeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fdisplay">-</td>
	<td class="flabel">手续费收入:</td>
	<td class="fcontent"><input type="text" name="feeIncomePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)消费撤销:</td>
	<td class="fcontent"><input type="text" name="consumCancelPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)联机退货:</td>
	<td class="fcontent"><input type="text" name="returnPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)手工退货:</td>
	<td class="fcontent"><input type="text" name="manulReturnPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeeChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)品牌费:</td>
	<td class="fcontent"><input type="text" name="brandFeePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)退单:</td>
	<td class="fcontent"><input type="text" name="chargeBackPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(加)调单回复:</td>
	<td class="fcontent"><input type="text" name="replyPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" name="interestCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)利息:</td>
	<td class="fcontent"><input type="text" name="interestChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(加)利息:</td>
	<td class="fcontent"><input type="text" name="interestPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeeCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeeChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)银行手续费:</td>
	<td class="fcontent"><input type="text" name="bankFeePe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">(加)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">(减)差错处理费用:</td>
	<td class="fcontent"><input type="text" name="elseGetPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="peSumPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">差错帐</td>
</tr>
<tr>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">单边账:</td>
	<td class="fcontent"><input type="text" name="unilatPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">差错例外:</td>
	<td class="fcontent"><input type="text" name="exceptionPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumElse" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumCom" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumChnl" xtype="money" readonly="readonly"/></td>
	<td class="flabel">合计:</td>
	<td class="fcontent"><input type="text" name="errorSumPe" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">银行收付情况</td>
</tr>
<tr>
	<td class="flabel">清算资金日初余额:</td>
	<td class="fcontent"><input type="text" name="stlmBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">清算入账资金:</td>
	<td class="fcontent"><input type="text" name="stlmInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">清算出账资金:</td>
	<td class="fcontent"><input type="text" name="stlmOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">清算资金余额:</td>
	<td class="fcontent"><input type="text" name="stlmEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">公司调拨日初余额:</td>
	<td class="fcontent"><input type="text" name="comBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">公司调入资金:</td>
	<td class="fcontent"><input type="text" name="comInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">公司调出资金:</td>
	<td class="fcontent"><input type="text" name="comOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">公司调拨余额:</td>
	<td class="fcontent"><input type="text" name="comEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">银行存款日初余额:</td>
	<td class="fcontent"><input type="text" name="bankBgnAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">入账资金:</td>
	<td class="fcontent"><input type="text" name="bankInAmt" xtype="money" readonly="readonly"/></td>
	<td class="fdisplay" colspan="2">-</td>
	<td class="flabel">出账资金:</td>
	<td class="fcontent"><input type="text" name="bankOutAmt" xtype="money" readonly="readonly"/></td>
	<td class="flabel">日结余额:</td>
	<td class="fcontent"><input type="text" name="bankEndAmt" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="fdisplay" colspan="10">审核及状态信息</td>
</tr>
<tr>
	<td class="flabel">创建时间:</td>
	<td class="fcontent"><input type="text" name="createTime" xtype="datetime" readonly="readonly"/></td>
	<td class="flabel">创建人:</td>
	<td class="fcontent"><input type="text" name="createUser" readonly="readonly"/></td>
	<td class="flabel">状态:</td>
	<td class="fcontent"><input type="text" name="statusDesc" readonly="readonly"/></td>
	<td class="flabel">最后更新时间:</td>
	<td class="fcontent"><input type="text" name="lastUpdTime" xtype="datetime" readonly="readonly"/></td>
	<td class="flabel">最后更新人:</td>
	<td class="fcontent"><input type="text" name="lastUpdUser" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">审核时间</td>
	<td class="fcontent"><input type="text" name="audTime" xtype="datetime" readonly="readonly"/></td>
	<td class="flabel">审核人:</td>
	<td class="fcontent"><input type="text" name="audUser" readonly="readonly"/></td>
	<td class="flabel">审核意见:</td>
	<td class="fcontent" colspan="5"><textarea type="text" name="audRemark" xtype="money" readonly="readonly"></textarea></td>
</tr>
</table>
</form>
</div>
<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<jsp:include page="/page/console/business/include/dialog_sysCode.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	list:'stlmPayManulStaticPage.action',
	add:'addStlmPayManulStatic.action',
	upd:'updStlmPayManulStatic.action',
	submit:'submitStlmPayManulStatic.action',
	audit:'aduitStlmPayManulStatic.action',
	deny:'denyStlmPayManulStatic.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$('#addForm input[xtype=money]').each(function(i,n){
		$(n).formValidator({validatorgroup:"1", onshow: "",onfocus: "",oncorrect: "√"})
		.inputValidator({min:-999999999999,onerrormin:"取值在-999999999999~999999999999", max:999999999999, onerrormax:'取值在-999999999999~999999999999',type:'value'}); /* 数字检查 */ 
	});
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$('#updForm input[xtype=money]').each(function(i,n){
		$(n).formValidator({validatorgroup:"2", onshow: "",onfocus: "",oncorrect: "√"})
		.inputValidator({min:-999999999999,onerrormin:"取值在-999999999999~999999999999", max:999999999999, onerrormax:'取值在-999999999999~999999999999',type:'value'}); /* 数字检查 */ 
	});
	$.formValidator.initConfig({ validatorgroup:"3", formid:"audForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	audRemark
	$("#audRemark").formValidator({validatorgroup:"3", onshow: "请填写审核意见"})
		.inputValidator({min:1,onerrormin:"审核意见必须填写", max:400, onerrormax:'不得超过400位'});
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '新增财务日报手填部分', buttons:{
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
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 600
	, title: '修改财务日报手填部分', buttons:{
		'保存' : function() {
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
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 600
	, title: '查看财务日报手填部分', buttons:{
		'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// subForm
	$('#subDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '提交财务日报手填部分', buttons:{
		'提交' : function() {
			if (!confirm('是否提交?')) {
				return;
			}
			$.ajaxForm({formId : 'subForm', url : urls.submit,
			success : function(data) {
				if (data.success) { 
					$('#subDiv').dialog('close'); alert('操作成功'); 
					if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
			}});
		}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// audForm
	$('#audDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '审核财务日报手填部分', buttons:{
		'通过' : function() {
			if($.formValidator.pageIsValid('3')) {
				if (!confirm('是否通过?')) {
					return;
				}
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
				if (!confirm('是否驳回?')) {
					return;
				}
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
	// ADD
	var add = function() {
		$.ajaxForm({formId : 'addForm', url : urls.add,
			success : function(data) {
				if (data.success) { 
					$('#addDiv').dialog('close'); alert('操作成功'); 
					if ( data.root && data.root[0] ) $('#table').flexAddData(data.root[0]);
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
			}});
	};
	
	// UPD
	var edit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if (record.lockFlag == '01') {alert('往期数据不可修改');return;}
		if (record.status == '02') {alert('已提交不可修改');return;}
		if (record.status == '03') {alert('已审核不可修改');return;}
		if (record.status == '04') {alert('已结账不可修改');return;}
		if (record.status == '06') {alert('已完全结账不可修改');return;}
		if (record.status == '09') {alert('已删除不可修改');return;}
		$.jyform.resetForm('updForm');
		$.jyform.fillForm('updForm', record);
		$('#updDiv').dialog('open');
	};
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};
	
	// SUBMIT
	var submit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if (record.lockFlag == '01') {alert('往期数据不可提交');return;}
		if (record.status == '02') {alert('已提交不可重复提交');return;}
		if (record.status == '03') {alert('已审核不可提交');return;}
		if (record.status == '04') {alert('已结账不可提交');return;}
		if (record.status == '06') {alert('已完全结账不可提交');return;}
		if (record.status == '09') {alert('已删除不可提交');return;}
		$.jyform.resetForm('subForm');
		$.jyform.fillForm('subForm', record);
		$('#subDiv').dialog('open');
	};
	
	// AUDIT
	var audit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if (record.lockFlag == '01') {alert('往期数据不可审核');return;}
		if (record.status != '02') {alert('未处于提交状态,不可审核');return;}
		$.jyform.resetForm('audForm');
		$.jyform.fillForm('audForm', record);
		$('#audDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'stlmDate', dir : "desc", checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		   {name: "新增", show:'ROLE_FIN_STLM_MANUAL_ADD', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		  ,{name: "修改", show:'ROLE_FIN_STLM_MANUAL_UPD', bclass: 'grid_edit', id: 'txt', onpress : edit },{separator : true }
		  ,{name: "提交", show:'ROLE_FIN_STLM_MANUAL_SUB', bclass: 'grid_edit', id: 'txt', onpress : submit },{separator : true }
		  ,{name: "审核", show:'ROLE_FIN_STLM_MANUAL_AUD', bclass: 'grid_edit', id: 'txt', onpress : audit },{separator : true }
		],
		colModel : [ 
		 { display : '清算日期', dataIndex : 'stlmDate', width : 120, align : 'center', sortable:true, render: fmtDate }
		,{ display : '收益和损失合计(公司部分)', dataIndex : 'peSumCom', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '收益和损失合计(客户或代理商承担)', dataIndex : 'peSumChnl', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '收益和损失合计(公司实际收益或损失)', dataIndex : 'peSumPe', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '差错帐合计(公司部分)', dataIndex : 'errorSumCom', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '差错帐合计(客户或代理商承担)', dataIndex : 'errorSumChnl', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '差错帐合计(公司实际收益或损失)', dataIndex : 'errorSumPe', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '差错帐合计(其他)', dataIndex : 'errorSumElse', width : 180, align : 'center', sortable:true, render: fmtMoney }
		,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
		,{ display : '审核时间', dataIndex : 'audTime', width : 180, align : 'center', sortable:true, render: fmtTime }
		,{ display : '审核人', dataIndex : 'audUser', width : 80, align : 'center', sortable:true }
		,{ display : '最后更新用户', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
		,{ display : '创建用户', dataIndex : 'createUser', width : 80, align : 'center', sortable:true }
		,{ display : '创建时间', dataIndex : 'createTime', width : 180, align : 'center', sortable:true, render: fmtTime }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	$('#addDiv').fullScreen();
	$('#updDiv').fullScreen();
	$('#subDiv').fullScreen();
	$('#audDiv').fullScreen();
	$('#viewDiv').fullScreen();
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
	
});
//-->
</script>
</body>