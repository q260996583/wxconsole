<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>进件审核（风控）</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<style>
.flabel{width:20%}
.qFormInput{width:80%}
</style>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value="" comparison="like"
						qtype="string" name=merName size=20 /></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="2" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>
	

	<div id="outMerDetail" class="detailDialog" style="display:none;">
		<form id="form2" >
		<input class="qFormInput"   id="ipFlag" name="ipFlag" type="hidden"   />
		<input class="qFormInput"   id="userId" name="userId" type="hidden"   />
		<input type="hidden" name="personNoType" />
		<input type="hidden" name="cardPersonNoType" />
		<div style="overflow-x: auto; overflow-y: auto; width:100%;">
	  		<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	  			<TBODY>
	  			<tr>
	  			<td class="flabel"> 商户号:</td>
	  			<td class="fcontent"> <input class="qFormInput" disabled id="mid" name="mid" type="text" maxlength="20" readonly="readonly"  disabled="disabled"/></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户名称:</td>
	  			<td class="fcontent"> <input class="qFormInput" disabled id="merName" name="merName" type="text" maxlength="100" /> </td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户对外经营名称:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="merOutName" name="merOutName" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户英文名称:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled  id="enName" name="enName" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户对外英文名称:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled  id="enOutName" name="enOutName" type="text" maxlength="100" /></td>
	  			</tr>
	  		  <tr>
		  			<td class="flabel">MCC:</td>
		  			<td class="fcontent">  <input class="qFormInput" disabled id="mcc" name="mcc" type="text" maxlength="50" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">商户类别(结算):</td>
	  				<td class="fcontent"><input class="qFormInput" disabled id="mccGrp" name="mccGrpDesc" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">商户类别(预期):</td>
	  				<td class="fcontent"><input class="qFormInput" disabled id="mccGrpImpDesc" name="mccGrpImpDesc" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">进件类别备注:</td>
	  				<td class="fcontent"><input class="qFormInput" disabled id="mccRemark" name="mccRemark" type="text" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 地区代码:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="areaCodeZH" name="areaCodeZH" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"><span id="licen" style="display:none;"><font color='red'>(已使用)</font></span> 营业执照统一社会信用代码:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="licenseNo" name="licenseNo" type="text" maxlength="30" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 营业执照注册地址:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="licenseAddr" name="licenseAddr" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 营业执照有效期:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="bizLicnoExpireDate" name="bizLicnoExpireDate" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 装机地址:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="address" name="address" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 企业成立日期:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="merCreateDate" name="merCreateDate" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 月租金(元):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="monthRent" name="monthRent" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 税务登记证号码:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="taxNO" name="taxNO" type="text" maxlength="30" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 组织机构代码证:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="certNO" name="certNO" type="text" maxlength="30" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 法人姓名:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="personName" name="personName" type="text" maxlength="30" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 法人证件类型:</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="personNoTypeDesc" name="personNoTypeDesc" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 法人证件号:</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="personNO" name="personNO" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">法人证件有效期:</td>
	  				<td class="fcontent"><input class="qFormInput" disabled id="personNoExpireDate" name="personNoExpireDate" type="text" maxlength="100" /></td></tr>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 营业开始时间:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="busiBgTime" name="busiBgTime" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 营业结束时间:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="busiEndTime" name="busiEndTime" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 营业面积(平方米):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="area" name="area" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel">对公账号:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="fftAccntZH" name="fftAccntZH" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
		   			<td class="flabel">商户账户类型：</td>
					<td class="fcontent" ><select id="accntType"
						name="accntType" disabled></select>
					</td>
				</tr>
	  			<tr>
	  			<td class="flabel"> 商户账户名称:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="accntName" name="accntName" type="text" maxlength="60" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户账户号码:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="accntNO" name="accntNO" type="text" maxlength="60" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 开户行总行号:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="accntBank" name="accntBank" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 开户行总行名称:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="accntBankPrivateDesc" name="accntBankPrivateDesc" type="text" maxlength="100" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 开户行支行号:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="bankBranchNO" name="bankBranchNO" type="text" maxlength="20" /></td>
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
	  				<td class="fcontent">  <input class="qFormInput" disabled id="merStatementsRate" name="merStatementsRate" type="text"  xtype="rate4" maxlength="100" /></td>
	  			</tr>
	  				  			
	  			<tr>
	  			<td class="flabel"> 开户行支行名称:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="bankBranchNodesc" name="bankBranchNoDesc" type="text" maxlength="20" /></td>
	  			</tr>
	  			<!-- <tr>
	  			<td class="flabel"> 商户开户行是否为浦发银行:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="spdFlagZH" name="spdFlagZH" type="text" maxlength="20" /></td>
	  			</tr> -->
	  			<tr>
	  			<td class="flabel"> 一级服务商:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="firstTcnZH" name="firstTcnZH" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 二级服务商:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="secondTcnZH" name="secondTcnZH" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 标识:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="gradeFlag" name="gradeFlag" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	 					<td class="flabel"> 开户人证件类型:</td>
	 					<td class="fcontent">  <input class="qFormInput" disabled id="cardPersonNoTypeDesc" name="cardPersonNoTypeDesc" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 开户人证件号:</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="cardPersonNO" name="cardPersonNO" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 开户人证件有效期:</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text" maxlength="100" /></td>
	  			</tr>
	  			
	  			<tr>
	  			<td class="flabel"> 手续费收取类型:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="feeType" name="feeTypeZh" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 借记手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="v_debitRate" name="debitRate" type="text" xtype="rate4" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 借记封顶费(元):</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="v_debitMaxFee" name="debitMaxFee" type="text" xtype="money" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 贷记手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="v_creditRate" name="creditRate" type="text" xtype="rate4" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 微信手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="v_wechatPayRate" name="wechatPayRate" type="text" xtype="rate4" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 外卡手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="v_outCardRate" name="outCardRate" type="text" xtype="rate4" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 支付宝手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" disabled id="v_alipayPayRate" name="alipayPayRate" type="text" xtype="rate4" /></td>
	  			</tr>
	  			<!-- 
	  			<tr>
	  			<td class="flabel"> 手续费率(%):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="feeRate" name="feeRate" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 手续费固定值(元):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="feeVal" name="feeVal" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 手续费封顶值(元):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="topValue" name="topValue" type="text" maxlength="15" /></td>
	  			</tr>
	  			-->
	  			<tr>
	  			<td class="flabel"> 非借记卡单笔交易限额(元):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="tranLimit" name="tranLimit" type="text" maxlength="15" /></td>
	  			</tr> 
	  			<tr>
	  			<td class="flabel"> 商户联系人:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="merContact" name="merContact" type="text" maxlength="60" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户联系电话:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="merPhone" name="merPhone" type="text" maxlength="50" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel"> 商户营销人员姓名:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="merketPerson" name="merketPerson" type="text" maxlength="15" /></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel">开户银行网点号:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="accntBankNoPrivate" name="accntBankNoPrivate" type="text" maxlength="20" /></td>
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
	  			<!-- <tr>
	  			<td class="flabel">是否支持建行分期:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="ifCcbIpZH" name="ifCcbIpZH" type="text" maxlength="20" />
	  			<input class="qFormInput"   id="ipFlag" name="ipFlag" type="hidden"   /></td>
	  			
	  			</tr>
	  			<tr>
	  			<td class="flabel">建行分期手续费收取方式:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="ipFeeTypeZH" name="ipFeeTypeZH" type="text" maxlength="20" />
	  			<input class="qFormInput"   id="ipFeeType" name="ipFeeType" type="hidden"   /></td></td>
	  			</tr>
	  			<tr>
	  			<td class="flabel">建行分期手续费率(%):</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="ipFeeRate" name="ipFeeRate" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr> -->
	  			<td class="flabel"> 备注:</td>
	  			<td class="fcontent">  <input class="qFormInput" disabled id="memo" name="memo" type="text" maxlength="200" /></td>
	  			</tr>
	  			<tr>
	   			<td class="flabel"> 进件附件:</td>
	   			<td class="fcontent">
	   				<input id="downloadOutMerApplyFile" class="bt" value="查看附件" type="button">
	   			</td>
	  			</tr>
	  			<tr>
	   			<td class="flabel"> 商户信息录入时间:</td>
	   			<td class="fcontent">  <input class="qFormInput" disabled id="updDate" name="updDate" type="text" /></td>
	  			</tr>
	  			<tr style="display: none;" >
	   			<td class="flabel"> 审批状态:</td>
	   			<td class="fcontent">  <input class="qFormInput" id="status" name="status" type="text" maxlength="5" /></td>
	  			</tr>
	  		    <tr>
	   			<td class="flabel"> 业务审批人:</td>
	   			<td class="fcontent">  <input class="qFormInput" disabled id="admitAcc" name="admitAcc" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	   			<td class="flabel"> 业务审批意见:</td>
	   			<td class="fcontent">  <textarea class="qFormInput" disabled id="admitMemo" name="admitMemo" type="text" maxlength="300" ></textarea></td>
	  			</tr>
	  			<tr>
	   			<td class="flabel"> 风控审批人:</td>
	   			<td class="fcontent">  <input class="qFormInput" disabled id="approveAcc" name="approveAcc" type="text" maxlength="20" /></td>
	  			</tr>
	  			<tr>
	   			<td class="flabel"> 风控审批意见:</td>
	   			<td class="fcontent">  <textarea class="qFormInput" id="approveMemo" name="approveMemo" type="text" maxlength="300" ></textarea></td>
	  			</tr>
	  			<tr style="display: none"> 
	  				<td></td> 
	  				<td>
	  					<input id="bankAccntId" name="bankAccntId" type="text"/>
	  					<input id="firstTcn" name="firstTcn" type="text"/>
	  					<input id="accntType" name="accntType" type="text"/>
	  					<input id="feeType" name="feeType" type="text"/>
	  					<input id="spdFlag" name="spdFlag" type="text"/>
	  					<input id="merFax" name="merFax" type="text"/>
	  					<input id="areaCode" name="areaCode" type="text"/>
	  					<input id="orgCode" name="orgCode" type="text"/>
	  					<input id="posNum" name="posNum" type="text"/>
	  					<input id="userId" name="userId" type="text"/>
	  					
	  					<input id="feeRate" name="feeRate" type="text"/>
	  					<input id="feeVal" name="feeVal" type="text"/>
	  					<input id="topValue" name="topValue" type="text"/>
	  					<input id="mccGrp" name="mccGrp" type="text"/>
	  					<input id="mccGrpImp" name="mccGrpImp" type="text"/>
	  				</td>
	  			</tr>
	             </TBODY>
	              </table> 
	              </div>              
	          </form>
		<div  class="titleDiv">
            <div class="dtitle">终端信息</div>
        </div>
        <div style="overflow: auto; width:100%; background:#ffffff">
        	<div id="outMerTidDetail" ></div>
        </div>
	</div>

