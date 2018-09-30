<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>终端信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="js/validator/formValidatorRegex.js"></script>
</head>
<body>
<script type="text/javascript">
</script>
<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">终端编号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tid size=20 id="tid"/></td>
		<td class="qlabel">终端品牌</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tidBrand  maxlength="15" id="tidBrand"/></td>	
		<td class="qlabel">终端型号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tidModel  maxlength="15" id="tidModel"/></td>	
	</tr>
	
	<tr>
		<td class="qlabel">商户名称</td>
		<td class="qinput"><INPUT style="display: none;" id="qmid"
						name="mid" comparison="eq"> <INPUT id="qmerName"
						name="qmerName" readonly="readonly"></td>
		<td class="qlabel">终端状态</td>
		<td class="qinput"><select id="status" comparison="eq"
						name="status"></td>	
		<td class="qlabel">终端类型</td>
		<td class="qinput"><select id="tidType" comparison="eq"
						name="tidType"></td>	
	</tr>
	<tr>
		<td class="qlabel">服务商名称</td>
		<td class="qinput"><INPUT style="display: none;" id="qChanCode"
						name="channelCode" comparison="eq"> <INPUT id="qChanName"
						name="ChannelName" readonly="readonly"></td>
		<td class="qlabel">SIM卡号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=reserved1  maxlength="11" id="reserved1"/></td>	
		<td class="qlabel">流量费收取方式</td>
		<td class="qinput"><select id="chargeType" comparison="eq"
			name="chargeType"></td>
	</tr>
	<tr>
		<td class="qlabel">外部商户号</td>
		<td class="qinput"><input id="merOutCode" name="merOutCode" type="text" maxlength="30" comparison="like"/></td>
		<td class="qlabel">开始时间</td>
		<td class="qinput"><input type="text" value="" comparison="ge"
			qtype="string" id=startTime name=confTimeSearch size=20 /></td>
		<td class="qlabel">结束时间</td>
		<td class="qinput"><input type="text" value="" comparison="le"
			qtype="string" id=endTime name=confTimeSearch  maxlength="15" /></td>	
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
	  <input id="downFileExl" class="bt" value="导出EXCEL" type="button" /></td>
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
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端品牌：</TD>
			<TD class="finput"><select id=tidBrand1 maxLength=50 name=tidBrand></select>
			<div id="tidBrand1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端型号：</TD>
			<TD class="finput"><select id=tidModel1 maxLength=50 name=tidModel></select>
			<div id="tidModel1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端类型：</TD>
			<TD class="finput"><SELECT name="tidType" id="tidType1">
					<OPTION selected value=01>固定POS</OPTION>
					<OPTION value=02>移动POS</OPTION>
				</SELECT> <div id="tidType1Tip"></div>
			</TD>
		</TR>
		<TR >
            <TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端通讯类型：</TD>
            <TD class="finput"><select name="instRemark" maxLength=50 id="instRemark"></select> 
        </TD>
        </TR>
		<TR >
			<TD class="flabel">终端所属者：</TD>
			<TD class="finput"><SELECT name="tidOwner" id="tidOwner1">
				<OPTION selected value="00">本公司</OPTION>
				<OPTION selected value="01">服务商</OPTION>
				<OPTION value="02">商户</OPTION>
				</SELECT> <div id="tidType1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>商户：</TD>
			<TD class="finput"><INPUT maxLength=15 id="mid1"
				name="mid" readonly="readonly">
			<div id="mid1Tip"></div>
			</TD>
		</TR>
		<!-- <TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>月流量费(元)：</TD>
			<TD class="finput"><INPUT id=monthFlowFee1 maxLength=50 name=monthFlowFee>
			<div id="monthFlowFee1Tip"></div>
			</TD>
		</TR> -->
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>联系人：</TD>
			<TD class="finput"><INPUT maxLength=20 id="person1" name=person>
			<div id="person1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>联系人电话：</TD>
			<TD class="finput"><INPUT maxLength=20 id="phone1" name=phone>
			<div id="phone1Tip"></div>
			</TD>
		</TR>
		<TR>
			<TD class="flabel">SN号：</TD>
			<TD class="finput"><INPUT id="snCode1" name="snCode">
			<div id="snCode1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">工作时间：</TD>
			<TD class="finput"><INPUT maxLength=60 id="workTime1" name=workTime>
			<div id="workTime1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">安装地址：</TD>
			<TD class="finput"><textarea  maxLength=200 id="address1" name=address></textarea>
			<div id="address1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">版本号：</TD>
			<TD class="finput"><INPUT maxLength=10 id="tidVer1" name=tidVer>
			<div id="tidVer1Tip"></div>
			</TD>
		</TR>
	<!-- 	<TR >
			<TD class="flabel">终端交易权限：</TD>
			<TD class="finput">
			<input type="checkbox" name="signPerm" >终端签到
			<input type="checkbox" name="queryPerm" >查询交易
			<input type="checkbox" name="consumPerm" >消费交易
			<input type="checkbox" name="conRevoPerm" >消费撤销交易
			<input type="checkbox" name="reversalPerm" >自动冲正
			<input type="checkbox" name="settlePerm" >结算
			<input type="checkbox" name="returnPerm" >退货交易
			<input type="checkbox" name="preAuthPerm" >预授权交易
			</TD>
		</TR> -->

	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="tidDetail" style="display: none;">
