<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务商信息维护</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style>
<!--
.fcontent input,.fcontent select,.fcontent textarea{width: 200px; padding:0;}
.ftable {position: relative;}

.rate-table { border-top: 1px solid #8db2e3; border-left: 1px solid #8db2e3; border-right: 1px solid #8db2e3;}
.rate-table > thead > tr { background-color: #dfe8f6; border-top: 1px solid #8db2e3;}
.rate-table > tbody { border-bottom: 1px solid #8db2e3; }
.rate-table > tbody > tr:hover {background-color: #d5effc;}
.rate-table > thead > tr > th{ border-right: 1px solid #8db2e3; border-bottom: 1px solid #8db2e3; height: 24px; padding: 5px 0 0; white-space: nowrap;}
.rate-table > tbody > tr > td{ border-bottom: 1px solid #8db2e3; border-right: 1px dotted #8db2e3; text-align: center; }

.rate-input {width: 40px; padding: 0 2px;}
.text-right {text-align: right;}
.text-center {text-align: center;}
a.add-rate-data,a.add-rate-data:hover,a.rate-mcc-btn,a.rate-mcc-btn:hover{text-decoration: none;}
a.rate-mcc-btn,a.add-rate-data{ display: inline-block; width: 22px; font-size: 18px; margin: 0 auto; padding: 2px 4px; border-radius: 3px; text-align: center; font-size: 12px;
	background-color: #f6f6f6; border: 1px solid #dddddd; border-radius: 3px; color: #0073ea; }
a.rate-mcc-btn:hover,a.add-rate-data:hover{ background-color: #0073ea; border: 1px solid #0073ea; color: #ffffff;}

.opr-line{padding: 0.2em 0.5em; }
.opr-line > input.opr-btn{height: 24px; padding-top: 0.2em!important; font-size: 12px!important; line-height: 12px!important; max-width: 100px;}
.opr-line input { height: 20px; max-width: 60px;} 

.rate-input:read-only{border: 0;}
.rate-input:-moz-read-only{border: 0;}
-->
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>服务商编码</label><input  id="q_channelCode" name="channelCode" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>服务商名称</label><input  id="q_channelName" name="channelName" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><label>状态</label><select id="q_status" name="status" qtype="string" comparison="like" ctype="CHANNEL_STATUS" multiple="multiple" ></select></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>
<!-- 新增 -->
<div id="addDiv" style="display: none;">
<div id="addtabs" style="border: none;">
	<ul>
   	<li id="channelInfo" ><a href="#addtabs-1">基本信息</a></li>
   	<li id="rateInfo"><a href="#addtabs-2">分润规则</a></li>
 	</ul>
 	<div id="addtabs-1">
		<form id="addForm" action="#">
			<input type="hidden" name="profitRate" value="0" id="a_profitRate"/>
			<input type="hidden" name="brandFeeRate" value="0" id="a_brandFeeRate"/>
		<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
		<tr>
			<td class="flabel"><font color="red">*</font>服务商编码</td>
			<td class="fcontent">
				<input class="cdnInput" id="a_channelCode_dummy" maxLength="3" type="text" />
				<input class="cdnInput" id="a_channelCode" name="channelCode" maxLength="15" type="text" readonly="readonly" />
				<div id="a_channelCodeTip"/>
			</td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>服务商名称</td>
			<td class="fcontent"><input class="cdnInput" id="a_channelName" name="channelName" maxLength="100" type="text" /><div id="a_channelNameTip"/></td>
		</tr>
		<tr>
			<td class="flabel">联系人姓名</td>
			<td class="fcontent"><input class="cdnInput" id="a_contactName" name="contactName" maxLength="30" type="text" /><div id="a_contactNameTip"/></td>
		</tr>
		<tr>
			<td class="flabel">联系人电话</td>
			<td class="fcontent"><input class="cdnInput" id="a_contactPhone" name="contactPhone" maxLength="30" type="text" /><div id="a_contactPhoneTip"/></td>
		</tr>
		<tr>
			<td class="flabel">备注</td>
			<td class="fcontent">
				<textarea class="cdnInput" id="a_remark" name="remark" maxLength="200" ></textarea>
				<div id="a_remarkTip"/>
			</td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>是否下载商户进件</td>
			<td class="fcontent">
				<select class="cdnInput" id="a_downFlag" name="downFlag" ctype="CHN_DOWN_FLAG" ></select>
				<div id="a_downFlagTip" />
			</td>
		</tr>
		</table>
		<!-- 账户信息 -->
		<h3>账户信息</h3>
		<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
		<tr>
			<td class="flabel"><font color="red">*</font>对公账户</td>
			<td class="fcontent">
				<select class="cdnInput" id="a_bankAccntId" name="bankAccntId" ></select>
				<div id="a_bankAccntIdTip"/>
			</td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>开户行号</td>
			<td class="fcontent"><input class="cdnInput" id="a_accntBankPrivate" name="accntBankPrivate" maxLength="100" type="text" /><div id="a_accntBankPrivateTip"/></td>
		</tr>
		<tr>
			<td class="flabel">开户行名称</td>
			<td class="fcontent"><input class="cdnInput" id="a_accntBankPrivateDesc" name="accntBankPrivateDesc" readonly="readonly" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>账户类型</td>
			<td class="fcontent">
				<select class="cdnInput" id="a_accntType" name="accntType" ctype="ACCNT_TYPE" ></select>
				<div id="a_accntTypeTip"/>
			</td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>账号</td>
			<td class="fcontent"><input class="cdnInput" id="a_accntNoPrivate" name="accntNoPrivate" maxLength="30" type="text" /><div id="a_accntNoPrivateTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>账户名称</td>
			<td class="fcontent"><input class="cdnInput" id="a_accntNamePrivate" name="accntNamePrivate" maxLength="100" type="text" /><div id="a_accntNamePrivateTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>开户人身份证号</td>
			<td class="fcontent"><input class="cdnInput" id="a_cardPersonNo" name="cardPersonNo" maxLength="100" type="text" /><div id="a_cardPersonNoTip"/></td>
		</tr>
		</table>
		<!-- 用户信息 -->
		<h3>用户信息</h3>
		<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
		<tr>
			<td class="flabel"><font color="red">*</font>用户姓名</td>
			<td class="fcontent"><input class="cdnInput" id="a_username" name="username" maxLength="50" type="text" /><div id="a_usernameTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>登陆ID</td>
			<td class="fcontent"><input class="cdnInput" id="a_loginid" name="loginid" maxLength="20" type="text" /><div id="a_loginidTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>登陆密码</td>
			<td class="fcontent"><input class="cdnInput" id="a_loginpasswd" name="loginpasswd" maxLength="64" type="password" /><div id="a_loginpasswdTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>确认密码</td>
			<td class="fcontent"><input class="cdnInput" id="a_loginpasswdRetype" name="loginpasswdRetype" maxLength="64" type="password" /><div id="a_loginpasswdRetypeTip"/></td>
		</tr>
		</table>
		<!-- 其他信息 -->
		<h3>其他信息</h3>
		<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
		<tr>
			<td class="flabel">保证金数额</td>
			<td class="fcontent"><input class="cdnInput" id="a_bailAmt" name="bailAmt" maxLength="50" type="text" xtype="money" /><div id="a_bailAmtTip"/></td>
		</tr>
		<tr>
			<td class="flabel">合同起始时间</td>
			<td class="fcontent"><input class="cdnInput" id="a_conBgnTime" xtype="datetime" name="conBgnTime" maxLength="50" type="text" /><div id="a_conBgnTimeTip"/></td>
		</tr>
		<tr>
			<td class="flabel">合同结束时间</td>
			<td class="fcontent"><input class="cdnInput" id="a_conEndTime" xtype="datetime" name="conEndTime" maxLength="50" type="password" /><div id="a_conEndTimeTip"/></td>
		</tr>
		</table>
		</form>
 	</div>
 	<div id="addtabs-2">
 		<div class="opr-line">
 			<input type="button" class="bt opr-btn" id="a_import" value="导入" />
 			<input type="button" class="bt opr-btn" id="a_export" value="导出" />
 			<input type="button" class="bt opr-btn" id="a_global_ratio_btn" value="设置分润比例" />
 			<input id="a_global_ratio_input" type="text" value="0" />%
 		</div>
 		<table id="addRateTable" class="rate-table" cellpadding="0" cellspacing="0" width="100%" >
 		</table>
 	</div>
</div>
</div>
<!-- 修改分润规则 -->
<div id="updRateDiv" style="display: none;">
	<div id="updRateDiv-channelInfo">
		<form id="updRateForm" action="#">
			<input type="hidden" name="version" />
			<input type="hidden" name="recVersion" />
			<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
				<tr>
					<td class="flabel">服务商编码：</td>
					<td class="fcontent"><input class="cdnInput" id="ur_channelCode" name="channelCode" readonly="readonly" type="text" /></td>
					<td class="flabel">服务商名称：</td>
					<td class="fcontent"><input class="cdnInput" id="ur_channelName" name="channelName" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">修改记录号：</td>
					<td class="fcontent"><input class="cdnInput" id="ur_recNo" name="recNo" readonly="readonly" type="text" /></td>
					<td class="flabel">记录状态：</td>
					<td class="fcontent"><input class="cdnInput" id="ur_recStatus" name="recStatusDesc" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">审核人：</td>
					<td class="fcontent"><input class="cdnInput" id="ur_recAudAcct" name="recAudAcct" readonly="readonly" type="text" /></td>
					<td class="flabel">审核时间：</td>
					<td class="fcontent"><input class="cdnInput" id="ur_recAudTime" name="recAudTime" readonly="readonly" type="text" xtype="datetime" /></td>
				</tr>
				<tr>
					<td class="flabel">审核意见：</td>
					<td class="fcontent" colspan="3"><textarea class="cdnInput" rows="1" id="ur_recAudRemark" name="recAudRemark" readonly="readonly" ></textarea></td>
				</tr> 
			</table>
			<br/>
		</form>
	</div>
	<div class="opr-line">
		<input type="button" class="bt opr-btn" id="u_import" value="导入" />
		<input type="button" class="bt opr-btn" id="u_export" value="导出" />
		<input type="button" class="bt opr-btn" id="u_global_ratio_btn" value="设置分润比例" />
		<input id="u_global_ratio_input" type="text" value="0" />%
	</div>
 	<table id="updRateTable" class="rate-table" cellpadding="0" cellspacing="0" width="100%" >
 	</table>
</div>

<!-- 查看分润规则 -->
<div id="vwRateDiv" style="display: none;">
	<div id="vwRateDiv-channelInfo">
		<form id="vwRateForm" action="#">
			<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
				<tr>
					<td class="flabel">服务商编码：</td>
					<td class="fcontent"><input class="cdnInput" id="vr_channelCode" name="channelCode" readonly="readonly" type="text" /></td>
					<td class="flabel">服务商名称：</td>
					<td class="fcontent"><input class="cdnInput" id="vr_channelName" name="channelName" readonly="readonly" type="text" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="opr-line">
		<input type="button" class="bt opr-btn" id="v_export" value="导出" />
	</div>
 	<table id="vwRateTable" class="rate-table" cellpadding="0" cellspacing="0" width="100%" >
 	</table>
 	<br />
 	<br />
 	<table id="vwProdRateTable" class="rate-table" cellpadding="0" cellspacing="0" width="50%" >
 	</table>
</div>

<!-- 配置产品 lixl -->
<div id="addProdToChl" style="display: none;">
	<div id="addProdToChl-channelInfo">
		<form id="addProdToChlForm" action="#">
			<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
				<tr>
					<td class="flabel">服务商编码：</td>
					<td class="fcontent"><input class="cdnInput" id="prod_channelCode" name="channelCode" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">服务商名称：</td>
					<td class="fcontent"><input class="cdnInput" id="prod_channelName" name="channelName" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel"><font color="red">*</font>产品名称：</td>
					<td class="fcontent">
						<select id="prod_productId" name="productId" style="width:100px">
							<option></option>
							<option value="0000001">服务商D0结算产品</option>
						</select>
					</td>
				</tr>
			</table>
			<div prodoption="prod" id="chlD0prod" style="display: none;">
			<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
					<tr>
						<td class="flabel"><font color="red">*</font>状态：</td>
						<td>
							<input type="radio" name="prodStatus" value="0">开启
							<input type="radio" name="prodStatus" value="99">关闭
							<input type="radio" name="prodStatus" value="1">暂停
						</td>
					</tr>
					<tr>
						<td class="flabel">保证金缴纳：</td>
						<td>
							<label><input name="guaranteeAmtFlag" type="radio" value="1" />是</label> 
							<label><input name="guaranteeAmtFlag" type="radio" value="2" />否</label> 
						</td>
					</tr>
					<!-- <tr>
						<td class="flabel"><font color="red">*</font>分润底价：</td>
						<td class="fcontent"><input class="cdnInput" id="d0_fee" name="d0fee" type="text" xtype="rate4"/></td>
					</tr>
					<tr>
						<td class="flabel"><font color="red">*</font>分润比例：</td>
						<td class="fcontent"><input class="cdnInput" id="chnl_ratio" name="chnlRatio" type="text"/></td>
					</tr> -->
					<tr>
						<td class="flabel">关闭原因：</td>
						<td class="fcontent"><input class="cdnInput" id="reason" name="reason" type="text" maxlength="100"/></td>
					</tr>
			</table>
			</div>
			<br/>
		</form>
	</div>
</div>
<!-- 查看产品 lixl -->
<div id="viewProdToChl" style="display: none;">
	<div id="viewProdToChl-channelInfo">
		<form id="viewProdToChlForm" action="#">
			<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
				<tr>
					<td class="flabel">服务商编码：</td>
					<td class="fcontent"><input class="cdnInput" id="prod_channelCode" name="channelCode" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">服务商名称：</td>
					<td class="fcontent"><input class="cdnInput" id="prod_channelName" name="channelName" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">产品名称：</td>
					<td class="fcontent">
						<input class="cdnInput" name="productName" readonly="readonly" type="text" />
					</td>
				</tr>
				<tr>
					<td class="flabel">状态：</td>
					<td>
						<input class="cdnInput" name="prodStatusDesc" readonly="readonly" type="text" />
					</td>
				</tr>
					<tr>
						<td class="flabel">保证金缴纳：</td>
						<td>
							<input class="cdnInput" name="guaFlag" readonly="readonly" type="text" />
						</td>
					</tr>
					<tr>
						<td class="flabel">关闭原因：</td>
						<td class="fcontent">
							<input class="cdnInput" name="reason" readonly="readonly" type="text" />
						</td>
					</tr>
					<!-- <tr>
						<td class="flabel">分润底价：</td>
						<td class="fcontent">
						<input class="cdnInput" name="d0feeDesc" readonly="readonly" type="text" /></td>
					</tr>
					<tr>
						<td class="flabel">分润比例：</td>
						<td class="fcontent">
							<input class="cdnInput" name="chnlRatioDesc" readonly="readonly" type="text" />
						</td>
					</tr> -->
					<tr>
						<td class="flabel">最后一次开启时间：</td>
						<td class="fcontent">
							<input class="cdnInput" name="lastOpenDate" readonly="readonly" type="text" />
						</td>
					</tr>
					<tr>
						<td class="flabel">最后一次关闭时间：</td>
						<td class="fcontent">
							<input class="cdnInput" name="lastCloseDate" readonly="readonly" type="text" />
						</td>
					</tr>
			</table>
			<br/>
		</form>
	</div>
</div>
<!-- 修改 -->
<div id="updDiv" style="display: none;">
<form id="updForm" action="#">
<input type="hidden" name="version" id="u_version" />
<input type="hidden" name="profitRate" value="0" id="u_profitRate" />
<input type="hidden" name="brandFeeRate" value="0" id="u_brandFeeRate"/>
<h3>服务商基本信息</h3>
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
<tr>
	<td class="flabel"><font color="red">*</font>服务商编码</td>
	<td class="fcontent"><input class="cdnInput" id="u_channelCode" name="channelCode" readonly="readonly" type="text" /><div id="u_channelCodeTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>服务商名称</td>
	<td class="fcontent"><input class="cdnInput" id="u_channelName" name="channelName" maxLength="100" type="text" /><div id="u_channelNameTip"/></td>
</tr>
<tr>
	<td class="flabel">联系人姓名</td>
	<td class="fcontent"><input class="cdnInput" id="u_contactName" name="contactName" maxLength="30" type="text" /><div id="u_contactNameTip"/></td>
</tr>
<tr>
	<td class="flabel">联系人电话</td>
	<td class="fcontent"><input class="cdnInput" id="u_contactPhone" name="contactPhone" maxLength="30" type="text" /><div id="u_contactPhoneTip"/></td>
</tr>
<tr>
	<td class="flabel">备注</td>
	<td class="fcontent"><textarea class="cdnInput" id="u_remark" name="remark" maxLength="200" ></textarea><div id="u_remarkTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>是否下载商户进件</td>
	<td class="fcontent">
		<select class="cdnInput" id="u_downFlag" name="downFlag" ctype="CHN_DOWN_FLAG" ></select>
		<div id="u_downFlagTip"/>
	</td>
</tr>
<tr>
	<td class="flabel">状态</td>
	<td class="fcontent"><input class="cdnInput" id="u_status" name="statusDesc" maxLength="2" type="text" readonly="readonly" /><div id="u_statusTip"/></td>
</tr>
<tr>
	<td class="flabel">创建时间</td>
	<td class="fcontent"><input class="cdnInput" id="u_oprTime" name="oprTime" maxLength="14" type="text" readonly="readonly" xtype="time" /><div id="u_oprTimeTip"/></td>
</tr>
<tr>
	<td class="flabel">创建人</td>
	<td class="fcontent"><input class="cdnInput" id="u_opAcc" name="oprAcc" maxLength="16" type="text" readonly="readonly" /><div id="u_opAccTip"/></td>
</tr>
<tr>
	<td class="flabel">最后修改时间</td>
	<td class="fcontent"><input class="cdnInput" id="u_lastUptTime" name="lastUptTime" maxLength="14" type="text" readonly="readonly" xtype="time"  /><div id="u_lastUptTimeTip"/></td>
</tr>
<tr>
	<td class="flabel">最后修改人</td>
	<td class="fcontent"><input class="cdnInput" id="u_lastUptAcc" name="lastUptAcc" maxLength="16" type="text" readonly="readonly" /><div id="u_lastUptAccTip"/></td>
</tr>
</table>
<h3>账户信息</h3>
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
<tr>
	<td class="flabel"><font color="red">*</font>对公账户</td>
	<td class="fcontent">
		<select class="cdnInput" id="u_bankAccntId" name="bankAccntId" ></select>
		<div id="u_bankAccntIdTip"/>
	</td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>开户行号</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntBankPrivate" name="accntBankPrivate" maxLength="100" type="text" /><div id="u_accntBankPrivateTip"/></td>
</tr>
<tr>
	<td class="flabel">开户行名称</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntBankPrivateDesc" name="accntBankPrivateDesc" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>账户类型</td>
	<td class="fcontent">
		<select class="cdnInput" id="u_accntType" name="accntType" ctype="ACCNT_TYPE" ></select>
		<div id="u_accntTypeTip"/>
	</td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>账号</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntNoPrivate" name="accntNoPrivate" maxLength="30" type="text" /><div id="u_accntNoPrivateTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>账户名称</td>
	<td class="fcontent"><input class="cdnInput" id="u_accntNamePrivate" name="accntNamePrivate" maxLength="100" type="text" /><div id="u_accntNamePrivateTip"/></td>
</tr>
<tr>                           
	<td class="flabel"><font color="red">*</font>开户人身份证号</td>
	<td class="fcontent"><input class="cdnInput" id="u_cardPersonNo" name="cardPersonNo" maxLength="100" type="text" /><div id="u_cardPersonNoTip"/></td>
</tr>
</table>
<!-- 其他信息 -->
<h3>其他信息</h3>
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
<tr>
	<td class="flabel">合同起始时间</td>
	<td class="fcontent"><input class="cdnInput" id="u_conBgnTime" xtype="datetime" name="conBgnTime" maxLength="50" type="text" /><div id="a_conBgnTimeTip"/></td>
</tr>
<tr>
	<td class="flabel">合同结束时间</td>
	<td class="fcontent"><input class="cdnInput" id="u_conEndTime" xtype="datetime" name="conEndTime" maxLength="50" type="password" /><div id="a_conEndTimeTip"/></td>
</tr>
<tr>
    <td class="flabel">邀请码</td>
    <td class="fcontent"><input class="cdnInput" id="u_inviteCode" name="inviteCode" maxLength="16" type="text" readonly="readonly" /><input type="button" class="bt"  id="previewBtn"  value="查看二维码"></td>
</tr>
</table>
</form>
</div>



<!-- 修改 -->
<div id="updPwdDiv" style="display: none;">
<form id="updPwdForm" action="#">
<input type="hidden" name="userid" id="up_userid" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
<tr>
	<td class="flabel"><font color="red">*</font>服务商编码</td>
	<td class="fcontent"><input class="cdnInput" id="up_channelCode" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>服务商名称</td>
	<td class="fcontent"><input class="cdnInput" id="up_channelName" readonly="readonly" type="text" /></td>
</tr>
</table>
<!-- 用户信息 -->
<h3>用户信息</h3>
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
<tr>
	<td class="flabel">用户姓名</td>
	<td class="fcontent"><input class="cdnInput" id="up_username" name="username" maxLength="50" type="text" readonly="readonly"/></td>
</tr>
<tr>
	<td class="flabel">登陆ID</td>
	<td class="fcontent"><input class="cdnInput" id="up_loginid" name="loginid" maxLength="20" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>登陆密码</td>
	<td class="fcontent"><input class="cdnInput" id="up_loginpasswd" name="loginpasswd" maxLength="64" type="password" /><div id="up_loginpasswdTip"></div></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>确认密码</td>
	<td class="fcontent"><input class="cdnInput" id="up_loginpasswdRetype" name="loginpasswdRetype" maxLength="64" type="password" /><div id="up_loginpasswdRetypeTip"></div></td>
</tr>
</table>	
</form>
</div>

<!-- 上传文件控件 -->
<div id="dialog_upload" style="display: none;">
	<form id="file-upload-form" action="importPageRateExcel.action" enctype="multipart/form-data" method="post" target="uploadRateFileTarget" >
		<input id="file-upload" name="uploadFile" type="file" accept="application/vnd.ms-excel" placeholder="选择文件" /><br/>
		<a class='bt' id="file-upload-submit" type="button" href="javascript:void(0);">上传文件</a>
	</form>
</div>


<!-- 编辑保证金 -->
<div id="updBailDiv" style="display: none;">
	<div id="updBailDiv-channelInfo">
		<form id="updBailForm" action="#">
			<input type="hidden" name="bailRecVersion" />
			<input type="hidden" name="version" />
			<input type="hidden" name="bailRecNo" />
			<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
				<tr>
					<td class="flabel">服务商编码：</td>
					<td class="fcontent"><input class="cdnInput" id="ub_channelCode" name="channelCode" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">服务商名称：</td>
					<td class="fcontent"><input class="cdnInput" id="ub_channelName" name="channelName" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">修改前保证金数额：</td>
					<td class="fcontent"><input class="cdnInput" id="ub_bailAmt" name="bailAmt" readonly="readonly" type="text" xtype="money"/></td>
				</tr>
				<tr>
					<td class="flabel">修改后保证金数额：</td>
					<td class="fcontent"><input class="cdnInput" id="ub_endAmt" name="endAmt" type="text" xtype="money"/><div id="ub_endAmtTip"></div></td>
				</tr>
				<tr>
					<td class="flabel">修改记录状态：</td>
					<td class="fcontent"><input class="cdnInput" id="ub_bailStatusDesc" name="bailStatusDesc" readonly="readonly" type="text" /></td>
				</tr>
				<tr>
					<td class="flabel">审核时间</td>
					<td class="fcontent"><input class="cdnInput" id="ub_bailRecAudTime" name="bailRecAudTime" maxLength="14" type="text" xtype="datetime" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="flabel">审核人</td>
					<td class="fcontent"><input class="cdnInput" id="ub_bailRecAudUser" name="bailRecAudUser" maxLength="30" type="text" readonly="readonly" /></td>
				</tr>
				<tr>
				<td class="flabel">审核意见</td>
					<td class="fcontent"><textarea class="cdnInput" id="ub_bailRecAudRemark" name="bailRecAudRemark" maxLength="600" readonly="readonly"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
$('#dialog_upload').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 400, height : 200
	, title: '上传分润规则文件', buttons:{'关闭' : function() { $(this).dialog('close'); }
}});
$('#file-upload-submit').click(function() {
	if ( $('#file-upload').val() ) {
		$("#file-upload-form")[0].submit();
	} else {
		alert('请选择文件');
	}
});
var evalJSON = function(src){
	if (typeof (JSON) == 'object' && JSON.parse)
        return eval("[" + src + "]")[0];
    return eval("(" + src + ")");
} ;
var loadRateCallback = false;
var loadRateFileEditor = function() {
	var data= $('#uploadRateFileTarget').contents().find("body").html();
	if(data!=""){
		data = frameCtx(data);
		console.log(data);
		var dataObj = evalJSON(data);
		if(dataObj) {
			if(dataObj.success){
				alert('操作成功');
				if ( loadRateCallback ) { loadRateCallback(dataObj); }
			} else {
				 alert('操作失败 原因是'+ dataObj.syserr); 
			}
		}
	}
};
</script>
<iframe style="display:none" name="uploadRateFileTarget" id="uploadRateFileTarget" onload="loadRateFileEditor()"></iframe>

<jsp:include page="pub/dialog_bank.jsp" />
<jsp:include page="pub/chnlrate.jsp" />

<script type="text/javascript">
var urls = {
	add:'doAddChannel.action',
	upd:'doUpdateChannel.action',
	updPwd:'doResetChannelPasswd.action',
	start:'doStartChannel.action',
	stop:'doStopChannel.action',
	close:'doShutdownChannel.action',
	del:'doDeleteChannel.action',
	list:'findAllChannel.action',
	user:'findChannelUser.action',
	excel:'findAllChannelExcel.action',
	
	updRate: 'doUpdateChannelRate.action',
	rateList: 'findChannelRate.action',
	
	subRec: 'doSubmitChnlRateRec.action',
	delRec: 'doDeleteChnlRateRec.action',
	
	recList: 'findChnlRateRecByChannelCode.action',
	hisRate: 'findChannelRateHis.action',
	tmpRate: 'findChnlRateTmp.action',
	
	updBail:'doUpdateBail.action',
	subBail:'doSubmitChnlBailRec.action',
	delBail:'doDeleteChnlBailRec.action',
	invCode:'generateInviteCode.action',
	
	addProdToChl:'addProdToChl.action'
};
var channelCodeBuild = function() {
	$('#a_channelCode').val("999999999" + $("#a_channelCode_dummy").val() + "000");
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_channelCode").formValidator({validatorgroup:"1", onshow: "请输入服务商编码"})
		.inputValidator({min:15, max:15, onerror:'服务商编码为15位数字'})  /* 必填检测和长度检测*/
		.regexValidator({regexp : "^999999999(?=.*[0-9]).{3}000$",onerror : "服务商号格式为 999999999 + 3位数字  + 000"});
	$("#a_channelName").formValidator({validatorgroup:"1", onshow: "请输入服务商名称"})
		.inputValidator({min:1,onerrormin:"服务商名称必须填写", max:100, onerrormax:'服务商名称最大长度为100'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
//	$("#a_profitRate").formValidator({validatorgroup:"1", onshow: "请输入服务商分润比例"})
//		.inputValidator({min:0,onerrormin:"服务商分润比例必须填写", max:99999, onerrormax:'服务商分润比例取值在0~99',type:'value'}) /* 数字检查 */ 
//	$("#a_brandFeeRate").formValidator({validatorgroup:"1", onshow: "请输入品牌服务费比例"})
//		.inputValidator({min:0,onerrormin:"品牌服务费比例必须填写", max:99999, onerrormax:'品牌服务费比例取值在0~99',type:'value'}) /* 数字检查 */ 
	$("#a_contactName").formValidator({validatorgroup:"1", onshow: "请输入联系人姓名"})
		.inputValidator({max:30, onerrormax:'联系人姓名最大长度为30'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#a_contactPhone").formValidator({validatorgroup:"1", onshow: "请输入联系人电话"})
		.inputValidator({max:30, onerrormax:'联系人电话最大长度为30'})  /* 必填检测和长度检测*/ 
		.regexValidator({regexp:"^(0?1[3,4,5,6,7,8]{1}[0-9]{9}$|^0[0-9]{2,3}[0-9]{7,8})*$",onerror:"联系人电话仅能输入数字，字母或者-，必须包含地区编码"});
	$("#a_remark").formValidator({validatorgroup:"1", onshow: "请输入备注"})
		.inputValidator({max:200, onerrormax:'备注最大长度为200'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#a_accntType").formValidator({validatorgroup:"1", onshow: "请选择账户类型"})
		.inputValidator({min:1,onerrormin:"账户类型必须选择"});  /* 必填检测和长度检测*/ 
	$("#a_accntNoPrivate").formValidator({validatorgroup:"1", onshow: "请输入账号"})
		.inputValidator({min:1,onerrormin:"账号必须填写", max:30, onerrormax:'账号最大长度为30'})  /* 必填检测和长度检测*/ 
		.regexValidator({regexp:"^[0-9]*$",onerror:"账号只能输入数字"});
	$("#a_accntNamePrivate").formValidator({validatorgroup:"1", onshow: "请输入账户名称"})
		.inputValidator({min:1,onerrormin:"账户名称必须填写", max:100, onerrormax:'账户名称最大长度为100'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#a_bankAccntId").formValidator({validatorgroup:"1", onshow: "请选择对公账户"})
		.inputValidator({min:1,onerrormin:"对公账户必须选择"}); 
	$("#a_accntBankPrivate").formValidator({validatorgroup:"1", onshow: "请输入开户行名称"})
		.inputValidator({min:1,onerrormin:"开户行必须填写", max:20, onerrormax:'开户行最大长度为20'})  /* 必填检测和长度检测*/ 
		.regexValidator({regexp:"^[0-9]*$",onerror:"开户行只能输入数字"});
	/* $("#a_cardPersonNo").formValidator({validatorgroup:"1", onshow: "请输入开户人身份证号"})
		.inputValidator({min:1,onerrormin:"开户人身份证号必须填写", max:20, onerrormax:'开户人身份证号最大长度为20'})
		.functionValidator({fun:chkCNLen}); */ /* 中文长度检测*/ 
	$("#a_exportFlag").formValidator({validatorgroup:"1", onshow: "请选择是否导出对帐文件"})
		.inputValidator({min:1,onerrormin:"是否导出对帐文件必须选择"});  /* 必填检测和长度检测*/ 
	$("#a_downFlag").formValidator({validatorgroup:"1", onshow: "请选择是否需要下载商户进件"})
		.inputValidator({min:1,onerrormin:"是否下载商户进件必须选择"});  /* 必填检测和长度检测*/ 
		
	$("#a_loginid").formValidator({validatorgroup:"1", onshow: "请输入登陆ID"})
		.inputValidator({min:1,onerrormin:"登陆ID必须填写", max:20, onerrormax:'登陆ID最大长度为20'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#a_loginpasswd").formValidator({validatorgroup:"1", onshow: "请输入登录密码"})
		.inputValidator({min : 8, max : 20, onerror : "密码8~20个字符"})
		.regexValidator({regexp : "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$]).{8,20}$",onerror : "密码需包括数字字母特殊字符(!@#$)"});
	$("#a_loginpasswdRetype").formValidator({onshow: "请确认登录密码",onfocus: "（必填）2次密码必须一致"})
	        .compareValidator({desid: "a_loginpasswd",operateor: "=",onerror: "（错误）2次密码不一致,请确认"});	
	$("#a_username").formValidator({validatorgroup:"1", onshow: "请输入用户名"})
		.inputValidator({min:1,onerrormin:"用户名必须填写", max:50, onerrormax:'用户名最大长度为50'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
		
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#u_channelName").formValidator({validatorgroup:"2", onshow: "请输入服务商名称"})
		.inputValidator({min:1,onerrormin:"服务商名称必须填写", max:100, onerrormax:'服务商名称最大长度为100'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
//	$("#u_profitRate").formValidator({validatorgroup:"2", onshow: "请输入服务商分润比例"})
//		.inputValidator({min:0,onerrormin:"服务商分润比例必须填写", max:99999, onerrormax:'服务商分润比例取值在0~999',type:'value'}) /* 数字检查 */ 
//	$("#u_brandFeeRate").formValidator({validatorgroup:"2", onshow: "请输入品牌服务费比例"})
//		.inputValidator({min:0,onerrormin:"品牌服务费比例必须填写", max:99999, onerrormax:'品牌服务费比例取值在0~999',type:'value'}) /* 数字检查 */ 
	$("#u_contactName").formValidator({validatorgroup:"2", onshow: "请输入联系人姓名"})
		.inputValidator({max:30, onerrormax:'联系人姓名最大长度为30'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#u_contactPhone").formValidator({validatorgroup:"2", onshow: "请输入联系人电话"})
		.inputValidator({max:30, onerrormax:'联系人电话最大长度为30'})  /* 必填检测和长度检测*/ 
		.regexValidator({regexp:"^(0?1[3,4,5,6,7,8]{1}[0-9]{9}$|^0[0-9]{2,3}[0-9]{7,8})*$",onerror:"联系人电话仅能输入数字，字母或者-，必须包含地区编码"});
	$("#u_remark").formValidator({validatorgroup:"2", onshow: "请输入备注"})
		.inputValidator({max:200, onerrormax:'备注最大长度为200'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#u_accntNoPrivate").formValidator({validatorgroup:"2", onshow: "请输入账号"})
		.inputValidator({min:1,onerrormin:"账号必须填写", max:30, onerrormax:'账号最大长度为30'})  /* 必填检测和长度检测*/ 
		.regexValidator({regexp:"^[0-9]*$",onerror:"账号只能输入数字"});
	$("#u_accntNamePrivate").formValidator({validatorgroup:"2", onshow: "请输入账户名称"})
		.inputValidator({min:1,onerrormin:"账户名称必须填写", max:100, onerrormax:'账户名称最大长度为100'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#u_bankAccntId").formValidator({validatorgroup:"2", onshow: "请输入对公账户"})
		.inputValidator({min:1,onerrormin:"对公账户必须填写"}); /* 数字检查 */ 
	$("#u_accntBankPrivate").formValidator({validatorgroup:"2", onshow: "请输入开户行"})
		.inputValidator({min:1,onerrormin:"开户行必须填写", max:20, onerrormax:'开户行最大长度为20'})  /* 必填检测和长度检测*/ 
		.regexValidator({regexp:"^[0-9]*$",onerror:"开户行只能输入数字"});
	/* $("#u_cardPersonNo").formValidator({validatorgroup:"2", onshow: "请输入开户人身份证号"})
		.inputValidator({min:1,onerrormin:"开户人身份证号必须填写", max:20, onerrormax:'开户人身份证号最大长度为20'})  
		.functionValidator({fun:chkCNLen}); */
	$("#u_exportFlag").formValidator({validatorgroup:"2", onshow: "请选择是否导出对帐文件"})
		.inputValidator({min:1,onerrormin:"是否导出对帐文件必须选择"});  /* 必填检测和长度检测*/ 
	$("#u_downFlag").formValidator({validatorgroup:"2", onshow: "请选择下载商户进件"})
		.inputValidator({min:1,onerrormin:"是否下载商户进件必须选择"});  /* 必填检测和长度检测*/ 
	
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"3", formid:"updPwdForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#up_loginpasswd").formValidator({validatorgroup:"3", onshow: "请输入登录密码"})
		.inputValidator({min : 8, max : 20, onerror : "密码8~20个字符"})
		.regexValidator({regexp : "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$]).{8,20}$",onerror : "密码需包括数字字母特殊字符(!@#$)"});
	$("#up_loginpasswdRetype").formValidator({validatorgroup:"3", onshow: "请确认登录密码",onfocus: "（必填）2次密码必须一致"})
        .compareValidator({desid: "up_loginpasswd",operateor: "=",onerror: "（错误）2次密码不一致,请确认"});	
	
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"4", formid:"updBailForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#ub_endAmt").formValidator({validatorgroup:"4", onshow: "请输入修改后保证金数额"})
		.inputValidator({min:0,onerrormin:"延迟清算金额必须填写且为正数", max:999999999999, onerrormax:'修改后保证金数额取值在0~999999999999',type:'value'}) /* 数字检查 */
	
	// Event 
	$("#a_channelCode_dummy").change(function(){channelCodeBuild();});
	$("#a_channelCode_dummy").keydown(function(){channelCodeBuild();});
	$("#a_channelCode_dummy").css({'width':'40px'});
	
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 550
	, title: '新增服务商', buttons:{
		'新增' : function() {
			channelCodeBuild();
			// read rateinfo 
			var ratelist = new Array();
			$('#addRateTable tbody tr').each(function(_i,_n){
				var rate = new Object();
				$(_n).find('.rate-input').each(function(_j,_m){
					$.inputToObj(rate, _m);
				});
				ratelist.push(rate);
			});
			if($.formValidator.pageIsValid('1')) {
				if ($('#a_accntType').val() == '02') {
					if (!$('#a_cardPersonNo').val()) {
						alert('开户人身份证号必填!');
						return;
					}
					if ($('#a_cardPersonNo').val().length > 20) {
						alert('开户人身份证号最多20个字符!');
						return;
					}
				}
				$.ajaxForm({formId : 'addForm', url : urls.add, data:{'ratelist': $.toJSON(ratelist) },
				success : function(data) {
					if (data.success) { 
						$('#addDiv').dialog('close'); alert('操作成功, 分润规则需要另外提交审核后生效. '); 
						if ( data.root && data.root[0] ) $('#table').flexAddData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// $('#addDiv').fullScreen();
	$('#addtabs').tabs(); $('#addtabs').fixTabInDialog('addDiv');
	
	var saveRateTmpBtn = {text:'保存', click:function(){
		// read rateinfo 
		if($('#upd-5000-def-fld-debitRate').val() < 0.25){alert('微信借记卡成本费率不能低于0.25'); return;}
		$('#upd-5000-def-fld-creditRate').val($('#upd-5000-def-fld-debitRate').val());
		$('#upd-5000-def-fld-creditChnlRatio').val($('#upd-5000-def-fld-debitChnlRatio').val());
		$('#upd-5000-def-fld-debitMaxFee').val(0);
        $('#upd-5000-def-fld-creditMaxFee').val(0);
        
        if($('#upd-6000-def-fld-debitRate').val() < 0.25){alert('支付宝借记卡成本费率不能低于0.25'); return;}
        $('#upd-6000-def-fld-creditRate').val($('#upd-6000-def-fld-debitRate').val());
        $('#upd-6000-def-fld-creditChnlRatio').val($('#upd-6000-def-fld-debitChnlRatio').val());
        $('#upd-6000-def-fld-debitMaxFee').val(0);
        $('#upd-6000-def-fld-creditMaxFee').val(0);
        
        if($('#upd-7000-def-fld-debitRate').val() < 0.02
        		|| $('#upd-7000-def-fld-debitRate').val() > 1){alert('1>=D0类成本费率>=0.02'); return;}
        if($('#upd-7000-def-fld-debitChnlRatio').val() < 0
        		|| $('#upd-7000-def-fld-debitChnlRatio').val() > 100){alert('100>=D0类分润比率>=0'); return;}
		$('#upd-7000-def-fld-creditRate').val($('#upd-7000-def-fld-debitRate').val());
		$('#upd-7000-def-fld-creditChnlRatio').val($('#upd-7000-def-fld-debitChnlRatio').val());
		$('#upd-7000-def-fld-debitMaxFee').val(0);
        $('#upd-7000-def-fld-creditMaxFee').val(0);
        
		var ratelist = new Array();
		$('#updRateTable tbody tr').each(function(_i,_n){
			var rate = new Object();
			$(_n).find('.rate-input').each(function(_j,_m){
				$.inputToObj(rate, _m);
			});
			ratelist.push(rate);
		});
		$.ajaxForm({formId : 'updRateForm', url : urls.updRate, data: {'ratelist': $.toJSON(ratelist) }
			, success : function(data) {
				if (data.success) { 
					$('#updRateDiv').dialog('close'); alert('操作成功');
					if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
				} else { 
					alert('操作失败 原因是' + data.syserr); 
				}
		}});
	}};
	var submitRateTmpBtn = {text:'提交修改', click:function(){
		$.ajaxForm({formId : 'updRateForm', url : urls.subRec
			, success : function(data) {
				if (data.success) { 
					$('#updRateDiv').dialog('close'); alert('操作成功'); 
					if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
		}});
	}};
	var deleteRateTmpBtn = {text:'删除修改', click:function(){
		$.ajaxForm({formId : 'updRateForm', url : urls.delRec
			, success : function(data) {
				if (data.success) { 
					$('#updRateDiv').dialog('close'); alert('操作成功'); 
					if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
		}});
	}};
	var updRateDivCloseBtn = { text:'关闭', click:function(){
		$('#updRateDiv').dialog('close');
	}};
	// updRateForm
	$('#updRateDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 550
	, title: '修改服务商分润规则'});

	$('#vwRateDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 550
	, title: '查看服务商分润规则', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	$('#addProdToChl').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 550
		, title: '添加服务商产品', buttons:{
			'保存' : function() {
					if($('input:radio[name="prodStatus"]:checked').attr('value') == null) {
						alert("请选择状态");
						return false;
					}
					if (($('#d0_fee').val() < '0.02' || $('#d0_fee').val() > '1')&& $('#d0_fee').val() != ''){
						alert("分润底价必需大于等于0.02小于等于1");
						return false;
					}
					if (($('#chnl_ratio').val() < 0 || $('#chnl_ratio').val() > 100)&& $('#chnl_ratio').val() != ''){
						alert("分润比例必需大于等于0小于等于100");
						return false;
					}
					if('99' != $('input:radio[name="prodStatus"]:checked').val()) {
						if(!$.formValidator.pageIsValid("5")) {
							return false;
						}
						if(null == $('input:radio[name="guaranteeAmtFlag"]:checked').val()
								|| '' == $('input:radio[name="guaranteeAmtFlag"]:checked').val()) {
							alert('请选择保证金缴纳');
							return false;	
						}
					}
					$.ajaxForm({formId : 'addProdToChlForm', url : urls.addProdToChl,
						success : function(data) {
							if (data.success) {
								$('#addProdToChl').dialog('close'); alert('操作成功'); 
							} else {
								alert('操作失败 原因是'+ data.syserr); 
							}
						}});
				}
			,
			'关闭' : function() { 
				$(this).dialog('close'); 
			}
		}});
	$('#viewProdToChl').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 550
		, title: '服务商产品详情', buttons:{
			'关闭' : function() { 
				$(this).dialog('close'); 
			}
		}});
	// updForm
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 550
	, title: '修改服务商信息', buttons:{
		'保存' : function() {
			if($.formValidator.pageIsValid('2')) {
				if ($('#u_accntType').val() == '02') {
					if (!$('#u_cardPersonNo').val()) {
						alert('开户人身份证号必填!');
						return;
					}
					if ($('#u_cardPersonNo').val().length > 20) {
						alert('开户人身份证号最多20个字符!');
						return;
					}
				}
				$.ajaxForm({formId : 'updForm', url : urls.upd,
				success : function(data) {
					if (data.success) { 
						$('#updDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// updPwdForm
	$('#updPwdDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '修改', buttons:{
		'保存' : function() {
			if($.formValidator.pageIsValid('3')) {
				$.ajaxForm({formId : 'updPwdForm', url : urls.updPwd,
				success : function(data) {
					if (data.success) { 
						$('#updPwdDiv').dialog('close'); alert('操作成功');
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});

	// updBailForm
	$('#updBailDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 550
	, title: '修改服务商保证金信息', buttons:{
		<sec:authorize ifAllGranted="ROLE_CHNL_MN_BAIL_UPDATE_CZ">
		'保存' : function() {
			if($.formValidator.pageIsValid('4')) {
				$.ajaxForm({formId : 'updBailDiv', url : urls.updBail,
					success : function(data) {
						if (data.success) { 
							$('#updBailDiv').dialog('close'); alert('操作成功'); 
							if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
						} else { 
							alert('操作失败 原因是'+ data.syserr); 
						}
					}});
			} else { return false; }},
		</sec:authorize>
		<sec:authorize ifAllGranted="ROLE_CHNL_MN_BAIL_SUBMIT_CZ">
		'保存并提交' : function() {
			if($.formValidator.pageIsValid('4')) {
				$.ajaxForm({formId : 'updBailDiv', url : urls.subBail,
					success : function(data) {
						if (data.success) { 
							$('#updBailDiv').dialog('close'); alert('操作成功'); 
							if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
						} else { 
							alert('操作失败 原因是'+ data.syserr); 
						}
					}});
			} else { return false; }},
		</sec:authorize>
		<sec:authorize ifAllGranted="ROLE_CHNL_MN_BAIL_DELETE_CZ">
		'删除' : function() {
			if($.formValidator.pageIsValid('4')) {
				$.ajaxForm({formId : 'updBailDiv', url : urls.delBail,
					success : function(data) {
						if (data.success) { 
							$('#delBailDiv').dialog('close'); alert('操作成功'); 
							if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
						} else { 
							alert('操作失败 原因是'+ data.syserr); 
						}
					}});
			} else { return false; }},
		</sec:authorize>
		'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// ADD
	var add = function() {
		$.jyform.resetForm('addForm');
		loadBlankRate('addRateTable','add');
		$('#a_cardPersonNo').parent().parent().show();
		$('#a_cardPersonNo').removeAttr('disabled');
		$('#addDiv').dialog('open');
		$('#channelInfo').click();
	};
	// UPD
	var edit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updForm');
		$.jyform.fillForm('updForm', record);
		if ($('#u_accntType').val() == '01') {
			$('#u_cardPersonNo').parent().parent().hide();
			$('#u_cardPersonNo').val('');
			$('#u_cardPersonNo').attr('disabled','disabled');
		} else {
			$('#u_cardPersonNo').parent().parent().show();
			$('#u_cardPersonNo').removeAttr('disabled');
		}
		$('#updDiv').dialog('open');
	};
	// UPD_RATE
	var editrate = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updRateForm');
		$.jyform.fillForm('updRateForm', record);
		$.ajax({url: urls.tmpRate, data:{jsonObject: $.toJSON(record)}, dataType:'json', type:'post', async: true
			, success : function(data) {
				if (data.success) { 
					if ( data.totalProperty <= 0 ) {
						alert('服务商未设置分润规则，将加载默认分规则');
						loadBlankRate('updRateTable','upd');
					} else {
						loadChannelRate('updRateTable','upd',data.root);
					}
				} else { 
					alert('加载分润规则失败：'+ data.syserr); 
				}
		}});
		var recStatus = record.recStatus;
		switch(recStatus) {
		case '00':
		case '03':
			$('#updRateDiv').dialog('option',{buttons:[saveRateTmpBtn, submitRateTmpBtn, deleteRateTmpBtn, updRateDivCloseBtn]});
			break;
		case '01':
			alert('分润规则待审核. ');
			$('#updRateDiv').dialog('option',{buttons:[updRateDivCloseBtn]});
			break;
		case '02':
		case '09':
		default: 
			$('#updRateDiv').dialog('option',{buttons:[saveRateTmpBtn, updRateDivCloseBtn]});
		};
		$('#updRateDiv').dialog('open');
	};
	// viewrate
	var viewrate = function( record, id ) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('vwRateForm');
		$.jyform.fillForm('vwRateForm', record);
		$.ajax({url: urls.rateList, data:{jsonObject: $.toJSON(record)}, dataType:'json', type:'post', async: true
			, success : function(data) {
				if (data.success) { 
					if ( data.totalProperty <= 0 ) {
						alert('服务商未设置分润规则，请先设置分润规则');
						$('#vwRateDiv').dialog('close');
					} else {
						loadChannelRate('vwRateTable','vw',data.root, true);
					}
				} else { 
					alert('加载分润规则失败：'+ data.syserr); 
					$('#vwRateDiv').dialog('close');
				}
		}});
		$('#vwRateDiv').dialog('open');
	};
	
	// RESET
	var resetpwd = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updPwdForm');

		$('#up_userid').val(record.channelUserid);
		$('#up_channelCode').val(record.channelCode);
		$('#up_channelName').val(record.channelName);
		
		$.ajax({url:urls.user, type:'POST', dataType:'json', data:{jsonObject:$.toJSON(record)}
			,success:function(data){
				if ( data.success ) {
					if ( data.root && data.root[0] ) {
						$.jyform.fillForm('updPwdForm', data.root[0]);
						$('#up_loginpasswd').val('');
					} else alert('未查询到关联用户. ');
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
		}});
		
		$('#updPwdDiv').dialog('open');
	};
	// START
	var startchnl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否启用服务商?') ) {
			$.ajax({url:urls.start, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	// STOP
	var stopchnl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否停用服务商?') ) {
			$.ajax({url:urls.stop, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	// CLOSE
	var closechnl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否注销服务商?') ) {
			$.ajax({url:urls.close, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	// DEL
	var delchnl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否删除服务商?') ) {
			$.ajax({url:urls.del, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	var genInvCode = function(record,id){
		if ( confirm('是否批量生成邀请码?') ) {
			$.ajax({url:urls.invCode, data:{}, type:'POST', dataType:'json',
	            success:function(data){ if(data.success){ alert('操作成功'); } else{ alert('操作失败：'+data.syserr); }}
			});
		}
	};
	var updBail = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updBailForm');
		record.endAmt
		$.jyform.fillForm('updBailForm', record);
		$('#updBailDiv').dialog('open');
	}
	
	var addProdToChl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('addProdToChlForm');
		$('input:radio[name="guaranteeAmtFlag"]:checked').attr('checked',false);
		$('input:radio[name="prodStatus"]:checked').attr('checked',false);
		$.jyform.fillForm('addProdToChlForm', record);
		$("#prod_productId").change();
		$('#addProdToChl').dialog('open');
	};
	var viewProdToChl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewProdToChlForm');
		$.ajax({url:'qyrChlProd.action', 
			type:'POST', dataType:'json', data:{channelCode: record.channelCode,
				productId:'0000001'}
			,success:function(data){
				if ( data.success ) {
					if ( data.root && data.root[0] ) {
						$.jyform.fillForm('viewProdToChlForm', data.root[0]);
					}
				} else {
					alert('操作失败原因是'+ data.syserr); 
				}
		}});
		$('#viewProdToChl').dialog('open');
	};
	//查看二维码  wxb
	$('#previewBtn').click(function(){
	    var inviteCode = $("#updForm input[name=inviteCode]").val();
	    window.open("previewInvCodeQrcode.action?inviteCode="+inviteCode);   //在新页面中打开二维码图片
	});


	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'channelCode', checkbox : false, usepager : true, dbClickRecord: edit,
		buttons : [
		 {name: "新增", show:'ROLE_CHANNEL_MN_ADD_CZ', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		,{name: "编辑", show:'ROLE_CHANNEL_MN_EDIT_CZ', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "修改分润规则", show:'ROLE_CHANNEL_MN_EDIT_RATE', bclass: 'grid_edit',  id : 'cel',  onpress : editrate },{separator : true }
		,{name: "查看分润规则", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : viewrate },{separator : true }
		,{name: "修改保证金信息", show:'ROLE_CHNL_MN_BAIL_UPDATE_CZ|ROLE_CHNL_MN_BAIL_DELETE_CZ|ROLE_CHNL_MN_BAIL_SUBMIT_CZ', bclass: 'grid_edit',  id : 'cel',  onpress : updBail },{separator : true }
		,{name: "重置密码", show:'ROLE_CHANNEL_MN_RESETPWD_CZ', bclass: 'grid_edit',  id : 'cel',  onpress : resetpwd },{separator : true }
		,{name: "启用", show:'ROLE_CHANNEL_MN_START_CZ', bclass: 'grid_edit',  id : 'cel',  onpress : startchnl },{separator : true }
		,{name: "停用", show:'ROLE_CHANNEL_MN_STOP_CZ', bclass: 'grid_edit',  id : 'cel',  onpress : stopchnl },{separator : true }
		,{name: "注销", show:'ROLE_CHANNEL_MN_SHUTDOWN_CZ', bclass: 'grid_del',  id : 'cel',  onpress : closechnl },{separator : true }
		,{name: "删除", show:'ROLE_CHANNEL_MN_DEL_CZ', bclass: 'grid_del',  id : 'cel',  onpress : delchnl },{separator : true }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} },{separator : true }
		,{name: "批量生成邀请码", bclass: 'ROLE_CHANNEL_INV_QRCODE_CZ', bclass: 'grid_del', id : 'inv_code',  onpress: genInvCode }
		,{name: "配置产品", bclass: 'grid_add',  id : 'cel',  onpress : addProdToChl },{separator : true }
		,{name: "查询产品", bclass: 'grid_edit',  id : 'cel',  onpress : viewProdToChl },{separator : true }
        ],
		colModel : [ 
		 { display: '编码', dataIndex: 'channelCode', width: 140, align: 'center', sortable: true }
		,{ display: '名称', dataIndex: 'channelName', width: 100, align: 'center', sortable: true }
		,{ display: '联系人姓名', dataIndex: 'contactName', width: 80, align: 'center', sortable: true }
		,{ display: '联系人电话', dataIndex: 'contactPhone', width: 80, align: 'center', sortable: true }
		,{ display: '合同起始时间', dataIndex: 'conBgnTime', width: 180, align: 'center', sortable: true, render: fmtTime }
		,{ display: '合同结束时间', dataIndex: 'conEndTime', width: 180, align: 'center', sortable: true, render: fmtTime }
		,{ display: '生效保证金数额', dataIndex: 'bailAmt', width: 120, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '状态', dataIndex: 'statusDesc', width: 80, align: 'center', sortable: true }
		,{ display: '保证金修改状态', dataIndex: 'bailStatusDesc', width: 120, align: 'center', sortable: true }
		,{ display: '分润修改状态', dataIndex: 'recStatusDesc', width: 120, align: 'center', sortable: true }
		,{ display: '分润修改记录号', dataIndex: 'recNo', width: 100, align: 'center', sortable: true }
		,{ display: '保证金修改记录号', dataIndex: 'bailRecNo', width: 100, align: 'center', sortable: true }
		,{ display: '创建时间', dataIndex: 'oprTime', width: 140, align: 'center', sortable: true, render: fmtTime }
		,{ display: '创建人', dataIndex: 'oprAcc', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('textarea[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$.jyform.components(); $('.bt').button();
	// 初始化代理商服务费率配置信息
	initRateConfig(); 
	
	// 设置分润比例信息
	$('#a_global_ratio_btn').click(function(){
		var gratio = parseFloat($('#a_global_ratio_input').val());
		if ( isNaN(gratio) ) { alert('请输入数字'); return false; }
		if ( gratio < 0 || gratio > 100 ) { alert('请输入[0~100]的数字'); return false; }
		$('#addRateTable :input[name="debitChnlRatio"]').val(frmRate4(gratio*10000));
		$('#addRateTable :input[name="creditChnlRatio"]').val(frmRate4(gratio*10000));
	});
	$('#u_global_ratio_btn').click(function(){
		var gratio = parseFloat($('#u_global_ratio_input').val());
		if ( isNaN(gratio) ) { alert('请输入数字'); return false; }
		if ( gratio < 0 || gratio > 100 ) { alert('请输入[0~100]的数字'); return false; }
		$('#updRateTable :input[name="debitChnlRatio"]').val(frmRate4(gratio*10000));
		$('#updRateTable :input[name="creditChnlRatio"]').val(frmRate4(gratio*10000));
	});
	// 导出页面的分润记录信息
	$('#a_export').click(function(){
		exportRateList($('#a_channelCode').val(), readRateList('addRateTable'));
	});
	$('#u_export').click(function(){
		exportRateList($('#ur_channelCode').val(), readRateList('updRateTable'));
	});
	$('#v_export').click(function(){
		exportRateList($('#vr_channelCode').val(), readRateList('vwRateTable'));
	});
	
	// 导入费率处理
	$('#a_import').click(function(){
		$('#dialog_upload').dialog('open');
		loadRateCallback = function(data){
			if ( data.totalProperty <= 0 ) {
				alert('文件为空或格式不正确. ');
			} else {
				loadChannelRate('addRateTable','add',data.root);
				$('#dialog_upload').dialog('close');
			}
		};
	});
	$('#u_import').click(function(){
		$('#dialog_upload').dialog('open');
		loadRateCallback = function(data){
			if ( data.totalProperty <= 0 ) {
				alert('文件为空或格式不正确. ');
			} else {
				loadChannelRate('updRateTable','upd',data.root);
				$('#dialog_upload').dialog('close');
			}
		};
	});
	
	// 开户行选择
	bankDialogBind('a_accntBankPrivate'
			, function(){
				bankDialogCallback = function(rec,id) {
					$('#a_accntBankPrivate').val(rec.unionBankNo);
					$('#a_accntBankPrivateDesc').val(rec.bankName);
					$('#dialog_bank').dialog('close');						
				};
			}, function(data){
				$('#a_accntBankPrivate').val(data.unionBankNo);
				$('#a_accntBankPrivateDesc').val(data.bankName);
			});
	$('#a_accntBankPrivateDesc').click(function(){ $('#a_accntBankPrivate').click(); });
	bankDialogBind('u_accntBankPrivate'
			, function(){
				bankDialogCallback = function(rec,id) {
					$('#u_accntBankPrivate').val(rec.unionBankNo);
					$('#u_accntBankPrivateDesc').val(rec.bankName);
					$('#dialog_bank').dialog('close');						
				};
			}, function(data){
				$('#u_accntBankPrivate').val(data.unionBankNo);
				$('#u_accntBankPrivateDesc').val(data.bankName);
			});
	$('#u_accntBankPrivateDesc').click(function(){ $('#u_accntBankPrivate').click(); });
	// 查询加载
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	$('#u_accntType').change(function(){
		if ($(this).val() == '01') {
			$('#u_cardPersonNo').parent().parent().hide();
			$('#u_cardPersonNo').val('');
			$('#u_cardPersonNo').attr('disabled','disabled');
		} else {
			$('#u_cardPersonNo').parent().parent().show();
			$('#u_cardPersonNo').removeAttr('disabled');
		}
	});
	
	$('#a_accntType').change(function(){
		if ($(this).val() == '01') {
			$('#a_cardPersonNo').parent().parent().hide();
			$('#a_cardPersonNo').val('');
			$('#a_cardPersonNo').attr('disabled','disabled');
		} else {
			$('#a_cardPersonNo').parent().parent().show();
			$('#a_cardPersonNo').removeAttr('disabled');
		}
	});
	var bankAccntBox = function(options) {
		var opt = $.extend({
			valueField:'bankAccntId',
			displayField:'bankName',
			render:function(res){return res.bankName;},
			failedMsg:'获取对公账户失败!'
		},options);
		if ( !opt.url ) {
			opt.url = 'findBankAccntCombo.action';
		}
		jQuery.jyform.ajaxSelectBox(opt);
	};
	bankAccntBox({selectId:'a_bankAccntId',emptyOpt:true});
	bankAccntBox({selectId:'u_bankAccntId',emptyOpt:true});

	//prod 
	$.formValidator.initConfig({ validatorgroup:"5", formid:"addProdToChlForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	//$("#prod_productId").formValidator({validatorgroup:'5',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"请选择产品"});
	$("#d0_fee").formValidator({validatorgroup:'5',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"分润底价必须填写"}).regexValidator({regexp:"^\\d{0,1}(\\.\\d{0,4})?$",onerror:"0.02 =< 分润底价(%) <= 1.0000"});
	$("#chnl_ratio").formValidator({validatorgroup:'5',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"分润比例必须填写"}).regexValidator({regexp:"^\\d+$",onerror:"0 =< 分润比例(%) <= 100"});

	function close99() {
		$('input:radio[name="guaranteeAmtFlag"]:checked').attr('checked',false);
		$('input:radio[name="guaranteeAmtFlag"]').each(function(){
			$(this).attr('disabled',true);
		});
		$('#d0_fee').attr('disabled',true);
		$('#chnl_ratio').attr('disabled',true);
		$('#d0_fee').val(null);
		$('#chnl_ratio').val(null);
	}
	function open99() {
		$('input:radio[name="guaranteeAmtFlag"]').each(function(){
			$(this).attr('disabled',false);
		});
		$('#d0_fee').attr('disabled',false);
		$('#chnl_ratio').attr('disabled',false);
	}
	$('input:radio[name="prodStatus"]').change(function(){
		if($(this).val() == '99') {
			if(!confirm("关闭后费率将会清空，确认关闭吗?")) {
				return;
			}
			close99();
		} else {
			open99();
		}
	});
	function noneProdAll() {
		$("div[prodoption=prod]").each(function() {
			$(this).css('display', 'none');
		});
	}
	function fillProdForm(chlprod) {
		$('input:radio[name="prodStatus"]').each(function(){
			if(chlprod['prodStatus'] == $(this).val()) {
				$(this).attr('checked',true);
			}
		});
		$('input:radio[name="guaranteeAmtFlag"]').each(function(){
			if(chlprod['guaranteeAmtFlag'] == $(this).val()) {
				$(this).attr('checked',true);
			}
		});
		$('#d0_fee').val(chlprod['d0fee']/10000);
		$('#chnl_ratio').val(chlprod['chnlRatio']);
		$('#reason').val(chlprod['reason']);
		if('99' == chlprod['prodStatus']){
			close99();
		}
		//$('#d0_fee').focus();
	}
	$("#prod_productId").change(function(){
		var prod = $(this);
		if(null == prod.val() || prod.val() == '') {
			noneProdAll();
		} else {
			var channelCode = $("#prod_channelCode").val();
			if('0000001' == prod.val()) {
				$.ajax({url:'qyrChlProd.action', 
					type:'POST', dataType:'json', data:{channelCode: channelCode,
						productId:prod.val()}
					,success:function(data){
						if ( data.success ) {
							if ( data.root && data.root[0] ) {
								fillProdForm(data.root[0]);
							}
						} else {
							alert('操作失败原因是'+ data.syserr); 
						}
				}});
				$("#chlD0prod").css('display','block');
			}
		}
	});
});
</script>
</body>