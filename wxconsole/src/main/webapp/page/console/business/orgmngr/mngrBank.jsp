<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>支付机构信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrBank.js"></script>

</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">支付机构名称</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=bankName size=20 /></td>
		<td class="qlabel">内部机构号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=orgCode  maxlength="15" /></td>	
		<td class="qlabel">外部机构号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=bankId  maxlength="15" /></td>			
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


<div id="addbank" style="display: none;">
<form id="form1" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<INPUT id=orgCode name=orgCode style="display:none;">
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>外部机构号：</TD>
			<TD class="finput"><INPUT id=bankId maxLength=15 name=bankId>
			<div id="bankIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>支付机构名称：</TD>
			<TD class="finput"><INPUT id=bankName  name=bankName >
			<div id="bankNameTip"></div>
			</TD>
		</TR>
				
		<TR id="conTypeInfo">
			<TD class="flabel" ><FONT color=red>&nbsp;*</FONT>接入方式：</TD>
			<TD class="finput">
				<SELECT name="conType" id="conType">
					<OPTION selected value=00>间联</OPTION>
					<OPTION value=10>直连支付网关（线上）</OPTION>
					<OPTION value=20>直连银行（线下）</OPTION>
				</SELECT> 
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>手续费率(%)：</TD>
			<TD class="finput"><INPUT id=feeRateDcm  name=feeRateDcm >
			<div id="feeRateDcmTip"></div>
			</TD>
		</TR>
				
		<TR >
			<TD class="flabel">备注：</TD>
			<TD class="finput">
			<textarea id="remark" name=remark></textarea>
			<div id="remarkTip"></div>
			</TD>
		</TR>

	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" />
</form>
</div>
<!-- 
<div id="editbank" style="display: none;">
<form id="form2" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>内部机构号：</TD>
			<TD class="finput"><INPUT id=orgCode maxLength=15 name=orgCode disabled="disabled">
			<div id="orgCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>外部机构号：</TD>
			<TD class="finput"><INPUT id=bankId maxLength=15 name=bankId>
			<div id="bankIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>支付机构名称：</TD>
			<TD class="finput"><INPUT id=bankName  name=bankName >
			<div id="bankNameTip"></div>
			</TD>
		</TR>
				
		<TR id="conTypeInfo">
			<TD class="flabel" ><FONT color=red>&nbsp;*</FONT>接入方式：</TD>
			<TD class="finput">
				<SELECT name="conType" id="conType">
					<OPTION selected value=00>间联</OPTION>
					<OPTION value=10>直连支付网关（线上）</OPTION>
					<OPTION value=20>直连银行（线下）</OPTION>
				</SELECT> 
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>手续费率(%)：</TD>
			<TD class="finput"><INPUT id=feeRateDcm  name=feeRateDcm >
			<div id="feeRateDcmTip"></div>
			</TD>
		</TR>
				
		<TR >
			<TD class="flabel">备注：</TD>
			<TD class="finput">
			<textarea id="remark" name=remark></textarea>
			<div id="remarkTip"></div>
			</TD>
		</TR>

	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" />
</form>
</div> -->

</body>
</html>