<!-- 商户附件 -->
<div id="mhtAttachInfoAddDialog" class="detailDialog" style="display:none;">
	<table id="mhtAttachInfoAddTable" class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
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
		<td><input type="checkbox" readonly="readonly" class="athChecked" id="{athType}_checked" onclick="return false;"/></td>
		<td>{athTypeName} <span class="txt-red">{athNullable}</span><input type="hidden" id="ath_{athType}" athType="{athType}" class="athInMedSeq" /></td>
		<td><input type="button" class="bt preview-in-ath-btn" fileId="ath_{athType}" athType="{athType}" value="查看" /></td>
	</tr>
</textarea>
</div>

<script type="text/javascript">
//<!--

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

$.formValidator.initConfig({onerror: function(msg) {alert(msg);} });
var list=[{id:"approveMemo",formValidator:{empty:false},inputValidator:{min:1,max:300,onerror:"风控审批意见长度不得为空不得大于150个汉字"}}];
$.someAuthentication(list);	

var flag=false;
var athNullableCheck = false; // nullable attachments check flag. 
var athNullableMessage = false;
$('#outMerDetail').dialog({	autoOpen: false, bgiframe: true, modal: true,	resizable: false,	draggable: false,	width: 800,	height: 500
	,title: '详细信息', buttons:{
		'通过': function(){										
			if ($.formValidator.pageIsValid('1')) {
				var cf = confirm("确认通过进件审核吗？");
				if (!cf) { return; }
				if ( !athNullableCheck ) { 
					if ( !confirm(athNullableMessage?(athNullableMessage+"，确定通过吗？"):'进件必填信息未校验! ') ) { return ;}
				}
				if(flag) {
					var licen=confirm("已经有商户使用了这个营业执照统一社会信用代码，确定通过吗？");
					if(!licen){ return; }
				}
				$.ajaxForm({ formId : 'form2', url : "doApproveOutMerApplyControl.action",
					success : function(data) {
						if (data.success) {
							$('#table').refresh();
							$('#outMerDetail').dialog('close');
							alert('操作成功');
						} else {
							alert('操作失败 原因是' + data.syserr);
						}
					}
				});
			} else {
				return false;
			}									
		},
		'驳回': function(){										
			if ($.formValidator.pageIsValid('1')) {
				var cf = confirm("确认驳回进件审核吗？");
				if (!cf) { return; }
				$.ajaxForm({ formId : 'form2', url : "doRejectOutMerApplyControl.action",
					success : function(data) {
						if (data.success) {
							$('#outMerDetail').dialog('close');
							$('#table').refresh();
							alert('操作成功');
						} else {
							alert('操作失败 原因是' + data.syserr);
						}
					}
				});
			}else {
				return false;
			}									
		},
		'关闭' : function() {$(this).dialog('close');}
}});	
				
