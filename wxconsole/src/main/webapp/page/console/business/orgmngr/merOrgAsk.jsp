<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>交易商户银行转换申请</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/merOrgAsk.js"></script>
</head>
<body>
<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">银行号</td>
		<td class="qinput"><input type="text" id="qbankCode" comparison="like"
			qtype="string" name="bankCode"  maxlength="10" /></td>
		<td class="qlabel">商户名</td>
		<td class="qinput"><input type="text"  comparison="like"
			qtype="string" name="merName"  maxlength="100" /></td>	
		<td class="qlabel">内部商户号</td>
		<td class="qinput"><input type="text"  comparison="like"
			qtype="string" name="merCode"  maxlength="15" /></td>	
	</tr>
	
	<tr>
		<td class="qlabel">外部商户号</td>
		<td class="qinput"><input type="text"  comparison="like"
			qtype="string" name="merOutCode"  maxlength="15" /></td>
		<td class="qlabel">起效清算开始日期</td>
		<td class="qinput"><input type="text" id="qstartDate1" comparison="ge"
			qtype="string" name="startDate"  maxlength="8" /></td>	
		<td class="qlabel">起效清算结束日期</td>
		<td class="qinput"><input type="text" id="qstartDate2" comparison="le"
			qtype="string" name="startDate"  maxlength="8" /></td>
	</tr>
	<tr>
		<td class="qlabel">失效清算开始日期</td>
		<td class="qinput"><input type="text" id="qendDate1" comparison="ge"
			qtype="string" name="endDate"  maxlength="8" /></td>	
		<td class="qlabel">失效清算结束日期</td>
		<td class="qinput"><input type="text" id="qendDate2" comparison="le"
			qtype="string" name="endDate"  maxlength="8" /></td>	
		<td class="qlabel"></td>
		<td class="qinput"></td>	
	</tr>
	<tr>
	  <td bgcolor="#ffffff"  colspan="6" align="center">
	  <input id="querybutton" class="bt" value="查询"  type="button">
	  <input class="bt" value="重置" type="reset" />
	  </td>
	</tr>
</table>
</form>
</div>
<DIV id="table"></DIV>
<!-- 商户选择弹出窗口 -->
<div id="merchantSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">商户名称</td>
		<td class="qinput">
		<input type='hidden' id="porgCode"  name="orgCode" class="param"/>
		<input type="text" name="merName" comparison="like" qtype="string"/></td>
			<td class="qlabel">内部商户号</td>
		<td class="qinput"><input  type="text" name="orgCode" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>
<!-- 银行选择弹出窗口 -->
<div id="bankSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">银行名称</td>
		<td class="qinput">
		<input type='hidden' id="porgCode"  name="orgCode" class="param"/>
		<input type="text" name="bankName" comparison="like" qtype="string"/></td>
			<td class="qlabel">银行号</td>
		<td class="qinput"><input  type="text" name="orgCode" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>
<div id="addMerOrgAsk" style="display: none;">
<form id="form1" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>银行号：</TD>
			<TD class="finput"><INPUT id="bankCode" maxLength="10" name="bankCode" readonly="readonly">
			<div id="bankCodeTip"></div>
			</TD>
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>内部商户号：</TD>
			<TD class="finput"><INPUT id="merCode" maxLength="15" name="merCode" readonly="readonly">
			<div id="merOrgTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>外部商户号：</TD>
			<TD class="finput"><INPUT maxLength="15" id="merOutCode"
				name="merOutCode" >
			<div id="merOutCodeTip"></div>	
			</TD>		
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>起效清算日：</TD>
			<TD class="finput"><INPUT maxLength="8" id="startDate" name="startDate" readonly="readonly">
			<div id="startDateTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>失效清算日：</TD>
			<TD class="finput"><INPUT maxLength="8" id="endDate" name="endDate" readonly="readonly">
			<div id="endDateTip"></div>
			</TD>
			<TD class="flabel">外部标识码：</TD>
			<TD class="finput"><INPUT id="merOutAcquireInstitCode" maxLength="11" name="merOutAcquireInstitCode">
			<div id="merOutAcquireInstitCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">对银联的商户类别码（MCC）：</TD>
			<TD class="finput"><INPUT maxLength="10" id="mccCups" name="mccCups" >
			<div id="mccCupsTip"></div>
			</TD>
			<TD class="flabel">受卡方名称：</TD>
			<TD class="finput"><INPUT maxLength="20" id="cardAcceptName" name="cardAcceptName">
			<div id="cardAcceptNameTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">特殊计费类型：</TD>
			<TD class="finput"><INPUT maxLength="2" id="sepcialchargeType" name="sepcialchargeType" >
			<div id="sepcialchargeTypeTip"></div>
			</TD>
			<TD class="flabel">特殊计费级别：</TD>
			<TD class="finput"><INPUT maxLength="1" id="sepcialchargeLevel" name="sepcialchargeLevel">
			<div id="sepcialchargeLevelTip"></div>
			</TD>		
		</TR>
		<TR >
			<TD class="flabel">位商户扣率，值为扣率*10000：</TD>
			<TD class="finput"><INPUT maxLength="6" id="busiDeductionRate" name="busiDeductionRate" >
			<div id="busiDeductionRateTip"></div>
			</TD>
			<TD class="flabel"></TD>
			<TD class="finput"><INPUT id="askBatchNo"  name="askBatchNo" type="hidden"/></TD>
		<TR >		
	</TBODY>

