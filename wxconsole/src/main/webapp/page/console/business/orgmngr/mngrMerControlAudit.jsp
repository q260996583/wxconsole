<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户信息审核</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrMerControlAudit.js"></script>
<style type="text/css">
 .diffInfo19891028{
 	background-color: red;
 }
</style>
</head>
<body>
<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<input type="hidden" comparison="eq" qtype="string"
						name="modiModule" value="02"/>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=merName size=20 /></td>
					<td class="qlabel">商户编号</td>
					<td class="qinput"><input type="text" value=""
						comparison="like" qtype="string" name=orgCode maxlength="15" /></td>
					<td class="qlabel">商户状态</td>
					<td class="qinput"><select comparison="eq" qtype="string"
						name="status">
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
					<td class="qlabel">审批状态</td>
						<td class="qinput"><select comparison="eq" qtype="string"
						name="auditResult">
							<OPTION value="" selected="selected">不限</OPTION>
							<OPTION value="0">待审核</OPTION>
							<OPTION value="1">审核通过</OPTION>
							<OPTION value="2">驳回</OPTION>
					</select></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
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
<!-- 审核弹出框 -->
<div id="auditDialog" class="detailDialog" style="display: none;">
<form id="form1">	
<!-- 基本信息 -->
<table id="baseInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="90%">
<tr>
<td></td>
<td>原始信息</td>
<td>修改后信息</td>
</tr>
<tr id="merNameTr"><td class="flabel">商户名称:</td> <td><input class="qFormInput" id="merName1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merName" name="merName" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户对外经营名称:</td> <td><input id="merOutName1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merOutName" name="merOutName" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户英文名称:</td> <td><input id="enName1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="enName" name="enName" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户对外英文名称:</td> <td><input id="enOutName1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="enOutName" name="enOutName" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户类别码:</td> <td><input id="mcc1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="mcc" name="mcc" type="text" maxlength="10" readonly="readonly"/></td></tr>
<tr><td class="flabel">地区代码:</td> <td><input id="areaCode1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="areaCode" name="areaCode" type="text" maxlength="10" readonly="readonly"/></td></tr>
<tr><td class="flabel">营业执照统一社会信用代码:</td> <td><input id="licenseNo1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="licenseNo" name="licenseNo" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">营业执照有效期:</td> <td><input id="bizLicnoExpireDate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="bizLicnoExpireDate" name="bizLicnoExpireDate" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">营业执照注册地址:</td> <td><input id="licenseAddr1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="licenseAddr" name="licenseAddr" type="text" maxlength="200" readonly="readonly"/></td></tr>
<tr><td class="flabel">税务登记证号码:</td> <td><input id="taxNo1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="taxNo" name="taxNo" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">组织机构代码证:</td> <td><input id="certNo1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="certNo" name="certNo" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户法定代表人姓名:</td> <td><input id="personName1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="personName" name="personName" type="text" maxlength="20" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户开户人证件类型:</td> <td><input id="personNoTypeDesc1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="personNoTypeDesc" name="personNoTypeDesc" maxlength="18" readonly="readonly" /></td></tr>
<tr><td class="flabel">商户法定代表人证件号:</td> <td><input id="personNo1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="personNo" name="personNo" type="text" maxlength="20" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户法定代表人证件有效期:</td> <td><input id="personNoExpireDate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="personNoExpireDate" name="personNoExpireDate" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">用户装机地址:</td> <td><input id="address1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="address" name="address" type="text" maxlength="200" readonly="readonly"/></td></tr>
<tr><td class="flabel">营业面积:</td> <td><input id="area1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="area" name="area" type="text" maxlength="20" readonly="readonly"/></td></tr>
<tr><td class="flabel">收银台数:</td> <td><input id="posNum1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="posNum" name="posNum" type="text" maxlength="5" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户联系人:</td> <td><input id="merContact1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merContact" name="merContact" type="text" maxlength="60" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户传真:</td> <td><input id="merFax1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merFax" name="merFax" type="text" maxlength="20" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户联系电话:</td> <td><input id="merPhone1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merPhone" name="merPhone" type="text" maxlength="50" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户营销人员姓名:</td> <td><input id="merketPerson1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merketPerson" name="merketPerson" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">企业成立日期:</td> <td><input id="foundedDate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="foundedDate" name="foundedDate" type="text" maxlength="8" readonly="readonly"/></td></tr>
<tr><td class="flabel">月租金(元):</td> <td><input id="monthRent1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="monthRent" name="monthRent" type="text" maxlength="8" readonly="readonly"/></td></tr>
</table>
<!-- 帐户信息 -->
<table id="acntInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="90%">
<tr>
<td></td>
<td>原始信息</td>
<td>修改后信息</td>
</tr>
<tr><td class="flabel">开户银行名称(他行):</td> <td><input id="accntBank1" readonly="readonly"/>
	<input id="bankNo1" type="hidden" />
   <input class="qFormInput" id="bankNo" name="bankNo" type="hidden" maxlength="20" />
   <input id="accntName1" type="hidden" />
    <input class="qFormInput" id="accntName" name="accntName" type="hidden"  />
    <input id="accntNo1" type="hidden" />
	<input class="qFormInput" id="accntNo" name="accntNo" type="hidden" maxlength="30" />
	</td>
    <td class="fcontent"><input class="qFormInput" id="accntBank" name="accntBank" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">帐户类型:</td> <td><input id="accntType1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntType" name="accntTypeZh" type="text" maxlength="2" readonly="readonly"/></td></tr>
