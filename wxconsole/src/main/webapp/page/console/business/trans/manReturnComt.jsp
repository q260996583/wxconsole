<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>退货提交</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/trans/manReturnComt.js"></script>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>中心交易清算日期</td>
					<td class="qinput"><input id="pospStmt" name="pospStmt" comparison="eq" /></td>
					
					<td class="qlabel">中心交易流水</td>
					<td class="qinput"><INPUT id="transSeq" name="transSeq"
						comparison="eq"></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="4" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>
	
	<div id="posTransDetail"styley:none;">
		<form id="form2">
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<TBODY>
					<TR>
						<TD class="flabel">中心交易时间：</TD>
						<TD class="finput"><INPUT disabled id=transTimeDesc name=transTimeDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">本系统清算日：</TD>
						<TD class="finput"><INPUT disabled id=pospStmtDesc name=pospStmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">主帐号：</TD>
						<TD class="finput"><INPUT disabled id="pan" name="pan">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易金额(元)：</TD>
						<TD class="finput"><INPUT disabled id="transAmtDesc" name=transAmtDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易流水号：</TD>
						<TD class="finput"><INPUT disabled id="tidSeq" name=tidSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易时间：</TD>
						<TD class="finput"><INPUT disabled id="tidTransTimeDesc" name=tidTransTimeDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易日期：</TD>
						<TD class="finput"><INPUT disabled id="tidTransDateDesc" name=tidTransDateDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">中心交易清算日：</TD>
						<TD class="finput"><INPUT disabled id="stlmDateDesc" name=stlmDateDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">中心交易流水：</TD>
						<TD class="finput"><INPUT disabled id="transSeq" name=transSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">终端标识号：</TD>
						<TD class="finput"><INPUT disabled id="tid" name=tid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">商户号：</TD>
						<TD class="finput"><INPUT disabled id="mid" name=mid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">商户名称：</TD>
						<TD class="finput"><textarea disabled id="merName" name=merName></textarea></TD>
					</TR>
					<TR>
						<TD class="flabel">货币代码：</TD>
						<TD class="finput"><INPUT disabled id="amtCode" name=amtCode></TD>
					</TR>
					<TR>
						<TD class="flabel">批次号：</TD>
						<TD class="finput"><INPUT disabled id="batchNo" name=batchNo>
						</TD>
					</TR>
					
					<TR>
						<TD class="flabel">是否积分交易：</TD>
						<TD class="finput"><INPUT disabled name=scoreFlagZh>
						<INPUT disabled style="display: none" id="scoreFlag" name=scoreFlag>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">积分消费总金额：</TD>
						<TD class="finput"><INPUT disabled id="scoreTransAmtDesc" name=scoreTransAmtDesc>
						</TD>
					</TR>
					
					<TR>
						<TD class="flabel"><FONT color=red>&nbsp;*</FONT>退货金额(元)：</TD>
						<TD class="finput"><INPUT id="backAmt" name=backAmtStr>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退货原因：</TD>
						<TD class="finput"><textarea id="backReason" name=backReason></textarea>
						</TD>
					</TR>
					<tr style="display: none"> 
	    				<td></td> 
	    				<td>
	    					<input id="pospStmt" name="pospStmt" type="text"/>
	    					<input id="transAmt" name="transAmt" type="text"/>
	    					<input id="tidTransDate" name="tidTransDate" type="text"/>
	    					<input id="localSeq" name="localSeq" type="text"/>
	    				</td>
	    			</tr>
				</TBODY>

			</table>
			<input id="formreset" style="display: none;" type="reset" />
		</form>
	</div>

	<div id="importReturnFileDiv" class="detailDialog" style="display:none;">
		<form id="form1">
		<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
			<TBODY>		
				<TR>
					<TD class="flabel">选择批量退货文件</TD>
					<TD class="finput">			
						<input id="upLoadfile" type="file"  name="upLoadfile" />			
					</TD>
				</TR>
			</TBODY>
		</table>
		</form>
	</div>

<form id="downForm" action="r/file/backCommit.xls" target="_blank">
	
</form>
</body>
</html>