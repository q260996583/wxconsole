<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>D0交易出账状态查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/trans/codeMap.js"></script>
<script type="text/javascript" src="pagejs/console/business/trans/transOutcomeStat.js"></script>
</head>

<body>
	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<!-- <td class="qlabel"><FONT color=red>&nbsp;</FONT>起始日期</td>
					<td class="qinput"><input id="pospStmtStart" name="pospStmt" comparison="ge" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;</FONT>结束日期</td>
					<td class="qinput"><input id="pospStmtEnd" name="pospStmt" comparison="le" /></td> -->
					<td class="qlabel">清算日期</td>
					<td class="qinput"><INPUT type="text" id="stlmDate" name="stlmDate" comparison="eq"></td>
					<td class="qlabel">交易流水号</td>
					<td class="qinput"><input type="text" value="" comparison="eq" id="transSeq" name=transSeq size=20 /></td>
					<td class="qlabel">结算流水号</td>
					<td class="qinput"><INPUT type="text" id="settleSeq" name="settleSeq" comparison="eq"></td>
					
				</tr>
				
				<tr>					
					<td class="qlabel">商户号</td>
					<td class="qinput"><INPUT type="text" id="mid" name="mid" comparison="eq"></td>
					<td class="qlabel">终端号</td>
					<td class="qinput"><input type="text" value="" comparison="eq" id="tid" name=tid size=20 /></td>
					<td class="qlabel">商户出账状态</td>
					<!-- <td class="qinput"><INPUT type="text" id="settleSeq" name="settleSeq" comparison="eq"></td> -->
					<td class="qinput">
					<select type="text" id="outcomeStat" name="outcomeStat" comparison="eq">
						<option></option>
						<option>未出账</option>
						<option>出账中</option>
						<option>已出账</option>
						<option>出账失败</option>
						<option>审核通过</option>
					</select>
					</td>
					
				</tr>
												
				<tr>
					 <td bgcolor="#ffffff" colspan="6" align="center">
						<input id="querybutton" class="bt" value="查询" type="button"> 
						<input class="bt" value="重置" type="reset" />
						<input id="excelexport" class="bt" value="导出EXCEL" type="button"> 
					 </td>	 									
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>
	
	<div id="D0posTransDetail"styley:none;">
		<form id="form2">
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<TBODY>
					<!-- <TR>
						<TD class="flabel">中心交易时间：</TD>
						<TD class="finput"><INPUT id=transTimeDesc name=transTimeDesc></TD>
					</TR> -->
					<TR>
						<TD class="flabel">主帐号：</TD>
						<TD class="finput"><INPUT id="pan" name="pan">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">发卡行：</TD>
						<TD class="finput"><INPUT id="issuerName" name="issuerName">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易流水号：</TD>
						<TD class="finput"><INPUT id="tidSeq" name=tidSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">中心交易流水：</TD>
						<TD class="finput"><INPUT id="transSeq" name=transSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">商户名称：</TD>
						<TD class="finput"><INPUT id="merName" name=merName></INPUT></TD>
					</TR>
					<TR>
						<TD class="flabel">内部商户号：</TD>
						<TD class="finput"><INPUT id=mid name=mid></TD>
					</TR>
					<TR>
						<TD class="flabel">终端号：</TD>
						<TD class="finput"><INPUT id=tid name=tid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">支付机构号：</TD>
						<TD class="finput"><INPUT id=bankId name=bankId>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易代码：</TD>
						<TD class="finput"><INPUT id=transCode name=transCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易金额(元)：</TD>
						<TD class="finput"><INPUT id=transAmt name=transAmt>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易时间：</TD>
						<TD class="finput"><INPUT id="transTime" name="transTime">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易手续费(元)：</TD>
						<TD class="finput"><INPUT id="tradeFee" name=tradeFee>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">结算手续费(元)：</TD>
						<TD class="finput"><INPUT id="settleFee" name=settleFee></TD>
					</TR>					
					<TR>
						<TD class="flabel">结算金额(元)：</TD>
						<TD class="finput"><INPUT id="netAmt" name=netAmt>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">结算流水号：</TD>
						<TD class="finput"><INPUT id="settleSeq" name=settleSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">清算日期：</TD>
						<TD class="finput"><INPUT id="stlmDate" name=stlmDate></TD>
					</TR>
					<TR>
						<TD class="flabel">商户出账状态：</TD>
						<TD class="finput"><INPUT id="outcomeStat" name=outcomeStat></TD>
					</TR>
					<!-- <TR>
						<TD class="flabel">出款时间：</TD>
						<TD class="finput"><INPUT id="outcomeTime" name="outcomeTime">
						</TD>
					</TR> -->
					<TR>
						<TD class="flabel">商户结算类型：</TD>
						<TD class="finput"><INPUT id="merStatementsType" name=merStatementsType>
						</TD>
					</TR>
					
					<TR>
						<TD class="flabel">审核人：</TD>
						<TD class="finput"><INPUT id="outcomeHandler" name=outcomeHandler></TD>
					</TR>
					<TR>
					<!--	<TD class="flabel">RSV2：</TD>
						<TD class="finput"><INPUT id="rsv2" name=rsv2>
						</TD>
					</TR> -->				
					
				</TBODY>

			</table>
			<input id="formreset" style="display: none;" type="reset" />
		</form>
	</div>

</body>
</html>