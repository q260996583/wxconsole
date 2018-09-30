<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>二维码报备</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
</head>
<style>
.flabel {
	width: 20%
}

.qFormInput {
	width: 80%
}
</style>
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
					<td class="qlabel"></td>
					<td class="qinput"></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center"><input
						id="querybutton" class="bt" value="查询" type="button" /> <input
						class="bt" value="重置" type="reset" /></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>


	<div id="outMerDetail" class="detailDialog" style="display: none;">
		<form id="form2">
			<div style="overflow-x: auto; overflow-y: auto; width: 100%;">
				<table class="ftable" cellpadding="1" cellspacing="1"
					bgcolor="#8392a5" width="100%">
					<TBODY>
						<tr>
							<td class="flabel">商户号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="mid" name="mid" type="text" maxlength="20"
								readonly="readonly" disabled="disabled" /></td>
						</tr>
						<tr>
							<td class="flabel">商户名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="merName" name="merName" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">商户对外经营名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="merOutName" name="merOutName" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">商户英文名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="enName" name="enName" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">商户对外英文名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="enOutName" name="enOutName" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">MCC:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="mcc" name="mcc" type="text" maxlength="50" /></td>
						</tr>
						<tr>
							<td class="flabel">商户类别(结算):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="mccGrp" name="mccGrpDesc" type="text" /></td>
						</tr>
						<tr>
							<td class="flabel">商户类别(预期):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="mccGrpImpDesc" name="mccGrpImpDesc" type="text" /></td>
						</tr>
						<tr>
							<td class="flabel">进件类别备注:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="mccRemark" name="mccRemark" type="text" /></td>
						</tr>
						<tr>
							<td class="flabel">地区代码:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="areaCodeZH" name="areaCodeZH" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">营业执照统一社会信用代码:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="licenseNo" name="licenseNo" type="text" maxlength="30" /></td>
						</tr>
						<tr>
							<td class="flabel">营业执照有效期:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="bizLicnoExpireDate" name="bizLicnoExpireDate" type="text"
								maxlength="100" xtype="date" /></td>
						</tr>
						<tr>
							<td class="flabel">营业执照注册地址:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="licenseAddr" name="licenseAddr" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">企业成立日期:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="merCreateDate" name="merCreateDate" type="text"
								maxlength="15" /></td>
						</tr>
						<tr>
							<td class="flabel">月租金(元):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="monthRent" name="monthRent" type="text" maxlength="15" /></td>
						</tr>
						<tr>
							<td class="flabel">税务登记证号码:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="taxNo" name="taxNo" type="text" maxlength="30" /></td>
						</tr>
						<tr>
							<td class="flabel">组织机构代码证:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="certNo" name="certNo" type="text" maxlength="30" /></td>
						</tr>
						<tr>
							<td class="flabel">法人姓名:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="personName" name="personName" type="text" maxlength="30" /></td>
						</tr>
						<tr>
							<td class="flabel">法人证件类型:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="personNoTypeDesc" name="personNoTypeDesc" type="text"
								maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">法人证件号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="personNo" name="personNo" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">法人证件有效期:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="personNoExpireDate" name="personNoExpireDate" type="text"
								maxlength="100" xtype="date" /></td>
						</tr>
						</tr>
						<tr>
							<td class="flabel">营业开始时间:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="busiBgTime" name="busiBgtime" type="text" maxlength="15" /></td>
						</tr>
						<tr>
							<td class="flabel">营业结束时间:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="busiEndtime" name="busiEndtime" type="text" maxlength="15" /></td>
						</tr>
						<tr>
							<td class="flabel">营业面积(平方米):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="area" name="area" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">对公账号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="fftAccntZH" name="fftAccntZH" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">商户账户类型：</td>
							<td class="fcontent"><select id="accntType"
								name="accntType" disabled></select></td>
						</tr>
						<tr>
							<td class="flabel">商户账户名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="accntNamePrivate" name="accntNamePrivate" type="text"
								maxlength="60" /></td>
						</tr>
						<tr>
							<td class="flabel">商户账户号码:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="accntNoPrivate" name="accntNoPrivate" type="text"
								maxlength="60" /></td>
						</tr>
						<tr>
							<td class="flabel">开户行总行号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="accntBank" name="accntBank" type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">开户行总行名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="accntBankPrivateDesc" name="accntBankPrivateDesc"
								type="text" maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">开户行支行号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="bankBranchNo" name="bankBranchNo" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">开户行支行名称:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="bankBranchNodesc" name="bankBranchNoDesc" type="text"
								maxlength="20" /></td>
						</tr>
						<!-- <tr>
                <td class="flabel"> 商户开户行是否为浦发银行:</td>
                <td class="fcontent">  <input class="qFormInput" disabled id="spdFlagZH" name="spdFlagZH" type="text" maxlength="20" /></td>
                </tr> -->
						<tr>
							<td class="flabel">一级服务商:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="firstTcnZH" name="firstTcnZH" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">二级服务商:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="secondTcnZH" name="secondTcnZH" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">标识:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="gradeFlag" name="gradeFlag" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">开户人证件类型:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="cardPersonNoTypeDesc" name="cardPersonNoTypeDesc"
								type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">开户人证件号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="cardPersonNo" name="cardPersonNo" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">开户人证件有效期:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text"
								maxlength="100" xtype="date" /></td>
						</tr>
						<tr>
							<td class="flabel">手续费收取类型:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="feeType" name="feeTypeZh" type="text" maxlength="15" /></td>
						</tr>
						<tr>
							<td class="flabel">借记手续费率(%):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="v_debitRate" name="debitRate" type="text" xtype="rate4" /></td>
						</tr>
						<tr>
							<td class="flabel">借记封顶费(元):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="v_debitMaxFee" name="debitMaxFee" type="text" xtype="money" /></td>
						</tr>
						<tr>
							<td class="flabel">贷记手续费率(%):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="v_creditRate" name="creditRate" type="text" xtype="rate4" /></td>
						</tr>
						<tr>
							<td class="flabel">微信手续费率(%):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="v_wechatPayRate" name="wechatPayRate" type="text"
								xtype="rate4" /></td>
						</tr>
						<tr>
							<td class="flabel">境外卡手续费率(%):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="v_outCardRate" name="outCardRate" type="text" xtype="rate4" /></td>
						</tr>
						<tr>
							<td class="flabel">支付宝手续费率(%):</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="v_alipayPayRate" name="alipayPayRate" type="text"
								xtype="rate4" /></td>
						</tr>
						<tr>
							<td class="flabel">商户联系人:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="merContact" name="merContact" type="text" maxlength="60" /></td>
						</tr>
						<tr>
							<td class="flabel">商户联系电话:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="merPhone" name="merPhone" type="text" maxlength="50" /></td>
						</tr>
						<tr>
							<td class="flabel">商户营销人员姓名:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="merketPerson" name="merketPerson" type="text" maxlength="15" /></td>
						</tr>
						<tr>
							<td class="flabel">开户银行网点号:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="accntBankNoPrivate" name="accntBankNoPrivate" type="text"
								maxlength="20" /></td>
						</tr>
						<!-- 调单联系人 -->
						<tr>
							<td class="flabel">调单联系人姓名:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="docTransferName" name="docTransferName" type="text"
								maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">调单联系人电话:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="docTransferPhone" name="docTransferPhone" type="text"
								maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">调单联系人邮箱:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="docTransferEmail" name="docTransferEmail" type="text"
								maxlength="100" /></td>
						</tr>
						<tr>
							<td class="flabel">备注:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="memo" name="memo" type="text" maxlength="200" /></td>
						</tr>
						<tr>
							<td class="flabel">进件附件:</td>
							<td class="fcontent"><input id="downloadOutMerApplyFile"
								class="bt" value="查看附件" type="button"></td>
						</tr>
						<tr>
                            <td class="flabel">二维码报备状态:</td>
                            <td>
                            <table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
                                <thead>
		                            <tr>
		                                <td>民生微信T0</td>
		                                <td>民生微信T1</td>
		                                <td>民生支付宝T0</td>
		                                <td>民生支付宝T1</td>
		                            </tr>
		                         </thead>
		                         <tbody>
		                            <tr>
		                                <td class="qlabel" disabled id="SMZF_SHSX2_HD_T0-SMZF_WX_HD" name="wxt0" type="text" maxlength="5" />未报备</td>
		                                <td class="qlabel" disabled id="SMZF_SHSX2_HD_T1-SMZF_WX_HD" name="wxt1" type="text" maxlength="5" />未报备</td>
		                                <td class="qlabel" disabled id="SMZF_SHSX_T0-SMZF_ZFB" name="zfbt0" type="text" maxlength="5" />未报备</td>
                                        <td class="qlabel" disabled id="SMZF_SHSX_T1-SMZF_ZFB" name="zfbt1" type="text" maxlength="5" />未报备</td>
                                        </tr>
		                            <tr>
                                        <td class="qlabel" disabled id="SMZF_SHSX2_HD_T0-SMZF_WX_HD-id" name="wxt0-id" type="text" maxlength="18" /></td>
                                        <td class="qlabel" disabled id="SMZF_SHSX2_HD_T1-SMZF_WX_HD-id" name="wxt1-id" type="text" maxlength="18" /></td>
                                        <td class="qlabel" disabled id="SMZF_SHSX_T0-SMZF_ZFB-id" name="zfbt0-id" type="text" maxlength="18" /></td>
                                        <td class="qlabel" disabled id="SMZF_SHSX_T1-SMZF_ZFB-id" name="zfbt1-id" type="text" maxlength="18" /></td>
                                        </tr>
		                         </tbody>
                           <thead>
                                    <tr>
                                        <td>恒丰</td>
                                        <td>上海银行</td>
                                        <td>平安银行</td>
                                        <td>中信银行</td>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                        <td class="qlabel" disabled id="000100015-SMZF_HF" name="hf" type="text" maxlength="5" />未报备</td>
                                        <td class="qlabel" disabled id="1100072-SMZF_SH" name="sh" type="text" maxlength="5" />未报备</td>
                                        <td class="qlabel" disabled id="880000092-SMZF_PA" name="pa" type="text" maxlength="5" />未报备</td>
                                        <td class="qlabel" disabled id="123456-SMZF_ZX" name="zx" type="text" maxlength="5" />未报备</td>
                                        </tr>
                                    <tr>
                                        <td class="qlabel" disabled id="000100015-SMZF_HF-id" name="hf-id" type="text" maxlength="18" /></td>
                                        <td class="qlabel" disabled id="1100072-SMZF_SH-id" name="sh-id" type="text" maxlength="18" /></td>
                                        <td class="qlabel" disabled id="880000092-SMZF_PA-id" name="pa-id" type="text" maxlength="18" /></td>
                                        <td class="qlabel" disabled id="123456-SMZF_ZX-id" name="zx-id" type="text" maxlength="18" /></td>
                                        </tr>
                                 </tbody>
                            </table>
                            </td>
                        </tr>
                        
						<tr>
							<td class="flabel">交易使用二维码渠道:</td>
							<TD class="finput"><input type="radio" id="activeChannelMS"
								name="merActiveQrcChannel" value="MS" />民生 <input type="radio"
								id="activeChannelHF" name="merActiveQrcChannel" value="HF" />恒丰
								<input type="radio" id="activeChannelSH" name="merActiveQrcChannel" value="SH" />上海银行
								<input type="radio" id="activeChannelSH" name="merActiveQrcChannel" value="PA" />平安
								<input type="radio" id="activeChannelSH" name="merActiveQrcChannel" value="ZX" />中信</TD>
						</tr>
						<tr>
							<td class="flabel">商户信息录入时间:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="updDate" name="updDate" type="text" xtype="datetime" /></td>
						</tr>
						<tr>
							<td class="flabel">审批状态:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="statusZH" name="statusZH" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">业务审批人:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="admitAcc" name="admitAcc" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">业务审批意见:</td>
							<td class="fcontent"><textarea class="qFormInput" disabled
									id="admitMemo" name="admitMemo" type="text" maxlength="300"></textarea></td>
						</tr>
						<tr>
							<td class="flabel">风控审批人:</td>
							<td class="fcontent"><input class="qFormInput" disabled
								id="approveAcc" name="approveAcc" type="text" maxlength="20" /></td>
						</tr>
						<tr>
							<td class="flabel">风控审批意见:</td>
							<td class="fcontent"><textarea class="qFormInput" disabled
									id="approveMemo" name="approveMemo" type="text" maxlength="300"></textarea></td>
						</tr>
						<tr style="display: none">
							<td></td>
							<td><input id="bankAccntId" name="bankAccntId" type="text" />
								<input id="firstTcn" name="firstTcn" type="text" /> <input
								id="accntType" name="accntType" type="text" /> <input
								id="feeType" name="feeType" type="text" /> <input id="spdFlag"
								name="spdFlag" type="text" /> <input id="merFax" name="merFax"
								type="text" /> <input id="areaCode" name="areaCode" type="text" />
								<input id="orgCode" name="orgCode" type="text" /> <input
								id="feeRate" name="feeRate" type="text" /> <input id="feeVal"
								name="feeVal" type="text" /> <input id="topValue"
								name="topValue" type="text" /> <input id="mccGrp" name="mccGrp"
								type="text" /> <input id="mccGrpImp" name="mccGrpImp"
								type="text" /></td>
						</tr>
					</TBODY>
				</table>
			</div>
		</form>
		<div class="titleDiv">
			<div class="dtitle">终端信息</div>
		</div>
		<div style="overflow: auto; width: 100%; background: #ffffff">
			<div id="outMerTidDetail"></div>
		</div>
	</div>

	<!-- 商户附件 -->
	<div id="mhtAttachInfoAddDialog" class="detailDialog"
		style="display: none;">
		<table id="mhtAttachInfoAddTable" class="ftable" cellpadding="1"
			cellspacing="1" bgcolor="#8392a5" width="100%">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th width="80%">名称</th>
					<th>查看</th>
				</tr>
			</thead>
			<tbody id="mhtAttachInfoAddTbody">
			</tbody>
		</table>
	</div>

	<div style="display: none;">
		<textarea id="athTrTpl">
    <tr>
        <td><input type="checkbox" readonly="readonly"
					class="athChecked" id="{athType}_checked" onclick="return false;" /></td>
        <td>{athTypeName} <span class="txt-red">{athNullable}</span><input
					type="hidden" id="ath_{athType}" athType="{athType}"
					class="athInMedSeq" /></td>
        <td><input type="button" class="bt preview-in-ath-btn"
					fileId="ath_{athType}" athType="{athType}" value="查看" /></td>
    </tr>