<form id="form2" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端号：</TD>
			<TD class="finput"><INPUT id=tid name=tid>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端品牌：</TD>
			<TD class="finput"><INPUT id=tidBrand name=tidBrand>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端型号：</TD>
			<TD class="finput"><INPUT id=tidModel name=tidModel>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>终端类型：</TD>
			<TD class="finput"><SELECT name="tidType" id="tidType">
					<OPTION selected value=01>有线</OPTION>
					<OPTION value=02>无线</OPTION>
				</SELECT> 
			</TD>
		</TR>
		
		<!--wxb 终端二维码 -->
		<TR >
			<TD class="flabel">终端二维码：</TD>
			<TD class="finput" >
				<input type="button" class="bt"  id="previewBtn"  value="查看">
				<input type="button" class="bt"  id="downLoadBtn"  value="下载">
				<!-- <input type="button" class="bt"  id="newQrcodeBtn"  value="新增"> -->
			</TD>			
		</TR>
		
		<tr>
			<TD class="flabel">终端所属者：</TD>
			<TD class="finput"><SELECT name="tidOwner" id="tidOwner">
				<OPTION selected value="00">本公司</OPTION>
				<OPTION selected value="01">服务商</OPTION>
				<OPTION value="02">商户</OPTION>
				</SELECT>
			</TD>
		</tr>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>商户：</TD>
			<TD class="finput"><INPUT maxLength=15 id="mid" name="mid">
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>月流量费(元)：</TD>
			<TD class="finput"><INPUT maxLength=50 name=monthFlowFee>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>联系人：</TD>
			<TD class="finput"><INPUT id="person" name=person>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>联系人电话：</TD>
			<TD class="finput"><INPUT id="phone" name=phone>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">SIM卡号：</TD>
			<TD class="finput"><INPUT id="reserved1" name=reserved1>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">流量费收取方式：</TD>
			<TD class="finput"><INPUT id="chargeTypeZh" name=chargeTypeZh>
			</TD>
		</TR>
		<TR>
			<TD class="flabel">SN号：</TD>
			<TD class="finput"><INPUT id="snCode" name="snCode">
			<div id="snCodeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">工作时间：</TD>
			<TD class="finput"><INPUT id="workTime" name=workTime>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">主密钥锁定标识：</TD>
			<TD class="finput"><input id="lockFlagDesc" name="lockFlagDesc" />
			<div id="instStatusTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">安装状态：</TD>
			<TD class="finput"><SELECT name="instStatus" id="instStatus"></SELECT> 
			<div id="instStatusTip"></div>
			</TD>
		</TR>
 		<TR >
			<TD class="flabel">安装备注：</TD>
			<TD class="finput"><textarea  maxLength=400 id="instRemark1" name="instRemark1" disabled="disabled"></textarea>
			<div id="instRemarkTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">安装地址：</TD>
			<TD class="finput"><textarea  id="address" name=address></textarea>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">版本号：</TD>
			<TD class="finput"><INPUT id="tidVer" name=tidVer>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">非借记卡单笔交易限额(万元)：</TD>
			<TD class="finput"><INPUT id="tranLimit" name=tranLimit>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端类型：</TD>
			<TD class="finput"><INPUT id="terminalTypeZh" name=terminalTypeZh>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">清算标志：</TD>
			<TD class="finput"><INPUT maxLength=9 id="liquidateFlagZh" name=liquidateFlagZh>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">账户号码：</TD>
			<TD class="finput"><INPUT maxLength=9 id="accntNoPrivate" name=accntNoPrivate>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">账户名称：</TD>
			<TD class="finput"><INPUT maxLength=9 id="accntNamePrivate" name=accntNamePrivate>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">开户人身份证：</TD>
			<TD class="finput"><INPUT maxLength=9 id="cardPersonNo" name=cardPersonNo>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">开户行：</TD>
			<TD class="finput"><INPUT maxLength=9 id="accntBankPrivate" name=accntBankPrivate>
			</TD>
		</TR>
		<tr>
	    	<td class="flabel"> 账户:</td>
	    	<td class="fcontent"><input class="qFormInput" id="bankTitle" name="bankTitle" type="text" maxlength="15" /></td>
	    </tr>
		<TR >
			<TD class="flabel">交互方式：</TD>
			<TD class="finput"><INPUT id="interactiveModeZh" name=interactiveModeZh>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">交易发起方式：</TD>
			<TD class="finput"><INPUT id="launchModeZh" name=launchModeZh>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端交易权限：</TD>
			<TD class="finput">
			<input type="checkbox" name="qsignPerm" >终端签到
			<input type="checkbox" name="qqueryPerm" >查询交易
			<input type="checkbox" name="qconsumPerm" >消费交易
			<input type="checkbox" name="qconRevoPerm" >消费撤销交易
			<input type="checkbox" name="qreversalPerm" >自动冲正
			<input type="checkbox" name="qsettlePerm" >结算
			<input type="checkbox" name="qreturnPerm" >退货交易
			<input type="checkbox" name="qpreAuthPerm" >预授权交易
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端状态：</TD>
			<TD class="finput"><INPUT id="tidStatusZh" name=tidStatusZh>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端启用时间：</TD>
			<TD class="finput"><INPUT id="openTimeDesc" name=openTimeDesc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端审批状态：</TD>
			<TD class="finput"><INPUT id="confStatZh" name=confStatZh>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端信息录入人：</TD>
			<TD class="finput"><INPUT id="oprAcc" name=oprAcc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">录入时间：</TD>
			<TD class="finput"><INPUT id="oprTimeDesc" name=oprTimeDesc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">审批人：</TD>
			<TD class="finput"><INPUT id="confAcc" name=confAcc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">审批时间：</TD>
			<TD class="finput"><INPUT id="confTimeDesc" name=confTimeDesc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">审批意见：</TD>
			<TD class="finput"><INPUT id="confRmk" name=confRmk>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">注销时间：</TD>
			<TD class="finput"><INPUT id="stopTimeDesc" name=stopTimeDesc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">备注：</TD>
			<TD class="finput"><INPUT id="remark" name=remark>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">最后更新时间：</TD>
			<TD class="finput"><INPUT id="lastUptTimeDesc" name=lastUptTimeDesc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">最后更新账户：</TD>
			<TD class="finput"><INPUT id="lastUptAcc" name=lastUptAcc>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">最后更新机构：</TD>
			<TD class="finput"><INPUT id="lastUptOrg" name=lastUptOrg>
			</TD>
		</TR>

	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="tidstatus" style="display: none;">
<form id="form3" >
<INPUT id=qmid name=mid style="display:none;">
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR>
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
<script type="text/javascript" src="pagejs/console/business/tidmngr/mngrTid.js"></script>

</div>


</body>
</html>