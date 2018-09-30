<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公告信息管理</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/notice/conNoticeFormal.js"></script>
</head>
<body>
<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<!-- <input type="hidden" name="status" comparison="eq" ftype="stringlist" qtype="stringlist" value="00,01,02,05,06"/> -->
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">标题:</td>
		<td class="qinput">
			<input type="text" name="title" comparison="like" qtype="string" />
		</td>
		<td class="qlabel">起效时间:</td>
		<td class="qinput">
			<input type="text" id="q_startTimeBgn" name="startTime" comparison="gt" qtype="string" xtype="datetime"/>
		</td>
		<td class="qlabel">到:</td>
		<td class="qinput">
			<input type="text" id="q_startTimeEnd" name="startTime" comparison="lt" qtype="string" xtype="datetime"/>
		</td>
	</tr>
	<tr>
		<td class="qlabel">状态:</td>
		<td class="qinput">
			<select type="text" id="q_status" name="status" comparison="eq" ctype="NOTICE_STATUS_MNGR" multiple="multiple" ></select>
		</td>
		<td class="qlabel">失效时间:</td>
		<td class="qinput">
			<input type="text" id="q_endTimeBgn" name="endTime" comparison="gt" qtype="string" xtype="datetime"/>
		</td>
		<td class="qlabel">到:</td>
		<td class="qinput">
			<input type="text" id="q_endTimeEnd" name="endTime" comparison="lt" qtype="string" xtype="datetime"/>
		</td>
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
<div id="table"></div>

<div id="tidDetail" style="display: none;">
<form id="form2" >
	<h4 class="modal-title" id="noticeTitle" ></h4></form>
	<iframe id="noticeContentFrame" name="noticeContentFrame" style="width:100%; border:0; height:370px; "></iframe>
</div>
<div style="display: none">
<form method="POST" id="noticeDetailForm" name="noticeDetailForm" target="noticeContentFrame">
	<input name="jsonObject" id="jsonObject" />
</form>
</div>
</body>
</html>