</textarea>
	</div>

	<!-- 修改微信报备信息-->
	<div id="mhtwechatUpdConfirmDialog" class="detailDialog"
		style="display: none;">
		<table id="mhtwechatUpdConfirmTable" class="ftable" cellpadding="1"
			cellspacing="1" bgcolor="#8392a5" width="100%">
			<tr>
				<td class="flabel">商户编码</td>
				<td class="fcontent"><input class="qFormInput" disabled
					id="wMerId" name="wMerId" type="text" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="flabel">商户简称:</td>
				<td class="fcontent"><input class="qFormInput" disabled
					id="wMerShortName" name="wMerShortName" type="text" maxlength="20" /></td>
			</tr>
			<td class="flabel">商户地址:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wMerAddr" name="wMerAddr" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">客服电话:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wServicePhone" name="wServicePhone" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">联系人名称:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wContactName" name="wContactName" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">收款人账户:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wAccNo" name="wAccNo" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">收款人账户名:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wAccName" name="wAccName" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">收款人账户联行号:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wBankType" name="wBankType" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">收款人账户开户行名称:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wBankName" name="wBankName" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">T0单笔提现手续费:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wT0drawFee" name="wT0drawFee" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">T0交易手续费扣率:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wT0tradeRate" name="wT0tradeRate" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">T1单笔提现手续费:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wT1drawFee" name="wT1drawFee" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">T1交易手续费扣率:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wT1tradeRate" name="wT1tradeRate" type="text" maxlength="20" /></td>
			</tr>
			</tr>
			<td class="flabel">支付渠道商户编码:</td>
			<td class="fcontent"><input class="qFormInput" disabled
				id="wChannelMerCode" name="wChannelMerCode" type="text"
				maxlength="20" /></td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		