$('#mhtAttachInfoAddDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 500
	, title:'附件列表', buttons:{'关闭':function() {$(this).dialog('close');}  } });		
	
$('#downloadOutMerApplyFile').click(function(){
	loadAthList();
	$('#mhtAttachInfoAddDialog').dialog('open');
});

var  viewOutMerDetail = function(record,id) {
	if (!record) { alert("请选择一条记录"); return; }
	__refNo = record.orgCode;
	$('#form2').fillObject({obj:record});
	$.ajax({ url: 'queryOutMerTidApply.action', async	: false, data	: {jsonObject:$.toJSON(record)},
		success:function(data){
			$('#outMerTidDetail').refreshWithData(data);
	}});
	$.ajax({url	: 'queryLicenseNo.action', async	: false, data	: {jsonObject:$.toJSON(record)},
		success:function(data){
			if(data.success){
				$('#licen').show();
				flag=true;
			}else{
				$('#licen').hide();
			}
		}													
	});
	// check attachment
	athNullableCheck = false;  
	athNullableMessage = false;
	$.ajax({url: 'checkMhtAttachInfoAdd.action', async: false, data: {orgCode:record.orgCode},
		success:function(data){
			if(data.success){
				athNullableCheck = true;
			}else{ 
				athNullableMessage = data.syserr;
			}
	}});
	$('#outMerDetail').dialog('open');
};

