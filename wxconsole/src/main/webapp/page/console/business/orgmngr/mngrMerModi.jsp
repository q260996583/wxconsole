<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户信息修改</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrMerModi.js"></script>

</head>
<body>
<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=merName size=20 /></td>
					<td class="qlabel">内部商户编号</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=orgCode maxlength="15" /></td>
					<td class="qlabel">商户状态</td>
					<td class="qinput">
						<select comparison="eq" qtype="string" name="status">
							<OPTION value="" selected="selected">不限</OPTION>
							<OPTION value=00>停用</OPTION>
							<OPTION value=01>启用</OPTION>
							<OPTION value=99>注销</OPTION>
						</select></td>
				</tr>
				<tr>
					<td class="qlabel">商户对外经营名称</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=merOutName size=30 /></td>
					<td class="qlabel">营业执照统一社会信用代码</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=licenseNo maxlength="30" /></td>
					<td class="qlabel">商户账户号码</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=accntNoPrivate maxlength="30" /></td>
				</tr>
				
				<tr>
					<td class="qlabel">修改内容</td>
						<td class="qinput"><select comparison="eq" qtype="string"
						name="modiModule">
							<OPTION value="" selected="selected">不限</OPTION>							
							<OPTION value="00">基本信息</OPTION>
							<OPTION value="01">帐户信息</OPTION>
							<OPTION value="02">风控信息</OPTION>
							<OPTION value="03">费率信息</OPTION>
					</select></td>
					<!-- <td class="qlabel">外部商户号</td>
					<td class="qinput"><input id="merOutCode" name="merOutCode" type="text" maxlength="30" comparison="like"/></td> -->
					<td class="qlabel">商户类别(结算)</td>
					<td class="qinput"><select id="q_mccGrp" name="mccGrp" comparison="eq"></select></td>
					<td class="qlabel">商户类别(预期)</td>
					<td class="qinput"><select id="q_mccGrpImp" name="mccGrpImp" comparison="eq"></select></td>	
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>

<!-- 增加外部商户号 -->
<div id="addmerchantOut" style="display: none;">
<form  id="addouterForm">
	<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
   		<TBODY>
   		<tr style="display: none;">
   			<td class="flabel"> 内部商户号:</td>
   			<td class="fcontent"> <input class="qFormInput" id="addMerCode" name="merCode" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 支付机构:</td>
   			<td class="fcontent"> <input class="qFormInput" id="addBankCode" name="bankCode" readonly="readonly" type="text" maxlength="15" /></td>
   			</tr>
		</TBODY>
	</table>
	</form>
</div>

<!-- 交易权限组 -->
<div id="merchantTransGroup" style="display: none;">
<form id="form5" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">商户编号：</TD>
			<TD class="finput"><input class="qFormInput"  name="orgCode" type="text"  readonly="readonly"  disabled="disabled"/>
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户名称：</TD>
			<TD class="finput"><input class="qFormInput"  name="merName" type="text"  readonly="readonly"  disabled="disabled"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户交易权限组：</TD>
			<TD class="finput">
			<select id="tranLimitParam" name="tranLimitParam" comparison="eq"></select>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<!-- 修改外部商户号 -->
<div id="editmerchantOut" style="display: none;">
<form  id="editouterForm">
	<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
   		<TBODY>
   		<tr style="display: none;">
   			<td class="flabel"> 内部商户号:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editMerCode" name="merCode" type="text" maxlength="15" /></td>
   			</tr>
   			<tr style="display: none">
   			<td class="flabel" > 版本号:</td>
   			<td class="fcontent"> <input class="qFormInput"  name="version" type="text" maxlength="20" readonly="readonly"/> </td>
   			</tr>
   			<tr>
   			<td class="flabel"> 支付机构:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editBankCode" name="bankCode" type="text" maxlength="15" readonly="readonly" /></td>
   			</tr>
   			<tr style="display: none">
   			<td class="flabel" > 原外部商户号:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editMerOutCode" name="merOutCode" type="text" maxlength="20" readonly="readonly"/> </td>
   			</tr>
   			<tr>
   			<td class="flabel"> <font color="red">*</font>外部商户号:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editMerOutCodeNew" name="merOutCodeNew" type="text" maxlength="20" readonly="readonly"/> </td>
   			</tr>
   			<tr>
   			<td class="flabel"> <font color="red">*</font> 起效清算日:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editStartDate" name="startDate" type="text" maxlength="8" /> </td>
   			</tr>
   			<tr>
   			<td class="flabel"> <font color="red">*</font>失效清算日:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editEndDate" name="endDate" type="text" maxlength="8" /> </td>
   			</tr>
   			<tr>
   			<td class="flabel"> 状态:</td>
   			<td class="fcontent"> <input class="qFormInput" id="editStatue" name="statueZh" type="text" maxlength="20" readonly="readonly"/> </td>
   			</tr>
		</TBODY>
	</table>
	</form>
