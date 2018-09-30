<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrMerchant.js"></script>
<style>
<!--
#mhtAttachInfoAddTbody .bt{width: 50px;}
.fcontent input,.fcontent select,.fcontent textarea{width: 260px;}
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
-->
</style>

</head>
<body>
<div id="merProdDetail" style="display: none;">
<form id="prodform" action="">
<input name="productId" size="40" type="hidden"/>
<input name="merAddStatus" size="40" type="hidden"/>
<input id="prodStatus" name="status" size="40" type="hidden"/>
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
			<TD class="finput"><input class="cdnInput" name="d0fee" xtype="rate4" size="40" type="text" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">初始单笔限额：</TD>
			<TD class="finput"><input class="cdnInput" name="oneLimit" xtype="money" size="40" readonly="readonly"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">初始单日限额：</TD>
			<TD class="finput"><input class="cdnInput" name="dayLimit" xtype="money" size="40" readonly="readonly"/>
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
<div id="queryCondition" style="background-color: #FBFEFF; padding: 5px;">
	<form id="queryForm" name="queryForm" action="#" method="post" style="padding: 0px; margin: 0px;">
		<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
			<tr>
				<td class="qlabel">商户名称</td>
				<td class="qinput"><input type="text" value="" id="merName" comparison="like" qtype="string" name=merName size=20 /></td>
				<td class="qlabel">内部商户编号</td>
				<td class="qinput"><input type="text" value="" id="orgCode" comparison="like" qtype="string" name=orgCode maxlength="15" /></td>
				<td class="qlabel">商户状态</td>
				<td class="qinput">
					<select comparison="eq" qtype="string" id="status" name="status">
						<OPTION value="" selected="selected">不限</OPTION>
						<OPTION value=02>停用</OPTION>
						<OPTION value=01>启用</OPTION>
						<OPTION value=99>注销</OPTION>
					</select>
				</td>
			</tr>
			<tr>
				<td class="qlabel">商户对外经营名称</td>
				<td class="qinput"><input type="text" value="" id="merOutName" comparison="like" qtype="string" name=merOutName size=30 /></td>
				<td class="qlabel">营业执照统一社会信用代码</td>
				<td class="qinput"><input type="text" value="" id="licenseNo" comparison="like" qtype="string" name=licenseNo maxlength="30" /></td>
				<td class="qlabel">商户账户号码</td>
				<td class="qinput"><input type="text" value="" id="accntNoPrivate" comparison="like" qtype="string" name=accntNoPrivate maxlength="30" /></td>
			</tr>
			<tr>
				<td class="qlabel">服务名称</td>
				<td class="qinput"><input  id="searchChannel" name="channelCode" type="text" maxlength="30" comparison="eq"/></td>
				<td class="qlabel">区域代码</td>
				<td class="qinput"><input  id="searchAreaCode" name="areaCode" type="text" maxlength="30" comparison="eq" /></td>
				<td class="qlabel">外部商户号</td>
				<td class="qinput"><input id="merOutCode" name="merOutCode" type="text" maxlength="30" comparison="like"/></td>
			</tr>
			<tr>
				<td class="qlabel">mcc</td>
				<td class="qinput"><input id="searchMcc" name="mcc" type="text" maxlength="30" comparison="eq"/></td>
				<td class="qlabel">商户类别(结算)</td>
				<td class="qinput"><select id="q_mccGrp" name="mccGrp" comparison="eq"></select></td>
				<td class="qlabel">商户类别(预期)</td>
				<td class="qinput"><select id="q_mccGrpImp" name="mccGrpImp" comparison="eq"></select></td>	
			</tr>
			<tr>
				<td class="qlabel">开始时间</td>
				<td class="qinput"><input type="text" value="" comparison="ge"
					qtype="string" id=startTime name=confTime size=20 /></td>
				<td class="qlabel">结束时间</td>
				<td class="qinput"><input type="text" value="" comparison="le"
					qtype="string" id=endTime name=confTime  maxlength="15" /></td>
				<td class="qlabel">免密</td>
				<td class="qinput">
					<select comparison="eq" qtype="string"  id="q_freePW" name="freePW">
						<OPTION value="" selected="selected">不限</OPTION>
						<OPTION value=开通>开通</OPTION>
						<OPTION value=关闭>关闭</OPTION>
					</select>
				</td>	
			</tr>
			<tr>
				<td class="qlabel">销售渠道</td>
				<td class="qinput"><select id="q_salesChannel" name="salesChannel" comparison="eq"></select></td>	
				<td class="qlabel">D0产品</td>
				<td class="qinput"><select id="q_prodStatusd0" name="prodStatusd0" comparison="eq"></select></td>
				<td class="qlabel"></td>
				<td class="qinput"></td>
			</tr>
			<tr>
				<td bgcolor="#ffffff" colspan="6" align="center">
					<input id="querybutton" class="bt" value="查询" type="button">
					<input class="bt" value="重置" type="reset" />
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="table"></div>

