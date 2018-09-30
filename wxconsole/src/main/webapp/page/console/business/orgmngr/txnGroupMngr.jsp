<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>交易组管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/txnGroupMngr.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">组名称:</td>
		<td class="qinput">
			<input type="text" name="title" comparison="like" qtype="string" />
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
		<tr>
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>组号:</td>
			<td class="finput"><input type="text" id="groupNo" name="groupNo" maxLength="100" /><div id="groupNoTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>组名称:</td>
			<td class="finput"><input type="text" id="groupName" name="groupName" maxLength="100" /><div id="groupNameTip"></div>
			</td>
		</tr>
		<tr>
			<td class="flabel">交易码:</td>
			<td>	
				<div class="restree">
					<div id="txnGrid" ></div>
				</div>
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
		<tr>
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>组号:</td>
			<td class="finput"><input type="text" id="v_groupNo" name="groupNo" maxLength="100" /><div id="groupNoTip"></div>
			</td>
		</tr>
		<tr>
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>组名称:</td>
			<td class="finput"><input type="text" id="v_groupName" name="groupName" />
			</td>
		</tr>
		<tr>
			<td class="flabel">交易码:</td>
			<td>	
				<div class="restree">
					<div id="v_txnGrid" ></div>
				</div>
			</td>
		</tr>
	</tbody>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>
</body>
</html>