<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>深圳代付对账</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/report/clear/szdfCheckResultSum.js"></script>

</head>
<body>
	<div>
		<form id="queryForm">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始支付日期</td>
					<td class="qinput"><input comparison="ge" id="theDate"
						qtype="string" type="text" name=theDate maxlength="15" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束支付日期</td>
					<td class="qinput"><input comparison="le" id="theDateEnd"
						qtype="string" type="text" name=theDateEnd maxlength="15" /></td>
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