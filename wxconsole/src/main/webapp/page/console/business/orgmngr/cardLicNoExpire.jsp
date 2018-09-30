<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户开户人证件过期提醒</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
</head>
<body>
	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<input type="hidden" id="h_cardLicnoExpireDate" name="cardLicnoExpireDate" comparison="le" qtype="string"/>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value="" id="merName"
						comparison="like" qtype="string" name=merName size=20 /></td>
					<td class="qlabel">内部商户编号</td>
					<td class="qinput"><input type="text" value="" id="orgCode"
						comparison="like" qtype="string" name=orgCode maxlength="15" /></td>
					<td class="qlabel">商户状态</td>
					<td class="qinput"><select comparison="eq" qtype="string" id="status"
						name="status">
							<OPTION value="" selected="selected">不限</OPTION>
							<OPTION value=02>停用</OPTION>
							<OPTION value=01>启用</OPTION>
							<OPTION value=99>注销</OPTION>
					</select></td>
				</tr>
				<tr>
					<td class="qlabel">商户对外经营名称</td>
					<td class="qinput"><input type="text" value="" id="merOutName"
						comparison="like" qtype="string" name=merOutName size=30 /></td>
					<td class="qlabel">营业执照统一社会信用代码</td>
					<td class="qinput"><input type="text" value="" id="licenseNo"
						comparison="like" qtype="string" name=licenseNo maxlength="30" /></td>
					<td class="qlabel">商户账户号码</td>
					<td class="qinput"><input type="text" value="" id="accntNoPrivate"
						comparison="like" qtype="string" name=accntNoPrivate maxlength="30" /></td>
				</tr>
				
				<tr>
					<td class="qlabel">服务商号</td>
					<td class="qinput"><input  id="searchChannel" name="channelCode" type="text" maxlength="30" comparison="eq"/></td>
					<td class="qlabel">mcc</td>
					<td class="qinput"><input  id="searchMcc" name="mcc" type="text" maxlength="30" comparison="eq"/></td>
					<td class="qlabel">区域代码</td>
					<td class="qinput">
					<input  id="searchAreaCode" name="areaCode" type="text" maxlength="30" comparison="eq" />
					</td>
				</tr>
				<tr>
					<td class="qlabel">外部商户号</td>
					<td class="qinput"><input id="merOutCode" name="merOutCode" type="text" maxlength="30" comparison="like"/></td>
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

