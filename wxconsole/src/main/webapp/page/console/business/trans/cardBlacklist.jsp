<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>卡黑名单维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/trans/mngrCardBlacklist.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">黑名单卡号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=cardNo  maxlength="19" /></td>			
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


<div id="addCardNo" style="display: none;">
<form id="form1" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>黑名单卡号</TD>
			<TD class="finput"><INPUT id=cardNo  name=cardNo >
			<div id="cardNoTip"></div>
			</TD>
		</TR>
		

	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" />
</form>
</div>


</body>
</html>