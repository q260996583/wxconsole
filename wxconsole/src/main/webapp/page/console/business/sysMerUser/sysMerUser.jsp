<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户用户解锁</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/sysMerUser/sysMerUser.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="islocked" comparison="eq" value="1"/>
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
	<td class="qlabel">操作员登录名</td>
	<td class="qinput">	<input type="text" id="loginid" maxlength="20" comparison="eq" name="loginid">
	</tr>
	<tr>
		<td bgcolor="#ffffff" colspan="6" align="center"><input
			class="bt" id="querybutton" value="查询" type="button"> <input
			value="重置" class="bt" type="reset" /></td>
	</tr>
</table>
</form>
</div>
<div id="table"></div>

</body>
</html>