<div id="merchantDetail" class="detailDialog" style="display:none;">
		<table >
			<tr>
            <td class="detailtd">
            <div  class="titleDiv">
                <div class="dtitle" >商户信息</div>
            </div>
            
				<form id="form2" >
				<div style="overflow-x: auto; overflow-y: auto; height: 530px; width:332px;">
	    		<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	    			<TBODY>
	    			<tr>
	    			<td class="flabel"> 商户编号:</td>
	    			<td class="fcontent"> <input class="qFormInput" id="orgCode" name="orgCode" type="text" maxlength="20" readonly="readonly"  disabled="disabled"/></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户名称:</td>
	    			<td class="fcontent"> <input class="qFormInput" id="merName" name="merName" type="text" maxlength="100" /> </td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户对外经营名称:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="merOutName" name="merOutName" type="text" maxlength="100" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户英文名称:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="enName" name="enName" type="text" maxlength="100" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户对外英文名称:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="enOutName" name="enOutName" type="text" maxlength="100" /></td>
	    			</tr>
	    		    <tr>
	    			<td class="flabel"> 商户类别码（MCC）:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="mcc" name="mcc" type="text" maxlength="50" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 地区代码:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="areaCodeZh" name="areaCodeZh" type="text" maxlength="50" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 营业执照统一社会信用代码:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="licenseNo" name="licenseNo" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 营业执照有效期:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="bizLicnoExpireDate" name="bizLicnoExpireDate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 营业执照注册地址:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="licenseAddr" name="licenseAddr" type="text" maxlength="15" /></td>
	    			</tr>
	    			<td class="flabel"> 开户银行网点号:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntBankNoPrivate" name="accntBankNoPrivate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 开户银行编号:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntBankCodePrivate" name="accntBankCodePrivate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 企业成立日期:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="foundedDate" name="foundedDate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 税务登记证号码:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="taxNo" name="taxNo" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 组织机构代码证:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="certNo" name="certNo" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 法人姓名:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="personName" name="personName" type="text" maxlength="15" /></td>
	    			<tr>
    					<td class="flabel"> 法人证件类型:</td>
    					<td class="fcontent">  <input class="qFormInput" id="personNoTypeDesc" name="personNoTypeDesc" type="text" maxlength="20" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel"> 法人证件号:</td>
	    				<td class="fcontent">  <input class="qFormInput" id="personNo" name="personNo" type="text" maxlength="20" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel"> 法人证件有效期:</td>
	    				<td class="fcontent">  <input class="qFormInput" id="personNoExpireDate" name="personNoExpireDate" type="text" maxlength="20" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户装机地址:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="address" name="address" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 营业开始时间:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="busiBgtime" name="busiBgtime" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 营业结束时间:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="busiEndtime" name="busiEndtime" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 营业面积(平方米):</td>
	    			<td class="fcontent">  <input class="qFormInput" id="area" name="area" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 月租金(元):</td>
	    			<td class="fcontent">  <input class="qFormInput" id="monthRent" name="monthRent" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 收银台数:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="posNum" name="posNum" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 账户名称:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntName" name="accntName" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 账户号码:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntNo" name="accntNo" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 账户:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="bankTitle" name="bankTitle" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户账户类型:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntTypeZh" name="accntTypeZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户账户名称:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntNamePrivate" name="accntNamePrivate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户账户号码:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="accntNoPrivate" name="accntNoPrivate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		   			<td class="flabel"> 商户开户行总行名称:</td>
		   			<td class="fcontent"><input class="qFormInput" id="accntBankPrivateDesc" name="accntBankPrivateDesc" type="text" maxlength="15" /></td>
		   			</tr>
		   			<tr>
		   			<td class="flabel"> 开户行支行号:</td>
		   			<td class="fcontent"><input class="qFormInput" id="bankBranchNo" name="bankBranchNo" type="text" maxlength="15" /></td>
		   			</tr>
		   			<tr>
		   			<td class="flabel"> 开户行支行名称:</td>
		   			<td class="fcontent"><input class="qFormInput" id="bankBranchNoDesc" name="bankBranchNoDesc" type="text" maxlength="100" /></td>
		   			</tr>
	    			<!-- <tr>
	  				<td class="flabel"> 商户开户行是否为浦发银行:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="spdFlagZh" name="spdFlagZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<tr>
	   					<td class="flabel"> 开户人证件类型:</td>
	   					<td class="fcontent">  <input class="qFormInput"  id="cardPersonNoTypeDesc" name="cardPersonNoTypeDesc" type="text" maxlength="20" /></td>
		   			</tr>
		   			<tr>
		   				<td class="flabel"> 开户人证件号:</td>
		   				<td class="fcontent">  <input class="qFormInput"  id="cardPersonNo" name="cardPersonNo" type="text" maxlength="20" /></td>
		   			</tr>
		   			<tr>
	    				<td class="flabel"> 开户人证件有效期:</td>
	    				<td class="fcontent">  <input class="qFormInput" id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text" maxlength="20" /></td>
	    			</tr>
	    			<!-- <tr>
	    			<td class="flabel"> 卡折标志:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="depositFlagZh" name="depositFlagZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<tr>
	    			<td class="flabel"> 本金结算周期:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="settlePeriod" name="settlePeriod" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 手续费收取类型:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="feeStlmTypeZh" name="feeStlmTypeZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 手续费率(%):</td>
	    			<td class="fcontent">  <input class="qFormInput" id="feeRate" name="feeRate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 手续费固定值(元):</td>
	    			<td class="fcontent">  <input class="qFormInput" id="feeVal" name="feeVal" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 手续费封顶值(元):</td>
	    			<td class="fcontent">  <input class="qFormInput" id="topValue" name="topValue" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户联系人:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="merContact" name="merContact" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户传真:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="merFax" name="merFax" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户联系电话:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="merPhone" name="merPhone" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户营销人员姓名:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="merketPerson" name="merketPerson" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
	    			<td class="flabel"> 商户发展方费率(%):</td>
	    			<td class="fcontent">  <input class="qFormInput" id="merDevRate" name="merDevRate" type="text" maxlength="15" /></td>
	    			</tr>
	    			<!-- <TR >
						<TD class="flabel" rowspan="13">业务开通情况：</TD>
					</TR>
					<tr><TD class="finput"><input type="checkbox" name="payPerm" >缴费开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="preAuthPerm" >预授权开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="onlineReturnsPerm" >联机退货开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="installPayPerm" >分期付款开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="integralConsPerm" >积分消费开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="labourBusiPerm" >人工交易开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="labourConsPerm" >人工消费开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="labourPreAuthPerm" >人工预授权开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="labourReturnsPerm" >人工退货开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="labourInstallPerm" >人工分期开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="transSystemCardPerm" >跨行卡交易开通</TD></tr>
					<tr><TD class="finput"><input type="checkbox" name="outCardBusiPerm" >外卡业务开通</TD></tr>
					
					<tr>
		    			<td class="flabel"> 分期手续费收取类型:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="installmentFeeTypeZh" name="installmentFeeTypeZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<!-- <tr>
		    			<td class="flabel"> 外卡业务币种:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="outCardTypeZh" name="outCardTypeZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<tr>
		    			<td class="flabel">非借记卡单笔交易限额(元):</td>
		    			<td class="fcontent">  <input class="qFormInput" id="tranLimit" name="tranLimit" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel">借记卡单笔交易限额(元):</td>
		    			<td class="fcontent">  <input class="qFormInput" id="tranLimitDebit" name="tranLimitDebit" type="text" maxlength="15" /></td>
	    			</tr>
	    			<!-- <tr>
		    			<td class="flabel"> 特惠商户:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="specFlagZh" name="specFlagZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 特殊计费:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="specMccZh" name="specMccZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<tr>
		    			<td class="flabel"> 商户交易权限组:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="tranLimitParamZh" name="tranLimitParamZh" type="text" maxlength="15" /></td>
	    			</tr>
	    		   <!--  <tr>
		    			<td class="flabel"> 商户风险评级:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="merRiskZh" name="merRiskZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<!-- <TR >
						<TD class="flabel" rowspan="9">业务关联情况：</TD>
					</TR>
						<tr><TD class="finput"><input type="checkbox" name="vipCardPerm" >VIP卡</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="creditCardPerm" >信用卡</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="distAgencyPerm" >代发工资</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="companyPerm" >公司</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="creditBusiPerm" >信贷</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="moneyBusiPerm" >理财类</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="electronicBankingPerm" >电子银行</TD></tr>
						<tr><TD class="finput"><input type="checkbox" name="busiEtonPerm" >商易通</TD></tr> -->
	    			<tr>
		    			<td class="flabel"> 接入模式:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="accessModeZh" name="accessModeZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<!-- <tr>
		    			<td class="flabel"> 是否有第三方服务公司:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="corpSignZh" name="corpSignZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 第三方服务公司编号:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="corpNo" name="corpNo" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<tr>
		    			<td class="flabel"> 下载进件文件包:</td>
		    			<td class="fcontent">
		    				<input id="downloadOutMerApplyFile" class="bt" value="点击下载" type="button">
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户信息录入人:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="oprAcc" name="oprAcc" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户信息录入时间:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="oprTimeDesc" name="oprTimeDesc" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 审批人:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="confAcc" name="confAcc" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 审批时间:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="confTimeDesc" name="confTimeDesc" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 审批意见:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="confRmk" name="confRmk" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户状态:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="merStatusZh" name="merStatusZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户注销时间:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="cnlTime" name="cnlTime" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户注销人:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="cnlAcc" name="cnlAcc" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户启用时间:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="merStDateDesc" name="merStDateDesc" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户审批状态:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="confStatusZh" name="confStatusZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<!-- 调单联系人 -->
	    			<tr>
	    				<td class="flabel"> 调单联系人姓名:</td>
	    				<td class="fcontent">  <input class="qFormInput" disabled id="docTransferName" name="docTransferName" type="text" maxlength="100" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel"> 调单联系人电话:</td>
	    				<td class="fcontent">  <input class="qFormInput" disabled id="docTransferPhone" name="docTransferPhone" type="text" maxlength="100" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel">调单联系人邮箱:</td>
	    				<td class="fcontent">  <input class="qFormInput" disabled id="docTransferEmail" name="docTransferEmail" type="text" maxlength="100" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 备注:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="remark" name="remark" type="text" maxlength="15" /></td>
	    			</tr>
	               </TBODY>
	                </table> 
	                </div>              
	            </form>
			</td>
			<td width="10"></td>
            
            <td class="detailtd">
	            <div  class="titleDiv">
	                <div class="dtitle">外部商户号</div>
	            </div>
	            <div style="overflow: auto; width:400px; background:#ffffff">
	            	<div id="merchantOutDetail" ></div>
	            </div>
				<!-- 终端信息 -->
				<div  class="titleDiv">
					<div class="dtitle">终端信息</div>
				</div>
				<div style="overflow: auto; width:400px; background:#ffffff">
					<div id="outMerTidDetail" ></div>
				</div>
            </td>
            </tr>		
		</table>
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

