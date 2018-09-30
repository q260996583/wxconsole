<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>交易流水查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/trans/posTransAllCard.js"></script>
</head>

<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始日期</td>
					<td class="qinput"><input id="pospStmtStart" name="pospStmt" comparison="ge" /></td>
					<td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束日期</td>
					<td class="qinput"><input id="pospStmtEnd" name="pospStmt" comparison="le" /></td>
					<td class="qlabel">商户</td>
					<td class="qinput"><INPUT style="display: none;" id="qmid"
						name="mid" comparison="eq"> <INPUT id="qmerName"
						name="qmerName" readonly="readonly"></td>
					<td class="qlabel">终端号</td>
					<td class="qinput"><input type="text" value="" comparison="eq" id="qtid"
						qtype="string" name=tid size=20 /></td>
				</tr>
				<tr>
					<td class="qlabel">中心交易流水</td>
					<td class="qinput"><INPUT id="transSeq" name="transSeq"
						comparison="eq"></td>
					<td class="qlabel">终端交易流水</td>
					<td class="qinput"><INPUT id="tidSeq" name="tidSeq"
						comparison="eq"></td>
					<td class="qlabel">主帐号</td>
					<td class="qinput"><INPUT id="pan" name="panSearch" comparison="eq"></td>
					<td class="qlabel">交易状态</td>
					<td class="qinput"><select id="transSt" name="transSt"
						comparison="eq"></select></td>
				</tr>
				<tr>
					<!-- <td class="qlabel">交易类型</td>
					<td class="qinput"><select id="txnTypeCode" name="txnTypeCode"
						comparison="eq"></select></td> -->
					<td class="qlabel">中心交易类型</td>
					<td class="qinput"><select id="transCode" name="transCode"
						comparison="eq"></select></td>
					<td class="qlabel">冲正标志</td>
					<td class="qinput"><select id="rollbackFlag" name="rollbackFlag"
						comparison="eq"></select></td>
					<td class="qlabel">撤销标志</td>
					<td class="qinput"><select id="cancelFlag" name="cancelFlag"
						comparison="eq"></select></td>
					<td class="qlabel" colspan="2"></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="8" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /><input
						id="exlbutton" class="bt" value="导出EXCEL" type="button"/>
						</td>
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
						<TD class="flabel">中心交易时间：</TD>
						<TD class="finput"><INPUT id=transTimeDesc name=transTimeDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">本系统清算日：</TD>
						<TD class="finput"><INPUT id=pospStmtDesc name=pospStmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">消息类型(请求)：</TD>
						<TD class="finput"><INPUT id=msgType name=msgType>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">消息类型(应答)：</TD>
						<TD class="finput"><INPUT id=msgTypeResp name=msgTypeResp>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">主帐号：</TD>
						<TD class="finput"><INPUT id="pan" name="panSearch">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易处理码：</TD>
						<TD class="finput"><INPUT id="procCode" name=procCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易金额(元)：</TD>
						<TD class="finput"><INPUT id="transAmtDesc" name=transAmtDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">应答交易金额：</TD>
						<TD class="finput"><INPUT id="transAmtRepDesc" name=transAmtRepDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易流水号：</TD>
						<TD class="finput"><INPUT id="tidSeq" name=tidSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易时间：</TD>
						<TD class="finput"><INPUT id="tidTransTimeDesc" name=tidTransTimeDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">终端交易日期：</TD>
						<TD class="finput"><INPUT id="tidTransDateDesc" name=tidTransDateDesc></TD>
					</TR>
					<TR>
						<TD class="flabel">中心交易清算日：</TD>
						<TD class="finput"><INPUT id="stlmDateDesc" name=stlmDateDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">服务点输入方式码：</TD>
						<TD class="finput"><INPUT id="pointEntryCode" name=pointEntryCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">卡序列号：</TD>
						<TD class="finput"><INPUT id="cardSeqNum" name=cardSeqNum>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">服务点条件码：</TD>
						<TD class="finput"><INPUT id="pointCondCode" name=pointCondCode></TD>
					</TR>
					<TR>
						<TD class="flabel">服务点PIN获取码：</TD>
						<TD class="finput"><INPUT id="pinCaptureCode" name=pinCaptureCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">受理方标识码：</TD>
						<TD class="finput"><INPUT id="acquireInstitCode" name=acquireInstitCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">银行受理方标识码：</TD>
						<TD class="finput"><INPUT id="respAcquireInstitCode" name=respAcquireInstitCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">中心交易流水：</TD>
						<TD class="finput"><INPUT id="transSeq" name=transSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">请求参考号：</TD>
						<TD class="finput"><INPUT id="askReference" name=askReference>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">授权标识应答码：</TD>
						<TD class="finput"><INPUT id="authRespCode" name=authRespCode></TD>
					</TR>
					<TR>
						<TD class="flabel">请求时应答码：</TD>
						<TD class="finput"><INPUT id="askRespCode" name=askRespCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">应答码：</TD>
						<TD class="finput"><INPUT id="respCode" name=respCodeZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">本地应答码：</TD>
						<TD class="finput"><INPUT id="respCodeLocal" name=respCodeLocal>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">终端标识号：</TD>
						<TD class="finput"><INPUT id="tid" name=tid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">商户号：</TD>
						<TD class="finput"><INPUT id="mid" name=mid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">商户名称：</TD>
						<TD class="finput"><textarea id="merName" name=merName></textarea></TD>
					</TR>
					<TR>
						<TD class="flabel">银行端商户号：</TD>
						<TD class="finput"><INPUT id="respMid" name=respMid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">接收/收单机构标识：</TD>
						<TD class="finput"><INPUT id="acqId" name=acqId>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">货币代码：</TD>
						<TD class="finput"><INPUT id="amtCode" name=amtCodeZh></TD>
					</TR>
					<TR>
						<TD class="flabel">安全控制信息：</TD>
						<TD class="finput"><INPUT id="secInfo" name=secInfo>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易类型码：</TD>
						<TD class="finput"><INPUT id="txnTypeCode" name=txnTypeCodeZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">批次号：</TD>
						<TD class="finput"><INPUT id="batchNo" name=batchNo>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原始交易批次号：</TD>
						<TD class="finput"><INPUT id="oriBatchNo" name=oriBatchNo>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原始交易POS流水：</TD>
						<TD class="finput"><INPUT id="oriTidSeq" name=oriTidSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原始交易日期：</TD>
						<TD class="finput"><INPUT id="oriTidTransDate" name=oriTidTransDate>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原中心交易流水号：</TD>
						<TD class="finput"><INPUT id="oriTransSeq" name=oriTransSeq>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">国际信用卡公司代码：</TD>
						<TD class="finput"><INPUT id="creditOrgCode" name=creditOrgCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">报文原因码：</TD>
						<TD class="finput"><INPUT id="messageReasonCode" name=messageReasonCode></TD>
					</TR>
					<TR>
						<TD class="flabel">特殊计费类型：</TD>
						<TD class="finput"><INPUT id="sepcialchargeType" name=sepcialchargeType>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">特殊计费级别：</TD>
						<TD class="finput"><INPUT id="sepcialchargeLevel" name=sepcialchargeLevel>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">位商户扣率，值为扣率*10000：</TD>
						<TD class="finput"><INPUT id="busiDeductionRate" name=busiDeductionRate>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">中心交易类型：</TD>
						<TD class="finput"><INPUT id="transCodeZh" name=transCodeZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易状态：</TD>
						<TD class="finput"><INPUT id="transStZh" name=transStZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">冲正标志：</TD>
						<TD class="finput"><INPUT id="rollbackFlagZh" name=rollbackFlagZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">撤销标志：</TD>
						<TD class="finput"><INPUT id="cancelFlagZh" name=cancelFlagZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">清算标志：</TD>
						<TD class="finput"><INPUT id="settleFlagZh" name=settleFlagZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退款类型：</TD>
						<TD class="finput"><INPUT id="backType" name=backType>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退款数额：</TD>
						<TD class="finput"><INPUT id="backAmtType" name=backAmtType>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">已退款金额：</TD>
						<TD class="finput"><INPUT id="backAmtDesc" name=backAmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">退货状态：</TD>
						<TD class="finput"><INPUT id="backStat" name=backStat></TD>
					</TR>
					<TR>
						<TD class="flabel">退货原因：</TD>
						<TD class="finput"><INPUT id="backReason" name=backReason>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">路由规则号：</TD>
						<TD class="finput"><INPUT id="routeId" name=routeId>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">转发支付机构号：</TD>
						<TD class="finput"><INPUT id="transferPayorg" name=transferPayorg>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">RSV1：</TD>
						<TD class="finput"><INPUT id="rsv1" name=rsv1></TD>
					</TR>
					<TR>
						<TD class="flabel">RSV2：</TD>
						<TD class="finput"><INPUT id="rsv2" name=rsv2>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">RSV3：</TD>
						<TD class="finput"><INPUT id="rsv3" name=rsv3>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">RSV4：</TD>
						<TD class="finput"><INPUT id="rsv4" name=rsv4>
						</TD>
					</TR>
					<TR id="signs" style="display: none">
						<TD class="flabel">导出电子签名：</TD>
						<TD class="finput"><input
						type="button" class="bt qbutton" id="signsButton" value="下载" />
						</TD>
					</TR>
				</TBODY>

			</table>
			<input id="formreset" style="display: none;" type="reset" />
		</form>
	</div>

