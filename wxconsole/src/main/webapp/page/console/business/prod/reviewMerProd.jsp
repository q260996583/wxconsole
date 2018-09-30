<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>对外终端信息审核</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/prod/reviewMerProd.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">商户号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="mid"  maxlength="15" /></td>	
		<td class="qlabel">商户名称</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="merName" size=20 /></td>
		<td class="qlabel">审核状态</td>
		<td class="qinput">
			<select id="prodstatus" comparison="eq" name="addStatus"></td>	
	</tr>
	
	<tr>
		<td class="qlabel">服务商号</td>
		<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name="channelId" size=20 /></td>
		<td class="qlabel">服务商名称</td>
		<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name="channelName" size=20 /></td>	
		<td class="qlabel">申请时间</td>
		<td class="qinput"><input type="text" value="" comparison="ge" qtype="string" id="commitDateStart" name="updDate" />
		<input type="text" value="" comparison="le" qtype="string" id="commitDateEnd" name="updDate" /></td>		
	</tr>
	<tr>
		<td class="qlabel">审核时间</td>
		<td class="qinput"><input type="text" value="" comparison="ge" qtype="string" id="reviewDateStart" name="reviewDate" />
		<input type="text" value="" comparison="le" qtype="string" id="reviewDateEnd" name="reviewDate" /></td>
		<td class="qlabel"></td>
		<td class="qinput"></td>	
		<td class="qlabel"></td>
		<td class="qinput"></td>	
	</tr>
	<tr>
	  <td bgcolor="#ffffff"  colspan="6" align="center">
	  <input id="querybutton" class="bt" value="查询"  type="button">
	  <input class="bt" value="重置" type="reset" />
	  </td>
	</tr>
</table>
</form>
</div>
<DIV id="table"></DIV>

<div id="merOuterTidDetail" style="display: none;">
<form id="form2" action="">
<input name="productId" size="40" type="hidden"/>
<input name="merAddStatus" size="40" type="hidden"/>
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel" width="120">商户号：</TD>
			<TD class="finput"><input class="cdnInput" name="mid" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户名称：</TD>
			<TD class="finput"><input class="cdnInput" name="merName" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">服务商号：</TD>
			<TD class="finput">
			<input class="cdnInput" name="channelCode" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">服务商名称：</TD>
			<TD class="finput"><input class="cdnInput" name="channelName" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">产品名称：</TD>
			<TD class="finput"><input class="cdnInput" name="productName" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">D0结算费率：</TD>
			<TD class="finput"><input class="cdnInput" name="addD0fee" xtype="rate4" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">初始单笔限额：</TD>
			<TD class="finput"><input class="cdnInput" name="addOneLimit" xtype="money" size="40" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">初始单日限额：</TD>
			<TD class="finput"><input class="cdnInput" name="addDayLimit" xtype="money" size="40" readonly="readonly"/>
			</TD>
		</TR>
		<TR rowspan='5'>
			<TD class="flabel">D0协议：</TD>
			<TD class="finput">
				<img id="prodImg" 
				onerror="this.src='images/404.jpg'"
				src="images/timg.jpg"
				style="display:block;width:20%;" onclick="window.open(this.src)"/>
			</TD>
		</TR>
		<TR rowspan='2'>
			<TD class="flabel">申请备注：</TD>
			<TD class="finput">
			<textarea rows="3" cols="3"  name="remark" readonly="readonly"></textarea>
			</TD>
		</TR>
	</TBODY>
</table>
<table class="ftable" cellpadding="1" cellspacing="1" width="100%" id="reviewLog">
</table>
</form>
</div>

</body>
</html>