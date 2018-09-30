<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>对账结果</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>

<script type="text/javascript">
	var searchDate = '<s:property value="#parameters.searchDate"/>';
	var bankId = '<s:property value="#parameters.bankId"/>';
</script>
<script type="text/javascript"
	src="pagejs/console/business/report/clear/checkJHResultDetail.js"></script>
</head>
<body>
	<TABLE cellSpacing=0 width="100%">
		<TBODY>
			<TR>
				<TD vAlign=top width="100%" align=middle>
					<!-- 小标题 -->
					<TABLE border=0 cellSpacing=0 width="100%">
						<TBODY>
							<TR>
								<TD bgColor=#ffffff vAlign=bottom width=155 align=right><IMG
									src="images/zhangdantitle.gif" width=112 height=89></TD>
								<TD bgColor=#ffffff width=135 align=left><IMG
									src="images/zhanghutitle2.gif" width=114 height=28></TD>
								<TD bgColor=#ffffff>
									<TABLE class=bigfont cellSpacing=0 width="100%" height=36>
										<TBODY>
											<TR>
												<TD bgColor=#ff9900 width=1></TD>
												<TD align="left">&nbsp;&nbsp;&nbsp;<B><FONT
														color=#333333>对帐----对账结果</FONT></B></TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD bgColor=#8392a5 height=1 width=1 colSpan=6></TD>
							</TR>
							<TR>
								<TD bgColor=#dedede height=4 colSpan=3></TD>
							</TR>
						</TBODY>
					</TABLE> <br /> <br />

					<div id="reconBilltab">
						<div>
							<form>
								<table class="qtable" width="100%" cellspacing="1"
									cellpadding="1">
									<tr>
										<td align="right" class="qlabel">对账结果</td>
										<td align="left" class="qinput">
											<select id="reconBillgridResult" comparison="eq" name="reconBillgridResult"></select>
										</td>
											<td align="right" class="qlabel">交易类型</td>
										<td align="left" class="qinput">
											<select id="transType" comparison="eq" name="transType">
												<option value="">不限</option>
												<option value="021000">消费</option>
												<option value="032000">预授权完成</option>
												<option value="071000">分期付款消费</option>
											</select>
										</td>
										<td align="right" class="qlabel">
										<input	type="button" class="bt qbutton" id="querysup" value="查询" />
										</td>
									</tr>
								</table>
							</form>
						</div>

						<div id="checkResultDetailGrid"></div>
					</div>

					<div id="reconTotal">
						<table id="totalTable" style="margin: auto; width: 400px;"
							class="qtable" cellspacing="1" cellpadding="1">
							<tbody>
								<tr style="background-color: #dfe8f6;">
									<td style="background-color: #dfe8f6;" align="center">
										落账笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										落账金额</td>
								</tr>
								<tr>
									<td class="qinput" id="fftDownLoadCnt" align="right">
										<s:property value="#parameters.fftDownLoadCnt"/>
									</td>
									<td class="qinput" id="fftDownLoadAmt" align="right">
										<s:property value="#parameters.fftDownLoadAmt"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										机构落账笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										机构落账金额</td>
								</tr>
								<tr>
									<td class="qinput" id="orgDownLoadCnt" align="right">
										<s:property value="#parameters.orgDownLoadCnt"/>
									</td>
									<td class="qinput" id="orgDownLoadAmt" align="right">
										<s:property value="#parameters.orgDownLoadAmt"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										日切笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										日切金额</td>
								</tr>
								<tr>
									<td class="qinput" id="fftDayCutCnt" align="right">
										<s:property value="#parameters.fftDayCutCnt"/>
									</td>
									<td class="qinput" id="fftDayCutAmt" align="right">
										<s:property value="#parameters.fftDayCutAmt"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										机构日切笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										机构日切金额</td>
								</tr>
								<tr>
									<td class="qinput" id="orgDayCutCnt" align="right">
										<s:property value="#parameters.orgDayCutCnt"/>
									</td>
									<td class="qinput" id="orgDayCutAmt" align="right">
										<s:property value="#parameters.orgDayCutAmt"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										已退款笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										已退款金额</td>
								</tr>
								<tr>
									<td class="qinput" id="returnCnt" align="right">
										<s:property value="#parameters.returnCnt"/>
									</td>
									<td class="qinput" id="returnAmt" align="right">
										<s:property value="#parameters.returnAmt"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										因金额不等对账不平笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										因金额不等对账不平金额</td>
								</tr>
								<tr>
									<td class="qinput" id="monNoEqCnt" align="right">
										<s:property value="#parameters.monNoEqCnt"/>
									</td>
									<td class="qinput" id="monNoEqAmt" align="right">
										<s:property value="#parameters.monNoEqAmt"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div>
						<table id="totalLogTable" style="margin: auto; width: 800px;"
							class="qtable" cellspacing="1" cellpadding="1">
							<tbody>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										清算日期</td>
									<td style="background-color: #dfe8f6;" align="center">
										支付机构名称</td>
									<td style="background-color: #dfe8f6;" align="center">
										支付机构笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										支付机构金额</td>
									<td style="background-color: #dfe8f6;" align="center">
										POS收单平台笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										POS收单平台金额</td>
								</tr>
								<tr>
									<td class="qinput" id="theDate" align="right">
										<s:property value="#parameters.searchDate"/>
									</td>
									<td class="qinput" id="bankName" align="right">
										<% out.print(URLDecoder.decode(request.getParameter("bankName"),"UTF-8")); %>
									</td>
									<td class="qinput" id="bankTxnCnt" align="right">
										<s:property value="#parameters.bankTxnCnt"/>
									</td>
									<td class="qinput" id="bankTxnAmt" align="right">
										<s:property value="#parameters.bankTxnAmt"/>
									</td>
									<td class="qinput" id="sysTxnCnt" align="right">
										<s:property value="#parameters.sysTxnCnt"/>
									</td>
									<td class="qinput" id="sysTxnAmt" align="right">
										<s:property value="#parameters.sysTxnAmt"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>



					<div id="editReckonPay" style="display: none;">
						<form id="form2">
							<table class="ftable" cellpadding="1" cellspacing="1"
								width="100%">
								<tbody>
									<tr>
										<td class="flabel">系统清算日:</td>
										<td><INPUT id=stlmDate readonly="readonly"  name=stlmDate ></td>
									</tr>
									<tr>
										<td class="flabel">机构名称:</td>
										<td><INPUT id=bankName readonly="readonly" name=bankName ></td>
									</tr>
									<tr>
										<td class="flabel">系统流水号:</td>
										<td><INPUT id=transSeq  readonly="readonly" name=transSeq ></td>
									</tr>
									<tr>
										<td class="flabel">机构清算日:</td>
										<td><INPUT id=bankStlmDate  readonly="readonly" name=bankStlmDate ></td>
									</tr>
									<tr>
										<td class="flabel">机构流水号:</td>
										<td><INPUT id=bankSeq  readonly="readonly" name=bankSeq ></td>
									</tr>
									<tr>
										<td class="flabel">对账结果:</td>
										<td>
											<select id="checkStat" comparison="eq" name="checkStat"></select>
										</td>
									</tr>
									<tr style="display: none">
										<td class="flabel">原对账结果:</td>
										<td><INPUT id=oldStat  readonly="readonly" name="oldStat" ></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</body>
</html>