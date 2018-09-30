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
</script>
<script type="text/javascript"
	src="pagejs/console/business/report/clear/szdfCheckResultDetail.js"></script>
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
														color=#333333>对帐----深圳代付对账结果</FONT></B></TD>
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
										<td align="right" width="50%">对账结果</td>
										<td align="left">
<%-- 											<select id="reconBillgridResult" comparison="eq" name="reconBillgridResult"></select>
 --%>	<select id="reconBillgridResult" comparison="eq"
			name="reconBillgridResult">
			<option value="" selected="selected">不限</option>			
			<option value="00" >金额不平</option>
			<option value="01" >落账</option>
			<option value="02" >深圳代付落账</option>						
			<option value="03" >已处理</option>	
		</select>
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
										深圳代付落账笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										深圳代付落账金额</td>
								</tr>
								<tr>
									<td class="qinput" id="szdfDownLoadCnt" align="right">
										<s:property value="#parameters.szdfDownLoadCnt"/>
									</td>
									<td class="qinput" id="szdfDownLoadAmt" align="right">
										<s:property value="#parameters.szdfDownLoadAmt"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #dfe8f6;" align="center">
										金额不平笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										金额不平金额</td>
								</tr>
								<tr>
									<td class="qinput" id="amtDiffCnt" align="right">
										<s:property value="#parameters.amtDiffCnt"/>
									</td>
									<td class="qinput" id="amtDiffAmt" align="right">
										<s:property value="#parameters.amtDiffAmt"/>
									</td>
								</tr>
																<tr>
									<td style="background-color: #dfe8f6;" align="center">
										已处理笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										已处理金额</td>
								</tr>
								<tr>
									<td class="qinput" id="handleCnt" align="right">
										<s:property value="#parameters.handleCnt"/>
									</td>
									<td class="qinput" id="handleAmt" align="right">
										<s:property value="#parameters.handleAmt"/>
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
										支付日期</td>								
									<td style="background-color: #dfe8f6;" align="center">
										深圳代付笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										深圳代付金额</td>
									<td style="background-color: #dfe8f6;" align="center">
										笔数</td>
									<td style="background-color: #dfe8f6;" align="center">
										金额</td>
								</tr>
								<tr>
									<td class="qinput" id="theDate" align="right">
										<s:property value="#parameters.searchDate"/>
									</td>							
									<td class="qinput" id="szdfCnt" align="right">
										<s:property value="#parameters.szdfCnt"/>
									</td>
									<td class="qinput" id="szdfAmt" align="right">
										<s:property value="#parameters.szdfAmt"/>
									</td>
									<td class="qinput" id="fftCnt" align="right">
										<s:property value="#parameters.fftCnt"/>
									</td>
									<td class="qinput" id="fftAmt" align="right">
										<s:property value="#parameters.fftAmt"/>
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
										<td class="flabel">支付日期:</td>
										<td><INPUT id=checkDate  name=checkDate  readonly="readonly"></td>
									</tr>							
									<tr>
										<td class="flabel">订单号:</td>
										<td><INPUT id=orderNo  name=orderNo readonly="readonly" ></td>
									</tr>
									<tr>
										<td class="flabel">对账结果:</td>
										<td>
<%-- 											<select id="checkStat" comparison="eq" name="checkStat"></select>
 --%>		<select id="status" comparison="eq"
			name="status">
	<!--		<option value="" selected="selected">不限</option>	-->		
 			<option value="00" >金额不平</option>
			<option value="01" >落账</option>
			<option value="02" >深圳代付落账</option>	 					
			<option value="03" >已处理</option>	
		</select>
										</td>
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