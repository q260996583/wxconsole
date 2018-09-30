<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户编码规则配置</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/parameter/midRule.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;display:none;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qbutton" colspan="10" align="center">
		<button class='bt' id="querybutton" type="button">查 询</button>
		<button class='bt' id="change" type="reset">重置</button>
		</td>
	</tr>
</table>
</form>
</div>
<div id="table"></div>
<div id="addOper" style="display: none;">
<form id="form1" >
<input type="hidden" name="version" />
<input type="hidden" name="paramCode" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tbody>
		<tr >
			<td class="flabel"><font color="red">&nbsp;*</font>商户编码前三位：</td>
			<td class="finput"><input id="paramValue" maxLength="3" name="paramValue" />
			<div id="paramValueTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">描述：</td>
			<td class="finput"><textarea id="paramDesc" maxLength="120" name="paramDesc" ></textarea>
			<div id="paramDescTip"></div>
			</td>
		</tr>
	</tbody>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>
</body>
</html>