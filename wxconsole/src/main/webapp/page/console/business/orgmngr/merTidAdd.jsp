<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>进件维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/orgmngr/merTidAdd.js"></script>
<style type="text/css">
.onShow {
	display: block !important;
	position: relative;
	margin-left: 0;
	padding-left: 10px;
	line-height: 22px;
	vertical-align: middle
}

.onFocus {
	background: #e9f0ff;
	display: block !important;
	position: relative;
	margin-left: 0;
	padding-left: 10px;
	line-height: 22px;
	vertical-align: middle
}

.onError {
	background: #fff2e9;
	display: block !important;
	position: relative;
	margin-left: 0;
	padding-left: 10px;
	line-height: 22px;
	vertical-align: middle
}

.onCorrect {
	background: #e9ffeb;
	display: block !important;
	position: relative;
	margin-left: 0;
	padding-left: 10px;
	line-height: 22px;
	vertical-align: middle
}

.onLoad {
	background: #e9ffeb no-repeat 3px 3px;
	display: block !important;
	position: relative;
	margin-left: 0;
	padding-left: 10px;
	line-height: 22px;
	vertical-align: middle
}

.onHide {
	display: none;
}

.tid-sim {
	width: 90px;
}
.qrCheck{
	width:90px;
	}
ul, li {
	list-style: none;
}

ul {
	padding: 0;
}

li.ui-menu-item {
	cursor: pointer;
	padding: 2px 0;
}

