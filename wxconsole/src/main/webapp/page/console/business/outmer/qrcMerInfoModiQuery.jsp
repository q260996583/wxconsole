<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>小微商户信息修改</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript"
	src="pagejs/console/business/outmer/qrcMerInfoModi.js"></script>
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
					<td class="qlabel">机构号</td>
					<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name=instId size=20 /></td>
					<td class="qlabel">机构商户号</td>
					<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name=instMerId size=20 /></td>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value="" comparison="like" qtype="string" name=merName size=20 /></td>
				</tr>
				<!-- <tr>
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
				 -->
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
					<td class="flabel" width="140px"><font color="red">*</font>机构号：</td>
					<td class="finput" width="310px"><input id="a_instId"
						name="instId" maxLength="100" type="text"  />
						<div id="a_instIdTip"></div></td>
						
					<td class="flabel" width="140px"><font color="red">*</font>机构商户号:</td>
					<td class="finput" width="310px"><input id="a_instMerId"
						name="instMerId" maxLength="100" type="text" />
						<div id="a_instMerIdTip"></div></td>
				</tr>

				<tr>
					<td class="flabel"><font color="red">*</font>机构商户名称：</td>
					<td class="finput"><input id="a_merName" name="merName"
						maxLength="100" type="text" />
						<div id="a_merNameTip"></div></td>

					<td class="flabel">商户类型：</td>
					<td class="finput"><input id="a_merShortName" name="merShortName"
						maxLength="100" type="text" />
						<div id="a_merShortNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">商户手机号：</td>
					<td class="finput"><input id="a_merPhoneNo" name="merPhoneNo"
						maxLength="100" type="text" />
					<div id="a_merPhoneNoTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户地址信息：</td>
					<td class="finput"><input id="a_merAddress" name="merAddress"
						maxLength="6" type="text" />
					<div id="a_merAddressTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户银行卡信息：</td>
					<td class="finput"><input id="a_merCardInfo" name="merCardInfo" maxLength="6"
						type="text"  />
					<div id="a_merCardInfoTip"></div></td>
					
					<td class="flabel">&nbsp;</td>
					<td class="finput">&nbsp;</td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户银行卡名字：</td>
					<td class="finput"><input id="a_merCardName" name="merCardName"></input>
					<div id="a_merCardNameTip"></div></td>
					
					<td class="flabel"><font color="red">*</font>商户银行联行信息：</td>
					<td class="finput"><input id="a_merCardBank" name="merCardBank"></input>
					<div id="a_merCardBankTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">商户银行联行名字：</td>
					<td class="finput" colspan="3"><input id="a_merCardBankName"
							name="merCardBankName" ></input>
						<div id="a_merCardBankNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>证件类型：</td>
					<td class="finput"><input id="a_merIdType" name="merIdType"
						maxLength="20" type="text" />
					<div id="a_merIdTypeTip"></div></td>

					<td class="flabel"><font color="red">*</font>证件号：</td>
					<td class="finput"><input id="a_merIdNo"
						name="merIdNo" maxLength="15" type="text"/>
						<div id="a_merIdNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>邀请码：</td>
					<td class="finput"><input id="a_inviteCode"
							name="inviteCode" rows="5" cols="15" maxLength="200"></input>
						<div id="a_inviteCodeTip"></div></td>

					<td class="flabel"><font color="red">*</font>联系人类型：</td>
					<td class="finput"><input id="a_contactType" name="contactType"
							rows="5" cols="15" maxLength="200"></input>
						<div id="a_contactTypeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">联系人姓名：</td>
					<td class="finput"><input id="a_contactName" name="contactName"
						maxLength="100" type="text" />
						<div id="a_contactNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>省：</td>
					<td class="finput"><input id="a_provinceCode" name="provinceCode"
						maxLength="100" type="text" />
						<div id="a_provinceCodeTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>市：</td>
					<td class="finput"><input id="a_cityCode" name="cityCode"
						maxLength="100" type="text" />
						<div id="a_cityCodeTip"></div></td>

					<td class="flabel"><font color="red">*</font>县/区：</td>
					<td class="finput"><input id="a_areaCode"
						name="areaCode" maxLength="100" type="text"/>
						<div id="a_areaCodeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>微信费率(%)：</td>
					<td class="finput"><input id="a_wechatPayRate"
						name="wechatPayRate"></input>
						<div id="a_wechatPayRateTip"></div></td>

					<td class="flabel"><font color="red">*</font>支付宝费率(%)：</td>
					<td class="finput"><input id="a_alipayPayRate" name="alipayPayRate"
						maxLength="100" type="text" />
						<div id="a_alipayPayRateTip"></div></td>
				</tr>
			</table>
		</form>
	</div>
	
	</div>


	<div id="editMer" style="display: none;">
		<form id="form3">
			<input type="hidden" name="feeRate" /> <input type="hidden"
				name="topValue" /> <input type="hidden" name="creditMaxFee" />
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<tr>
					<td class="flabel" width="140px"><font color="red">*</font>机构号：</td>
					<td class="finput" width="310px"><input disabled id="b_instId"
						name="instId" maxLength="100" type="text"  />
						<div id="b_instIdTip" ></div></td>
						
					<td class="flabel" width="140px"><font color="red">*</font>机构商户号:</td>
					<td class="finput" width="310px"><input disabled id="b_instMerId"
						name="instMerId" maxLength="100" type="text" />
						<div id="b_instMerIdTip" ></div></td>
				</tr>

				<tr>
					<td class="flabel"><font color="red">*</font>机构商户名称：</td>
					<td class="finput"><input id="b_merName" name="merName"
						maxLength="100" type="text" />
						<div id="b_merNameTip"></div></td>

					<td class="flabel">商户类型：</td>
					<td class="finput"><input id="b_merShortName" name="merShortName"
						maxLength="100" type="text" />
						<div id="b_merShortNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">商户手机号：</td>
					<td class="finput"><input id="b_merPhoneNo" name="merPhoneNo"
						maxLength="100" type="text" />
					<div id="b_merPhoneNoTip"></div></td>

					<td class="flabel"><font color="red">*</font>商户地址信息：</td>
					<td class="finput"><input id="b_merAddress" name="merAddress"
						maxLength="6" type="text" onkeydown="return false;" />
					<div id="b_merAddressTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户银行卡信息：</td>
					<td class="finput"><input id="b_merCardInfo" name="merCardInfo" maxLength="6"
						type="text" onkeydown="return false;" />
					<div id="b_merCardInfoTip"></div></td>
					
					<td class="flabel">商户银行联行名字：</td>
					<td class="finput" colspan="3"><input id="b_merCardBankName"
							name="merCardBankName" rows="5" cols="15"></input>
						<div id="b_merCardBankNameTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>商户银行卡名字：</td>
					<td class="finput"><input id="b_merCardName" name="merCardName"></input>
					<div id="b_merCardNameTip"></div></td>
					
					<td class="flabel"><font color="red">*</font>商户银行联行信息：</td>
					<td class="finput"><input id="b_merCardBank" name="merCardBank"></input>
					<div id="b_merCardBankTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>证件类型：</td>
					<td class="finput"><input id="b_merIdType" name="merIdType"
						maxLength="20" type="text" />
					<div id="b_merIdTypeTip"></div></td>

					<td class="flabel"><font color="red">*</font>证件号：</td>
					<td class="finput"><input id="b_merIdNo"
						name="merIdNo" maxLength="15" type="text"
						onkeydown="return false;" />
						<div id="b_merIdNoTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>邀请码：</td>
					<td class="finput"><input id="b_inviteCode"
							name="inviteCode" rows="5" cols="15"
							maxLength="200"></input>
						<div id="b_inviteCodeTip"></div></td>

					<td class="flabel"><font color="red">*</font>联系人类型：</td>
					<td class="finput"><input id="b_contactType" name="contactType"
							rows="5" cols="15" 
							maxLength="200"></input>
						<div id="b_contactTypeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">联系人姓名：</td>
					<td class="finput"><input id="b_contactName" name="contactName"
						maxLength="100" type="text" />
						<div id="b_contactNameTip"></div></td>

					<td class="flabel"><font color="red">*</font>省：</td>
					<td class="finput"><input id="b_provinceCode" name="provinceCode"
						maxLength="100" type="text" />
						<div id="b_provinceCodeTip"></div></td>

				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>市：</td>
					<td class="finput"><input id="b_cityCode" name="cityCode"
						maxLength="100" type="text" />
						<div id="b_cityCodeTip"></div></td>

					<td class="flabel"><font color="red">*</font>县/区：</td>
					<td class="finput"><input id="b_areaCode"
						name="areaCode" maxLength="100" type="text"
						onkeydown="return false;" />
						<div id="b_areaCodeTip"></div></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>微信费率(%)：</td>
					<td class="finput"><input id="b_wechatPayRate"
						name="wechatPayRate"></input>
						<div id="b_wechatPayRateTip"></div></td>

					<td class="flabel"><font color="red">*</font>支付宝费率(%)：</td>
					<td class="finput"><input id="b_alipayPayRate" name="alipayPayRate"
						maxLength="100" type="text" />
						<div id="b_alipayPayRateTip"></div></td>
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
					<td class="flabel">商户号：</td>
					<td class="finput"><input id="instMerId" name="instMerId" type="text"
						readonly="readonly" /></td>
					<td class="flabel">商户名称:</td>
					<td class="finput"><input id="maia_merName" name="merName"
						type="text" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="flabel">进件机构商户号：</td>
					<td class="finput"><input id="addInstMerId" name="addInstMerId"
						type="text" readonly="readonly" />
						<td></td>
						<td></td>
					<!-- <td class="flabel">一级服务商号</td>
					<td class="finput"><input id="maia_firstTcn" name="firstTcn"
						type="text" readonly="readonly" /></td> -->
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
athDef: 'loadQrcMhtAttachDef.action',	
athList: 'loadQrcMhtAttachInfoAdd.action',
saveAth: 'saveQrcMhtAttachInfoAdd.action',
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
	__refNo = record.addInstMerId;
	$('#uploadAttachForm_refNo').val(__refNo);
	$('#mhtAttachInfoAddForm input[name=addInstMerId]').val(record.addInstMerId);
	$('#mhtAttachInfoAddForm input[name=merName]').val(record.merName);
	$('#mhtAttachInfoAddForm input[name=instMerId]').val(record.instMerId);
	/* $('#mhtAttachInfoAddForm input[name=firstTcn]').val(record.firstTcn); */
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
		var mhtAdd = {addInstMerId: $('#addInstMerId').val() , instMerId: $('#instMerId').val()};
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
