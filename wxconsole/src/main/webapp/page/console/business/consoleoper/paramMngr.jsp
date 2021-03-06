<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>系统配置参数管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/consoleoper/paramMngr.js"></script>
	
</head>
<body>
<div id="queryCondition" style="background-color: #FBFEFF; padding: 5px; border-style: solid none none; border-width: 1px; border-color: #B9B9B9;">
<form id="queryForm">
<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
	<tr>
	
	<td class="qlabel">参数序号</td>
	<td class="qinput">	<input type="text"  comparison="eq" name="type"></td>	
		<td class="qlabel">参数描述</td>
		<td class="qinput">	<input type="text" id="typeDesc" comparison="like" name="typeDesc">
		<td class="qlabel"></td>
	<td class="qinput"></td>	
	</tr>
	<tr>
		<td bgcolor="#ffffff" colspan="6" align="center"><input
			class="bt" id="querybutton" value="查询" type="button"> <input
			value="重置" class="bt" type="reset" /></td>
	</tr>
</table>
</form>
</div>
<DIV id="table"></DIV>
<form id="infoDtlQuery" class="fform">
<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
	<TBODY>
		<TR>
			<TD class="flabel">参数序号：</TD>
			<TD class="finput"><INPUT maxLength=10 id="type"
				name="type">
			<div id="typeQ"></div>
		</TR>
			<TR>
			<TD class="flabel">参数细分码：</TD>
			<TD class="finput"><INPUT maxLength=20 id="code"
				name="code">
			<div id="codeQ"></div>
		</TR>
			<TR>
			<TD class="flabel">描述：</TD>
			<TD class="finput"><INPUT maxLength=500 id="typeDesc"
				name="typeDesc">
			<div id="typeDescQ"></div>
		</TR>
			<TR>
			<TD class="flabel">参数配置一：</TD>
			<TD class="finput"><INPUT maxLength=200 id="display1"
				name="display1">
			<div id="display1Q"></div>
		</TR>
			<TR>
			<TD class="flabel">参数配置二：</TD>
			<TD class="finput"><INPUT maxLength=200 id="display2"
				name="display2">
			<div id="display2Q"></div>
		</TR>
			<TR>
			<TD class="flabel">状态：</TD>
			<TD class="finput"><select  id="status"
				name="status">
				<option value="0">停用</option>
				<option value="1">启用</option>
			</select>
			<div id="stutasQ"></div>
		</TR>
	</TBODY>
</table>
</form>



<form id="infoDtlQueryEdit" class="fform">
<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
	<TBODY>

		<TR>
			<TD class="flabel">参数序号：</TD>
			<TD class="finput"><INPUT maxLength=20 id="type" style= "background:none;border:none;" 
			readonly="readonly"	 name="type">
			<div id="typeQ"></div>
		</TR>
		
			<TR>
			<TD class="flabel">参数细分码：</TD>
			<TD class="finput"><INPUT maxLength=20 id="code"
				name="code">
			<div id="codeQ"></div>
		</TR>
		
			<TR>
			<TD class="flabel">描述：</TD>
			<TD class="finput"><INPUT maxLength=200 id="typeDesc" style= "background:none;border:none;"
			readonly="readonly"	name="typeDesc">
			<div id="typeDescQ"></div>
		</TR>
		
			<TR>
			<TD class="flabel">参数配置一：</TD>
			<TD class="finput"><INPUT maxLength=200 id="display1"
				name="display1">
			<div id="display1Q"></div>
		</TR>
		
			<TR>
			<TD class="flabel">参数配置二：</TD>
			<TD class="finput"><INPUT maxLength=200 id="display2"
				name="display2">
			<div id="display2Q"></div>
		</TR>
		
			<TR>
			<TD class="flabel">状态：</TD>
			<TD class="finput">
			<select  id="status"	name="status">
				<option value="0">停用</option>
				<option value="1">启用</option>
			</select>
			<div id="stutasQ"></div>
		</TR>
		

	</TBODY>
</table>
</form>




</body>
</html>