</div>
<!-- 支付机构选择弹出窗口 -->
<div id="bankSelect" style="display: none;">
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
			<td class="qlabel">支付机构名称</td>
			<td class="qinput">
			<input type='hidden' id="pbankId"  name="bankId" class="param"/>
			<input type="text" name="bankName" comparison="like" qtype="string"/></td>
			<td class="qlabel">支付机构代码</td>
			<td class="qinput"><input  type="text" name="bankId" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="6" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querybank"  value="查询"/></td>
		</tr>
</table>
</div>


<!-- 外部商户号弹出框 -->
<div id="outMidSelect" style="display: none;">
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
			<td class="qlabel">外部商户名称</td>
			<td class="qinput">
			<input type='hidden' id="inputBankCode"  name="bankCode" comparison="like" qtype="string" />
			<input type="text" name="cardAcceptName" comparison="like" qtype="string"/></td>
			<td class="qlabel">外部商户号</td>
			<td class="qinput"><input  type="text" name="merOutCode" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="6" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querybank"  value="查询"/></td>
		</tr>
</table>
</div>






		<!-- 商户外部商户号信息列表页面 -->
		<DIV id="outerMertable" style="display: none">
		
		</DIV>

	<!-- 修改弹出框 -->
	<div id="modiDialog" class="detailDialog" style="display: none;">
		<form id="form1">
		
