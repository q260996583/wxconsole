<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>深圳快付通付款申请页</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/report/clear/szkftPayApplyPaget.js"></script>

</head>
<body>
<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
	    <td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始清算日期</td>
	    <td class="qinput"><input type="text" value="" comparison="eq" qtype="string" id="dateStart" name="dateStart"  /></td>
	    <td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束清算日期</td>
		<td class="qinput"><input type="text" value="" comparison="eq" qtype="string" id="dateEnd" name="dateEnd"  /></td>		
		</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center">
					<input id="querybutton" class="bt" value="查询" type="button">
					 <input class="bt" value="重置" type="reset" />
					 </td>
				</tr>
				
			    <tr>
					<td bgcolor="#ffffff" colspan="6" align="left">
					<input id="kftpay" class="bt" value="划款" type="button">
					<input id="KftTradeQuery" class="bt" value="支付查询" type="button">
					<input id="KftDishonorQuery" class="bt" value="退票查询" type="button">
					 </td>
				</tr>
			</table>
</form>
</div>

	
<div style="margin-left:550px;">划款汇总(单位:元)</div>
<div id="sumtable" style="margin-bottom:50px;"></div>
	
<div style="margin-left:550px;">划款明细(单位:元)</div>
<DIV id="table"></DIV>

</body>
</html>