<!-- 大丰收积分消费的交易明细 -->
		<DIV id="creditScoreDetail" style="display: none">
		<form id="form3">
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<TBODY>
					<TR>
						<TD class="flabel">商户号：</TD>
						<TD class="finput"><INPUT  name=mid></TD>
					</TR>
					<TR>
						<TD class="flabel">终端号：</TD>
						<TD class="finput"><INPUT  name=tid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易时间：</TD>
						<TD class="finput"><INPUT  name=transTime format="yyyy—MM-dd HH:mm:ss">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原交易金额：</TD>
						<TD class="finput"><INPUT  name=transAmtBefore>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">优惠后交易金额：</TD>
						<TD class="finput"><INPUT  name=transAmtAfter>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">应答码：</TD>
						<TD class="finput"><INPUT  name=respCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">营销费：</TD>
						<TD class="finput"><INPUT  name=markerFee>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">乐币：</TD>
						<TD class="finput"><INPUT  name=coin>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">乐豆：</TD>
						<TD class="finput"><INPUT  name=bean>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">积分优惠金额：</TD>
						<TD class="finput"><INPUT  name=giftAmt>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">赠送积分：</TD>
						<TD class="finput"><INPUT  name=giftScore>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">冲正标志：</TD>
						<TD class="finput"><INPUT  name=rollbackFlagZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">撤销标志：</TD>
						<TD class="finput"><INPUT  name=cancelFlagZh>
						</TD>
					</TR>
				</TBODY>
			</table>
		</form>
		</DIV>


<!-- 汇付积分查询 -->

<DIV id="creditPnrDetail" style="display: none">
		<form id="form4">
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<TBODY>
					<TR>
						<TD class="flabel">商户号：</TD>
						<TD class="finput"><INPUT  name=mid></TD>
					</TR>
					<TR>
						<TD class="flabel">终端号：</TD>
						<TD class="finput"><INPUT  name=tid>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">交易时间：</TD>
						<TD class="finput"><INPUT  name=transTime format="yyyy—MM-dd HH:mm:ss">
						</TD>
					</TR>
					<TR>
						<TD class="flabel">原交易金额：</TD>
						<TD class="finput"><INPUT  name=transAmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">汇付清算额：</TD>
						<TD class="finput"><INPUT  name=pnrDivAmtDesc>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">应答码：</TD>
						<TD class="finput"><INPUT  name=respCode>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">冲正标志：</TD>
						<TD class="finput"><INPUT  name=rollbackFlagZh>
						</TD>
					</TR>
					<TR>
						<TD class="flabel">撤销标志：</TD>
						<TD class="finput"><INPUT  name=cancelFlagZh>
						</TD>
					</TR>
				</TBODY>
			</table>
		</form>
		</DIV>

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