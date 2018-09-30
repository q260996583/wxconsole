<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>大丰收积分查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/trans/querySocreChannel.js"></script>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">开始日期</td>
					<td class="qinput"><input id="dateStart" name="stlmDate" comparison="ge" /></td>
					<td class="qlabel">结束日期</td>
					<td class="qinput"><input id="dateEnd" name="stlmDate" comparison="le" /></td>
				</tr>
				<tr>	
					<td class="qlabel">服务商名称</td>
					<td class="qinput"><INPUT style="display: none;" id="qChanCode"
						name="channelCode" comparison="eq"> <INPUT id="qChanName"
						name="ChannelName" readonly="readonly"></td>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><INPUT style="display: none;" id="qmid"
						name="mid" comparison="eq"> <INPUT id="qmerName"
						name="qmerName" readonly="readonly"></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="4" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /><input
						id="exlbutton" class="bt" value="导出EXCEL" type="button"/></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>
	<!-- 上级机构选择弹出窗口 -->
	<div id="merchantSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" name="merName"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">商户代码</td>
					<td class="qinput"><input type="text" name="orgCode"
						comparison="like" qtype="string" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="channelSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">服务商名称</td>
					<td class="qinput">
						<input type="text" name="channelName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">服务商代码</td>
					<td class="qinput">
						<input type="text" name="channelCode" comparison="like" qtype="string" />
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>