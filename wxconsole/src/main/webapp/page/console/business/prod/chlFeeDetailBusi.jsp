<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>查询代理商分润明细</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/prod/chlFeeDetailBusi.js"></script>
</head>
<body>
<!-- 商户选择弹出窗口 -->
<div id="merchantSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">商户名称</td>
		<td class="qinput">
		<input type='hidden' id="porgCode"  name="orgCode" class="param"/>
		<input type="text" name="merName" comparison="like" qtype="string"/></td>
			<td class="qlabel">内部商户号</td>
		<td class="qinput"><input  type="text" name="orgCode" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>
<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">商户号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			id="merCode" qtype="string" name="mid"  maxlength="15" /></td>	
		<td class="qlabel">商户名称</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="merName" size=20 /></td>
		<td class="qlabel">交易时间</td>
		<td class="qinput"><input type="text" value="" comparison="ge" qtype="string" id="transTimeStart" name="transTime" />
		<input type="text" value="" comparison="le" qtype="string" id="transTimeEnd" name="transTime" /></td>		
	</tr>
	<tr>
		<td class="qlabel">服务商号</td>
		<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name="secMerNO" size=20 /></td>
		<td class="qlabel">服务商名称</td>
		<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name="secMerName" size=20 /></td>	
		<td class="qlabel">清算日期</td>
		<td class="qinput"><input type="text" value="" comparison="ge" qtype="string" id="stlmDateStart" name="stlmDate" />
		<input type="text" value="" comparison="le" qtype="string" id="stlmDateEnd" name="stlmDate" /></td>		
	</tr>
	<tr>
		<td class="qlabel">交易方式</td>
		<td class="qinput">
			<select id="transWay" comparison="eq" name="transWay"></td>	
		<td class="qlabel">卡类型</td>
		<td class="qinput">
			<select id="cardType" comparison="eq" name="cardType"></td>	
		<td class="qlabel">交易类型</td>
		<td class="qinput">
			<select id="transType" comparison="eq" name="transType"></td>		
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
</body>
</html>