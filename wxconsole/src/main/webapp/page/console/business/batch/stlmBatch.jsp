<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>交易流水查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/batch/stlmBatch.js"></script>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">当前清分日期</td>
					<td class="qinput"><input id="qsday" name="sday" /></td>
					<td class="qlabel">批处理状态</td>
					<td class="qinput">
						<input type="hidden" id="qbatchSt" name="batchSt" />
						<input id="qbatchStName" name="batchStName" />
					</td>
				</tr>
				
				<tr style="display: none">
					<td bgcolor="#ffffff" colspan="4" align="center"><input
						id="querybutton" class="bt" value="查询" type="button">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>

</body>
</html>