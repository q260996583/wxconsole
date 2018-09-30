<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>操作员管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>

<script type="text/javascript" src="js/validator/formValidatorRegex.js"></script>
<script type="text/javascript" src="pagejs/console/business/report/clear/szdfPayChange.js"></script>

</head>
<body>
        <div id="queryCondition">
            <form id="queryForm" name="queryForm" action="#" method="post">
            <table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >          
        <tr>
	    <td class="qlabel"><FONT color=red>&nbsp;*</FONT>起始清算日期</td>
	    <td class="qinput"><input type="text" value="" comparison="ge" qtype="string" id="dateStart" name="dateStart"  /></td>
	    <td class="qlabel"><FONT color=red>&nbsp;*</FONT>结束清算日期</td>
		<td class="qinput"><input type="text" value="" comparison="le" qtype="string" id="dateEnd" name="dateEnd"  /></td>		
		</tr>

		<tr>
		<td class="qlabel">商户</td>
		<td class="qinput">
			<INPUT style="display: none;" id="mid" name="mid" comparison="eq">
			<INPUT id="qmerName" name="qmerName" >  <!-- readonly="readonly" -->
		</td>
		<td class="qlabel"><FONT color=red>&nbsp;*</FONT>支付状态:</td>
		<td class="qinput">
		<select id="payStat" comparison="eq" name="payStat">
			<option value="9" selected="selected">未请求</option>
			<option value="2" >失败</option>
			<option value="6" >冻结</option>
			<!-- <option value="7" >退票</option> -->
		</select>
		<div id="payStatTip"></div></td>							
	    </tr>
	
	    <tr>
		<td class="qlabel">是否手工录入:</td>
		<td class="qinput">
		<select id="artiAddFlag" comparison="eq" name="artiAddFlag">
			<option value="" selected="selected">全部</option>		
			<option value="0" >否</option>
			<option value="1" >是</option>			
		</select>
		<div id="artiAddFlagTip"></div></td>		
		<td class="qlabel"><FONT color=red>&nbsp;*</FONT>是否冻结:</td>
		<td class="qinput">
		<select id="freezeFlag" comparison="eq" name="freezeFlag">
       <!-- <option value="" selected="selected">全部</option>-->			
            <option value="0" selected="selected">否</option>
			<option value="1" >是</option>
		</select>
		<div id="freezeFlagTip"></div></td>	
	    </tr>

	<tr>
		<td class="qbutton" colspan="10" align="center">
		<button class='bt' id="queryBtn" type="button">查 询</button>
		<button class='bt' id="change" type="reset">重置</button>
		<input type="button" class="bt" id="downFileExl" value="导出Excel" />
		
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff" colspan="6" align="left">
		<input id="kftInitialize" class="bt" value="批量初始化" type="button">
		<input id="kftfreeze" class="bt" value="批量冻结" type="button">
		<input id="kftUnfreeze" class="bt" value="批量解冻" type="button">
		</td>
	</tr>
</table>
            </form>
        </div>
        <DIV id="table">
        </DIV>



<!-- addOper 新增支付记录-->
<div id="addOper" style="display: none;">
<form id="form1" action="doInsertSzdfPayRecord.action">
<table class="ftable" cellpadding="1" cellspacing="1" width="100%">   

	<tr>
		<td class="flabel"><font color="red">*</font>清算日期:</td>
		<td class="fcontent"><input class="cdnInput" id="stlmDate"
			name="stlmDate" maxLength="8" /><div id="stlmDateTip"></div></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>商户:</td>
		<!-- <td class="fcontent"><input class="cdnInput" id="mid2" 
		name="mid" maxLength="40" /><div id="midTip"></div></td> -->
		
		
				<td class="qinput">
			<INPUT style="display: none;" id="mid2" name="mid" comparison="eq">
			<INPUT id="qmerName2" name="merName" >  <!-- readonly="readonly" -->
		</td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>付款金额(单位：元):</td>
		<td class="fcontent"><input class="cdnInput" id="realAmt" 
		name="realAmt" maxLength="15" /><div id="realAmtTip"></div></td>
	</tr>
		<tr style="display:none">
		<td class="flabel">是否手工录入</td>
		<td class="fcontent"><input class="cdnInput" id="artiAddFlag" 
		name="artiAddFlag" maxLength="15" /><div id="artiAddFlagTip"></div></td>
	</tr>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>


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