<div id="merchantDetail" class="detailDialog" style="display:none;">
				<form id="form2" >
				<div style="overflow-x: auto; overflow-y: auto; width:100%;">
	    		<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	    			<TBODY>
	    			<tr>
	    			<td class="flabel" width="140px" > 商户编号:</td>
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
	    			<td class="flabel"> 销售渠道:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="salesChannelDesc" name="salesChannelDesc" type="text" maxlength="100" /></td>
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
	    			<td class="flabel"> MCC:</td>
	    			<td class="fcontent">  <input class="qFormInput" id="mcc" name="mcc" type="text" maxlength="50" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel"> 商户类别(结算):</td>
	    				<td class="fcontent">  <input class="qFormInput" id="mccGrpDesc" name="mccGrpDesc" type="text" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel"> 商户类别(预期):</td>
	    				<td class="fcontent">  <input class="qFormInput" id="mccGrpImpDesc" name="mccGrpImpDesc" type="text" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel"> 进件类别备注:</td>
	    				<td class="fcontent">  <input class="qFormInput" id="mccRemark" name="mccRemark" type="text" /></td>
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
		   			
		   			<!--wxb  -->
		   			<tr>
			   			<td class="flabel">商户结算类型：</td>
						<td class="fcontent" >
						<select id='merStatementsType' name='merStatementsType' style="width:60px " disabled >
								<option ></option>
								<option >T1</option>
		    					<option >D0</option>
							</select>
						</td>
					</tr>
					<tr>
		  				<td class="flabel"> 垫资手续费费率(%):</td>
		  				<td class="fcontent">  <input class="qFormInput" disabled id="merStatementsRate" name="merStatementsRate" type="text" xtype="rate4" maxlength="100" /></td>
		  			</tr>
		  			
		   			<!--免密  -->
		   			<tr>
		  				<td class="flabel"> 免密开关:</td>
		  				<td class="fcontent"><input class="qFormInput" id="freePW" name="freePW" type="text" maxlength="30" /></td>
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
	    				<td class="fcontent">  <input class="qFormInput" id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text" maxlength="15" /></td>
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
	    				<td class="flabel">借记交易费率(%):</td>
	    				<td class="fcontent"><input class="qFormInput" id="debitRate" name="debitRate" type="text" xtype="rate4" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel">借记交易封顶费(元):</td>
	    				<td class="fcontent"><input class="qFormInput" id="debitMaxFee" name="debitMaxFee" type="text" xtype="money" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel">贷记交易费率(%):</td>
	    				<td class="fcontent"><input class="qFormInput" id="creditRate" name="creditRate" type="text" xtype="rate4" /></td>
	    			</tr>
	    			<!-- 2016/12/1 lxl add -->
	    			<tr>
	    				<td class="flabel">微信交易费率(%):</td>
	    				<td class="fcontent"><input class="qFormInput" id="wechatPayRate" name="wechatPayRate" type="text" xtype="rate4" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel">外卡交易费率(%):</td>
	    				<td class="fcontent"><input class="qFormInput" id="outCardRate" name="outCardRate" type="text" xtype="rate4" /></td>
	    			</tr>
	    			<tr>
	    				<td class="flabel">支付宝交易费率(%):</td>
	    				<td class="fcontent"><input class="qFormInput" id="alipayPayRate" name="alipayPayRate" type="text" xtype="rate4" /></td>
	    			</tr>
	    			<!-- 2016/12/1 lxl add -->
	    			<!-- <tr>
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
	    			</tr> -->
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
	    			<!-- <tr>
	    				<td class="flabel"> 商户发展方费率(%):</td>
	    				<td class="fcontent">  <input class="qFormInput" id="merDevRate" name="merDevRate" type="text" maxlength="15" /></td>
	    			</tr> -->
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
	    			</tr> 
	    			<tr>
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
	    			<!-- <tr>
		    			<td class="flabel"> 接入模式:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="accessModeZh" name="accessModeZh" type="text" maxlength="15" /></td>
	    			</tr> -->
	    			<!-- <tr>
		    			<td class="flabel"> 是否有第三方服务公司:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="corpSignZh" name="corpSignZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 第三方服务公司编号:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="corpNo" name="corpNo" type="text" maxlength="15" /></td>
	    			</tr> -->
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
		
	<div  class="titleDiv"><div class="dtitle">外部商户号</div></div>
	<div style="overflow: auto; width:100%; background:#ffffff"><div id="merchantOutDetail" ></div></div>
	<!-- 终端信息 -->
	<div  class="titleDiv"><div class="dtitle">终端信息</div></div>
	<div style="overflow: auto; width:100%; background:#ffffff"><div id="outMerTidDetail" ></div></div>
