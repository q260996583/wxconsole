<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>组件实时状态检测</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
</head>
<body>
<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">实时刷新时间:</td>
		<td class="qinput"><input type="text" value="30秒" readonly="readonly"/>
		</td>
	</tr>
	
	
</table>
</form>
</div>
<div><font style="font-weight: bold;">检测结果</font></div>
<DIV id="table1"></DIV>
<div><font style="font-weight: bold;">检测明细</font></div>
<DIV id="table2"></DIV>

</html>
<script type="text/javascript" src="pagejs/console/business/comp/comp.js"></script>