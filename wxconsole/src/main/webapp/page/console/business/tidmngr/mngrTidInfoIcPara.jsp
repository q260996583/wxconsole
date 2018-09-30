<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>终端信息IC卡参数维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="js/validator/formValidatorRegex.js"></script>
<script type="text/javascript" src="pagejs/console/business/tidmngr/mngrTidInfoIcPara.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" style="display:none">
	<tr>
	  <td bgcolor="#ffffff" align="center">
	  <input id="querybutton" class="bt" value="查询"  type="button">
	  </td>
	</tr>
</table>
</form>
</div>
<div id="table"></div>
	
<div id="editTidInfo" style="display: none;">
<form id="form1" >
<input type="hidden" id="u_version" name="version" maxLength="10" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tr>
		<td class="flabel">AID(9F06)</td>
		<td class="fcontent"><input class="cdnInput" id="u_aid" name="aid" readonly="readonly" /></td>
		<td class="flabel"><font color="red">*</font>应用选择指示符ASI(DF01)</td>
		<td class="fcontent"><input class="cdnInput" id="u_asi" name="asi" maxLength="2" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>应用版本号(9F09)</td>
		<td class="fcontent"><input class="cdnInput" id="u_appVersion" name="appVersion" maxLength="4" /></td>
		<td class="flabel"><font color="red">*</font>TAC－缺省(DF11)</td>
		<td class="fcontent"><input class="cdnInput" id="u_tacDefault" name="tacDefault" maxLength="10" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>TAC－联机(DF12)</td>
		<td class="fcontent"><input class="cdnInput" id="u_tacOnline" name="tacOnline" maxLength="10" /></td>
		<td class="flabel"><font color="red">*</font>TAC－拒绝(DF13)</td>
		<td class="fcontent"><input class="cdnInput" id="u_tacReject" name="tacReject" maxLength="10" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>终端最低限额(9F1B)</td>
		<td class="fcontent"><input class="cdnInput" id="u_icOfflineTxnMin" name="icOfflineTxnMin" maxLength="8" /></td>
		<td class="flabel"><font color="red">*</font>偏置随机选择的阈值(DF15)</td>
		<td class="fcontent"><input class="cdnInput" id="u_radomSelLiminit" name="radomSelLiminit" maxLength="8" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>偏置随机选择的最大目标百分数(DF16)</td>
		<td class="fcontent"><input class="cdnInput" id="u_radomSelectMaxpercent" name="radomSelectMaxpercent" maxLength="2" /></td>
		<td class="flabel"><font color="red">*</font>随机选择的目标百分数</td>
		<td class="fcontent"><input class="cdnInput" id="u_radomSelectPercent" name="radomSelectPercent" maxLength="2" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>缺省DDOL(DF14)</td>
		<td class="fcontent"><input class="cdnInput" id="u_ddol" name="ddol" maxLength="128" /></td>
		<td class="flabel"><font color="red">*</font>终端联机PIN支持能力(DF18)</td>
		<td class="fcontent"><input class="cdnInput" id="u_onlinePin" name="onlinePin" maxLength="2" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>终端电子现金交易限额</td>
		<td class="fcontent"><input class="cdnInput" id="u_eCashLimit" name="eCashLimit" maxLength="12" /></td>
		<td class="flabel"><font color="red">*</font>非接触读写器脱机最低限额(DF19)</td>
		<td class="fcontent"><input class="cdnInput" id="u_nonContactLimitMin" name="nonContactLimitMin" maxLength="12" /></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>非接触读写器交易限额(DF20)</td>
		<td class="fcontent"><input class="cdnInput" id="u_nonContactLimitMax" name="nonContactLimitMax" maxLength="12" /></td>
		<td class="flabel"><font color="red">*</font>读写器持卡人验证方法（CVM）所需限制(DF21)</td>
		<td class="fcontent"><input class="cdnInput" id="u_cvmLimit" name="cvmLimit" maxLength="12" /></td>
	</tr>
	
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
		<TR >
			<TD class="flabel">工作时间：</TD>
			<TD class="finput"><INPUT id="workTime" name=workTime>
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
</body>
</html>