</div>

<div id="addmerchantOut" style="display: none;">
	<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tbody>
   		<tr>
	   		<td class="flabel"> 支付机构:</td>
	   		<td class="fcontent"> <input class="qFormInput" id="bank_id" name="bank_id" type="text" maxlength="15" /></td>
   		</tr>
   		<tr>
	   		<td class="flabel"> 外部商户号:</td>
	   		<td class="fcontent"> <input class="qFormInput" id="bankName" name="bankName" type="text" maxlength="64" /> </td>
   		</tr>
		</tbody>
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


<div id="addmerchant" class="detailDialog" style="display: none;">
<table>
	<tr>
          <td class="detailtd">
          <div  class="titleDiv">
              <div class="dtitle" >商户信息</div>
          </div>
          
		<form id="form1" >
		<div style="overflow-x: auto; overflow-y: auto; height: 530px; ">  
   		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
   			<TBODY>
   			<INPUT id=orgCode name=orgCode style="display:none;">
   			<tr>
   			<td class="flabel"> 商户名称:</td>
   			<td class="fcontent"> <input class="qFormInput" id="merName" name="merName" type="text" maxlength="64" /> </td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户对外经营名称:</td>
   			<td class="fcontent">  <input class="qFormInput" id="merOutName" name="merOutName" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户英文名称:</td>
   			<td class="fcontent">  <input class="qFormInput" id="enName" name="enName" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户对外英文名称:</td>
   			<td class="fcontent">  <input class="qFormInput" id="enOutName" name="enOutName" type="text" maxlength="15" /></td>
   			</tr>
   		    <tr>
   			<td class="flabel"> 商户类别码（MCC）:</td>
   			<td class="fcontent">  <input class="qFormInput" id="mcc" name="mcc" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 地区代码:</td>
   			<td class="fcontent">  <input class="qFormInput" id="areaCodeZh" name="areaCodeZh" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 营业执照统一社会信用代码:</td>
   			<td class="fcontent">  <input class="qFormInput" id="licenseNo" name="licenseNo" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 营业执照注册地址:</td>
   			<td class="fcontent">  <input class="qFormInput" id="licenseAddr" name="licenseAddr" type="text" maxlength="15" /></td>
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
   			<td class="flabel"> 商户法定代表人姓名:</td>
   			<td class="fcontent">  <input class="qFormInput" id="personName" name="personName" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户法定代表人身份证号:</td>
   			<td class="fcontent">  <input class="qFormInput" id="personNo" name="personNo" type="text" maxlength="15" /></td>
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
   			<td class="flabel"> 商户开户行:</td>
   			<td class="fcontent">  <input class="qFormInput" id="accntBankPrivate" name="accntBankPrivate" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户开户行是否为浦发银行:</td>
   			<td class="fcontent">  <input class="qFormInput" id="spdFlag" name="spdFlag" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 开户人身份证:</td>
   			<td class="fcontent">  <input class="qFormInput" id="cardPersonNo" name="cardPersonNo" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 卡折标志:</td>
   			<td class="fcontent">  <input class="qFormInput" id="depositFlag" name="depositFlag" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 本金结算周期:</td>
   			<td class="fcontent">  <input class="qFormInput" id="settlePeriod" name="settlePeriod" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 手续费收取类型:</td>
   			<td class="fcontent">  <input class="qFormInput" id="feeStlmType" name="feeStlmType" type="text" maxlength="15" /></td>
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
   		    <tr>
    			<td class="flabel"> 商户类型:</td>
    			<td class="fcontent">  <input class="qFormInput" id="mcc_zh" name="mccZh" type="text" maxlength="15" /></td>
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
    			<td class="flabel"> 商户审批状态:</td>
    			<td class="fcontent">  <input class="qFormInput" id="conf_status_zh" name="confStatusZh" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
    			<td class="flabel"> 商户状态:</td>
    			<td class="fcontent">  <input class="qFormInput" id="mer_status_zh" name="merStatusZh" type="text" maxlength="15" /></td>
   			</tr>
              </TBODY>
               </table>     
               
               </div>          
           </form>
	</td>
	<td width="10"></td>
          
    <td>
	    <div  class="titleDiv">
	        <div class="dtitle">外部商户号</div>
	    </div>
	        <div class="restree">
	    <div id="addMerchantOutDetail"></div>
	    
	    </div>
    </td>
    </tr>		
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="merchantstatus" style="display: none;">
<form id="form3" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>商户号：</TD>
			<TD class="finput"><input class="qFormInput"  name="orgCode" type="text"  readonly="readonly"  disabled="disabled"/>
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">描述：</TD>
			<TD class="finput"><textarea  maxLength="200"  id="channgeRemark" name="remark" rows="4" cols="20"></textarea>
			
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户状态：</TD>
			<TD class="finput">
			<input type="radio" id="result10"  name="bussBrhStatus" value="02" />停用维护
	         <input type="radio" id="result20" name="bussBrhStatus" value="01"/>正常启用
			<div id="bussBrhStatusTip"></div>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="merchantspecial" style="display: none;">
