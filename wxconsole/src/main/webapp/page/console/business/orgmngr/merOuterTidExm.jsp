<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>对外终端信息审核</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/merOuterTidExm.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">银行号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="bankCode" size=20 /></td>
		<td class="qlabel">终端号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="tid"  maxlength="15" /></td>	
		<td class="qlabel">商户号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="mid"  maxlength="15" /></td>	
	</tr>
	
	<tr>
		<td class="qlabel">终端状态</td>
		<td class="qinput"><select id="searchstatus" comparison="eq"
						name="status"></select></td>
		<td class="qlabel">审批状态</td>
		<td class="qinput"><select id="searchconfstatus" comparison="eq"
						name="confStat"></select></td>	
		<td class="qlabel">外部银行商户号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="merOutCode"  maxlength="15" /></td>		
	</tr>
	<tr>
		<td class="qlabel">外部终端</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name="tidOut"  maxlength="8" /></td>
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
<!-- 上级机构选择弹出窗口 -->
<div id="merchantSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">商户名称</td>
		<td class="qinput">
		<input type='hidden' id="porgCode"  name="orgCode" class="param"/>
		<input type="text" name="merName" comparison="like" qtype="string"/></td>
			<td class="qlabel">商户代码</td>
		<td class="qinput"><input  type="text" name="orgCode" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>


<div id="addOuterTid" style="display: none;">
<form id="form1" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">银行：</TD>
			<TD class="finput"><INPUT id="bankCode" maxLength="10" name="bankCode">
			<div id="bankCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端号：</TD>
			<TD class="finput"><INPUT id="tid" maxLength=8 name="tid">
			<div id="tidTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户：</TD>
			<TD class="finput"><INPUT maxLength=15 id="mid"
				name="mid" readonly="readonly">
			<div id="midTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部终端号：</TD>
			<TD class="finput"><INPUT id="tidOut" maxLength="8" name="tidOut">
			<div id="tidOutTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部银行商户号：</TD>
			<TD class="finput"><INPUT maxLength=15 id="merOutCode" name="merOutCode">
			<div id="merOutCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部终端对帐号：</TD>
			<TD class="finput"><INPUT maxLength=32  id="tidOutStlm" name="tidOutStlm">
			<div id="tidOutStlmTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">状态：</TD>
			<TD class="finput"><select id="status" comparison="eq"
						name="status"></select>
			<div id="statusTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">备注：</TD>
			<TD class="finput"><textarea id="remark" rows="4" cols="20" name="remark" maxLength=200 style="resize: none;"></textarea>
			<div id="remarkTip"></div>
		</TD>
		<TR >
			<TD class="flabel">审批意见：</TD>
			<TD class="finput"><textarea rows="4" cols="20" name="confRmk" maxLength=200 style="resize: none;"></textarea>
			<div id="statusTip"></div>
			</TD>
		</TR>
	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="merOuterTidDetail" style="display: none;">
<form id="form2" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">银行：</TD>
			<TD class="finput"><INPUT maxLength="10" name="bankCode">
			<div id="bankCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端号：</TD>
			<TD class="finput"><INPUT  maxLength=8 name="tid">
			<div id="tidTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户：</TD>
			<TD class="finput"><INPUT maxLength=15 
				name="mid" readonly="readonly">
			<div id="midTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部终端号：</TD>
			<TD class="finput"><INPUT  maxLength="8" name="tidOut">
			<div id="tidOutTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部银行商户号：</TD>
			<TD class="finput"><INPUT maxLength=15  name="merOutCode">
			<div id="merOutCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">外部终端对帐号：</TD>
			<TD class="finput"><INPUT maxLength=32  name="tidOutStlm">
			<div id="tidOutStlmTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">状态：</TD>
			<TD class="finput"><select id="statusDetail" comparison="eq"
						name="status"></select>
			<div id="statusTip"></div>
			</TD>
		</TR>
		
		<TR >
			<TD class="flabel">审批意见：</TD>
			<TD class="finput"><textarea rows="4" cols="20" name="confRmk" style="resize: none;"></textarea>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">审批人：</TD>
			<TD class="finput"><INPUT maxLength=32  name="confAcc">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">审批时间：</TD>
			<TD class="finput"><INPUT maxLength=32  name="confTime">
			</TD>
		</TR>
		
	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="tidkey" style="display: none;">
<form id="form3" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR style="display: none;">
			<TD class="flabel">银行：</TD>
			<TD class="finput"><INPUT maxLength="10" name="bankCode">
			<div id="bankCodeTip"></div>
			</TD>
		</TR>
		<TR style="display: none;">
			<TD class="flabel">终端号：</TD>
			<TD class="finput"><INPUT  maxLength=8 name="tid">
			<div id="tidTip"></div>
			</TD>
		</TR>
		<TR style="display: none;">
			<TD class="flabel">商户：</TD>
			<TD class="finput"><INPUT maxLength=15 
				name="mid" readonly="readonly">
			<div id="midTip"></div>
			</TD>
		</TR>
		<TR style="display: none;">
			<TD class="flabel">外部终端号：</TD>
			<TD class="finput"><INPUT  maxLength="8" name="tidOut">
			<div id="tidOutTip"></div>
			</TD>
		</TR>
		<TR style="display: none;">
			<TD class="flabel">外部银行商户号：</TD>
			<TD class="finput"><INPUT maxLength=15  name="merOutCode">
			<div id="merOutCodeTip"></div>
			</TD>
		</TR>
		<TR style="display: none;">
			<TD class="flabel">外部终端对帐号：</TD>
			<TD class="finput"><INPUT maxLength=32  name="tidOutStlm">
			<div id="tidOutStlmTip"></div>
			</TD>
		</TR>
		<TR style="display: none;">
			<TD class="flabel">状态：</TD>
			<TD class="finput"><select id="statusDetail1" comparison="eq"
						name="status"></select>
			<div id="statusTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端主密钥明文：</TD>
			<TD class="finput"><INPUT maxLength=64 id="key" name="key">
			<div id="keyTip"></div>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>


</body>
</html>