</table>
<input id="formreset1" style="display: none;" type="reset" /></form>
</div>

<div id="merOrgAskTidDetail" style="display: none;">
<form id="form2" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">银行号：</TD>
			<TD class="finput"><INPUT id="dbankCode"  name="bankCode" readonly="readonly">
			</TD>
			<TD class="flabel">银行名称：</TD>
			<TD class="finput"><INPUT id="dbankName"  name="bankName" readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">内部商户号：</TD>
			<TD class="finput"><INPUT id="dmerCode"  name="merCode" readonly="readonly">
			</TD>
			<TD class="flabel">商户名称：</TD>
			<TD class="finput"><INPUT id="dmerName"  name="merName" readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部商户号：</TD>
			<TD class="finput"><INPUT  id="dmerOutCode" name="merOutCode" readonly="readonly">
			</TD>
			<TD class="flabel">申请批次：</TD>
			<TD class="finput"><INPUT id="daskBatchNo"  name="askBatchNo" readonly="readonly">
			</TD>
		</TR>		
		<TR >
			<TD class="flabel">起效清算日：</TD>
			<TD class="finput"><INPUT  id="dstartDate" name="startDate" readonly="readonly">
			</TD>
			<TD class="flabel">失效清算日：</TD>
			<TD class="finput"><INPUT  id="dendDate" name="endDate" readonly="readonly">
			</TD>
		<TR >
		<TR >
			<TD class="flabel">外部标识码：</TD>
			<TD class="finput"><INPUT id="dmerOutAcquireInstitCode"  name="merOutAcquireInstitCode" readonly="readonly">
			</TD>
			<TD class="flabel">对银联的商户类别码（MCC）：</TD>
			<TD class="finput"><INPUT  id="dmccCups" name="mccCups" readonly="readonly">
			</TD>
		<TR >
		<TR >	
			<TD class="flabel">受卡方名称：</TD>
			<TD class="finput"><INPUT id="dcardAcceptName" name="cardAcceptName" readonly="readonly">
			</TD>
			<TD class="flabel">特殊计费类型：</TD>
			<TD class="finput"><INPUT  id="dsepcialchargeType" name="sepcialchargeType" readonly="readonly">
			</TD>
		<TR >
		<TR >	
			<TD class="flabel">特殊计费级别：</TD>
			<TD class="finput"><INPUT  id="dsepcialchargeLevel" name="sepcialchargeLevel" readonly="readonly">
			</TD>		
			<TD class="flabel">位商户扣率，值为扣率*10000：</TD>
			<TD class="finput"><INPUT  id="dbusiDeductionRate" name="busiDeductionRate" readonly="readonly">
			</TD>
		<TR >
		<TR >	
			<TD class="flabel">审批状态：</TD>
			<TD class="finput"><INPUT  id="dcheckStatueZh" name="checkStatueZh" readonly="readonly">
			</TD>		
			<TD class="flabel">删除标志：</TD>
			<TD class="finput"><INPUT  id="deraseFlagZh" name="eraseFlagZh" readonly="readonly">
			</TD>
		<TR >	
		<TR >	
			<TD class="flabel">最后更新时间：</TD>
			<TD class="finput"><INPUT  id="dlastUptTime" name="lastUptTime" readonly="readonly">
			</TD>		
			<TD class="flabel">最后更新账户：</TD>
			<TD class="finput"><INPUT  id="dlastUptAcc" name="lastUptAcc" readonly="readonly">
			</TD>
		<TR >
		<TR >	
			<TD class="flabel">最后更新机构：</TD>
			<TD class="finput"><INPUT  id="dlastUptOrg" name="lastUptOrg" readonly="readonly">
			</TD>		
			<TD class="flabel">最后更新机构名称：</TD>
			<TD class="finput"><INPUT  id="dlastUptOrgName" name="lastUptOrgName" readonly="readonly">
			</TD>
		<TR >		
	</TBODY>

</table>
<input id="formreset2" style="display: none;" type="reset" /></form>
</div>
<!-- 导入excel文件 -->
    <form id="upfileform" >
	<table class="ftable" cellpadding="1" cellspacing="1"  width="100%" >
	<TBODY>
		<TR >
			<TD class="flabel">导入Excel文件</TD>
			<TD class="finput">
			<input id="upLoadfile" type="file" name="upLoadfile" />
			 </TD>
		</TR>
	</TBODY>
	</table>
</form>
</body>
</html>