<!-- 基本信息 -->  
  <table id="baseInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%"> 
    <tr>
      <td class="flabel">商户名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="merName" name="merName" type="text" maxlength="100"/>
        <div id="merNameTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户对外经营名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="merOutName" name="merOutName" type="text" maxlength="100"/>
        <div id="merOutNameTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户英文名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="enName" name="enName" type="text" maxlength="100"/>
        <div id="enNameTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户对外英文名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="enOutName" name="enOutName" type="text" maxlength="100"/>
        <div id="enOutNameTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户类别号：</td>  
      <td class="fcontent"> 
        <input class="qFormInput" maxLength="15" id="mcc" name="mcc" readonly="readonly"/>
        <div id="mccTip"/> 
      </td>
    </tr>  
    <tr>
      <td class="flabel">地区代码:</td>  
      <!-- <td class="fcontent"><select id="areaCode" name="areaCode">-->  
      <td class="fcontent"> 
        <input class="qFormInput" maxLength="15" id="areaCode" name="areaCode" readonly="readonly"/>  
        <div id="areaCodeTip"/> 
        <!-- </select> <input class="qFormInput" id="areaCode" name="areaCode" type="text" maxlength="10" /> -->
      </td>
    </tr>  
    <tr>
      <td class="flabel">营业执照统一社会信用代码:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="licenseNo" name="licenseNo" type="text" maxlength="30"/>
        <div id="licenseNoTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">营业执照有效期:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="bizLicnoExpireDate" name="bizLicnoExpireDate" type="text" maxlength="30"/>
        <div id="bizLicnoExpireDateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">营业执照注册地址:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="licenseAddr" name="licenseAddr" type="text" maxlength="200"/>
        <div id="licenseAddrTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">税务登记证号码:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="taxNo" name="taxNo" type="text" maxlength="30"/>
        <div id="taxNoTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">组织机构代码证:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="certNo" name="certNo" type="text" maxlength="30"/>
        <div id="certNoTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户法定代表人姓名:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="personName" name="personName" type="text" maxlength="20"/>
        <div id="personNameTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户法定代表人证件类型:</td>  
      <td class="fcontent">
        <select class="qFormInput" id="personNoType" name="personNoType" type="text" maxlength="10"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户法定代表人证件号:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="personNo" name="personNo" type="text" maxlength="20"/>
        <div id="personNoTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户法定代表人证件有效期:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="personNoExpireDate" name="personNoExpireDate" type="text" maxlength="100"/>
        <div id="personNoExpireDateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">用户装机地址:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="address" name="address" type="text" maxlength="200"/>
        <div id="addressTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">营业面积:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="area" name="area" type="text" maxlength="20"/>
        <div id="areaTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">收银台数:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="posNum" name="posNum" type="text" maxlength="5"/>
        <div id="posNumTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户联系人:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="merContact" name="merContact" type="text" maxlength="60"/>
        <div id="merContactTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户传真:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="merFax" name="merFax" type="text" maxlength="20"/>
        <div id="merFaxTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户联系电话:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="merPhone" name="merPhone" type="text" maxlength="50"/>
        <div id="merPhoneTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户营销人员姓名:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="merketPerson" name="merketPerson" type="text" maxlength="100"/>
        <div id="merketPersonTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">企业成立日期:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="foundedDate" name="foundedDate" type="text" maxlength="8"/>
        <div id="foundedDateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">月租金(元):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="monthRent" name="monthRent" type="text" maxlength="8"/>
        <div id="monthRentTip"/>
      </td>
    </tr> 
  </table>  
  <!-- 帐户信息 -->  
  <table id="acntInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%"> 
    <tr>
      <td class="flabel">对公账户:</td>  
      <td class="fcontent">
        <select id="bankAccntId" name="bankAccntId" comparison="eq"/> 
      </td>
    </tr>  
    <!-- <tr><td class="flabel">开户银行名称(他行):</td>
    <td class="fcontent"><input class="qFormInput" id="accntBank" name="accntBank" type="text" maxlength="100" /></td></tr> -->  
    <tr>
      <td class="flabel">帐户类型:</td>  
      <td class="fcontent">
        <select id="accntType" name="accntType"/>
        <!-- <input class="qFormInput" id="accntType" name="accntType" type="text" maxlength="2" /> -->
      </td>
    </tr>  
    <!-- <tr><td class="flabel">卡折标志:</td>
    <td class="fcontent"><select id="depositFlag" name="depositFlag"></select><input class="qFormInput" id="depositFlag" name="depositFlag" type="text" maxlength="2" /></td></tr> -->  
    <tr>
      <td class="flabel">商户帐户号码:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="accntNoPrivate" name="accntNoPrivate" type="text" maxlength="30"/>
        <div id="accntNoPrivateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户帐户名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="accntNamePrivate" name="accntNamePrivate" type="text" maxlength="100"/>
        <div id="accntNamePrivateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">开户行总行号:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="accntBankPrivate" readonly="true" name="accntBankPrivate" type="text" maxlength="100"/>
        <div id="accntBankPrivateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">开户行支行号:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="bankBranchNo" name="bankBranchNo" type="text" maxlength="100"/>
        <div id="bankBranchNoTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">开户行总行名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="accntBankPrivateDesc" readonly="true" name="accntBankPrivateDesc" type="text" maxlength="100"/>
        <div id="accntBankPrivateDescTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">开户行支行名称:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="bankBranchNoDesc" readonly="true" name="bankBranchNoDesc" type="text" maxlength="100"/>
        <div id="bankBranchNoDescTip"/>
      </td>
    </tr>  
    <!-- <tr><td class="flabel">是否为浦发银行:</td>
    <td class="fcontent"><select id="spdFlag" name="spdFlag"></select></td></tr> -->  
    <tr>
      <td class="flabel">商户开户人证件类型:</td>  
      <td class="fcontent">
        <select class="qFormInput" id="cardPersonNoType" name="cardPersonNoType" maxlength="2"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户开户人证件号:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="cardPersonNo" name="cardPersonNo" type="text" maxlength="20"/>
        <div id="cardPersonNoTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">商户开户人证件有效期:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text" maxlength="30"/>
        <div id="cardLicnoExpireDateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">开户行网点编号:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="accntBankNoPrivate" name="accntBankNoPrivate" type="text" maxlength="20"/>
        <div id="accntBankNoPrivateTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">开户银行编号:</td>  
      <td class="fcontent"> 
        <INPUT id="accntBankCodePrivate" name="accntBankCodePrivate" comparison="eq" readonly="readonly"/> 
      </td> 
    </tr> 
  </table>  
  <!-- 风控信息 -->  
  <table id="riskInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%"> 
    <tr>
      <td class="flabel">营业开始时间:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="busiBgtime" name="busiBgtime" type="text" maxlength="10"/>
        <div id="busiBgtimeTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">营业结束时间:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="busiEndtime" name="busiEndtime" type="text" maxlength="10"/>
        <div id="busiEndtimeTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">是否屏蔽信用卡:</td>  
      <td class="fcontent">
        <select id="creditSign" name="creditSign"/>
        <!-- <input class="qFormInput" id="creditSign" name="creditSign" type="text" maxlength="2" /> -->
      </td>
    </tr>  
    <tr>
      <td class="flabel">非借记卡单笔交易限额(元):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="tranLimit" name="tranLimit" type="text" maxlength="12"/>
        <div id="tranLimitTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">借记卡单笔交易限额(元):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="tranLimitDebit" name="tranLimitDebit" type="text" maxlength="12"/>
        <div id="tranLimitDebitTip"/>
      </td>
    </tr>  
    <tr>
      <td class="flabel">日交易限额(元):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="dayTranLimit" name="dayTranLimit" type="text" maxlength="12"/>
        <div id="dayTranLimitTip"/>
      </td>
    </tr>  
    <!-- <tr><td class="flabel">商户风险评级:</td>
    <td class="fcontent"><select id="merRisk" name="merRisk"></select><input class="qFormInput" id="merRisk" name="merRisk" type="text" maxlength="2" /></td></tr> --> 
  </table>  
  <!-- 费率信息 -->  
  <table id="rateInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%"> 
    <input type="hidden" id="settlePeriod" name="settlePeriod"/>  
    <input type="hidden" id="feeStlmType" name="feeStlmType"/>  
    <input type="hidden" id="feeRate" name="feeRate"/>  
    <input type="hidden" id="feeVal" name="feeVal"/>  
    <input type="hidden" id="mccGrpImp" name="mccGrpImp"/>  
    <input type="hidden" id="topValue" name="topValue"/>  
    <input type="hidden" id="outVisFeeRate" name="outVisFeeRate"/>  
    <input type="hidden" id="creditMaxFee" name="creditMaxFee"/>  
    <tr> 
      <td class="flabel">商户类别(预期):</td>  
      <td class="fcontent">
        <input class="qFormInput" readonly="readonly" id="mccGrpImpDesc" name="mccGrpImpDesc"/>
        <div id="mccGrpImpDescTip"/>
      </td> 
    </tr>  
    <tr> 
      <td class="flabel">进件类别备注:</td>  
      <td class="fcontent">
        <textarea class="qFormInput" readonly="readonly" id="mccRemark" name="mccRemark"></textarea>
        <div id="mccRemarkTip"/>
      </td> 
    </tr>  
    <tr> 
      <td class="flabel">商户类别(结算):</td>  
      <td class="fcontent">
        <select class="qFormInput" id="mccGrp" name="mccGrp"/>
      </td> 
    </tr>  
    <tr> 
      <td class="flabel">借记交易费率(%):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="debitRate" name="debitRate" type="text" maxlength="12" xtype="rate4"/>
        <div id="debitRateTip"/>
      </td> 
    </tr>  
    <tr> 
      <td class="flabel">借记交易封顶费(元):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="debitMaxFee" name="debitMaxFee" type="text" maxlength="12" xtype="money"/>
        <div id="debitMaxFeeTip"/>
      </td> 
    </tr>  
    <tr> 
      <td class="flabel">贷记交易费率(%):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="creditRate" name="creditRate" type="text" maxlength="12" xtype="rate4"/>
        <div id="creditRateTip"/>
      </td> 
    </tr>  
    <tr> 
      <td class="flabel">微信易费率(%):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="wechatPayRate" name="wechatPayRate" type="text" maxlength="12" xtype="rate4"/>
        <div id="wechatPayRateTip"/>
      </td> 
    </tr> 
    <tr> 
      <td class="flabel">外卡交易费率(%):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="outCardRate" name="outCardRate" type="text" maxlength="12" xtype="rate4"/>
        <div id="outCardRateTip"/>
      </td> 
    </tr>
    <!--      -->
    <tr > 
      <td class="flabel">支付宝交易费率(%):</td>  
      <td class="fcontent">
        <input class="qFormInput" id="alipayPayRate" name="alipayPayRate" type="text" maxlength="12" xtype="rate4"/>
        <div id="alipayPayRateTip"/>
      </td> 
    </tr>
    
    <!--wxb  -->
    <tr > 
      <td class="flabel">商户结算类型:</td>  
      <td class="fcontent">
        <select id='merStatementsType' name='merStatementsType' style="width:60px " >
			<option ></option>
			<option >T1</option>
    		<option >D0</option>
		</select>
      </td> 
    </tr>
    
    <tr > 
      <td class="flabel">垫资手续费费率(%):</td>  
      <td class="fcontent">
        <input id="a_merStatementsRate"
						name="merStatementsRate" type="text" xtype="rate4" maxLength="100" />
        <div id="alipayPayRateTip"/>
      </td> 
    </tr>

    <tr> 
      <td class="flabel">生效日期:</td>  
      <td class="fcontent">
        <input class="qFormInput" id="expectDate" name="expectDate" type="text" maxlength="8" readonly="readonly"/>
        <div id="expectDateTip"/>
      </td> 
    </tr> 
  </table> 



		<!-- 其他信息 -->
			<table id="otherInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr><td class="flabel">版本号:</td>
    <td class="fcontent"><input class="qFormInput" id="version" name="version" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">内部机构号:</td>
    <td class="fcontent"><input class="qFormInput" id="orgCode" name="orgCode" type="text" maxlength="15" /></td></tr>