<!-- MCC选择弹出窗口 -->
	<div id="mccSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">MCC码</td>
					<td class="qinput">
						<input type="text" name="mcc" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">描述</td>
					<td class="qinput">
						<input type="text" name="mccDesc" comparison="like" qtype="string" />
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



<!-- 区域码选择弹出窗口 -->
	<div id="areaCodeSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">地区代码</td>
					<td class="qinput">
						<input type="text" name="codeNo" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">地区描述</td>
					<td class="qinput">
						<input type="text" name="codeName" comparison="like" qtype="string" />
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
<script>
$(document).ready(function() {
	$('#bankSelect').queryDialog({
	     	width : 600,
	     	height : 400,												
			flexigrid:{ 
					url : 'findAllBank.action',					
					width : 550,
					dir : "bankId",
					sort:"bankId",
					usepager : true,
					colModel : [ {
						display : '支付机构代码',
						width : 200,
						dataIndex : 'bankId',
						align : 'center',
						sortable:true
					}, {
						display : '支付机构名称',
						width : 300,
						dataIndex : 'bankName',
						align : 'center'
					}]
				}
	});


	$('#mccSelect').queryDialog({
	 	width : 600,
	 	height : 400,												
		flexigrid:{ 
				url : 'findMccDesc.action',					
				width : 550,
				dir : "mcc",
				sort:"mcc",
				usepager : true,
				colModel : [ {
					display : 'MCC码',
					width : 100,
					dataIndex : 'mcc',
					align : 'center',
					sortable:true
				}, {
					display : '描述',
					width : 300,
					dataIndex : 'mccDesc',
					align : 'center'
				}
				, {
					display : '总扣率(%)',
					width : 100,
					dataIndex : 'rateBackup',
					align : 'center'
				}]
			}
	});


	$('#searchMcc').click(function() {
		$('#mccSelect').queryDialogOpen({
			clear : function() {
				$('#searchMcc').val('');
			},
			success : function(data) {
				if (data) {
					$('#searchMcc').val(data.mcc);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});


	$('#areaCodeSelect').queryDialog({
		width : 600,
		height : 400,
		flexigrid : {
			url : 'findAreaCodeList.action',
			width : 500,
			dir : "codeNo",
			usepager : true,
			colModel : [ {
				display : '地区代码',
				width : 200,
				dataIndex : 'codeNo',
				align : 'center'
			}, {
				display : '地区描述',
				width : 300,
				dataIndex : 'codeName',
				align : 'center'
			} ]
		}
	});



	$('#searchAreaCode').click(function() {
		$('#areaCodeSelect').queryDialogOpen({
			clear : function() {
				$('#searchAreaCode').val('');
			},
			success : function(data) {
				if (data) {
					$('#searchAreaCode').val(data.codeNo);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});



	//上级选择机构按钮
	$('#bank_id').click(function() {			
		$('#bankSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#bank_id').val(data.bankId);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});


	$('#channelSelect').queryDialog({
	 	width : 600,
	 	height : 400,												
		flexigrid:{ 
				url : 'findAllChannel.action',					
				width : 550,
				dir : "channelCode",
				sort:"channelCode",
				usepager : true,
				colModel : [ {
					display : '服务商代码',
					width : 200,
					dataIndex : 'channelCode',
					align : 'center',
					sortable:true
				}, {
					display : '服务商名称',
					width : 300,
					dataIndex : 'channelName',
					align : 'center'
				}]
			}
	});



	$('#searchChannel').click(function() {
		$('#channelSelect').queryDialogOpen({
			clear : function() {
				$('#searchChannel').val('');
			},
			success : function(data) {
				if (data) {
					$('#searchChannel').val(data.channelCode);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});

	$('#tranLimitParam').ajaxSelect({url:'findSecCodeList.action?codeType=TRANS_GROUP_CODE',displayField:'codeName',valueField:'codeNo',blank:true});

	$.formValidator.initConfig({							
		onerror : function(msg) {
			alert(msg);
		}
	});

	var list=[
		        {id:"orgCode",formValidator:{empty:false},inputValidator:{min:15,max:15,onerror:"机构号长度不得为空不得大于20位"}},
		        {id:"merName",formValidator:{empty:false},inputValidator:{min:1,max:40,onerror:"商户名称不得为空不得大于50个汉字"}},
		   		{id:"enName",formValidator:{empty:true},inputValidator:{min:0,max:80,onerror:"商户英文名称不得大于100个字母"}},
		   		{id:"merOutName",formValidator:{empty:false},inputValidator:{min:1,max:40,onerror:"商户对外经营名称不得为空不得大于50个汉字"}},
		   		{id:"enOutName",formValidator:{empty:true},inputValidator:{min:0,max:80,onerror:"商户对外英文名称不得大于100个字母"}}
		   		
		        
		   		];


	//$.someAuthentication(list);	



	$('#merchantstatus').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 600,
		height : 400
	});

	$('#merchantDetail').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 800,
		height : 600
	});

	$('#downloadOutMerApplyFile').click(function(){
		var orgCode=$("#form2 input[id=orgCode]").val();
		$.ajax({    
	        type:'post',        
	        url:'booleanMerFile.action',    
	        async:false,
	        data: {"orgCode":orgCode},
	        success:function(data){  
	        	if(data.success){
	        		var href="downloadsdMerFile.action?orgCode="+orgCode;
	        		window.open(href);
	        	}else{
	        		alert("进件文件包不存在");
	        	}
	        }    
	    }); 
	});	

	//详细信息
	var  view=function(record,id) {
		if (!record) {
			alert("请选择一条记录");
			return;
		}
		$('#form2').fillObject({obj:record});
		$('#form2 :input').attr('disabled','disabled');
		
		if(record.tranLimit==''){
			record.tranLimit=0;
		}
		$('#tranLimit').val($.changeDecimal(parseFloat(record.tranLimit)/100));
		$('#tranLimitDebit').val($.changeDecimal(parseFloat(record.tranLimitDebit)/100));
		$('#bizLicnoExpireDate').val(frmBSDate(record.bizLicnoExpireDate));
		$('#form2 [type=checkbox]').attr("checked","");
	    if (record.businessStat.substr(0,1) == 1)
			$('#form2 [name=payPerm]').attr("checked","checked");
		if (record.businessStat.substr(1,1) == 1)
			$('#form2 [name=preAuthPerm]').attr("checked","checked");
		if (record.businessStat.substr(2,1) == 1)
			$('#form2 [name=onlineReturnsPerm]').attr("checked","checked");
		if (record.businessStat.substr(3,1) == 1)
			$('#form2 [name=installPayPerm]').attr("checked","checked");
		if (record.businessStat.substr(4,1) == 1)
			$('#form2 [name=integralConsPerm]').attr("checked","checked");
		if (record.businessStat.substr(5,1) == 1)
			$('#form2 [name=labourBusiPerm]').attr("checked","checked");
		if (record.businessStat.substr(6,1) == 1)
			$('#form2 [name=labourConsPerm]').attr("checked","checked");
		if (record.businessStat.substr(7,1) == 1)
			$('#form2 [name=labourPreAuthPerm]').attr("checked","checked");
		if (record.businessStat.substr(8,1) == 1)
			$('#form2 [name=labourReturnsPerm]').attr("checked","checked");
		if (record.businessStat.substr(9,1) == 1)
			$('#form2 [name=labourInstallPerm]').attr("checked","checked");
		if (record.businessStat.substr(10,1) == 1)
			$('#form2 [name=transSystemCardPerm]').attr("checked","checked");
		if (record.businessStat.substr(11,1) == 1)
			$('#form2 [name=outCardBusiPerm]').attr("checked","checked");

	    if (record.busiStat.substr(0,1) == 1)
			$('#form2 [name=vipCardPerm]').attr("checked","checked");
		if (record.busiStat.substr(1,1) == 1)
			$('#form2 [name=creditCardPerm]').attr("checked","checked");
		if (record.busiStat.substr(2,1) == 1)
			$('#form2 [name=distAgencyPerm]').attr("checked","checked");
		if (record.busiStat.substr(3,1) == 1)
			$('#form2 [name=companyPerm]').attr("checked","checked");
		if (record.busiStat.substr(4,1) == 1)
			$('#form2 [name=creditBusiPerm]').attr("checked","checked");
		if (record.busiStat.substr(5,1) == 1)
			$('#form2 [name=moneyBusiPerm]').attr("checked","checked");
		if (record.busiStat.substr(6,1) == 1)
			$('#form2 [name=electronicBankingPerm]').attr("checked","checked");
		if (record.busiStat.substr(7,1) == 1)
			$('#form2 [name=busiEtonPerm]').attr("checked","checked");
		
		$.ajax({
			url		: 'queryMerchantOutTrue.action',
			async	: false,
			data	: {jsonObject:$.toJSON(record)},
			success:function(data){
				$('#merchantOutDetail').refreshWithData(data);
			}													
		});
		$.ajax({
			url : 'queryCoreMerChantTids.action?mid=' + record.mid,
			async	: false,
			data	: {jsonObject:$.toJSON(record)},
			success:function(data){
				$('#outMerTidDetail').refreshWithData(data);
			}													
		});
		$('#downloadOutMerApplyFile').attr('disabled','');
		$('#merchantDetail').dialog("option","title","详细信息");
		$('#merchantDetail').dialog("option","buttons",{'关闭' : function() {
			$('#form2 :input').attr('disabled','');
			$(this).dialog('close');
			}
			});
		$('#merchantDetail').dialog('open');
	};


	$('#outMerTidDetail').flexigrid({
	    url : 'queryCoreMerChantTids.action',
		width : 400,
		checkbox : false,
		usepager : false,					
		colModel : [
				{
					display : '终端号',
					width : 100,
					dataIndex : 'tid',
					align : 'center'
				},
				{
					display : '月流量费(元)',
					width : 100,
					dataIndex : 'monthFlowFee',
					align : 'center'
				},
				{
					display : '终端品牌',
					width : 100,
					dataIndex : 'tidBrand',
					align : 'center'
				},
				{
					display : '终端类型',
					width : 100,
					dataIndex : 'tidTypeZh',
					align : 'center'
				},
				{
					display : '流量费收取方式',
					width : 100,
					dataIndex : 'chargeTypeZh',
					align : 'center'
				},
				{
					display : '终端状态',
					width : 100,
					dataIndex : 'statusZh',
					align : 'center'
				},
				{
					display : '终端型号',
					width : 100,
					dataIndex : 'tidModel',
					align : 'center'
				},
				{
					display : '安装地址',
					width : 100,
					dataIndex : 'address',
					align : 'center'
				},
				{
					display : 'SIM卡号',
					width : 100,
					dataIndex : 'reserved1',
					align : 'center'
				}
				]
	});	
							

	//启用、停用申请
	var merchantstatus= function(record, id) {
		if (!record) {
			alert("请选择一条记录");
			return;
		}	
		var bussBrhStatus = '';
		$('#form3').fillObject({obj:record});
		$('#form3 [type=radio]').attr('checked','');
		$('#result10,#result20').unbind("click");
		$('#result10,#result20').click(function(){
			   if(this.checked){
				   bussBrhStatus = this.value;
				   if(this.value=="01"){
					   if(record.status!='02'){
						   alert('只有在停用状态下，才允许提交启用申请！');
						   return false;
					   }
				   }else if(this.value=="02"){	
					   if(record.status!='01'){
						   alert('只有在启用状态下，才允许提交停用申请！');
						   return  false;
					   }
//					   if($('#channgeRemark').val()==null||$('#channgeRemark').val()==""){
//						   alert('停机时必须填写停用描述！');
//						   return  false;
//					   }
				   }
			   }
		});

		$('#form3 :input').trigger('blur');
		$('#merchantstatus').dialog("option","title","启用、停用修改");
		$('#merchantstatus').dialog("option","buttons",
				{'修改' : function() {
						if (true) {
							if($('#result10').attr("checked")==false && $('#result20').attr("checked")==false){
								alert("请选择商户状态");
								return;
							}
//							if($('#result10').attr("checked")==true && $('#result20').attr("checked")==false){
//								if($('#channgeRemark').val()==null||$('#channgeRemark').val()==""){
//								alert('停用时必须填写停机描述！');
//								return;
//								}
//							}
							
							//封装修改的数据
							record.remark=$('#channgeRemark').val();
							record.status=bussBrhStatus;
							$.ajax({url:'doUpdateMerchantVo.action',
								data:{jsonObject:$.toJSON(record)},
								success:function(data){
									if(data.success){
										alert('修改成功');
										$('#table').refresh();
										$('#merchantstatus').dialog('close');
									}
									else{
										alert('修改失败 失败原因是'+data.syserr);
									}												
								}
							});
							
//							$.ajaxForm({
//										formId : 'form3',
//										url : "doUpdateMerchantStatus.action",
//										success : function(data) {
//											if (data.success) {
//												$('#merchantstatus').dialog('close');
//												$('#table').refresh();
//												alert('修改成功');
//											} else {
//												alert('修改失败');
//											}
//										}
//									});
						} else {
							return false;
						}
		
					},
					'关闭' : function() {
						$(this).dialog('close');
					}
				});

		$('#merchantstatus').dialog('open');
	};


	//注销商户
	var shutdownmerchant = function(record,id){
		
		if(!record){
			alert('请选择一条记录');
			return false;
		}
		var able=confirm('确认注销该商户');
		record.status='99';
		if(able){
			$.ajax({url:'doUpdateMerchantVo.action',
				data:{jsonObject:$.toJSON(record)},
				success:function(data){
					if(data.success){
						alert('注销成功');
						$('#table').refresh();
					}
					else{
						alert(data.syserr);
					}												
				}
			});
		}
	};
	//删除商户信息
	var deletemerchant = function(record,id){
		
		if(!record){
			alert('请选择一条记录');
			return false;
		}
		var able=confirm('确认删除该商户信息');
		if(able){
			$.ajax({url:'doDeleteMerchant.action',
				data:{jsonObject:$.toJSON(record)},
				success:function(data){
					if(data.success){
						alert('删除成功');
						$('#table').refresh();
					}
					else{
						alert('删除失败 失败原因是'+data.syserror);
					}												
				}
			});
		}
	};



	$('#table').flexigrid({ 
			url : 'findAllMerchant.action',
			buttons : [
					{
						name : "详细信息",
						bclass : 'page_excel',
						id : 'cel',
						onpress : view
					},{
						separator : true
					}
					],
			dir : "desc",
			sort : "orgCode",											
			usepager : true,
			colModel : [ {
				display : '服务商名称',												
				dataIndex : 'channelName',
				align : 'center',
				sortable:true
			},{
				display : '内部商户编号',												
				dataIndex : 'orgCode',
				align : 'center',
				sortable:true
			},{
				display : '商户名称',												
				dataIndex : 'merName',											
				sortable:true
			},{
				display : '开户人证件有效期',												
				dataIndex : 'cardLicnoExpireDate',											
				sortable:true, render: fmtDate
			},{
				display : '商户对外经营名称',												
				dataIndex : 'merOutName',											
				sortable:true
			},{
				display : '商户类别码（MCC）',											
				dataIndex : 'mcc',											
				sortable:true
			},{
				display : '商户类型',											
				dataIndex : 'mccZh',											
				sortable:true
			},{
				display : '外部商户编号',												
				dataIndex : 'merOutCode',
				align : 'center',
				sortable:true
			},{
				display : '商户审批状态',												
				dataIndex : 'confStatusZh',
				align : 'center'
			},{
				display : '商户状态',											
				dataIndex : 'merStatusZh',
				align : 'center'
			}]
		});
			
		

	$('#merchantOutDetail').flexigrid({
	    url : 'queryMerchantOutTrue.action',
		limit : 100,
		width : 400,
		usepager : false,					
		colModel : [
				{
					display : '外部商户号',
					width : 200,
					dataIndex : 'merOutCode',
					align : 'center'
				},
				{
					display : '支付机构名称',
					width : 200,
					dataIndex : 'bankName',
					align : 'center'
				},
				{
					display : '支付机构号',
					width : 200,
					dataIndex : 'bankCode',
					align : 'center'
				}]
	});	


		$('#querybutton').click(function(){
			$.queryTable({
				formId : 'queryForm',
				tableId : 'table'
			});
		});						
		var exDate = new Date().DateAdd('d', 30);
		var theExDate = exDate.Format('yyyyMMdd');
		$('#h_cardLicnoExpireDate').val(theExDate);
		//初始化查询;
		$('#querybutton').trigger('click');
		
	});
</script>
</body>
</html>