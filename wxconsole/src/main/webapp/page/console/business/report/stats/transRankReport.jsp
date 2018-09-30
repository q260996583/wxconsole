<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/report/stats/transRankReport.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
			$('#printbt').click(
				function() {
					var fram1 = document.frames('printFrame');
					fram1.document.body.insertAdjacentHTML(
						"beforeEnd",
						"<object id=\"WebBrowser\" width=0 height=0 classid=\"CLSID:8856F961-340A-11D0-A96B-00C04FD705A2\">");
					var HKEY_Root, HKEY_Path, HKEY_Key;
					HKEY_Root = "HKEY_CURRENT_USER";
					HKEY_Path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
					//设置网页打印的页眉页脚为空    
					try {
						var Wsh = new ActiveXObject("WScript.Shell");
						HKEY_Key = "header";
						Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key,"");
						HKEY_Key = "footer";
						Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key,"");
					} catch (e) {}
					document.all.printFrame.ExecWB(7, 1);
				});
			});
</script>
</head>
<body>
	<!-- 商户选择弹出窗口 -->
	<div id="merSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>			
					<td class="qlabel">商户名称</td>
					<td class="qinput">
						<input type="text" name="merName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">商户代码</td>
					<td class="qinput">
						<input type="text" name="orgCode" comparison="like" qtype="string" />				
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

	<!-- 服务商选择弹出窗口 -->
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

			<div>
		<form id="queryForm">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr><td class="qlabel"><font color="red">*</font>报表类型</td>
					<td class="qinput"><select  id="reportType" name="reportType">
							<option value="" selected="selected"></option>					
							<option value="POS_MER_TANSRANK_STATS">商户交易排行表</option>
							<option value="POS_TID_TANSRANK_STATS">终端交易排行表</option>						
					</select></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始日期</td>
					<td class="qinput"><input id="startDate" name="startDate" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束日期</td>
					<td class="qinput"><input id="endDate" name="endDate" /></td>					
				</tr><tr>
					<td class="qlabel"><font color="red">*</font>报表排序</td>
					<td class="qinput"><select  id="seqType" name="seqType">
							<option value="" selected="selected"></option>					
							<option value="0">按照交易笔数排序</option>
							<option value="1">按照交易金额排序</option>						
					</select></td>
					<td class="qlabel">检索条数</td>
					<td class="qinput"><input id="count" name="count" /></td>
					<td class="qlabel">商户</td>
					<td class="qinput">
						<INPUT style="display: none;" id="mid" name="mid" comparison="eq">
						<INPUT id="qmerName" name="qmerName" readonly="readonly">
					</td>
					</tr>
					<tr>
				<td class="qlabel">服务商名称</td>
					<td class="qinput">
					<INPUT style="display: none;" id="channelCode" name="channelCode" comparison="eq">
						<INPUT id="channelName" name="channelName" readonly="readonly" comparison="eq">
						</td>
				<td class="qlabel"></td>
					<td class="qinput"></td>
				<td class="qlabel"></td>
					<td class="qinput"></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="8" align="center">
						<input id="querybutton" class="bt" value="查询" type="button"> 
						<input class="bt" value="重置" type="reset" /> 
						<input type="button" class="bt" id="downFileExl" value="导出Execl" />
					</td>
				</tr>


			</table>
		</form>
	</div>
	
	
	
	
	<center><iframe id="printFrame" align="middle" src="" frameborder="0" scrolling="auto"
		width="100%" height="500"> </iframe></center>
	
	
</body>
</html>