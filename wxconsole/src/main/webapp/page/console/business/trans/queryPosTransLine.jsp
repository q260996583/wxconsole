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
<title>交易查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>

<script type="text/javascript">
	var searchDate = '<s:property value="#parameters.searchDate"/>';
	var bankId = '<s:property value="#parameters.bankId"/>';
</script>
<script type="text/javascript"
	src="pagejs/console/business/trans/queryPosTransLine.js"></script>
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
														color=#333333>交易查询</FONT></B></TD>
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

					<div id="posTransLineDetailGrid"></div>

				</TD>
			</TR>
		</TBODY>
	</TABLE>
</body>
</html>