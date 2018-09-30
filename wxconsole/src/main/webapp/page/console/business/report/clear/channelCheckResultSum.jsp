<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大丰收积分对账</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/report/clear/channelCheckResultSum.js"></script>

</head>
<body>
	
	
	<div>
		<form id="queryForm">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始日期</td>
					<td class="qinput"><input comparison="ge" id="startDate"
						qtype="string" type="text" name=startDate maxlength="15" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束日期</td>
					<td class="qinput"><input comparison="le" id="endDate"
						qtype="string" type="text" name=endDate maxlength="15" /></td>
					<td class="qlabel">下载状态</td>
					<td class="qinput"><select id="getCheckFile" comparison="eq"
						name="getCheckFile"></select></td>
				</tr>

				<tr>
					<td class="qlabel">对账状态</td>
					<td class="qinput"><select id="checkFlag" comparison="eq"
						name="checkFlag"></select></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
				</tr>

				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" />
				</tr>


			</table>
		</form>
	</div>

	<DIV id="table"></DIV>


</body>
</html>