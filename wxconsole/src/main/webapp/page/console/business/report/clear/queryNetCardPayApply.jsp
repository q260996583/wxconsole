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
	src="pagejs/console/business/report/clear/queryNetCardPayApply.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#printbt')
								.click(
										function() {
											var fram1 = document
													.frames('printFrame');
											fram1.document.body
													.insertAdjacentHTML(
															"beforeEnd",
															"<object id=\"WebBrowser\" width=0 height=0 classid=\"CLSID:8856F961-340A-11D0-A96B-00C04FD705A2\">");
											var HKEY_Root, HKEY_Path, HKEY_Key;
											HKEY_Root = "HKEY_CURRENT_USER";
											HKEY_Path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
											//设置网页打印的页眉页脚为空    
											try {
												var Wsh = new ActiveXObject(
														"WScript.Shell");
												HKEY_Key = "header";
												Wsh.RegWrite(HKEY_Root
														+ HKEY_Path + HKEY_Key,
														"");
												HKEY_Key = "footer";
												Wsh.RegWrite(HKEY_Root
														+ HKEY_Path + HKEY_Key,
														"");
											} catch (e) {
											}
											document.all.printFrame
													.ExecWB(7, 1);

										});
					});
</script>
</head>
<body>

	<!-- 支付机构选择弹出窗口 -->
	<div id="bankSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">支付机构名称</td>
					<td class="qinput">
						<input type="text" name="bankName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">支付机构代码</td>
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

	<div>
		<form id="queryForm">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始日期</td>
					<td class="qinput"><input id="dateStart" name="dateStart" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束日期</td>
					<td class="qinput"><input id="dateEnd" name="dateEnd" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>支付机构</td>
					<td class="qinput">
						<INPUT style="display: none;" id="bankId" name="bankId" comparison="eq">
						<INPUT id="qbankName" name="qbankName" readonly="readonly">
					</td>
				</tr>

				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center">
						<input id="querybutton" class="bt" value="查询" type="button"> 
						<input class="bt" value="重置" type="reset" /> 
						<input type="button" class="bt" id="downFile" value="导出文件" />
						<input type="button" class="bt" id="downFileExl" value="导出Execl" />
					</td>
				</tr>


			</table>
		</form>
	</div>
	
	<div>
	<iframe id="printFrame" src="" frameborder="0" scrolling="auto"
		width="100%" height="1000"> </iframe>
	</div>
	
</body>
</html>