// <!--
var urls = {
athDef: 'loadMhtAttachDef.action',  
athList: 'loadMhtAttachInfoAdd.action'
};
var __refNo = false;
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
    $('.athInMedSeq').val('');
    if ( __refNo ) {
        $.ajax({url:urls.athList, dataType:'json', type:'POST', async:false, data:{'orgCode':__refNo}
            ,success:function(data){
                if (data && data.success) {
                    if ( data.root ){
                        $(data.root).each(function(_i,_n){
                            $('#ath_'+_n.athType).val('').val(_n.inMedSeq).change();
                        });
                    }
                } else {
                    alert('加载附件列表失败');
                }
        }});
    }
    
};
var bindAthEvent = function() {
    $('.preview-in-ath-btn').click(function() {
        var fileId = $(this).attr('fileId');
        var athType = $(this).attr('athType');
        var medSeq = $('#' + fileId).val();
        if ( medSeq ) {
            window.open('attach/' + __refNo + '_in_' + athType + '_' + medSeq);
        } else {
            alert('无附件信息');
        }
    });
    $('.athInMedSeq').change(function(){
        var inMedSeq = $(this).val();
        var $checked = $('#' + $(this).attr('athType') + '_checked');
        $checked.removeAttr('checked');
        if ( inMedSeq && inMedSeq.length > 0 ) {
            $checked.attr('checked','checked');
        }
    });
};

