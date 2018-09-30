<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公告信息管理</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/notice/noticeCheck.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="status" comparison="eq" ftype="stringlist" qtype="stringlist" value="03,04"/>
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
<div id="addtid" style="display: none;">
<form id="form1" >
<input type="hidden" name="noticeSeq" />
<input type="hidden" name="version" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tbody>
		<tr >
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>标题：</td>
			<td class="finput"><input type="text" id="title" name="title" maxLength="255" /><div id="titleTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">
				<FONT color=red>&nbsp;*</FONT>内容：<br/>
				<a id="previewBtn" class="bt" href="javascript:void(0);">预览</a>
			</td>
			<td class="finput"><textarea type="text" id="content" name="content" ></textarea><div id="contentTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">是否置顶：</td>
			<td class="finput"><select id="topFlag" name="topFlag" >
			<option value="0">不置顶</option>
			<option value="1">置顶</option>
			</select><div id="topFlagTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">起效时间：</td>
			<td class="finput"><input type="text" id="startTime" name="startTime" xtype="datetime" readonly="readonly" /><div id="startTimeTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">失效时间：</td>
			<td class="finput"><input type="text" id="endTime" name="endTime" xtype="datetime" readonly="readonly" /><div id="endTimeTip"></div>
			</td>
		</tr>
	</tbody>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="tidDetail" style="display: none;">
<form id="form2" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tbody>
		<tr >
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>标题：</td>
			<td class="finput"><input type="text" id="v_title" name="title" />
			</td>
		</tr>
		<tr >
			<td class="flabel">
				<FONT color=red>&nbsp;*</FONT>内容：<br/>
				<a id="v_previewBtn" class="bt" href="javascript:void(0);">预览</a>
			</td>
			<td class="finput"><textarea id="v_content" name="content" ></textarea>
			</td>
		</tr>
		<tr >
			<td class="flabel">是否置顶：</td>
			<td class="finput"><select id="v_topFlag" name="topFlag" >
			<option value="0">不置顶</option>
			<option value="1">置顶</option>
			</select>
			</td>
		</tr>
		<tr >
			<td class="flabel">状态：</td>
			<td class="finput"><input type="text" id="v_statusDesc" name="statusDesc" />
			</td>
		</tr>
		<tr >
			<td class="flabel">起效时间：</td>
			<td class="finput"><input type="text" id="v_startTime" name="startTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">失效时间：</td>
			<td class="finput"><input type="text" id="v_endTime" name="endTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">记录创建时间：</td>
			<td class="finput"><input type="text" id="v_recCrtTime" name="recCrtTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">记录创建账号：</td>
			<td class="finput"><input type="text" id="v_recCrtAcc" name="recCrtAcc" />
			</td>
		</tr>
		<tr >
			<td class="flabel">最后更新时间：</td>
			<td class="finput"><input type="text" id="v_lastUptTime" name="lastUptTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">最后更新账号：</td>
			<td class="finput"><input type="text" id="v_lastUptAcc" name="lastUptAcc" />
			</td>
		</tr>
		<tr>
			<td class="flabel">公告目标服务商:</td>
			<td>	
				<div class="restree">
					<div id="v_resourceTree" ></div>
				</div>
			</td>
		</tr>
	</tbody>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>
<jsp:include page="pub/content_edit.jsp" />
</body>
</html>