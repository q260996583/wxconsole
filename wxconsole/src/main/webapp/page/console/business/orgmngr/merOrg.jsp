<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>交易商户银行转换</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/merOrg.js"></script>
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

<div id="merOrgDetail" style="display: none;">
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
			<TD class="flabel">起效清算日：</TD>
			<TD class="finput"><INPUT  id="dstartDate" name="startDate" readonly="readonly">
			</TD>
		</TR>		
		<TR >	
			<TD class="flabel">失效清算日：</TD>
			<TD class="finput"><INPUT  id="dendDate" name="endDate" readonly="readonly">
			</TD>		
			<TD class="flabel">外部标识码：</TD>
			<TD class="finput"><INPUT id="dmerOutAcquireInstitCode"  name="merOutAcquireInstitCode" readonly="readonly">
			</TD>
		<TR >
		<TR >
			<TD class="flabel">对银联的商户类别码（MCC）：</TD>
			<TD class="finput"><INPUT  id="dmccCups" name="mccCups" readonly="readonly">
			</TD>		
			<TD class="flabel">受卡方名称：</TD>
			<TD class="finput"><INPUT id="dcardAcceptName" name="cardAcceptName" readonly="readonly">
			</TD>
		<TR >
		<TR >	
			<TD class="flabel">特殊计费类型：</TD>
			<TD class="finput"><INPUT  id="dsepcialchargeType" name="sepcialchargeType" readonly="readonly">
			</TD>	
			<TD class="flabel">特殊计费级别：</TD>
			<TD class="finput"><INPUT  id="dsepcialchargeLevel" name="sepcialchargeLevel" readonly="readonly">
			</TD>
		<TR >
		<TR >			
			<TD class="flabel">位商户扣率，值为扣率*10000：</TD>
			<TD class="finput"><INPUT  id="dbusiDeductionRate" name="busiDeductionRate" readonly="readonly">
			</TD>	
			<TD class="flabel">状态：</TD>
			<TD class="finput"><INPUT  id="dstatueZh" name="statueZh" readonly="readonly">
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
</body>
</html>