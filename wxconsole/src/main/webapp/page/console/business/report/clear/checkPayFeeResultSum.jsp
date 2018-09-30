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
	src="pagejs/console/business/report/clear/checkPayFeeResultSum.js"></script>

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
					<td class="qinput"><input comparison="ge" id="theDate"
						qtype="string" type="text" name=stlmDate maxlength="15" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束日期</td>
					<td class="qinput"><input comparison="le" id="theDateEnd"
						qtype="string" type="text" name=stlmDate maxlength="15" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>支付机构</td>
					<td class="qinput">
						<INPUT style="display: none;" id="bankId" name="bankId" comparison="eq">
						<INPUT id="qbankName" name="qbankName" readonly="readonly">
					</td>
				</tr>

				<tr>
					<td class="qlabel">下载状态</td>
					<td class="qinput"><select id="downloadStat" comparison="eq"
						name="downloadStat"></select></td>
					<td class="qlabel">对账状态</td>
					<td class="qinput"><select id="acctStat" comparison="eq"
						name="acctStat"></select></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
				</tr>

				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" />
				</tr>


			</table>
		</form>
	</div>

	<DIV id="table"></DIV>


</body>
</html>