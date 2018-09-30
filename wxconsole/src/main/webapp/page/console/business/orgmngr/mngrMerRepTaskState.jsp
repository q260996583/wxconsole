<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户任务报表状态</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrMerRepTaskState.js"></script>
<style>
<!--
#mhtAttachInfoAddTbody .bt{width: 50px;}
-->
</style>

</head>
<body>

<div id="queryCondition" style="background-color: #FBFEFF; padding: 5px;">
	<form id="queryForm" name="queryForm" action="#" method="post" style="padding: 0px; margin: 0px;">
		<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
			<tr>
				<td class="qlabel">操作员名称</td>
				<td class="qinput"><input type="text" value="" id="userName" comparison="like" qtype="string" name=userName size=20 /></td>
				<td class="qlabel">操作员ID</td>
				<td class="qinput"><input type="text" value="" id="loginID" comparison="like" qtype="string" name=loginID maxlength="15" /></td>
				<td class="qlabel">新建时间</td>
				<td class="qinput"><input id="createTime" name="createTime" comparison="like" /></td>				
			</tr>
			<tr>
				<td class="qlabel">任务名称</td>
				<td class="qinput"><input type="text" value="" id="taskName" comparison="like" qtype="string" name=taskName size=20 /></td>
				<td class="qlabel"></td>
				<td class="qinput">
					<!-- <select comparison="eq" qtype="string" id="status" name="status">
						<OPTION value="" selected="selected">正常</OPTION>
						<OPTION value=02>执行</OPTION>
						<OPTION value=01>执行完毕</OPTION>
						<OPTION value=99>删除状态</OPTION>						
					</select> -->
				</td>				
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
				<div style="overflow-x: auto; overflow-y: auto;">
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
		    			<td class="flabel"> 外卡业务币种:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="outCardTypeZh" name="outCardTypeZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel">非借记卡单笔交易限额(元):</td>
		    			<td class="fcontent">  <input class="qFormInput" id="tranLimit" name="tranLimit" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel">借记卡单笔交易限额(元):</td>
		    			<td class="fcontent">  <input class="qFormInput" id="tranLimitDebit" name="tranLimitDebit" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 商户交易权限组:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="tranLimitParamZh" name="tranLimitParamZh" type="text" maxlength="15" /></td>
	    			</tr>
	    			<tr>
		    			<td class="flabel"> 接入模式:</td>
		    			<td class="fcontent">  <input class="qFormInput" id="accessModeZh" name="accessModeZh" type="text" maxlength="15" /></td>
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
		
	<div  class="titleDiv"><div class="dtitle">外部商户号</div></div>
	<div style="overflow: auto;background:#ffffff"><div id="merchantOutDetail" ></div></div>
	<!-- 终端信息 -->
	<div  class="titleDiv"><div class="dtitle">终端信息</div></div>
	<div style="overflow: auto;background:#ffffff"><div id="outMerTidDetail" ></div></div>
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
		<div style="overflow-x: auto; overflow-y: auto; height: 530px;">  
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
		<td>{athTypeName}</td>
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
		}
	});
	$('.preview-upd-ath-btn').click(function() {
		var fileId = $(this).attr('fileId');
		var athType = $(this).attr('athType');
		var refNo = $(this).attr('refNo');
		var medSeq = $('#' + fileId).val();
		if ( medSeq ) {
			window.open('attach/' + refNo + '_in_' + athType + '_' + medSeq);
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