var __defCodeBoxParam = function(__opt) {
    return $.extend({emptyOpt:true,valueField:'codeNo', displayField:'codeName', render:function(res){return res.codeName;}, failedMsg:'获取应用参数失败!'}, __opt);
};

$(document).ready(function() {

$('#outMerDetail').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 900, height: 500 });                    
$('#mhtAttachInfoAddDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 500
    , title:'附件列表', buttons:{'关闭':function() {$(this).dialog('close');}  } });                  
$('#mhtwechatUpdConfirmDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 500
    , title:'报备信息修改', buttons:{
        '确认修改':function() { 
            var mhtObj2 = $('#form2').formToJSON();
            $.ajax({url:'qrcodeApplyUpdWechatCommit.action', type:'POST', dataType:'json', 
                async:false, data:{mers:$.toJSON(mhtObj2)}
            ,success: function(data) {
                if ( data && data.success ) {
                    alert(data.syserr);
                } else { alert('保存出错：' + data.syserr); }
            }});
                $(this).dialog('close');} , 
          '关闭' : function() {$(this).dialog('close');} } });                  
     
$('#downloadOutMerApplyFile').click(function(){
    loadAthList();
    $('#mhtAttachInfoAddDialog').dialog('open');
});

var  viewOutMerDetail = function(record,id) {
    if (!record) { alert("请选择一条记录"); return;    }
    __refNo = record.orgCode;
    $('#form2').fillObject({obj:record});
    $("input[name=merActiveQrcChannel]").val([record.merActiveQrcChannel]);
    $('#bizLicnoExpireDate').val(frmBSDate(record.bizLicnoExpireDate));
    $('#personNoExpireDate').val(frmBSDate(record.personNoExpireDate));
    $('#cardLicnoExpireDate').val(frmBSDate(record.cardLicnoExpireDate));
    $('#updDate').val(frmBSTime(record.updDate));
    $.ajax({ url: 'queryOutMerTidApply.action', async   : false, data   : {jsonObject:$.toJSON(record)},
        success:function(data){
            $('#outMerTidDetail').refreshWithData(data);
        }                                                   
    });
    document.getElementById('SMZF_SHSX2_HD_T0-SMZF_WX_HD').innerHTML = '未报备';
    document.getElementById('SMZF_SHSX2_HD_T1-SMZF_WX_HD').innerHTML = '未报备';
    document.getElementById('SMZF_SHSX_T0-SMZF_ZFB').innerHTML = '未报备';
    document.getElementById('SMZF_SHSX_T1-SMZF_ZFB').innerHTML = '未报备';
    document.getElementById('000100015-SMZF_HF').innerHTML = '未报备';
    document.getElementById('1100072-SMZF_SH').innerHTML = '未报备';
    document.getElementById('880000092-SMZF_PA').innerHTML = '未报备';
    document.getElementById('123456-SMZF_ZX').innerHTML = '未报备';
    
    document.getElementById('SMZF_SHSX2_HD_T0-SMZF_WX_HD-id').innerHTML = '';
    document.getElementById('SMZF_SHSX2_HD_T1-SMZF_WX_HD-id').innerHTML = '';
    document.getElementById('SMZF_SHSX_T0-SMZF_ZFB-id').innerHTML = '';
    document.getElementById('SMZF_SHSX_T1-SMZF_ZFB-id').innerHTML = '';
    document.getElementById('000100015-SMZF_HF-id').innerHTML = '';
    document.getElementById('1100072-SMZF_SH-id').innerHTML = '';
    document.getElementById('880000092-SMZF_PA-id').innerHTML = '';
    document.getElementById('123456-SMZF_ZX-id').innerHTML = '';
    var mhtObj = $('#form2').formToJSON();
    $.ajax({url:'queryQrcRouteInfo.action', type:'POST', dataType:'json', 
        async:false, data:{mers:$.toJSON(mhtObj)}
        ,success: function(data) {
            for(var i=0; i<data.root.length; i++) {
            	var element = document.getElementById(data.root[i].qrcChannelExt1 + "-" + data.root[i].qrcImportType);
            	var elementId = document.getElementById(data.root[i].qrcChannelExt1 + "-" + data.root[i].qrcImportType + "-id");
                
            	if (element != null)
	            	switch (data.root[i].qrcImportStatus){
	            	case 'N' : element.innerHTML = '已报备'; elementId.innerHTML = data.root[i].qrcChannelMerId; break;
	            	case 'C' : element.innerHTML = '报备中';break;
	            	case 'E' : element.innerHTML = '报备错误';break;
	            	case 'X' : element.innerHTML = '停用';break;
	            	default : element.innerHTML = data.root[i].qrcImportStatus;break;
	            	}
            	
            }
    }});

    $('#outMerDetail').dialog("option","title","详细信息");
    $('#outMerDetail').dialog("option","buttons",{
    	'确认' : function() {
            //alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
            var mhtObj2 = $('#form2').formToJSON();
            $.ajax({url:'qrcodeApplyChgChannel.action', type:'POST', dataType:'json', 
                async:false, data:{mers:$.toJSON(mhtObj2)}
            ,success: function(data) {
                if ( data && data.success ) {
                    alert(data.syserr);
                } else { alert('保存出错：' + data.syserr); }
            }});
            $('#querybutton').trigger('click');
            $(this).dialog('close');
        },    
    	'报备' : function() {
                //alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
                var mhtObj2 = $('#form2').formToJSON();
                $.ajax({url:'qrcodeApplyAddCommit.action', type:'POST', dataType:'json', 
                    async:false, data:{mers:$.toJSON(mhtObj2)}
                ,success: function(data) {
                    if ( data && data.success ) {
                        alert(data.syserr);
                    } else { alert('保存出错：' + data.syserr); }
                }});
            }, 
            '修改' : function() { mobileUpdate(); },
            '查询' : function() { mobileQuery(); },
            '关闭' : function() { $(this).dialog('close');}
        });
    $('#outMerDetail').dialog('open');
};

