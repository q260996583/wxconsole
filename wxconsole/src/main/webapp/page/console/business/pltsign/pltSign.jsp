<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>支付机构信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/pltsign/pltSign.js"></script>

</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">签到状态</td>
		<td class="qinput"><select id="signStat" name="signStat" comparison="eq"></select></td>
		<td>
			<input id="querybutton" class="bt" value="查询"  type="button">
  			<input class="bt" value="重置" type="reset" />
  		</td>	
		</tr>
		
</table>
</form>
</div>
<DIV id="table"></DIV>

</body>
</html>