<tr><td class="flabel">外部商户号(银联):</td>
    <td class="fcontent"><input class="qFormInput" id="mid" name="mid" type="text" maxlength="15" /></td></tr>
<tr><td class="flabel">应用Id:</td>
    <td class="fcontent"><input class="qFormInput" id="appId" name="appId" type="text" maxlength="4" /></td></tr>
<tr><td class="flabel">对应支付机构代码:</td>
    <td class="fcontent"><input class="qFormInput" id="payOrgCode" name="payOrgCode" type="text" maxlength="20" /></td></tr>

<tr><td class="flabel">扣款协议号:</td>
    <td class="fcontent"><input class="qFormInput" id="contractNo" name="contractNo" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">营销机构号:</td>
    <td class="fcontent"><input class="qFormInput" id="marketNo" name="marketNo" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">营销机构联系电话:</td>
    <td class="fcontent"><input class="qFormInput" id="marketPhone" name="marketPhone" type="text" maxlength="50" /></td></tr>
<tr><td class="flabel">客户经理姓名:</td>
    <td class="fcontent"><input class="qFormInput" id="cusmngrName" name="cusmngrName" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">客户经理手机:</td>
    <td class="fcontent"><input class="qFormInput" id="cusmngrMob" name="cusmngrMob" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">业务开通情况:</td>
    <td class="fcontent"><input class="qFormInput" id="businessStat" name="businessStat" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">分期期数:</td>
    <td class="fcontent"><input class="qFormInput" id="installmentPeriod" name="installmentPeriod" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">商品编号:</td>
    <td class="fcontent"><input class="qFormInput" id="productId" name="productId" type="text" maxlength="20" /></td></tr>
