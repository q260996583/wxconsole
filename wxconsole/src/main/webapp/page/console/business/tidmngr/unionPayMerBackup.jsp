<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户信息报备</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/tidmngr/unionPayMerBackup.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel"><font color='red'>*</font>开始时间</td>
		<td class="qinput"><input type="text" value="" comparison="ge"
			qtype="string" id=startTime name=startTime size=20 /></td>
		<td class="qlabel"><font color='red'>*</font>结束时间</td>
		<td class="qinput"><input type="text" value="" comparison="le"
			qtype="string" id=endTime name=endTime  maxlength="15" /></td>	
	</tr>
	<tr>
		<td class="qlabel">上次导出时间</td>
		<td bgcolor="#ffffff"  colspan="3" align="left"><s:property value="result"></s:property></td>
	</tr>
	<tr>
	  <td bgcolor="#ffffff"  colspan="4" align="center">
	  <input id="querybutton" class="bt" value="查询"  type="button">
	  <input class="bt" value="重置" type="reset" />
	  <input id="downFile" class="bt" value="导出文件"  type="button">
	  </td>
	</tr>
</table>
</form>
</div>
<iframe id="printFrame" src="" frameborder="0" scrolling="auto"
		width="100%" height="500"> </iframe>
</body>
</html>