li.ui-menu-item>a {
	display: block;
	width: 90%;
	cursor: pointer;
}
</style>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">创建开始日期</td>
					<td class="qinput"><input type="text" value="" comparison="ge"
						qtype="string" id=qStartDate name=startDate maxlength=20 /></td>
					<td class="qlabel">创建结束日期</td>
					<td class="qinput"><input type="text" value="" comparison="le"
						qtype="string" id=qEndDate name=endDate maxlength=20 /></td>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value="" id="merName"
						comparison="like" qtype="string" name=merName maxlength=20 /></td>
				</tr>
				<tr>
					<td class="qlabel">商户号</td>
					<td class="qinput"><input type="text" value="" id="mid"
						comparison="like" qtype="string" name=orgCode maxlength="15" /></td>
					<td class="qlabel">商户对外经营名称:</td>
					<td class="qinput"><input type="text" value="" id="merOutName"
						comparison="like" qtype="string" name=merOutName maxlength=30 /></td>
					<td class="qlabel">审批状态：</td>
					<td class="qinput"><select id="searchStatus" comparison="eq"
						qtype="string" name="status"></select></td>
				</tr>
				<tr>
					<td class="qlabel">商户开户银行：</td>
					<td class="qinput"><input type="text" value="" id="accntBank"
						comparison="like" qtype="string" name=accntBank maxlength="30" /></td>
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

	<div id="table"></div>

	<div id="addMer" style="display: none;">
		<form id="form2">
			<input type="hidden" name="feeRate" value="0" /> <input
				type="hidden" name="topValue" value="0" /> <input type="hidden"
				name="creditMaxFee" value="0" />

			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<tr>
					<td class="flabel" width="140px"><font color="red">*</font>服务商内部商户号：</td>
					<td class="finput" width="310px"><input id="a_orgCode"
						name="orgCode" maxLength="100" type="text" readonly="readonly" />
						<div id="a_orgCodeTip"></div></td>
					<td class="flabel" width="140px"><font color="red">*</font>商户名称:</td>
					<td class="finput" width="310px"><input id="a_merName"
						name="merName" maxLength="100" type="text" />
						<div id="a_merNameTip"></div></td>
				</tr>

				<tr>
					<td class="flabel"><font color="red">*</font>商户对外经营名称：</td>
					<td class="finput"><input id="a_merOutName" name="merOutName"
						maxLength="100" type="text" />
						<div id="a_merOutNameTip"></div></td>

					<td class="flabel">商户英文名称：</td>
					<td class="finput"><input id="a_enName" name="enName"
						maxLength="100" type="text" />
						<div id="a_enNameTip"></div></td>

				</tr>
				<tr>
					<td class="flabel">商户对外英文名称：</td>
					<td class="finput"><input id="a_enOutName" name="enOutName"
						maxLength="100" type="text" />
					<div id="a_enOutNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>地区名称：</td>
					<td class="finput"><input id="a_areaCode" name="areaCode"
						maxLength="6" type="text" onkeydown="return false;" />
					<div id="a_areaCodeTip"></div></td>


				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>MCC描述：</td>
					<td class="finput"><input id="a_mcc" name="mcc" maxLength="6"
						type="text" onkeydown="return false;" />
					<div id="a_mccTip"></div></td>
					<td class="flabel">&nbsp;</td>
					<td class="finput">&nbsp;</td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户类别(预期)：</td>
					<td class="finput"><select id="a_mccGrpImp" name="mccGrpImp"></select>
					<div id="a_mccGrpImpTip"></div></td>
					<td class="flabel"><font color="red">*</font>商户类别(结算)：</td>
					<td class="finput"><select id="a_mccGrp" name="mccGrp"></select>
					<div id="a_mccGrpTip"></div></td>

				</tr>
				<tr>
					<td class="flabel">进件类别备注：</td>
					<td class="finput" colspan="3"><textarea id="a_mccRemark"
							name="mccRemark" rows="5" cols="15"
							style="width: 220px; resize: none;"></textarea>
						<div id="a_mccRemarkTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>营业执照统一社会信用代码码：</td>
					<td class="finput"><input id="a_licenseNo" name="licenseNo"
						maxLength="20" type="text" />
					<div id="a_licenseNoTip"></div></td>

					<td class="flabel"><font color="red">*</font>营业执照有效期：</td>
					<td class="finput"><input id="a_bizLicnoExpireDate"
						name="bizLicnoExpireDate" maxLength="15" type="text"
						onkeydown="return false;" />
						<div id="a_bizLicnoExpireDateTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>营业执照注册地址：</td>
					<td class="finput"><textarea id="a_licenseAddr"
							name="licenseAddr" rows="5" cols="15"
							style="width: 220px; resize: none;" maxLength="200"></textarea>
						<div id="a_licenseAddrTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户装机地址：</td>
					<td class="finput"><textarea id="a_address" name="address"
							rows="5" cols="15" style="width: 220px; resize: none;"
							maxLength="200"></textarea>
						<div id="a_addressTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">税务登记证号码：</td>
					<td class="finput"><input id="a_taxNo" name="taxNo"
						maxLength="100" type="text" />
						<div id="a_taxNoTip"></div></td>

					<td class="flabel">组织机构代码：</td>
					<td class="finput"><input id="a_certNo" name="certNo"
						maxLength="100" type="text" />
						<div id="a_certNoTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>法人姓名：</td>
					<td class="finput"><input id="a_personName" name="personName"
						maxLength="100" type="text" />
						<div id="a_personNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>法人证件有效期：</td>
					<td class="finput"><input id="a_personNoExpireDate"
						name="personNoExpireDate" maxLength="100" type="text"
						onkeydown="return false;" />
						<div id="a_personNoExpireDateTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>法人证件类型：</td>
					<td class="finput"><select id="a_personNoType"
						name="personNoType"></select>
						<div id="a_personNoTypeTip"></div></td>

					<td class="flabel"><font color="red">*</font>法人证件号：</td>
					<td class="finput"><input id="a_personNo" name="personNo"
						maxLength="100" type="text" />
						<div id="a_personNoTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>营业开始时间：</td>
					<td class="finput"><input id="a_busiBgtTime"
						name="busiBgtTime" maxLength="100" type="text" />
						<div id="a_busiBgtTimeTip"></div></td>

					<td class="flabel"><font color="red">*</font>营业结束时间：</td>
					<td class="finput"><input id="a_busiEndTime"
						name="busiEndTime" maxLength="100" type="text" />
						<div id="a_busiEndTimeTip"></div></td>

				</tr>
				<tr>
					<td class="flabel">营业面积(平方米)：</td>
					<td class="finput"><input id="a_area" name="area"
						maxLength="100" type="text" />
						<div id="a_areaTip"></div></td>

					<td class="flabel">月租金(元)：</td>
					<td class="finput"><input id="a_monthRent" name="monthRent"
						maxLength="100" type="text" />
						<div id="a_monthRentTip"></div></td>

				</tr>
				<tr>
					<td class="flabel">商户成立日期：</td>
					<td class="finput"><input id="a_merCreatDate"
						onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyyMMdd'})"
						name="merCreatDate" maxLength="100" type="text"
						onkeydown="return false;" />
						<div id="a_merCreatDateTip"></div></td>

					<td class="flabel">收银台数：</td>
					<td class="finput"><input id="a_posNum" name="posNum"
						maxLength="100" type="text" />
						<div id="a_posNumTip"></div></td>

				</tr>

				<tr>
					<!-- <td class="flabel"><font color="red">*</font>对公账户：</td>
				<td class="finput" ><select  id="a_bankAccntId"
					name="bankAccntId"></select>
					<div id="a_bankAccntIdTip"></div></td>
				 -->
					<td class="flabel"><font color="red">*</font>商户账户类型：</td>
					<td class="finput"><select id="a_accntType" name="accntType"></select>
						<div id="a_accntTypeTip"></div></td>

					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户账户名称：</td>
					<td class="finput"><input id="a_accntName" name="accntName"
						maxLength="100" type="text" />
						<div id="a_accntNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户账户号码：</td>
					<td class="finput"><input id="a_accntNo" name="accntNo"
						maxLength="100" type="text" />
						<div id="a_accntNoTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>开户行总行号：</td>
					<td class="finput"><input id="a_accntBank" name="accntBank"
						maxLength="100" type="text" readonly />
					<div id="a_accntBankTip"></div></td>

					<td class="flabel"><font color="red">*</font>开户行支行号：</td>
					<td class="finput"><input id="a_bankBranchNo"
						name="bankBranchNo" maxLength="100" type="text" />
					<div id="a_bankBranchNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>开户行总行名称：</td>
					<td class="finput"><input id="a_accntBankPrivateDesc"
						name="accntBankPrivateDesc" maxLength="100" type="text" readonly />
					<div id="a_accntBankPrivateDescTip"></div></td>

					<td class="flabel"><font color="red">*</font>开户行支行名称：</td>
					<td class="finput"><input id="a_bankBranchNoDesc"
						name="bankBranchNoDesc" maxLength="100" type="text" readonly />
					<div id="a_bankBranchNoDescTip"></div></td>
				</tr>
				
				<!--wxb  -->
				<tr>	
					<td class="flabel">商户结算类型：</td>
					<td class="finput">
					<select id='a_merStatementsType' name='merStatementsType' style="width:60px " >
						<option ></option>
						<option >T1</option>
    					<option >D0</option>
					</select>
					<div id="a_merStatementsTypeTip"></div>
					</td>	
									
					<td class="flabel">垫资手续费费率(%):</td>
					<td class="finput"><input id="a_merStatementsRate"
						name="merStatementsRate" type="text" xtype="rate4" maxLength="100" />
					<div id="a_merStatementsRateTip"></div></td>					
				</tr>
				
				<tr>
					<td class="flabel"><font color="red">*</font>服务商号：</td>
					<td class="finput"><input id="a_channel" name="channel"
						type="text" maxlength="100" onkeydown="return false;" />
					<div id="a_channelTip"></div></td>

					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户开户人证件类型：</td>
					<td class="finput"><select id="a_cardPersonNoType"
						name="cardPersonNoType"></select>
					<div id="a_cardPersonNoTypeTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户开户人证件号：</td>
					<td class="finput"><input id="a_cardPersonNo"
						name="cardPersonNo" maxLength="100" type="text" />
					<div id="a_cardPersonNoTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户开户人证件号有效期：</td>
					<td class="finput"><input id="a_cardLicnoExpireDate"
						name="cardLicnoExpireDate" maxLength="100" type="text"
						onkeydown="return false;" />
					<div id="a_cardLicnoExpireDateTip"></div></td>

					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>借记交易费率(%)：</td>
					<td class="finput"><input id="a_debitRate" name="debitRate"
						type="text" xtype="rate4" />
						<label id="a_debitRateLab"><font color="red">费率倒挂</font></label>
					<div id="a_debitRateTip"></div></td>

					<td class="flabel"><font color="red">*</font>借记封顶费(元)：</td>
					<td class="finput"><input id="a_debitMaxFee"
						name="debitMaxFee" maxLength="100" xtype="money" type="text" />
					<div id="a_debitMaxFeeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>贷记交易费率(%)：</td>
					<td class="finput"><input id="a_creditRate" name="creditRate"
						type="text" xtype="rate4" />
						<label id="a_creditRateLab"><font color="red">费率倒挂</font></label>
					<div id="a_creditRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				
				<!--微信二维码交易费率/外卡交易费率    wxb  -->
				<tr>
					<td class="flabel"><font color="red">*</font>微信交易费率(%)：</td>
					<td class="finput"><input id="a_wechatPayRate" name="wechatPayRate"
						type="text" xtype="rate4" />
						<label id="a_wechatPayRateLab"><font color="red">费率倒挂</font></label>
					<div id="a_wechatPayRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>外卡交易费率(%)：</td>
					<td class="finput"><input id="a_outCardRate" name="outCardRate"
						type="text" xtype="rate4" />
					<div id="a_outCardRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				<!-- lxl -->
				<tr>
					<td class="flabel"><font color="red">*</font>支付宝费率(%)：</td>
					<td class="finput"><input id="a_alipayPayRate" name="alipayPayRate"
						type="text" xtype="rate4" />
						<label id="a_alipayPayRateLab"><font color="red">费率倒挂</font></label>
					<div id="a_alipayPayRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>

				<tr>
					<td class="flabel"><font color="red">*</font>商户联系人：</td>
					<td class="finput"><input id="a_merContact" name="merContact"
						maxLength="100" type="text" />
					<div id="a_merContactTip"></div></td>

					<td class="flabel">商户传真：</td>
					<td class="finput"><input id="a_merFax" name="merFax"
						maxLength="100" type="text" />
					<div id="a_merFaxTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户联系电话：</td>
					<td class="finput"><input id="a_merPhone" name="merPhone"
						maxLength="100" type="text" />
					<div id="a_merPhoneTip"></div></td>

					<td></td>
					<td></td>
					<!-- <td class="flabel">非借记卡单笔交易限额(元)：</td>
				<td class="finput" ><input id="a_tranLimit" name="tranLimit" maxLength="100" type="text" value="自动根据封顶值计算" readonly="readonly"/>
					<div id="a_tranLimitTip"></div></td>
				 -->
				</tr>
				<tr>
					<td class="flabel">开户银行网点号：</td>
					<td class="finput"><input id="a_accntbankNo"
						name="accntbankNo" maxLength="20" type="text" />
					<div id="a_accntbankNoTip"></div></td>

					<td class="flabel">调单联系人姓名：</td>
					<td class="finput"><input id="a_docTransferName"
						name="docTransferName" maxLength="50" type="text" />
					<div id="a_docTransferNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">调单联系人电话：</td>
					<td class="finput"><input id="a_docTransferPhone"
						name="docTransferPhone" type="text" maxLength="25" />
					<div id="a_docTransferPhoneTip"></div></td>

					<td class="flabel">调单联系人邮箱：</td>
					<td class="finput"><input id="a_docTransferEmail"
						name="docTransferEmail" type="text" maxLength="50" /></td>
				</tr>
			</table>
			<input id="form2reset" style="display: none;" type="reset" />

			<div style="display: none;">
				<div class="clearboth border-dash"></div>

				<span class="fontgray14b fl spt10">特色业务</span> <span
					class="borderb borderb-w01"></span>
				<div class="clearboth"></div>

				<div style="overflow: auto;">
					<table id='ipList' class="ftable" cellpadding="1" cellspacing="1"
						width="100%">
						<tr>
							<th align="center" colspan="2"><div align="center">业务类型</div></th>
							<th align="center"><div align="center">手续费收取方式</div></th>
							<th align="center"><div align="center">手续费率(%)</div></th>
							<th align="center"><div align="center">手续费封顶值(元)</div></th>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" id="a_ipType_1">银联分期付
								<input class="cdnInput" id="a_ipType1" name="ipType1"
								type="hidden" /></td>
							<td><select class="input09" id="a_ipFeeType1"
								name="ipFeeType1" disabled="disabled">
									<option value="01">持卡人和商户共同承担</option>
									<option value="02">向商户收取</option>
							</select>
								<div id="ipFeeType2Tip"></div></td>
							<td><input class="cdnInput" id="a_ipFeeRate1"
								name="ipFeeRate1" maxLength="100" type="text"
								disabled="disabled" />
								<div id="a_ipFeeRate1Tip"></div></td>
							</td>
							<td><input class="cdnInput" id="a_ipFeeRateMax1"
								name="ipFeeRateMax1" maxLength="100" type="text"
								disabled="disabled" />
								<div id="a_ipFeeRate1Tip"></div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" id="a_ipType">建行分期付
								<input class="cdnInput" id="a_ipType2" name="ipType2"
								type="hidden" /></td>
							<td><select class="input09" id="a_ipFeeType2"
								name="ipFeeType2" disabled="disabled">
									<option value="02">持卡人和商户共同承担</option>
									<option value="01">向持卡人收取</option>
							</select>
								<div id="ipFeeType2Tip"></div></td>
							<td><input class="cdnInput" id="a_ipFeeRate2"
								name="ipFeeRate2" maxLength="100" type="text"
								disabled="disabled" />
								<div id="a_ipFeeRate2Tip"></div></td>
							<td></td>
						</tr>
					</table>
				</div>
		</form>
	</div>
	<!-- 特色业务 -->




	<div class="clearboth border-dash"></div>

	<span class="fontgray14b fl spt10">终端信息</span>
	<span class="borderb borderb-w01"></span>
	<div class="clearboth"></div>

	<div id="tidadd">
		<input type='button' id='addTid' value='增加终端'> <input
			type='button' id='delTid' value='删除终端'>
	</div>
	<div style="overflow: auto;">
		<table id='tidList' class="ftable" cellpadding="1" cellspacing="1"
			width="100%">
			<thead>
				<tr>
					<th align="center" colspan="2">终端类型</th>
					<th align="center">终端品牌</th>
					<th align="center">终端型号</th>
					<th align="center">安装地址</th>
					<th align="center">SIM卡号</th>
					<th align="center">SN号</th>
					<th align="center">是否生成二维码</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	</div>


	<div id="editMer" style="display: none;">
		<form id="form3">
			<input type="hidden" name="feeRate" /> <input type="hidden"
				name="topValue" /> <input type="hidden" name="creditMaxFee" />
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<tr>
					<td class="flabel" width="140px"><font color="red">*</font>服务商内部商户号：</td>
					<td class="finput" width="310px"><input id="b_orgCode"
						name="orgCode" maxLength="100" type="text" readonly="readonly" />
					<div id="b_orgCodeTip"></div></td>

					<td class="flabel" width="140px"><font color="red">*</font>商户名称:</td>
					<td class="finput" width="310px"><input id="b_merName"
						name="merName" maxLength="100" type="text" />
					<div id="b_merNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">商户号：</td>
					<td class="finput"><input id="b_mid" name="mid"
						readonly="readonly" maxLength="100" type="text" /></td>

					<td class="flabel">一级服务商号</td>
					<td class="finput"><input id="b_firstTcn" name="firstTcn"
						maxLength="100" readonly="readonly" type="text" />
					<div id="b_firstTcnTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户对外经营名称：</td>
					<td class="finput"><input id="b_merOutName" name="merOutName"
						maxLength="100" type="text" />
					<div id="b_merOutNameTip"></div></td>

					<td class="flabel">商户英文名称：</td>
					<td class="finput"><input id="b_enName" name="enName"
						maxLength="100" type="text" />
					<div id="b_enNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">商户对外英文名称：</td>
					<td class="fcontent"><input id="b_enOutName" name="enOutName"
						maxLength="100" type="text" />
					<div id="b_enOutNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>地区名称：</td>
					<td class="finput"><input id="b_areaCode" name="areaCode"
						maxLength="6" type="text" onkeydown="return false;" />
					<div id="b_areaCodeTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>MCC描述：</td>
					<td class="finput"><input id="b_mcc" name="mcc" maxLength="6"
						type="text" onkeydown="return false;" />
					<div id="b_mccTip"></div></td>
					<td class="flabel">&nbsp;</td>
					<td class="finput">&nbsp;</td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户类别(预期)：</td>
					<td class="finput"><select id="b_mccGrpImp" name="mccGrpImp"></select>
					<div id="b_mccGrpImpTip"></div></td>
					<td class="flabel"><font color="red">*</font>商户类别(结算)：</td>
					<td class="finput"><select id="b_mccGrp" name="mccGrp"></select>
					<div id="b_mccGrpTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">进件类别备注：</td>
					<td class="finput" colspan="3"><textarea id="b_mccRemark"
							name="mccRemark" rows="4" cols="21"
							style="width: 220px; resize: none;"></textarea>
						<div id="b_mccRemarkTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>营业执照统一社会信用代码码：</td>
					<td class="finput"><input id="b_licenseNo" name="licenseNo"
						maxLength="100" type="text" maxLength="20" />
					<div id="b_licenseNoTip"></div></td>

					<td class="flabel"><font color="red">*</font>营业执照有效期：</td>
					<td class="finput"><input id="b_bizLicnoExpireDate"
						name="bizLicnoExpireDate" maxLength="20" type="text"
						onkeydown="return false;" />
					<div id="b_bizLicnoExpireDateTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>营业执照注册地址：</td>
					<td class="finput"><textarea id="b_licenseAddr"
							name="licenseAddr" rows="4" cols="21"
							style="width: 220px; resize: none;" maxLength="200"></textarea>
						<div id="b_licenseAddrTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户装机地址：</td>
					<td class="finput"><textarea id="b_address" name="address"
							rows="4" cols="21" style="width: 220px; resize: none;"
							maxLength="200"></textarea>
						<div id="b_addressTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">税务登记证号码：</td>
					<td class="finput"><input id="b_taxNo" name="taxNo"
						maxLength="25" type="text" />
					<div id="b_taxNoTip"></div></td>

					<td class="flabel">组织机构代码：</td>
					<td class="finput"><input id="b_certNo" name="certNo"
						maxLength="25" type="text" />
					<div id="b_certNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>法人姓名：</td>
					<td class="finput"><input id="b_personName" name="personName"
						maxLength="100" type="text" />
					<div id="b_personNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>法人证件有效期：</td>
					<td class="finput"><input id="b_personNoExpireDate"
						name="personNoExpireDate" maxLength="20" type="text"
						onkeydown="return false;" />
					<div id="b_personNoExpireDateTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>法人证件类型：</td>
					<td class="finput"><select id="b_personNoType"
						name="personNoType"></select>
					<div id="b_personNoTypeTip"></div></td>

					<td class="flabel"><font color="red">*</font>法人证件号：</td>
					<td class="finput"><input id="b_personNo" name="personNo"
						maxLength="30" type="text" />
					<div id="b_personNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>营业开始时间：</td>
					<td class="finput"><input id="b_busiBgtTime"
						name="busiBgtTime" maxLength="10" type="text" />
					<div id="b_busiBgtTimeTip"></div></td>

					<td class="flabel"><font color="red">*</font>营业结束时间：</td>
					<td class="finput"><input id="b_busiEndTime"
						name="busiEndTime" maxLength="10" type="text" />
					<div id="b_busiEndTimeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">营业面积(平方米)：</td>
					<td class="finput"><input id="b_area" name="area"
						maxLength="10" type="text" />
					<div id="b_areaTip"></div></td>

					<td class="flabel">月租金(元)：</td>
					<td class="finput"><input id="b_monthRent" name="monthRent"
						maxLength="15" type="text" />
					<div id="b_monthRentTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">商户成立日期：</td>
					<td class="finput"><input id="b_merCreatDate"
						onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyyMMdd'})"
						name="merCreatDate" maxLength="100" type="text"
						onkeydown="return false;" />
					<div id="b_merCreatDateTip"></div></td>

					<td class="flabel">收银台数：</td>
					<td class="finput"><input id="b_posNum" name="posNum"
						maxLength="5" type="text" />
					<div id="b_posNumTip"></div></td>
				</tr>

				<tr>
					<!-- <td class="flabel"><font color="red">*</font>对公账户：</td>
				<td class="finput" ><select  id="b_bankAccntId"
					name="bankAccntId"></select>
					<div id="b_bankAccntIdTip"></div></td>
				 -->
					<td class="flabel"><font color="red">*</font>商户账户类型：</td>
					<td class="finput"><select id="b_accntType" name="accntType"></select>
					<div id="b_accntTypeTip"></div></td>

					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户账户名称：</td>
					<td class="finput"><input id="b_accntName" name="accntName"
						maxLength="100" type="text" />
					<div id="b_accntNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户账户号码：</td>
					<td class="finput"><input id="b_accntNo" name="accntNo"
						maxLength="30" type="text" />
					<div id="b_accntNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>开户行总行号：</td>
					<td class="finput"><input id="b_accntBank" name="accntBank"
						maxLength="6" type="text" readonly />
					<div id="b_accntBankTip"></div></td>

					<td class="flabel"><font color="red">*</font>开户行支行号：</td>
					<td class="finput"><input id="b_bankBranchNo"
						name="bankBranchNo" maxLength="20" type="text" />
					<div id="b_bankBranchNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>开户行总行名称：</td>
					<td class="finput"><input id="b_accntBankPrivateDesc"
						name="accntBankPrivateDesc" maxLength="100" type="text" readonly />
					<div id="b_accntBankPrivateDescTip"></div></td>

					<td class="flabel"><font color="red">*</font>开户行支行名称：</td>
					<td class="finput"><input id="b_bankBranchNoDesc"
						name="bankBranchNoDesc" maxLength="100" type="text" readonly />
					<div id="b_bankBranchNoDescTip"></div></td>
				</tr>
				
				<!--wxb  -->
				<tr>
					<td class="flabel">商户结算类型：</td>
					<td class="finput">
					<select id='b_merStatementsType' name='merStatementsType' style="width:60px " >
						<option ></option>
						<option >T1</option>
    					<option >D0</option>
					</select>
					<div id="b_merStatementsTypeTip"></div>
					</td>					
					<td class="flabel">垫资手续费费率(%):</td>
					<td class="finput"><input id="a_merStatementsRate"
						name="merStatementsRate" type="text" xtype="rate4" maxLength="100" />
					<div id="b_merStatementsRateTip"></div></td>
				</tr>
				
				<tr>
					<td class="flabel"><font color="red">*</font>商户开户人证件类型：</td>
					<td class="finput"><select id="b_cardPersonNoType"
						name="cardPersonNoType"></select>
					<div id="b_cardPersonNoTypeTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户开户人证件号：</td>
					<td class="finput"><input id="b_cardPersonNo"
						name="cardPersonNo" maxLength="30" type="text" />
					<div id="b_cardPersonNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户开户人证件号有效期：</td>
					<td class="finput"><input id="b_cardLicnoExpireDate"
						name="cardLicnoExpireDate" maxLength="20" type="text"
						onkeydown="return false;" />
					<div id="b_cardLicnoExpireDateTip"></div></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="flabel">开户银行网点号：</td>
					<td class="finput"><input id="b_accntbankNo"
						name="accntbankNo" maxLength="20" type="text" />
					<div id="b_accntbankNoTip"></div></td>

					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>借记交易费率(%)：</td>
					<td class="finput"><input id="b_debitRate" name="debitRate"
						type="text" xtype="rate4" maxLength="10" />
						<label id="b_debitRateLab"><font color="red">费率倒挂</font></label>
					<div id="b_debitRateTip"></div></td>

					<td class="flabel"><font color="red">*</font>借记封顶费(元)：</td>
					<td class="finput"><input id="b_debitMaxFee"
						name="debitMaxFee" maxLength="15" xtype="money" type="text" />
					<div id="b_debitMaxFeeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>贷记交易费率(%)：</td>
					<td class="finput"><input id="b_creditRate" name="creditRate"
						type="text" xtype="rate4" maxLength="10" />
						<label id="b_creditRateLab"><font color="red">费率倒挂</font></label>
					<div id="b_creditRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				
				<!-- wxb -->
				<tr>									
					<td class="flabel"><font color="red">*</font>微信交易费率(%)：</td>
					<td class="finput"><input id="b_wechatPayRate" name="wechatPayRate"
						type="text" xtype="rate4" maxLength="10" />
						<label id="b_wechatPayRateLab"><font color="red">费率倒挂</font></label>
					<div id="b_wechatPayRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				<tr>									
					<td class="flabel"><font color="red">*</font>外卡交易费率(%)：</td>
					<td class="finput"><input id="b_outCardRate" name="outCardRate"
						type="text" xtype="rate4" maxLength="10" />
					<div id="b_outCardRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				<!-- lxl -->
				<tr>									
					<td class="flabel"><font color="red">*</font>支付宝费率(%)：</td>
					<td class="finput"><input id="b_alipayPayRate" name="alipayPayRate"
						type="text" xtype="rate4" maxLength="10" />
						<label id="b_alipayPayRateLab"><font color="red">费率倒挂</font></label>
					<div id="b_alipayPayRateTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户联系人：</td>
					<td class="finput"><input id="b_merContact" name="merContact"
						maxLength="100" type="text" />
					<div id="b_merContactTip"></div></td>

					<td class="flabel">商户传真：</td>
					<td class="finput"><input id="b_merFax" name="merFax"
						maxLength="50" type="text" />
					<div id="b_merFaxTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户联系电话：</td>
					<td class="finput"><input id="b_merPhone" name="merPhone"
						maxLength="20" type="text" />
					<div id="b_merPhoneTip"></div></td>

					<td class="flabel">非借记卡单笔交易限额(元)：</td>
					<td class="finput"><input id="b_tranLimit" name="tranLimit"
						maxLength="100" type="text" readonly="readonly" />
					<div id="b_tranLimitTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">调单联系人姓名：</td>
					<td class="finput"><input id="b_docTransferName"
						name="docTransferName" type="text" maxLength="20" />
					<div id="b_docTransferNameTip"></div></td>

					<td class="flabel">调单联系人电话：</td>
					<td class="finput"><input id="b_docTransferPhone"
						name="docTransferPhone" type="text" maxLength="20" />
					<div id="b_docTransferPhoneTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">调单联系人邮箱：</td>
					<td class="finput"><input id="b_docTransferEmail"
						name="docTransferEmail" maxLength="50" type="text" />
					<div id="b_docTransferEmailTip"></div></td>

					<td class="flabel"></td>
					<td class="finput"></td>
				</tr>

				<tr>
					<td class="flabel">业务审批人：</td>
					<td class="finput"><input name="admitAcc" maxLength="100"
						readonly="readonly" type="text" /></td>

					<td class="flabel">业务审批意见：</td>
					<td class="finput"><textarea id="admitMemo" name="admitMemo"
							rows="4" cols="21" style="width: 220px; resize: none;"
							readonly="readonly"></textarea></td>

				</tr>
				<tr>
					<td class="flabel">风控审批人：</td>
					<td class="finput"><input class="cdnInput" name="approveAcc"
						maxLength="100" readonly="readonly" type="text" /></td>

					<td class="flabel">风控审批意见：</td>
					<td class="finput"><textarea id="approveMemo"
							name="approveMemo" rows="4" cols="21"
							style="width: 220px; resize: none;" readonly="readonly"></textarea>
					</td>
				</tr>
			</table>
			<input id="form3reset" style="display: none;" type="reset" />
			<div style="display: none;">
				<div class="clearboth border-dash"></div>
				<span class="fontgray14b fl spt10">特色业务</span> <span
					class="borderb borderb-w01"></span>
				<div class="clearboth"></div>
				<div style="overflow: auto;">
					<table id='ipList1' class="ftable" cellpadding="1" cellspacing="1"
						width="100%">
						<tr>
							<th align="center" colspan="2"><div align="center">业务类型</div></th>
							<th align="center"><div align="center">手续费收取方式</div></th>
							<th align="center"><div align="center">手续费率(%)</div></th>
							<th align="center"><div align="center">手续费封顶值(元)</div></th>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" id="b_ipType_1">银联分期付
								<input class="cdnInput" id="b_ipType1" name="ipType1"
								type="hidden" /></td>
							<td><select class="input09" id="b_ipFeeType1"
								name="ipFeeType1" disabled="disabled">
									<option value="01">持卡人和商户共同承担</option>
									<option value="02">向商户收取</option>
									<option value="03">不收取</option>
							</select>
								<div id="a_ipFeeTypeTip"></div></td>
							<td><input class="cdnInput" id="b_ipFeeRate1"
								name="ipFeeRate1" maxLength="100" type="text" />
								<div id="b_ipFeeRate1Tip"></div></td>
							<td><input class="cdnInput" id="b_ipFeeRateMax1"
								name="ipFeeRateMax1" maxLength="100" type="text"
								disabled="disabled" />
								<div id="a_ipFeeRate1Tip"></div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" id="b_ipType">建行分期付
								<input class="cdnInput" id="b_ipType2" name="ipType2"
								type="hidden" /></td>
							<td><select class="input09" id="b_ipFeeType2"
								name="ipFeeType2">
									<option value="02">向商户收取</option>
									<option value="01">持卡人和商户共同承担</option>
									<option value="03">不收取</option>
							</select>
								<div id="b_ipFeeType2Tip"></div></td>
							<td><input class="cdnInput" id="b_ipFeeRate2"
								name="ipFeeRate2" maxLength="100" type="text" />
								<div id="b_ipFeeRate2Tip"></div></td>
							<td></td>
						</tr>
					</table>
				</div>
		</form>
	</div>

	<!-- 特色业务 -->
	<div class="clearboth border-dash"></div>
	<span class="fontgray14b fl spt10">终端信息</span>
	<span class="borderb borderb-w01"></span>
	<div class="clearboth"></div>
	<div id="tidadd1">
		<input type='button' id='addTid1' value='增加终端' /> <input
			type='button' id='delTid1' value='删除终端' />
	</div>
	<div style="overflow: auto;">
		<table id='tidList1' class="ftable" cellpadding="1" cellspacing="1"
			width="100%">
			<thead>
				<tr>
					<th align="center">终端号</th>
					<th align="center">终端类型</th>
					<th align="center">终端品牌</th>
					<th align="center">终端型号</th>
					<th align="center">安装地址</th>
					<th align="center">SIM卡号</th>
					<th align="center">SN号</th>
					<th align="center">是否生成二维码</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	</div>




	<!-- MCC选择弹出窗口 -->
	<div id="mccSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">MCC码</td>
					<td class="qinput"><input type="text" name="mcc"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">描述</td>
					<td class="qinput"><input type="text" name="mccDesc"
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

	<!-- 区域码选择弹出窗口 -->
	<div id="areaCodeSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">地区代码</td>
					<td class="qinput"><input type="text" name="codeNo"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">地区描述</td>
					<td class="qinput"><input type="text" name="codeName"
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
					<td class="qinput"><input type="text" name="channelName"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">服务商代码</td>
					<td class="qinput"><input type="text" name="channelCode"
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

	<!-- 开户行选择弹出窗口 -->
	<div id="branchBankSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">总行号</td>
					<td class="qinput"><input id="branchBankSelect_parentBankNo"
						type="text" name="parentBankNo" comparison="like" qtype="string"
						autocomplete='off' /></td>
					<td class="qlabel">地区代码</td>
					<td class="qinput"><input id="branchBankSelect_cityCode"
						type="text" name="cityCode" comparison="like" qtype="string"
						autocomplete='off' /></td>
					<td class="qlabel">银行行号</td>
					<td class="qinput"><input type="text" name="unionBankNo"
						comparison="like" qtype="string" /></td>
				</tr>
				<tr>
					<td class="qlabel">名称</td>
					<td class="qinput"><input type="text" name="bankName"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">地址</td>
					<td class="qinput"><input type="text" name="address"
						comparison="like" qtype="string" /></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="6" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 商户附件 -->
	<div id="mhtAttachInfoAddDialog" class="detailDialog"
		style="display: none;">
		<form id="mhtAttachInfoAddForm">
			<table id="mhtAttachInfoAddTable" class="ftable" cellpadding="1"
				cellspacing="1" bgcolor="#8392a5" width="100%">
				<tr>
					<td class="flabel">服务商内部商户号：</td>
					<td class="finput"><input id="maia_orgCode" name="orgCode"
						type="text" readonly="readonly" /></td>
					<td class="flabel">商户名称:</td>
					<td class="finput"><input id="maia_merName" name="merName"
						type="text" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="flabel">商户号：</td>
					<td class="finput"><input id="maia_mid" name="mid" type="text"
						readonly="readonly" /></td>
					<td class="flabel">一级服务商号</td>
					<td class="finput"><input id="maia_firstTcn" name="firstTcn"
						type="text" readonly="readonly" /></td>
				</tr>
			</table>
		</form>
		<br />
		<table id="mhtAttachInfoAddTable" class="ftable" cellpadding="1"
			cellspacing="1" bgcolor="#8392a5" width="100%">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th width="80%">名称</th>
					<th>上传</th>
					<th>查看</th>
				</tr>
			</thead>
			<tbody id="mhtAttachInfoAddTbody">
			</tbody>
		</table>
	</div>
	<!-- 文件选择下载框 -->
	<div id="uploadAttachDialog" style="display: none;">
		<form id="uploadAttachForm" target="fileFrame"
			enctype="multipart/form-data" method="post" role="form">
			<input id="attachfile" type="file" name="uploadFile"
				class="form-control" style="border: none; font-size: 12px;"
				accept="" /> <input id="uploadAttachForm_refNo" type="hidden"
				name="refNo" /> <input id="uploadAttachForm_uploadFileName"
				type="hidden" name="uploadFileName" />
		</form>
	</div>

	<!-- JS填充用模版 -->
	<div style="display: none;">
		<textarea id="athTrTpl">
			<tr>
			<td><input type="checkbox" readonly="readonly" class="athChecked"
						id="{athType}_checked" onclick="return false;" /></td>
			<td>{athTypeName} <span class="txt-red">{athNullable}</span><input
						type="hidden" id="ath_{athType}" athType="{athType}"
						class="athInMedSeq" /></td>
			<td><input type="button" class="bt upload-in-ath-btn"
						fileId="ath_{athType}" athType="{athType}"
						uploadMime="{athFileType}" value="上传" /></td>
			<td><input type="button" class="bt preview-in-ath-btn"
						fileId="ath_{athType}" athType="{athType}" value="查看" /></td>
			</tr>
		</textarea>
	<textarea id="tidTrTpl">
		<tr id="{cid}-row">
			<td><input type="checkbox" name="tidChecked" /></td>
			<td><select id="{cid}-tidType" name="tidType" rowid="{cid}-row"></select></td>
			<td><input type="text" name="tidBrand" /></td>
			<td><input type="text" name="tidModel" /></td>
			<td><input type="text" name="address" /></td>
			<td><input type="text" name="reserved1" class="tid-sim" /></td>
			<td><input type="text" name="snCode" /></td>
			<td><input id="{cid}-doqrcode" class="qrCheck" type="checkbox" name="reserved2" checked = "checked" value="1" /></td>    <!-- wxb -->
		</tr>
		
	</textarea>
	<textarea id="tidValTrTpl">
			<tr id="{cid}-row">
			<td>{tid}</td>
			<td><select id="{cid}-tidType" name="tidType" rowid="{cid}-row"
						disabled="disabled"></select></td>
			<td>{tidBrand}</td>
			<td>{tidModel}</td>
			<td>{address}</td>
			<td>{reserved1}</td>
			<td>{snCode}</td>
			<td>{reserved2}</td> 
			</tr>
	</textarea>