<!-- <tr><td class="flabel">卡折标志:</td> <td><input id="depositFlag1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="depositFlag" name="depositFlagZh" type="text" maxlength="2" readonly="readonly"/></td></tr> -->
<tr><td class="flabel">对公账户:</td> <td><input id="bankName1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="bankName" name="bankName" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户帐户号码:</td> <td><input id="accntNoPrivate1"  readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntNoPrivate" name="accntNoPrivate" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户帐户名称:</td> <td><input id="accntNamePrivate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntNamePrivate" name="accntNamePrivate" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">开户行总行号:</td> <td><input id="accntBankPrivate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntBankPrivate" name="accntBankPrivate" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">开户行支行号:</td> <td><input id="bankBranchNo1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="bankBranchNo" name="bankBranchNo" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">开户行总行名称:</td> <td><input id="accntBankPrivateDesc1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntBankPrivateDesc" name="accntBankPrivateDesc" type="text" maxlength="100" readonly="readonly"/></td></tr>
<tr><td class="flabel">开户行支行名称:</td> <td><input id="bankBranchNoDesc1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="bankBranchNoDesc" name="bankBranchNoDesc" type="text" maxlength="100" readonly="readonly"/></td></tr>

<!-- <tr><td class="flabel">是否为浦发银行:</td> <td><input id="spdFlag1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="spdFlag" name="spdFlagZh" type="text" maxlength="100" readonly="readonly"/></td></tr> -->
<tr><td class="flabel">商户开户人证件类型:</td> <td><input id="cardPersonNoTypeDesc1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="cardPersonNoTypeDesc" name="cardPersonNoTypeDesc" maxlength="18" readonly="readonly"/></td></tr>

<tr><td class="flabel">商户开户人证件号:</td> <td><input id="cardPersonNo1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="cardPersonNo" name="cardPersonNo" type="text" maxlength="20" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户开户人证件有效期:</td> <td><input id="cardLicnoExpireDate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text" maxlength="30" readonly="readonly"/></td></tr>
<tr><td class="flabel">开户行网点编号:</td> <td><input id="accntBankNoPrivate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntBankNoPrivate" name="accntBankNoPrivate" type="text" maxlength="5" readonly="readonly"/></td></tr>
<tr><td class="flabel">开户银行编号:</td> <td><input id="accntBankCodePrivate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="accntBankCodePrivate" name="accntBankCodePrivate" type="text" maxlength="2" readonly="readonly"/></td></tr>
</table>
<!-- 风控信息 -->
<table id="riskInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="90%">
<tr>
<td></td>
<td>原始信息</td>
<td>修改后信息</td>
</tr>
<tr><td class="flabel">营业开始时间:</td> <td><input id="busiBgtime1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="busiBgtime" name="busiBgtime" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">营业结束时间:</td> <td><input id="busiEndtime1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="busiEndtime" name="busiEndtime" type="text" maxlength="10"/></td></tr>
<tr><td class="flabel">是否屏蔽信用卡:</td> <td><input id="creditSignZh1"  readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="creditSignZh" name="creditSignZh" type="text" maxlength="2" readonly="readonly"/></td></tr>
<tr><td class="flabel">非借记卡单笔交易限额(元):</td> <td><input id="tranLimit1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="tranLimit" name="tranLimit" type="text" maxlength="12" readonly="readonly"/></td></tr>
<tr><td class="flabel">借记卡单笔交易限额(元):</td> <td><input id="tranLimitDebit1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="tranLimitDebit" name="tranLimitDebit" type="text" maxlength="12" readonly="readonly"/></td></tr>
<tr><td class="flabel">日交易限额(元):</td> <td><input id="dayTranLimit1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="dayTranLimit" name="dayTranLimit" type="text" maxlength="12" readonly="readonly"/></td></tr>
<tr><td class="flabel">商户风险评级:</td> <td><input id="merRiskZh1"  readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="merRiskZh" name="merRiskZh" type="text" maxlength="2" readonly="readonly"/></td></tr>
</table>
<!-- 费率信息 -->
<table id="rateInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="90%">
<tr>
<td></td>
<td>原始信息</td>
<td>修改后信息</td>
</tr>
<tr>
	<td class="flabel">商户类别:</td>
	<td><input id="mccGrpDesc1" readonly="readonly" /></td>
	<td class="fcontent"><input class="qFormInput" id="mccGrpDesc" name="mccGrpDesc" type="text" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">借记交易费率(%):</td>
	<td><input id="debitRate1" readonly="readonly" xtype="rate4" /></td>
	<td class="fcontent"><input class="qFormInput" id="debitRate" name="debitRate" type="text" xtype="rate4" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">借记交易封顶费(元):</td>
	<td><input id="debitMaxFee1" readonly="readonly" xtype="money" /></td>
	<td class="fcontent"><input class="qFormInput" id="debitMaxFee" name="debitMaxFee" type="text" xtype="money" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">贷记交易费率(%):</td>
	<td><input id="creditRate1" readonly="readonly" xtype="rate4" /></td>
	<td class="fcontent"><input class="qFormInput" id="creditRate" name="creditRate" type="text" xtype="rate4" readonly="readonly"/></td>