<form id="form4" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">商户编号：</TD>
			<TD class="finput"><input class="qFormInput" id="orgCode" name="orgCode" type="text"  readonly="readonly"  disabled="disabled"/>
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户名称：</TD>
			<TD class="finput"><input class="qFormInput" id="merName" name="merName" type="text"  readonly="readonly"  disabled="disabled"/>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">特殊计费：</TD>
			<TD class="finput">
			<select id="specialNo" name="specialNo" comparison="eq"></select>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="freePassword" style="display: none;">
<form id="form6" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>商户号：</TD>
			<TD class="finput"><input class="qFormInput"  name="orgCode" type="text"  readonly="readonly"  disabled="disabled"/>
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">描述：</TD>
			<TD class="finput"><textarea  maxLength="200"  id="channgeRemark" name="remark" rows="4" cols="20"></textarea>
			
			</TD>
		</TR>
		<TR >
			<TD class="flabel">免密开关：</TD>
			<TD class="finput">
			<input type="radio" id="result30"  name="bussBrhStatus" value="开通" />开通
	         <input type="radio" id="result40" name="bussBrhStatus" value="关闭"/>关闭
			<div id="bussBrhStatusTip"></div>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
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
					<td class="qlabel">服务名称</td>
					<td class="qinput">
						<input type="text" name="channelName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">服务代码</td>
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




<div id="merchantTransGroup" style="display: none;">
<form id="form5" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">商户编号：</TD>
			<TD class="finput"><input class="qFormInput" id="orgCode" name="orgCode" type="text"  readonly="readonly"  disabled="disabled"/>
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户名称：</TD>
			<TD class="finput"><input class="qFormInput" id="merName" name="merName" type="text"  readonly="readonly"  disabled="disabled"/>
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


<!-- 商户附件 -->
<div id="mhtAttachInfoAddDialog" class="detailDialog" style="display:none;">
	<form id="mhtAttachInfoAddForm">
	<table id="mhtAttachInfoAddTable" class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">商户号：</td>
			<td class="finput"><input id="maia_mid" name="mid" type="text" readonly="readonly" /></td>
			<td class="flabel">商户名称:</td>
			<td class="finput"><input id="maia_merName" name="merName" type="text" readonly="readonly"/></td>
		</tr>
	</table>
	</form>
	<br/>
	<table id="mhtAttachInfoAddTable" class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<thead>
			<tr>
				<th width="60%">名称</th>
				<th>进件</th>
				<th>修改</th>
			</tr>
		</thead>
		<tbody id="mhtAttachInfoAddTbody">
		</tbody>
	</table>
