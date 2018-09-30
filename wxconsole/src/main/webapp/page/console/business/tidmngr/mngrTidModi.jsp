<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>终端信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">终端编号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tid size=20 /></td>
		<td class="qlabel">终端品牌</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tidBrand  maxlength="15" /></td>	
		<td class="qlabel">终端型号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tidModel  maxlength="15" /></td>	
	</tr>
	
	<tr>
		<td class="qlabel">商户名称</td>
		<td class="qinput"><INPUT style="display: none;" id="qmid"
						name="mid" comparison="eq"> <INPUT id="qmerName"
						name="qmerName" readonly="readonly"></td>
		<td class="qlabel">终端状态</td>
		<td class="qinput"><select id="status" comparison="eq"
						name="status"></select></td>	
		<td class="qlabel">终端类型</td>
		<td class="qinput"><select id="tidType" comparison="eq"
						name="tidType"></select></td>	
	</tr>
	<tr>
		<td class="qlabel">服务商名称</td>
		<td class="qinput"><INPUT style="display: none;" id="qChanCode"
						name="channelCode" comparison="eq"> <INPUT id="qChanName"
						name="ChannelName" readonly="readonly"></td>
		<td class="qlabel">SIM卡号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=reserved1  maxlength="11" /></td>	
		<td class="qlabel">流量费收取方式</td>
		<td class="qinput"><select id="chargeType" comparison="eq"
			name="chargeType"></td>	
	</tr>
	<tr>
		<td class="qlabel">SN号</td>
		<td class="qinput"><input name="snCode" type="text" maxlength="30" comparison="like"/></td>
		<td class="qlabel">安装状态</td>
		<td class="qinput"><select id="q_instStatus" name="instStatus" type="text" maxlength="30" comparison="eq"></select></td>
		<td class="qlabel">终端所属者</td>
		<td class="qinput"><select id="q_tidOwner" name="tidOwner" type="text" maxlength="30" comparison="eq"></select></td>
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
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" name="merName"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">商户代码</td>
					<td class="qinput"><input type="text" name="orgCode"
						comparison="like" qtype="string" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 服务商选择弹出窗口 -->
	<div id="channelSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">服务商名称</td>
					<td class="qinput">
						<input type="text" name="channelName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">服务商代码</td>
					<td class="qinput">
						<input type="text" name="channelCode" comparison="like" qtype="string" />
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


<div id="addtid" style="display: none;">
<form id="form1" >
<input type="hidden" name="status" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR id="editShow" style="display: none;">
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端号：</TD>
			<TD class="finput"><INPUT id=tid maxLength=8 name=tid>
			<div id="tidTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端品牌：</TD>
			<TD class="finput"><select id=tidBrand maxLength=50 name=tidBrand></select>
			<div id="tidBrandTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端型号：</TD>
			<TD class="finput"><select id=tidModel maxLength=50 name=tidModel></select>
			<div id="tidModelTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端类型：</TD>
			<TD class="finput"><select name="tidType" maxLength=50 id="tidType">
                <OPTION selected value="00">固定POS</OPTION>
                <OPTION selected value="01">移动POS</OPTION></select> 
			</TD>
		</TR>
		<TR >
            <TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端通讯类型：</TD>
            <TD class="finput"><select name="instRemark" maxLength=50 id="instRemark"></select> 
        </TD>
        </TR>
		<tr>
			<TD class="flabel">终端所属者：</TD>
			<TD class="finput"><SELECT name="tidOwner" id="tidOwner">
				<OPTION selected value="00">本公司</OPTION>
				<OPTION selected value="01">服务商</OPTION>
				<OPTION value="02">商户</OPTION>
				</SELECT> <div id="tidTypeTip"></div>
			</TD>
		</tr>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>商户：</TD>
			<TD class="finput"><INPUT maxLength=15 id="mid"
				name="mid" readonly="readonly">
			<div id="midTip"></div>
			</TD>
		</TR>
		<!-- <TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>月流量费(元)：</TD>
			<TD class="finput"><INPUT id=monthFlowFee maxLength=50 name=monthFlowFee>
			<div id="monthFlowFeeTip"></div>
			</TD>
		</TR> -->
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>联系人：</TD>
			<TD class="finput"><INPUT maxLength=20 id="person" name=person>
			<div id="personTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>联系人电话：</TD>
			<TD class="finput"><INPUT maxLength=20 id="phone" name=phone>
			<div id="phoneTip"></div>
			</TD>
		</TR>
		<TR id="addShow" style="display: none;">
			<TD class="flabel">SIM卡号：</TD>
			<TD class="finput"><INPUT id="reserved1" name=reserved1>
			<div id="reserved1Tip"></div>
			</TD>
		</TR>
		<!-- <TR >
			<TD class="flabel">流量费收取方式：</TD>
			<TD class="finput"><SELECT name="chargeType" id="chargeType">
					<OPTION selected value=0>不收取</OPTION>
					<OPTION value=1>向商户收取</OPTION>
					<OPTION value=2>向服务商收取</OPTION>
				</SELECT>
			</TD>
		</TR> -->
		<TR>
			<TD class="flabel">SN号：</TD>
			<TD class="finput"><INPUT id="snCode" name="snCode">
			<div id="snCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">工作时间：</TD>
			<TD class="finput"><INPUT maxLength=60 id="workTime" qtype ="String" name=workTime>
			<div id="workTimeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">安装状态：</TD>
			<TD class="finput"><SELECT name="instStatus" id="instStatus"></SELECT> 
			<div id="instStatusTip"></div>
			</TD>
		</TR>
		
		<!--wxb  -->
		<tr>
			<TD class="flabel">安装时间：</TD>
			<TD class="finput"><INPUT maxLength=20 id="installTime" name=installTime>
			<!-- <input id="sureBtn" name="sureBtn" class="bt" value="确定"  type="button" > -->
			</TD>
		</tr>
 		<TR >
			<TD class="flabel">安装备注：</TD>
			<TD class="finput"><textarea  maxLength=400 id="instRemark1" name="instRemark1" disabled="disabled"></textarea>
			<div id="instRemarkTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">安装地址：</TD>
			<TD class="finput"><textarea  maxLength=200 id="address" name=address></textarea>
			<div id="addressTip"></div>
			</TD>
		</TR>
	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="tidstatus" style="display: none;">
<form id="form3" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<INPUT id=qmid name=mid style="display:none;">
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端号：</TD>
			<TD class="finput"><INPUT id=qtid maxLength=8 name=tid disabled="disabled">
			<div id="tidTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端状态：</TD>
			<TD class="finput">
			<input type="radio" id="result01" name=status value="01"/>启用
			<input type="radio" id="result02"  name="status" value="02" />停用
	         
			<div id="statusTip"></div>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
<script type="text/javascript" src="pagejs/console/business/tidmngr/mngrTidModi.js"></script>

</div>


</body>
</html>