</tr>

<!-- 
<tr><td class="flabel">本金结算周期:</td> <td><input id="settlePeriod1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="settlePeriod" name="settlePeriod" type="text" maxlength="5" readonly="readonly"/></td></tr>
<tr><td class="flabel">手续费收取类型:</td> <td><input id="feeStlmTypeZh1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="feeStlmTypeZh" name="feeStlmTypeZh" type="text" maxlength="2" readonly="readonly"/></td></tr>
<tr><td class="flabel">手续费率(%):</td> <td><input id="feeRate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="feeRate" name="feeRate" type="text" maxlength="2" readonly="readonly"/></td></tr>
<tr><td class="flabel">手续费固定值(元):</td> <td><input id="feeVal1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="feeVal" name="feeVal" type="text" maxlength="10" readonly="readonly"/></td></tr>
<tr><td class="flabel">手续费封顶值(元):</td> <td><input id="topValue1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="topValue" name="topValue" type="text" maxlength="10" readonly="readonly"/></td></tr>
<tr><td class="flabel">外卡手续费率(%):</td> <td><input id="outVisFeeRate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="outVisFeeRate" name="outVisFeeRate" type="text" maxlength="5" readonly="readonly"/></td></tr>
 -->
<!-- <tr><td class="flabel">特殊计费:</td> <td><input id="specMccZh1" name="specMccZh" readonly="readonly"/></td>
    <td class="fcontent"><input id="specMccZh" name="specMccZh"  readonly="readonly"/></td></tr>-->
<!-- <tr><td class="flabel">品牌服务费是否清算标识:</td> <td><input id="brandFeeFlagZh1" name="brandFeeFlagZh" type="text" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="brandFeeFlagZh" name="brandFeeFlagZh" type="text" maxlength="10" readonly="readonly"/></td></tr> -->
<tr><td class="flabel">预期修改日期:<td><input id="expectDate1" name="expectDate1" type="text" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="expectDate" name="expectDate" type="text" maxlength="10" readonly="readonly"/></td></tr>

<!-- <tr><td class="flabel">是否支持建行分期:</td> <td><input id="ipTypeZh1" name="ipTypeZh1" type="text" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="ipTypeZh" name="ipTypeZh" type="text" maxlength="10" readonly="readonly"/></td></tr>
<tr><td class="flabel">建行分期手续费收取类型:</td> <td><input id="ipFeeTypeZh1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="ipFeeTypeZh" name="ipFeeTypeZh" type="text" maxlength="2" readonly="readonly"/></td></tr>
<tr><td class="flabel">建行分期手续费率(%):</td> <td><input id="ipFeeRate1" readonly="readonly"/></td>
    <td class="fcontent"><input class="qFormInput" id="ipFeeRate" name="ipFeeRate" type="text" maxlength="2" readonly="readonly"/></td></tr> -->