$('#outMerTidDetail').flexigrid({url : 'queryOutMerTidApply.action', width: 400, checkbox: false, usepager: false,                  
colModel : [
  { display: '终端号', width: 100, dataIndex: 'tid', align: 'center' }
, { display: '终端品牌', width: 100, dataIndex: 'tidBrand', align: 'center' }
, { display: '终端类型', width: 100, dataIndex: 'tidTypeZh', align: 'center' }
, { display: '终端状态', width: 100, dataIndex: 'tidStatusZH', align: 'center' }
, { display: '终端型号', width: 100, dataIndex: 'tidModel', align: 'center' }
, { display: '安装地址', width: 100, dataIndex: 'tidAddress', align: 'center' }
, { display: 'SIM卡号', width: 100, dataIndex: 'reserved1', align: 'center' }
, { display: 'SN号', width: 100, dataIndex: 'snCode', align: 'center' }
]
}); 
                        
$('#table').flexigrid({url: 'findAllMerchant.action', width: 560, dir: "desc", sort: "orgCode", usepager: true, 
buttons: [
{name: "详细信息", bclass: 'page_excel', id: 'cel', onpress: viewOutMerDetail },{separator: true }
],
colModel: [ 
 { display: '服务商内部商户号', dataIndex : 'orgCode', align : 'center', sortable:true }
,{ display: '银联商户号', dataIndex : 'mid', align : 'center' }
,{ display: '商户名称', dataIndex : 'merName', sortable:true }
,{ display: '商户类别(预期)', dataIndex: 'mccGrpImpDesc', align: 'center'}
,{ display: '商户类别(结算)', dataIndex: 'mccGrpDesc', align: 'center'}
,{ display: '借记费率(%)', dataIndex : 'debitRate', align : 'right', render:fmtRate4 }
,{ display: '借记封顶费', dataIndex : 'debitMaxFee', align : 'right', render:fmtMoney }
,{ display: '贷记费率(%)', dataIndex : 'creditRate', align : 'right', render:fmtRate4 }
,{ display: '微信费率(%)', dataIndex : 'wechatPayRate', align : 'right', render:fmtRate4 }
,{ display: '境外卡费率(%)', dataIndex : 'outCardRate', align : 'right', render:fmtRate4 }
,{ display: '支付宝费率(%)', dataIndex : 'alipayPayRate', align : 'right', render:fmtRate4 }
,{ display: '账户号码', dataIndex : 'accntNoPrivate', sortable:true }
]
});
    