</div>
<!-- 文件选择下载框 -->
<div id="uploadAttachDialog" style="display: none;" >
<form id="uploadAttachForm" target="fileFrame" enctype="multipart/form-data" method="post" role="form">
	<input id="attachfile" type="file" name="uploadFile" class="form-control" style="border:none; font-size:12px;" accept="" />
	<input id="uploadAttachForm_refNo" type="hidden" name="refNo" />
	<input id="uploadAttachForm_uploadFileName" type="hidden" name="uploadFileName" />
</form>
</div>

<div style="display: none;">
<textarea id="athTrTpl">
	<tr>
		<td>{athTypeName} <span class="txt-red">{athNullable}</span></td>
		<td>
			<input type="checkbox" readonly="readonly" class="athChecked" id="{athType}_checked" onclick="return false;"/>
			<input type="hidden" id="ath_{athType}" athType="{athType}" class="athInMedSeq" />
			<input type="button" id="ath_{athType}_in_preview" class="bt preview-in-ath-btn" refNo="" fileId="ath_{athType}" athType="{athType}" value="查看" />
		</td>
		<td>
			<input type="checkbox" readonly="readonly" class="athCheckedUpd" id="{athType}_upd_checked" onclick="return false;"/>
			<input type="hidden" id="ath_{athType}_upd" athType="{athType}" class="athUpdMedSeq" />
			<input type="button" class="bt upload-upd-ath-btn" fileId="ath_{athType}_upd" athType="{athType}" uploadMime="{athFileType}" value="上传" />
			<input type="button" id="ath_{athType}_upd_preview" class="bt preview-upd-ath-btn" refNo="" fileId="ath_{athType}_upd" athType="{athType}" value="查看" />
		</td>
	</tr>
</textarea>
</div>
<script type="text/javascript">
// <!--
var urls = {
athDef: 'loadMhtAttachDef.action',	
athList: 'loadMhtAttachInfo.action',
saveAth: 'saveMhtAttachInfo.action',
ulAthImg: 'uploadAttachImg.action',
ulAthFile: 'uploadAttachFile.action'
};
var __refNo = false;
var uploadId = false;
//added 
var isIE = function() { return /msie/.test(navigator.userAgent.toLowerCase());};
var frameCtx=function(str){
	str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
	str.value = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
	//str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
	return str;
};
var loadFile = function() {
	var data= $('#fileFrame').contents().find("body").html();
	if(data != ""){
		data = frameCtx(data);
		//alert(data);
		var dataObj = $.evalJSON(data);
		if(dataObj) {
			if(dataObj.success && dataObj.root.length == 1){
				alert('上传文件成功');
				var med = dataObj.root[0];
				console.log(med);
				var athMedSeq = med.medSeq + med.medName.substring(med.medName.lastIndexOf('.')); 
				$('#' + uploadId).val(athMedSeq).change();
			} else {
				alert('上传文件失败 ' + dataObj.syserr);
			}
		}
	}
} ;

var htmlFromTpl = function(_f,_t){
	var html =  _t.replace(/{([^{}]+)}/g,function(word){ 
		var _attr=word.replace(/({|})+/g,""); 
		return _f[_attr]; });
	return $(html);
};