<!-- <tr><td class="flabel">分期手续费收取类型:</td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeType" name="installmentFeeType" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">分期手续费费率:</td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeRate" name="installmentFeeRate" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">分期手续费固定值:</td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeVal" name="installmentFeeVal" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">分期手续费最大值:</td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeMax" name="installmentFeeMax" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">分期手续费最小值:</td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeMin" name="installmentFeeMin" type="text" maxlength="10" /></td></tr> -->
<!-- <tr><td class="flabel">积分折算比率:</td>
    <td class="fcontent"><input class="qFormInput" id="pointRate" name="pointRate" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">积分手续费费率:</td>
    <td class="fcontent"><input class="qFormInput" id="pointFeeRate" name="pointFeeRate" type="text" maxlength="5" /></td></tr> -->
<!-- <tr><td class="flabel">特惠商户:</td>
    <td class="fcontent"><input class="qFormInput" id="specFlag" name="specFlag" type="text" maxlength="1" /></td></tr> -->
<tr><td class="flabel">业务关联情况:</td>
    <td class="fcontent"><input class="qFormInput" id="busiStat" name="busiStat" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">接入模式:</td>
    <td class="fcontent"><input class="qFormInput" id="accessMode" name="accessMode" type="text" maxlength="1" /></td></tr>
<!-- <tr><td class="flabel">是否有第三方服务公司:</td>
    <td class="fcontent"><input class="qFormInput" id="corpSign" name="corpSign" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">第三方服务公司编号:</td>
    <td class="fcontent"><input class="qFormInput" id="corpNo" name="corpNo" type="text" maxlength="20" /></td></tr> -->
