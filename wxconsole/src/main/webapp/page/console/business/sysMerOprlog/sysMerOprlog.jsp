<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户平台日志查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/sysMerOprlog/sysMerOprlog.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="status" comparison="eq" ftype="stringlist" qtype="stringlist" value="00,01,02,05,06"/>
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
	<td class="qlabel">操作时间</td>
	<td class="qinput"><input type="text" id="oprTime" maxlength="14" comparison="like" name="oprTime"></td>	
	<td class="qlabel">操作员登录名</td>
	<td class="qinput">	<input type="text" id="oprLoginId" maxlength="20" comparison="eq" name="oprLoginId">
	<td class="qlabel">操作名称</td>
	<td class="qinput"><input type="text" id="resZh" maxlength="20" comparison="like" name="resZh"></td>	
	</tr>
	<tr>
		<td bgcolor="#ffffff" colspan="6" align="center"><input
			class="bt" id="querybutton" value="查询" type="button"> <input
			value="重置" class="bt" type="reset" /></td>
	</tr>
</table>
</form>
</div>
<div id="table"></div>

<div id="tidDetail" style="display: none;">
<form id="form2" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tbody>
		<tr>
            <td class="qlabel"> 操作流水号:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprNo" name="oprNo" type="text" /></td>
        </tr>
        <tr>
            <td class="qlabel"> 清算日期: </td>
            <td class="qinput"><input class="qFormInput" id="u_stlmDate" name="stlmDate" type="text"/></td>
        </tr>
        <tr>    
            <td class="qlabel">资源id:</td>
            <td class="qinput"><input class="qFormInput" id="u_resId" name="resId" type="text" /></td>
        </tr>
        <tr>    
            <td class="qlabel">资源中文:</td>
            <td class="qinput"><input class="qFormInput" id="u_resZh" name="resZh" type="text" /></td>
        </tr>
        <tr>    
            <td class="qlabel">操作人id:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprUserId" name="oprUserId" type="text" /></td>
        </tr>
        <tr>    
            <td class="qlabel">操作人登陆id:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprLoginId" name="oprLoginId" type="text" /></td>
        </tr>
        <tr>    
            <td class="qlabel">操作URL:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprUrl" name="oprUrl" type="text" /></td>
        </tr>
        <tr>    
            <td class="qlabel">操作时间:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprTime" name="oprTime" type="text" /></td>
        </tr>
        <tr>    
            <td class="qlabel">操作方ip:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprIp" name="oprIp" type="text" /></td>
        </tr>
		<tr>    
            <td class="qlabel">操作是否成功:</td>
            <td class="qinput"><input class="qFormInput" id="u_oprSuccess" name="oprSuccess" type="text" /></td>
        </tr>
	</tbody>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>
</body>
</html>