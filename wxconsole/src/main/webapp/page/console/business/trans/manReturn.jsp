<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>退货审批</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/trans/manReturn.js"></script>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">原交易日期</td>
					<td class="qinput"><input id="pospStmt" name="pospStmt" comparison="eq" /></td>
					<td class="qlabel">退货日期</td>
					<td class="qinput"><input id="applyDate" name="applyDate" comparison="eq" /></td>
					<td class="qlabel">退货状态</td>
					<td class="qinput"><select id="backStat" name="backStat"
						comparison="eq"></select></td>
				</tr>
				<tr>	
					<td class="qlabel">原中心交易流水</td>
					<td class="qinput"><INPUT id="oriTransSeq" name="oriTransSeq"
						comparison="eq"></td>
					<td class="qlabel">商户</td>
					<td class="qinput"><INPUT style="display: none;" id="qmid"
						name="mid" comparison="eq"> <INPUT id="qmerName"
						name="qmerName" readonly="readonly"></td>
					<td class="qlabel">主帐号</td>
					<td class="qinput"><INPUT id="pan" name="pan" comparison="eq"></td>
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
						<TD class="flabel">原交易日期：</TD>
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
				
					
					
					
					<TR id="hid1" >
						<TD class="flabel">银联退货金额(元)：</TD>
						<TD class="finput"><INPUT disabled id="transAmtAfterDesc" name=transAmtAfterDesc></TD>
					</TR>
					<TR id="hid2" >
						<TD class="flabel">乐币(元)：</TD>
						<TD class="finput"><INPUT disabled id="coinDesc" name=coinDesc></TD>
					</TR>
					<TR id="hid3" >
						<TD class="flabel">乐豆(元)：</TD>
						<TD class="finput"><INPUT disabled id="beanDesc" name=beanDesc></TD>
					</TR>
					<TR id="hid4" >
						<TD class="flabel">营销费(元)：</TD>
						<TD class="finput"><INPUT disabled id="markerFeeDesc" name=markerFeeDesc></TD>
					</TR>
					<TR id="hid5" >
						<TD class="flabel">赠送积分(元)：</TD>
						<TD class="finput"><INPUT disabled id="giftScoreDesc" name=giftScoreDesc></TD>
					</TR>
					<TR id="hid6" >
						<TD class="flabel">赠送金额(元)：</TD>
						<TD class="finput"><INPUT disabled id="giftAmtDesc" name=giftAmtDesc></TD>
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
						<TD class="flabel">审批意见：</TD>
						<TD class="finput"><textarea id="confirmMemo" name=confirmMemo></textarea></TD>
					</TR>
					<tr style="display: none"> 
	    				<td></td> 
	    				<td>
	    					<input id="seqNo" name="seqNo" type="text"/>
	    					<input id="mid" name="mid" type="text"/>
	    					<input id="backStat" name="backStat" type="text"/>
	    					<input id="transAmt" name="transAmt" type="text"/>
	    					<input id="backAmt" name="backAmt" type="text"/>
	    					<input id="oriTidTransDate" name="oriTidTransDate" type="text"/>
	    					<input id="scoreFlag" name="scoreFlag" type="text"/>
	    					<input id="localSeq" name="localSeq" type="text"/>
	    					<input id="markerFee" name="markerFee" type="text"/>
	    					<input id="coin" name="coin" type="text"/>
	    					<input id="bean" name="bean" type="text"/>
	    					<input id="giftAmt" name="giftAmt" type="text"/>
	    					<input id="giftScore" name="giftScore" type="text"/>
	    					<input id="transAmtAfter" name="transAmtAfter" type="text"/>
	    				</td>
	    			</tr>
				</TBODY>

			</table>
			<input id="formreset" style="display: none;" type="reset" />
		</form>
	</div>


</body>
</html>