var sendUpdate = false;
var mobileUpdate = function(){
    $('#wMerId').val($('#mid').val());
    $('#wMerShortName').val($('#merOutName').val());
    $('#wMerAddr').val($('#licenseAddr').val());
    $('#wServicePhone').val($('#merPhone').val());
    $('#wContactName').val($('#merContact').val());
    $('#wAccNo').val($('#accntNoPrivate').val());
    $('#wAccName').val($('#accntNamePrivate').val());
    $('#wBankType').val($('#bankBranchNo').val());
    $('#wBankName').val($('#bankBranchNodesc').val());
    $('#wT0tradeRate').val($('#v_wechatPayRate').val());
    $('#wT1tradeRate').val($('#v_wechatPayRate').val());
    $('#wChannelMerCode').val($('#channelMerCode').val());
    $('#mhtwechatUpdConfirmDialog').dialog('open');
};

var mobileQuery = function(){
    //报备结果查询
    var mhtObj2 = $('#form2').formToJSON();
    $.ajax({url:'qrcodeApplyQryCommit.action', type:'POST', dataType:'json', 
        async:false, data:{mers:$.toJSON(mhtObj2)}
    ,success: function(data) {
        if ( data && data.success ) {
            alert(data.syserr);
        } else { alert('查询出错：' + data.syserr); }
    }});
}; 

$('#querybutton').click(function(){
    $.queryTable({ formId : 'queryForm', tableId : 'table'  });
});                     
//初始化查询;
$('#querybutton').trigger('click');

loadAthDef();
bindAthEvent();
$.ajax({url:'findSecCodeList.action?codeType=ACCNT_TYPE', type:'POST', dataType:'json', success:function(data){
    if ( data && data.success ) { 
        $.dataSelectBox(__defCodeBoxParam({selectId:'accntType'}), data.root);
    } else { console.log('获取参数失败'); }
}});
});

	</script>
</body>
</html>