</table>
<!-- 其他信息 -->
<table id="otherInfo" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="90%">
<tr>
<td></td>
<td>原始信息</td>
<td>修改后信息</td>
</tr>
<tr><td class="flabel">版本号:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="version" name="version" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">内部机构号:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="orgCode" name="orgCode" type="text" maxlength="15" /></td></tr>
<tr><td class="flabel">外部商户号(银联):</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="mid" name="mid" type="text" maxlength="15" /></td></tr>
<tr><td class="flabel">应用Id:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="appId" name="appId" type="text" maxlength="4" /></td></tr>
<tr><td class="flabel">对应支付机构代码:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="payOrgCode" name="payOrgCode" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">扣款协议号:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="contractNo" name="contractNo" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">营销机构号:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="marketNo" name="marketNo" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">营销机构联系电话:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="marketPhone" name="marketPhone" type="text" maxlength="50" /></td></tr>
<tr><td class="flabel">客户经理姓名:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="cusmngrName" name="cusmngrName" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">客户经理手机:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="cusmngrMob" name="cusmngrMob" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">业务开通情况:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="businessStat" name="businessStat" type="text" maxlength="20" /></td></tr>
<!-- <tr><td class="flabel">分期期数:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="installmentPeriod" name="installmentPeriod" type="text" maxlength="5" /></td></tr> -->
<tr><td class="flabel">商品编号:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="productId" name="productId" type="text" maxlength="20" /></td></tr>
<!-- <tr><td class="flabel">分期手续费收取类型:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeType" name="installmentFeeType" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">分期手续费费率:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeRate" name="installmentFeeRate" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">分期手续费固定值:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeVal" name="installmentFeeVal" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">分期手续费最大值:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeMax" name="installmentFeeMax" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">分期手续费最小值:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="installmentFeeMin" name="installmentFeeMin" type="text" maxlength="10" /></td></tr> -->
<!-- <tr><td class="flabel">积分折算比率:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="pointRate" name="pointRate" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">积分手续费费率:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="pointFeeRate" name="pointFeeRate" type="text" maxlength="5" /></td></tr> -->
<!-- <tr><td class="flabel">特惠商户:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="specFlag" name="specFlag" type="text" maxlength="1" /></td></tr> -->
<tr><td class="flabel">业务关联情况:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="busiStat" name="busiStat" type="text" maxlength="10" /></td></tr>
<tr><td class="flabel">接入模式:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="accessMode" name="accessMode" type="text" maxlength="1" /></td></tr>
<!-- <tr><td class="flabel">是否有第三方服务公司:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="corpSign" name="corpSign" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">第三方服务公司编号:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="corpNo" name="corpNo" type="text" maxlength="20" /></td></tr> -->
<tr><td class="flabel">商户信息录入人:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="oprAcc" name="oprAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">商户信息录入时间:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="oprTime" name="oprTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">商户注销人:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="cnlAcc" name="cnlAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">商户注销时间:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="cnlTime" name="cnlTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">审批人:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="confAcc" name="confAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">审批时间:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="confTime" name="confTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">审批意见:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="confRmk" name="confRmk" type="text" maxlength="200" /></td></tr>
<tr><td class="flabel">停用/启用:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="status" name="status" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">审批状态:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="confStatus" name="confStatus" type="text" maxlength="2" /></td></tr>
<tr><td class="flabel">文件生成标志:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="fileFlag" name="fileFlag" type="text" maxlength="1" /></td></tr>
<tr><td class="flabel">商户发展放费率:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="merDevRate" name="merDevRate" type="text" maxlength="5" /></td></tr>
<tr><td class="flabel">商户启用时间:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="merStDate" name="merStDate" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">备注:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="remark" name="remark" type="text" maxlength="200" /></td></tr>
<tr><td class="flabel">最后更新时间:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="lastUptTime" name="lastUptTime" type="text" maxlength="14" /></td></tr>
<tr><td class="flabel">最后更新帐户:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="lastUptAcc" name="lastUptAcc" type="text" maxlength="16" /></td></tr>
<tr><td class="flabel">最后更新机构:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="lastUptOrg" name="lastUptOrg" type="text" maxlength="30" /></td></tr>
<tr><td class="flabel">原帐户号码:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="oldAccntNo" name="oldAccntNo" type="text" maxlength="20" /></td></tr>
<tr><td class="flabel">原帐户维护标志:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="acctFlag" name="acctFlag" type="text" maxlength="1" /></td></tr>
<tr><td class="flabel">merDevName:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="merDevName" name="merDevName" type="text" maxlength="100" /></td></tr>
<tr><td class="flabel">brandFeeMax:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="brandFeeMax" name="brandFeeMax" type="text" maxlength="12" /></td></tr>

<tr><td class="flabel">编辑审核标记:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="auditResult" name="auditResult" type="text" maxlength="1" /></td></tr>
<tr><td class="flabel">编辑模块:</td> <td></td>
    <td class="fcontent"><input class="qFormInput" id="modiModule" name="modiModule" type="text" maxlength="2" /></td></tr>
</table>
<table>
	<tr><td class="flabel">审核描述:</td> 
	<td  class="fcontent"><input class="qFormInput" id="auditInfo" name="auditInfo" type="text" maxlength="50" /></td></tr>			
</table>
</form>
</div>
</body>
</html>