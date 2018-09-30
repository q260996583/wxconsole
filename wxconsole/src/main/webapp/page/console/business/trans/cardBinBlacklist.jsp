<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>卡BIN黑名单维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/trans/cardBinBlacklist.js"></script>

</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">卡BIN</td>
		<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name="cardBin"  maxlength="14" /></td>
	</tr>
	<tr>
  		<td bgcolor="#ffffff"  colspan="2" align="center">
  			<input id="querybutton" class="bt" value="查询"  type="button">
  			<input class="bt" value="重置" type="reset" />
  		</td>
	</tr>
</table>
</form>
</div>
<DIV id="table"></DIV>


<div id="addCardBinBlack" style="display: none;">
<form id="form1" >
<input type="hidden" name="version" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR>
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>卡BIN</TD>
			<TD class="finput"><INPUT id="cardBin"  name="cardBin" maxlength="14"/><div id="cardBinTip"></div></TD>
		</TR>
		
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" />
</form>
</div>


</body>
</html>