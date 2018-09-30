<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>建行批量批结算签退签到</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/batch/ccbBatchLogin.js"></script>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
				    <td class="qlabel">当前处理最大ID_SEQ</td>
					<td class="qinput"><input id="qcurrIdSeq" name="currIdSeq" /></td>
					<td class="qlabel">轮询状态</td>
					<td class="qinput">
						<input type="hidden" id="qcycleStat" name="cycleStat" />
						<input id="qcycleStatName" name="cycleStatName" />
					</td>
					 <td class="qlabel">最后更新时间</td>
					<td class="qinput"><input id="qupdatetime" name="updatetime" /></td>
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