var loadAthDef = function() {
	var tpl = $('#athTrTpl').val();
	var $parent = $('#mhtAttachInfoAddTbody');
	$parent.html('');
	$.ajax({url:urls.athDef, dataType:'json', type:'POST', async:false
		, success: function(data){
			if (data && data.success) {
				$(data.root).each(function(_i,_n){
					_n.athNullable = (_n.nullable=='1'?'*':'');
					$parent.append(htmlFromTpl(_n, tpl));
				});
			} else {
				alert('加载附件定义失败');
			}
		}});
};
var loadAthList = function() {
	$('.athChecked').removeAttr('checked');
	$('.athCheckedUpd').removeAttr('checked');
	$('.athInMedSeq').val('');
	$('.athUpdMedSeq').val('');
	if ( __refNo ) {
		$.ajax({url:urls.athList, dataType:'json', type:'POST', async:false, data:{'mid':__refNo}
			,success:function(data){
				if (data && data.success) {
					if ( data.root ){
						var mid = __refNo;
						$(data.root).each(function(_i,_n){
							$('#ath_'+_n.athType).val('').val(_n.inMedSeq).change();
							$('#ath_'+_n.athType + '_upd').val('').val(_n.updMedSeq).change();
							$('#ath_'+_n.athType + "_in_preview").attr('refNo', _n.addOrgCode);
							// $('#ath_'+_n.athType + "_upd_preview").attr('refNo', _n.mid);
						});
						$('.preview-upd-ath-btn').attr('refNo', __refNo);
					}
				} else {
					alert('加载附件列表失败');
				}
		}});
	}
	
};
var getFileName = function(o){
	var pos=o.lastIndexOf("\\");
	return o.substring(pos+1);  
}
var bindAthEvent = function() {
	$('.preview-in-ath-btn').click(function() {
		var fileId = $(this).attr('fileId');
		var athType = $(this).attr('athType');
		var refNo = $(this).attr('refNo');
		var medSeq = $('#' + fileId).val();
		if ( medSeq ) {
			window.open('attach/' + refNo + '_in_' + athType + '_' + medSeq);
		} else {
			alert('无附件信息');
		}
	});
	$('.preview-upd-ath-btn').click(function() {
		var fileId = $(this).attr('fileId');
		var athType = $(this).attr('athType');
		var refNo = $(this).attr('refNo');
		var medSeq = $('#' + fileId).val();
		if ( medSeq ) {
			window.open('attach/' + refNo + '_in_' + athType + '_' + medSeq);
		} else {
			alert('无附件信息');
		}
	});
	
	$('.upload-upd-ath-btn').click(function() {
		uploadId = $(this).attr('fileId') ;
		var accept = $(this).attr('uploadMime') ;
		if ( accept.indexOf('image')>=0){
			$('#uploadAttachForm').attr('action',urls.ulAthImg);
		} else {
			$('#uploadAttachForm').attr('action',urls.ulAthFile);
		}
		$('input[id=attachfile]').attr('accept', accept);
		$('#uploadAttachForm')[0].reset();
		$('#uploadAttachDialog').dialog('open');
	});
	
	$('.athInMedSeq').change(function(){
		var inMedSeq = $(this).val();
		var $checked = $('#' + $(this).attr('athType') + '_checked');
		$checked.removeAttr('checked');
		if ( inMedSeq && inMedSeq.length > 0 ) {
			$checked.attr('checked','checked');
		}
	});
	
	$('.athUpdMedSeq').change(function(){
		var inMedSeq = $(this).val();
		var $checked = $('#' + $(this).attr('athType') + '_upd_checked');
		$checked.removeAttr('checked');
		if ( inMedSeq && inMedSeq.length > 0 ) {
			$checked.attr('checked','checked');
		}
	});
	
	$('#attachfile').change(function() { 
		var file = $(this).val();
		$('#uploadAttachForm_uploadFileName').val(getFileName(file));
		$("#uploadAttachForm")[0].submit();
		$('#uploadAttachDialog').dialog('close');
		// if ( isIE() ) 
	});
};
var uploadAthBtn = function(record,id) {
	if (!record) { alert("请选择一条记录"); return;	}
	__refNo = record.mid;
	$('#uploadAttachForm_refNo').val(__refNo);
	$('#mhtAttachInfoAddForm input[name=merName]').val(record.merName);
	$('#mhtAttachInfoAddForm input[name=mid]').val(record.mid);
	loadAthList();
	$('#mhtAttachInfoAddDialog').dialog('open');
};

$(function(){
$('#uploadAttachDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 400, height: 200, title:'选择附件'});	
$('#mhtAttachInfoAddDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 500
, title:'商户附件信息', buttons:{
	'保存':function() {
		var athTypeList = new Array();
		$('.athUpdMedSeq').each(function(_i,_n){
			athTypeList.push({'athType':$(_n).attr('athType'), 'updMedSeq':$(_n).val()});
		});
		var mhtAdd = {mid: $('#maia_mid').val() };
		$.ajax({url:urls.saveAth, type:'POST', dataType:'json', async:false, data:{jsonObject:$.toJSON(mhtAdd), jsonArray:$.toJSON(athTypeList)}
		,success: function(data) {
			if ( data && data.success ) {
				alert('操作成功');
				$('#mhtAttachInfoAddDialog').dialog('close');
			} else { alert('保存出错：' + data.syserr); }
		}});
	},'关闭':function() {$(this).dialog('close');}  
}});

loadAthDef();
bindAthEvent();

});
//-->
</script>
<div style="display: none"><iframe id="fileFrame" name="fileFrame" onload="loadFile()" ></iframe></div>
</body>
</html>