<tr><td class="flabel">商户信息录入人:</td>
    <td class="fcontent"><input class="qFormInput" id="oprAcc" name="oprAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">商户信息录入时间:</td>
    <td class="fcontent"><input class="qFormInput" id="oprTime" name="oprTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">商户注销人:</td>
    <td class="fcontent"><input class="qFormInput" id="cnlAcc" name="cnlAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">商户注销时间:</td>
    <td class="fcontent"><input class="qFormInput" id="cnlTime" name="cnlTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">审批人:</td>
    <td class="fcontent"><input class="qFormInput" id="confAcc" name="confAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">审批时间:</td>
    <td class="fcontent"><input class="qFormInput" id="confTime" name="confTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">审批意见:</td>
    <td class="fcontent"><input class="qFormInput" id="confRmk" name="confRmk" type="text" maxlength="200" /></td></tr>

<tr><td class="flabel">停用/启用:</td>
    <td class="fcontent"><input class="qFormInput" id="status" name="status" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">审批状态:</td>
    <td class="fcontent"><input class="qFormInput" id="confStatus" name="confStatus" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">文件生成标志:</td>
    <td class="fcontent"><input class="qFormInput" id="fileFlag" name="fileFlag" type="text" maxlength="1" /></td></tr>
<tr><td class="flabel">商户发展放费率:</td>
    <td class="fcontent"><input class="qFormInput" id="merDevRate" name="merDevRate" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">商户启用时间:</td>
    <td class="fcontent"><input class="qFormInput" id="merStDate" name="merStDate" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">备注:</td>
    <td class="fcontent"><input class="qFormInput" id="remark" name="remark" type="text" maxlength="200" /></td></tr>
<tr><td class="flabel">最后更新时间:</td>
    <td class="fcontent"><input class="qFormInput" id="lastUptTime" name="lastUptTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">最后更新帐户:</td>
    <td class="fcontent"><input class="qFormInput" id="lastUptAcc" name="lastUptAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">最后更新机构:</td>
    <td class="fcontent"><input class="qFormInput" id="lastUptOrg" name="lastUptOrg" type="text" maxlength="30" /></td></tr>
<tr><td class="flabel">原帐户号码:</td>
    <td class="fcontent"><input class="qFormInput" id="oldAccntNo" name="oldAccntNo" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">原帐户维护标志:</td>
    <td class="fcontent"><input class="qFormInput" id="acctFlag" name="acctFlag" type="text" maxlength="1" /></td></tr>
<tr><td class="flabel">merDevName:</td>
    <td class="fcontent"><input class="qFormInput" id="merDevName" name="merDevName" type="text" maxlength="100" /></td></tr>
<tr><td class="flabel">brandFeeMax:</td>
    <td class="fcontent"><input class="qFormInput" id="brandFeeMax" name="brandFeeMax" type="text" maxlength="12" /></td></tr>

<tr><td class="flabel">编辑审核标记:</td>
    <td class="fcontent"><input class="qFormInput" id="auditResult" name="auditResult" type="text" maxlength="1" /></td></tr>
<tr><td class="flabel">编辑模块:</td>
    <td class="fcontent"><input class="qFormInput" id="modiModule" name="modiModule" type="text" maxlength="2" /></td></tr>

			</table>
		</form>
	</div>

   	<!-- 商户类别弹出窗口 -->
<div id="mccSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">MCC码</td>
		<td class="qinput">
		<input type="text" name="mcc" comparison="like" qtype="string"/></td>
			<td class="qlabel">描述</td>
		<td class="qinput"><input  type="text" name="mccDesc" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>


	<!-- 地区代码弹出窗口 -->
<div id="areaCodeSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">地区代码</td>
		<td class="qinput">
		<input type="text" name="codeNo" comparison="like" qtype="string"/></td>
			<td class="qlabel">地区名称</td>
		<td class="qinput"><input  type="text" name="codeName" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>

<!-- 开户银行弹出窗口 -->
<div id="accntBankNoSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">开户银行编号</td>
		<td class="qinput">
		<input type="text" name="szdfBankCode" comparison="like" qtype="string"/></td>
		<td class="qlabel">开户银行名称</td>
		<td class="qinput"><input  type="text" name="szdfBankName" comparison="like" qtype="string"/></td>
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
		   <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>

<!-- 开户行选择弹出窗口 -->
	<div id="branchBankSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">银行行号</td>
					<td class="qinput">
						<input type="text" name="unionBankNo" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">银行名称</td>
					<td class="qinput">
						<input type="text" name="bankName" comparison="like" qtype="string" />
					</td>
				</tr>
				<tr>
					<td class="qlabel">上级行号</td>
					<td class="qinput">
						<input type="text" name="parentBankNo" comparison="like" qtype="string" />
					</td>
					<td></td>
					<td></td>
					<td></td>
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