</div>


<script type="text/javascript">		
// <!--
var urls = {
athDef: 'loadMhtAttachDef.action',	
athList: 'loadMhtAttachInfoAdd.action',
saveAth: 'saveMhtAttachInfoAdd.action',
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
var getFileName = function(o){
	var pos=o.lastIndexOf("\\");
	return o.substring(pos+1);  
}
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
	$('.upload-in-ath-btn').click(function() {
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
	
	$('#attachfile').change(function() { 
		var file = $(this).val();
		$('#uploadAttachForm_uploadFileName').val(getFileName(file));
		$("#uploadAttachForm")[0].submit();
		$('#uploadAttachDialog').dialog('close');
	});
};
var uploadAthBtn = function(record,id) {
	if (!record) { alert("请选择一条记录"); return;	}
	__refNo = record.orgCode;
	$('#uploadAttachForm_refNo').val(__refNo);
	$('#mhtAttachInfoAddForm input[name=orgCode]').val(record.orgCode);
	$('#mhtAttachInfoAddForm input[name=merName]').val(record.merName);
	$('#mhtAttachInfoAddForm input[name=mid]').val(record.mid);
	$('#mhtAttachInfoAddForm input[name=firstTcn]').val(record.firstTcn);
	loadAthList();
	$('#mhtAttachInfoAddDialog').dialog('open');
};

$(function(){
$('#uploadAttachDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 400, height: 200, title:'选择附件'});	
$('#mhtAttachInfoAddDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 500
, title:'上传附件', buttons:{
	'保存':function() {
		
		var athTypeList = new Array();
		$('.athInMedSeq').each(function(_i,_n){
			athTypeList.push({'athType':$(_n).attr('athType'), 'inMedSeq':$(_n).val()});
		});
		var mhtAdd = {orgCode: $('#maia_orgCode').val(), firstTcn: $('#maia_firstTcn').val() };
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

</script>

<script>
/* 
console.log($('#doqrcode').val());

$("#doqrcode").change(function(){
	alert("进来");
	if($('#doqrcode').prop("checked")) {
		alert(1);
	}else{
		alert(0);
	}
}); */
</script>
	<div style="display: none">
		<iframe id="fileFrame" name="fileFrame" onload="loadFile()"></iframe>
	</div>
</body>
</html>
