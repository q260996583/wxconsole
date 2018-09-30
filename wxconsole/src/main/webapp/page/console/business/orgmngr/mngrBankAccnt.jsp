<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>银行账户信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrBankAccnt.js"></script>

</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">支行名称</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=bankName size=20 /></td>
		<td class="qlabel">行号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=bankNo  maxlength="25" /></td>	
		<td class="qlabel">账号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=accntNo  maxlength="25" /></td>			
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


<div id="addBankAccnt" style="display: none;">
<form id="form1" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<INPUT id=bankAccntId name=bankAccntId style="display:none;">
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>总行名称：</TD>
			<TD class="finput"><INPUT id=bankTitle  name=bankTitle maxLength="50">
			<div id="bankTitleTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>支行名称：</TD>
			<TD class="finput"><INPUT id=bankName  name=bankName maxLength="50">
			<div id="bankNameTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>行号：</TD>
			<TD class="finput"><INPUT id=bankNo maxLength=15 name=bankNo>
			<div id="bankNoTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>账号：</TD>
			<TD class="finput"><INPUT id=accntNo  name=accntNo maxLength="25">
			<div id="accntNoTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>账户名称：</TD>
			<TD class="finput"><INPUT id=accntName  name=accntName maxLength="50">
			<div id="accntNameTip"></div>
			</TD>
		</TR>
		<TR id="bankAccntType" style="display:none;">
			<TD class="flabel" >账户类型：</TD>
			<TD class="finput">
				<SELECT name="bankAccntType" id="bankAccntType">
					<OPTION selected value=0>账户</OPTION>
					<OPTION value=1>机构账户</OPTION>
					<OPTION value=2>假账户</OPTION>
				</SELECT> 
			</TD>
		</TR>
	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" />
</form>
</div>


</body>
</html>