<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>退货生效查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/trans/selectRealReturn.js"></script>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">清算日期</td>
					<td class="qinput"><input id="pospStmt" name="pospStmt" comparison="eq" /></td>
					<td class="qlabel">退货日期</td>
					<td class="qinput"><input id="applyDate" name="stlmDate" comparison="eq" /></td>
					<td class="qlabel">退货生效日期</td>
					<td class="qinput"><input id="realDate" name="realStlmDate" comparison="eq" /></td>
				</tr>
				<tr>	
					<td class="qlabel">退货清算状态</td>
					<td class="qinput"><select id="stlmStatus" name="stlmStatus"
						comparison="eq"></select></td>
					<td class="qlabel">原中心交易流水</td>
					<td class="qinput"><INPUT id="oriTransSeq" name="oriTransSeq"
						comparison="eq"></td>
					<td class="qlabel">商户号</td>
					<td class="qinput"><INPUT id="mid" name="mid"
						comparison="eq"></td>
				</tr>
				<tr>	
					<td class="qlabel">商户名称</td>
					<td class="qinput"><INPUT id="merName" name="merName"
						comparison="like"></td>
					<td class="qlabel">卡号</td>
					<td class="qinput"><INPUT id="pan" name="pan"
						comparison="like"></td>
					<td ></td>
					<td ></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /></td>
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

	<div id="posTransDetail"styley:none;">
		<form id="form2">
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<TBODY>
					<TR>
						<TD class="flabel">清算日期：</TD>
						<TD class="finput"><INPUT disabled id=pospStmtDesc name=pospStmtDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">原中心交易流水：</TD>
						<TD class="finput"><INPUT disabled id=oriTransSeq name=oriTransSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原终端交易流水：</TD>
						<TD class="finput"><INPUT disabled id=oriTidSeq name=oriTidSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原交易批次：</TD>
						<TD class="finput"><INPUT disabled id=oriBatchNo name=oriBatchNo>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原银联交易金额(元)：</TD>
						<TD class="finput"><INPUT disabled id="transAmtDesc" name="transAmtDesc">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">总退货金额(元)：</TD>
						<TD class="finput"><INPUT disabled id="backAmtDesc" name=backAmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">实际退货金额(元)：</TD>
						<TD class="finput"><INPUT disabled id="mBackAmtDesc" name=mBackAmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">货币代码：</TD>
						<TD class="finput"><INPUT disabled id="amtCode" name=amtCode></TD>
					</TR>
					<TR>
						<TD class="flabel">商户名称：</TD>
						<TD class="finput"><INPUT disabled id="merName" name=merName></TD>
					</TR>
					<TR>
						<TD class="flabel">终端号：</TD>
						<TD class="finput"><INPUT disabled id="tid" name=tid></TD>
					</TR>
					<TR>
						<TD class="flabel">主帐号：</TD>
						<TD class="finput"><INPUT disabled id="pan" name=pan>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退货状态：</TD>
						<TD class="finput"><INPUT disabled id="backStatZh" name=backStatZh></TD>
					</TR>
					<TR>
						<TD class="flabel">退货提交人：</TD>
						<TD class="finput"><INPUT disabled id="applyAcc" name=applyAcc></TD>
					</TR>
					<TR>
						<TD class="flabel">退货时间：</TD>
						<TD class="finput"><INPUT disabled id="applyTMDesc" name=applyTMDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退货审批人：</TD>
						<TD class="finput"><INPUT disabled id="confirmAcc" name=confirmAcc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退货审批时间：</TD>
						<TD class="finput"><INPUT disabled id="confirmTMDesc" name=confirmTMDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel"><FONT color=red>&nbsp;*</FONT>审批意见：</TD>
						<TD class="finput"><textarea disabled id="confirmMemo" name=confirmMemo></textarea></TD>
					</TR>
				</TBODY>

			</table>
			<input id="formreset" style="display: none;" type="reset" />
		</form>
	</div>


</body>
</html>