$('#outMerTidDetail').flexigrid({url: 'queryOutMerTidApply.action', width: 400, checkbox: false, usepager: false,	colModel: [
 {display: '终端号',width: 100,dataIndex: 'tid',align: 'center'}
,{display: '终端品牌',width: 100,dataIndex: 'tidBrand',align: 'center'}
,{display: '终端类型',width: 100,dataIndex: 'tidTypeZh',align: 'center'}
,{display: '终端状态',width: 100,dataIndex: 'tidStatusZH',align: 'center'}
,{display: '终端型号',width: 100,dataIndex: 'tidModel',align: 'center'}
,{display: '安装地址',width: 100,dataIndex: 'tidAddress',align: 'center'}
,{display: 'SIM卡号',width: 100,dataIndex: 'reserved1',align: 'center'}
,{display: 'SN号',width: 100,dataIndex: 'snCode',align: 'center'}
,{display: '是否生成二维码',width: 50,dataIndex: 'reserved2Zh',align: 'center'}                /*wxb*/
]});	
						
$('#table').flexigrid({url: 'findOutMerApplyControl.action',width: 400, dir: "desc", sort: "orgCode", usepager: true,
buttons:[{name: "详细信息", bclass: 'page_excel', id: 'cel', onpress: viewOutMerDetail},{separator: true}],
colModel:[
 {display: '服务商内部商户号',dataIndex: 'orgCode',align: 'center',sortable:true}
,{display: '外部商户号',dataIndex: 'mid',align: 'center'}
,{display: '商户名称',dataIndex: 'merName',sortable:true}
,{display: '一级服务商',dataIndex: 'firstTcnZH',sortable:true}
,{ display: '商户类别(预期)', dataIndex: 'mccGrpImpDesc', align: 'center'}
,{ display: '商户类别(结算)', dataIndex: 'mccGrpDesc', align: 'center'}
,{ display: '借记费率(%)', dataIndex : 'debitRate', align : 'right', render:fmtRate4 }
,{ display: '贷记费率(%)', dataIndex : 'creditRate', align : 'right', render:fmtRate4 }
,{ display: '微信费率(%)', dataIndex : 'wechatPayRate', align : 'right', render:fmtRate4 }
,{ display: '外卡费率(%)', dataIndex : 'outCardRate', align : 'right', render:fmtRate4 }
,{ display: '支付宝费率(%)', dataIndex : 'alipayPayRate', align : 'right', render:fmtRate4 }
//,{display: '银行费率(%)',dataIndex: 'feeRate',align: 'center'}
//,{display: '单笔限额(元)',dataIndex: 'tranLimit',sortable:true}
,{display: '账户号码',dataIndex: 'accntNO',sortable:true}
,{display: '审批状态',dataIndex: 'statusZH',align: 'center'}
]});
		
$('#querybutton').click(function(){$.queryTable({ formId : 'queryForm', tableId : 'table' }); });						
//初始化查询;
$('#querybutton').trigger('click');

loadAthDef();
bindAthEvent();
$.ajax({url:'findSecCodeList.action?codeType=ACCNT_TYPE_SD', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { 
		$.dataSelectBox(__defCodeBoxParam({selectId:'accntType'}), data.root);
	} else { console.log('获取参数失败'); }
}});
});
//-->
</script>
</body>
</html>