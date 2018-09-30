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
	var stlmDate = '<s:property value="#parameters.stlmDate"/>';
	var orgCode = '<s:property value="#parameters.orgCode"/>';
</script>
<script type="text/javascript"
	src="pagejs/console/business/report/clear/checkPayFeeResultDetail.js"></script>
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
														color=#333333>支付机构手续费对帐----对账结果明细</FONT></B></TD>
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
										<td align="right" class="qlabel">差异类型</td>
										<td align="left" class="qinput" >
											<select id="payFeeStat" comparison="eq" name="stat"></select>
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
					
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</body>
</html>