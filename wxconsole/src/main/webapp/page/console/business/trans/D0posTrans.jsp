<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>D0交易流水审核</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/trans/codeMap.js"></script>
<script type="text/javascript" src="pagejs/console/business/trans/D0posTrans.js"></script>
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
					<td class="qlabel">商户号</td>
					<td class="qinput"><INPUT type="text" id="qmid" name="mid" comparison="eq"></td>
					<td class="qlabel">终端号</td>
					<td class="qinput"><input type="text" value="" comparison="eq" id="qtid" qtype="string" name=tid size=20 /></td>
					<td class="qlabel">中心交易流水</td>
					<td class="qinput"><INPUT type="text" id="qtransSeq" name="transSeq" comparison="eq"></td>
					<td class="qlabel">终端交易流水</td>
					<td class="qinput"><INPUT type="text" id="qtidSeq" name="tidSeq" comparison="eq"></td>
				</tr>
												
				<tr>
					 <td bgcolor="#ffffff" colspan="8" align="center" ">
						<input id="querybutton" class="bt" value="查询" type="button"> 
						<input class="bt" value="重置" type="reset" />
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
						<TD class="flabel">垫资手续费(元)：</TD>
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



<div id="contactPosTrans" class="detailDialog" style="display:none;">
	<table >
		<tr>
           <td class="detailtd">
            <div  class="titleDiv">
                <div class="dtitle">关联交易</div>
            </div>
            <div style="overflow: auto; width=100%; background:#ffffff">
            	<div id="contactPosTransDetail" ></div>
            </div>
           </td>
           </tr>		
	</table>
</div>
</body>
</html>