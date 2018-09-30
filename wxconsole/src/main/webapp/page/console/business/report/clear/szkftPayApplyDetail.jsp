<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>深圳快付通付款申请明细查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/report/clear/szkftPayApplyDetail.js"></script>

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
		<td class="qlabel">商户</td>
		<td class="qinput">
			<INPUT style="display: none;" id="mid" name="mid" comparison="eq">
			<INPUT id="qmerName" name="qmerName" readonly="readonly">
		</td>
<!-- 		<td class="qlabel"></td>
		<td class="qinput"></td> -->
		
		<td class="qlabel">是否手工录入:</td>
		<td class="qinput">
		<select id="artiAddFlag" comparison="eq" name="artiAddFlag">
			<option value="" selected="selected">全部</option>		
			<option value="0" >否</option>
			<option value="1" >是</option>			
		</select>
		<div id="artiAddFlagTip"></div></td>
		</tr>

			<tr>
		<td class="qlabel">支付状态:</td>
		<td class="qinput"><select id="payStat" comparison="eq"
			name="payStat">
			<option value="" selected="selected">全部</option>			
			<option value="1" >成功</option>
			<option value="2" >失败</option>
			<option value="3" >快付通处理中</option>
			<option value="6" >冻结</option>						
			<option value="7" >退票</option>	
			<option value="8" >未响应</option>					
			<option value="9" >未请求</option>
		</select><div id="payStatTip"></div></td>
		
				<td class="qlabel">对账结果:</td>
		        <td class="qinput"><select id="reconResult" comparison="eq"
			name="reconResult">
			<option value="" selected="selected">全部</option>			
			<option value="00" >金额不平</option>
			<option value="01" >落账</option>
			<option value="02" >快付通落账</option>						
			<option value="04" >对平</option>	
			<option value="03" >已处理</option>					
		</select><div id="reconResultTip"></div></td>		
	</tr>
	<tr>

  <td bgcolor="#ffffff"  colspan="6" align="center">
  <input id="querybutton" class="bt" value="查询"  type="button">
  <input class="bt" value="重置" type="reset" />
  <input type="button" class="bt" id="downFileExl" value="导出Excel" />
  </td>
    </tr>
</table>
</form>
</div>


	
<div style="margin-left:550px;">划款汇总(单位:元)</div>
<div id="sumtable" style="margin-bottom:50px;"></div>
	
<div style="margin-left:550px;">划款明细(单位:元)</div>
<DIV id="table"></DIV>


	<!-- 商户选择弹出窗口 -->
	<div id="merSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput">
						<input type="text" name="merName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">商户代码</td>
					<td class="qinput">
						<input type="text" name="orgCode" comparison="like" qtype="string" />
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>