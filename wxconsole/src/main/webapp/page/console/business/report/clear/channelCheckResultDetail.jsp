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
	var checkDate = '<s:property value="#parameters.checkDate"/>';
	var channelCode = '<s:property value="#parameters.channelCode"/>';
</script>
<script type="text/javascript"
	src="pagejs/console/business/report/clear/channelCheckResultDetail.js"></script>
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
											<select id="reconBillgridResult" comparison="eq" name="checkFlag"></select>
										</td>
											<td align="right" class="qlabel">交易类型</td>
										<td align="left" class="qinput">
											<select id="txnType"  comparison="eq" name="txnType">
												<option value="">不限</option>
												<option value="W3000">消费</option>
												<option value="W4000">消费冲正</option>
												<option value="W5000">消费撤销</option>
												<option value="W6000">消费撤销冲正</option>												
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
			<form action="#" id="form3">
					<div id="reconTotal">
						
							<table id="totalTable" style="margin: auto; width: 400px;"
								class="qtable" cellspacing="1" cellpadding="1">
								<tr>
									<td style="background-color: #dfe8f6;" align="center">落账笔数</td>
									<td style="background-color: #dfe8f6;" align="center">落账交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">落账积分金额</td>
								</tr>
								<tr>
									<td class="qinput" id="fftDownLoadCnt"  align="center"></td>
									<td class="qinput" id="fftDownLoadAmt"  align="center"></td>
									<td class="qinput" id="fftDownLoadScoreAmt"  align="center"></td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">机构落账笔数</td>
									<td style="background-color: #dfe8f6;" align="center">机构落账交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">机构落账积分金额</td>
								</tr>
								<tr>
									<td class="qinput" id="orgDownLoadCnt" align="center"></td>
									<td class="qinput" id="orgDownLoadAmt" align="center"></td>
									<td class="qinput" id="orgDownLoadScoreAmt" align="center"></td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">日切笔数</td>
									<td style="background-color: #dfe8f6;" align="center">日切交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">日切积分金额</td>
								</tr>
								<tr>
									<td class="qinput" id="fftDayCutCnt" align="center"></td>
									<td class="qinput" id="fftDayCutAmt" align="center"></td>
									<td class="qinput" id="fftDayCutScoreAmt" align="center"></td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">机构日切笔数</td>
									<td style="background-color: #dfe8f6;" align="center">机构日切交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">机构日切积分金额</td>
								</tr>
								<tr>
									<td class="qinput" id="orgDayCutCnt" align="center"></td>
									<td class="qinput" id="orgDayCutAmt" align="center"></td>
									<td class="qinput" id="orgDayCutScoreAmt" align="center"></td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">退款交易笔数</td>
									<td style="background-color: #dfe8f6;" align="center">退款交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">退款交易积分金额</td>
								</tr>
								<tr>
									<td class="qinput" id="returnCnt" align="center"></td>
									<td class="qinput" id="returnAmt" align="center"></td>
									<td class="qinput" id="returnScoreAmt" align="center"></td>
								</tr>
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
										支付机构交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">
										支付机构交易积分金额</td>
									<td style="background-color: #dfe8f6;" align="center">
										交易笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										交易金额</td>
									<td style="background-color: #dfe8f6;" align="center">
										交易积分金额</td>
								</tr>
								<tr>
									<td class="qinput" id="theDate" align="center">
										<s:property value="#parameters.checkDate"/>
									</td>
									<td class="qinput" id="bankName" align="center">
										<% out.print(URLDecoder.decode(request.getParameter("channelName"),"UTF-8")); %>
									</td>
									<td class="qinput" id="orgTransNum" align="center">
									</td>
									<td class="qinput"  id="orgTransAmt" align="center">
									</td>
									<td class="qinput" id="orgScoreAmt" align="center">
									</td>
									<td class="qinput" id="fftTransNum" align="center">
									</td>
									<td class="qinput" id="fftTransAmt" align="center">
									</td>
									<td class="qinput" id="fftScoreAmt" align="center">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		</form>

					<div id="editReckonPay" style="display: none;">
						<form id="form2">
							<table class="ftable" cellpadding="1" cellspacing="1"
								width="100%">
								<tbody>
									<tr>
										<td class="flabel">系统清算日:</td>
										<td><INPUT id=transTime readonly="readonly"  name=transTime ></td>
									</tr>
									<tr>
										<td class="flabel">机构名称:</td>
										<td><INPUT id=channelName readonly="readonly" name=channelName ></td>
									</tr>
									<tr>
										<td class="flabel">系统流水号:</td>
										<td><INPUT id=transSeq  readonly="readonly" name=transSeq ></td>
									</tr>
									<tr>
										<td class="flabel">机构清算日:</td>
										<td><INPUT id=destTransTime  readonly="readonly" name=destTransTime ></td>
									</tr>
									<tr>
										<td class="flabel">机构流水号:</td>
										<td><INPUT id=destTransSeq  readonly="readonly" name=destTransSeq ></td>
									</tr>
									<tr>
										<td class="flabel">对账结果:</td>
										<td>
											<select id="checkFlag" comparison="eq" name="checkFlag"></select>
										</td>
									</tr>
									<tr style="display: none">
										<td class="flabel">原对账结果:</td>
										<td><INPUT id=oldCheckFlag  readonly="readonly" name="oldCheckFlag" ></td>
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