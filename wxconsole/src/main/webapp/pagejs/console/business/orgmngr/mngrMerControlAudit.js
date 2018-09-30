$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

$('#auditDialog').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 600
});
//商户基本信息
var merName1Tab = $('#merName1'),merOutName1Tab = $('#merOutName1'),enName1Tab = $('#enName1'),
enOutName1Tab = $('#enOutName1'),mcc1Tab = $('#mcc1'),areaCode1Tab = $('#areaCode1'),
licenseNo1Tab = $('#licenseNo1'),licenseAddr1Tab = $('#licenseAddr1'),taxNo1Tab = $('#taxNo1'),
certNo1Tab = $('#certNo1'),personName1Tab = $('#personName1'),personNo1Tab = $('#personNo1'),
address1Tab = $('#address1'),area1Tab = $('#area1'),posNum1Tab = $('#posNum1'),
merContact1Tab = $('#merContact1'),merFax1Tab = $('#merFax1'),merPhone1Tab = $('#merPhone1'),
merketPerson1Tab = $('#merketPerson1'),foundedDate1Tab = $('#foundedDate1'),monthRent1Tab = $('#monthRent1'),
sdGradeFlag1Tab = $('#sdGradeFlag1'),personNoTypeDesc1Tab = $('#personNoTypeDesc1'),bizLicnoExpireDate1Tab = $('#bizLicnoExpireDate1'),personNoExpireDate1Tab = $('#personNoExpireDate1');


var merNameTab = $('#merName'),merOutNameTab = $('#merOutName'),enNameTab = $('#enName'),
enOutNameTab = $('#enOutName'),mccTab = $('#mcc'),areaCodeTab = $('#areaCode'),
licenseNoTab = $('#licenseNo'),licenseAddrTab = $('#licenseAddr'),taxNoTab = $('#taxNo'),
certNoTab = $('#certNo'),personNameTab = $('#personName'),personNoTab = $('#personNo'),
addressTab = $('#address'),areaTab = $('#area'),posNumTab = $('#posNum'),
merContactTab = $('#merContact'),merFaxTab = $('#merFax'),merPhoneTab = $('#merPhone'),
merketPersonTab = $('#merketPerson'),foundedDateTab = $('#foundedDate'),monthRentTab = $('#monthRent'),
sdGradeFlagTab = $('#sdGradeFlag'),personNoTypeDescTab = $('#personNoTypeDesc'),bizLicnoExpireDateTab = $('#bizLicnoExpireDate'),personNoExpireDateTab = $('#personNoExpireDate');

// 帐户信息
var accntBank1Tab = $('#accntBank1'),accntName1Tab = $('#accntName1'), accntNo1Tab = $('#accntNo1'),accntType1Tab = $('#accntType1'),
depositFlag1Tab = $('#depositFlag1'),bankName1Tab = $('#bankName1'),bankNo1Tab = $('#bankNo1'),
accntNoPrivate1Tab = $('#accntNoPrivate1'),accntNamePrivate1Tab = $('#accntNamePrivate1'),accntBankPrivate1Tab = $('#accntBankPrivate1'),
spdFlag1Tab = $('#spdFlag1'),cardPersonNo1Tab = $('#cardPersonNo1'),bankAccntId1Tab = $('#bankAccntId1'),
liquidateFlag1Tab = $('#liquidateFlag1'),bankBranchNo1Tab = $('#bankBranchNo1'),accntBankNoPrivate1Tab = $('#accntBankNoPrivate1'),
accntBankCodePrivate1Tab = $('#accntBankCodePrivate1'),bankBranchNo1Tab = $('#bankBranchNo1'),cardPersonNoTypeDesc1Tab = $('#cardPersonNoTypeDesc1'),
accntBankPrivateDesc1Tab = $('#accntBankPrivateDesc1'),bankBranchNoDesc1Tab = $('#bankBranchNoDesc1'),cardLicnoExpireDate1Tab = $('#cardLicnoExpireDate1');

var accntBankTab = $('#accntBank'),accntNameTab = $('#accntName'), accntNoTab = $('#accntNo'),accntTypeTab = $('#accntType'),
depositFlagTab = $('#depositFlag'),bankNameTab = $('#bankName'),bankNoTab = $('#bankNo'),
accntNoPrivateTab = $('#accntNoPrivate'),accntNamePrivateTab = $('#accntNamePrivate'),accntBankPrivateTab = $('#accntBankPrivate'),
spdFlagTab = $('#spdFlag'),cardPersonNoTab = $('#cardPersonNo'),bankAccntIdTab = $('#bankAccntId'),
liquidateFlagTab = $('#liquidateFlag'),bankBranchNoTab = $('#bankBranchNo'),accntBankNoPrivateTab = $('#accntBankNoPrivate'),
accntBankCodePrivateTab = $('#accntBankCodePrivate'),bankBranchNoTab = $('#bankBranchNo'),cardPersonNoTypeDescTab = $('#cardPersonNoTypeDesc'),
accntBankPrivateDescTab = $('#accntBankPrivateDesc'),bankBranchNoDescTab = $('#bankBranchNoDesc'),cardLicnoExpireDateTab = $('#cardLicnoExpireDate');

// 风控信息
var busiBgtime1Tab = $('#busiBgtime1'),busiEndtime1Tab = $('#busiEndtime1'),creditSignZh1Tab = $('#creditSignZh1'),
tranLimit1Tab = $('#tranLimit1'),dayTranLimit1Tab = $('#dayTranLimit1'),tranLimitParam1Tab = $('#tranLimitParam1'),
merRiskZh1Tab = $('#merRiskZh1'),tranLimitDebit1Tab = $('#tranLimitDebit1');

var busiBgtimeTab = $('#busiBgtime'),busiEndtimeTab = $('#busiEndtime'),creditSignZhTab = $('#creditSignZh'),
tranLimitTab = $('#tranLimit'),dayTranLimitTab = $('#dayTranLimit'),tranLimitParamTab = $('#tranLimitParam'),
merRiskZhTab = $('#merRiskZh'),tranLimitDebitTab = $('#tranLimitDebit');

// 费率信息
var settlePeriod1Tab = $('#settlePeriod1'),
feeStlmTypeZh1Tab = $('#feeStlmTypeZh1'),
feeRate1Tab = $('#feeRate1'),
feeVal1Tab = $('#feeVal1'),topValue1Tab = $('#topValue1'),
//outVisFeeRate1Tab = $('#outVisFeeRate1'),
//specMccZh1Tab = $('#specMccZh1'),
brandFeeFlagZh1Tab = $('#brandFeeFlagZh1'),
expectDateTab1 = $('#expectDate1');
//ipFeeTypeZh1Tab = $('#ipFeeTypeZh1'),ipFeeRate1Tab = $('#ipFeeRate1'),ipTypeZh1Tab = $('#ipTypeZh1');

var settlePeriodTab = $('#settlePeriod'),feeStlmTypeZhTab = $('#feeStlmTypeZh'),feeRateTab = $('#feeRate'),
feeValTab = $('#feeVal'),topValueTab = $('#topValue'),
//outVisFeeRateTab = $('#outVisFeeRate'),
//specMccZhTab = $('#specMccZh'),
brandFeeFlagZhTab = $('#brandFeeFlagZh'),
expectDateTab = $('#expectDate');
//ipFeeTypeZhTab = $('#ipFeeTypeZh'),ipFeeRateTab = $('#ipFeeRate'),ipTypeZhTab = $('#ipTypeZh');
//开户行网点编号
var accntBankNoPrivate1Tab=$('#accntBankNoPrivate1'),accntBankCodePrivate1Tab=$('#accntBankCodePrivate1');
var accntBankNoPrivateTab=$('#accntBankNoPrivate'),accntBankCodePrivateTab=$('#accntBankCodePrivate');


function setStyle(tab1Cell,tabCell){
	//alert("");
	if(tab1Cell.val() == tabCell.val()){ 
		tabCell.css("color","black");tabCell.css("border","1px solid #99bbe8"); }
	else{ tabCell.css("color","red");tabCell.css("border","1px solid red");}
}

function compareInfo(record){
	if(record.modiModule == "00"){
		setStyle(merName1Tab,merNameTab);setStyle(merOutName1Tab,merOutNameTab);setStyle(enName1Tab,enNameTab);
		setStyle(enOutName1Tab,enOutNameTab);setStyle(mcc1Tab,mccTab);setStyle(areaCode1Tab,areaCodeTab);
		setStyle(licenseNo1Tab,licenseNoTab);setStyle(licenseAddr1Tab,licenseAddrTab);setStyle(taxNo1Tab,taxNoTab);
		setStyle(certNo1Tab,certNoTab);setStyle(personName1Tab,personNameTab);setStyle(personNo1Tab,personNoTab);
		setStyle(address1Tab,addressTab);setStyle(area1Tab,areaTab);setStyle(posNum1Tab,posNumTab);
		setStyle(merContact1Tab,merContactTab);setStyle(merFax1Tab,merFaxTab);setStyle(merPhone1Tab,merPhoneTab);
		setStyle(merketPerson1Tab,merketPersonTab);setStyle(foundedDate1Tab,foundedDateTab);setStyle(monthRent1Tab,monthRentTab);
		setStyle(sdGradeFlag1Tab,sdGradeFlagTab);
		setStyle(personNoTypeDesc1Tab,personNoTypeDescTab);
		setStyle(bizLicnoExpireDate1Tab,bizLicnoExpireDateTab);
		setStyle(personNoExpireDate1Tab,personNoExpireDateTab);
	}else if(record.modiModule == "01"){
		setStyle(accntBank1Tab,accntBankTab);setStyle(accntName1Tab,accntNameTab);setStyle(accntNo1Tab,accntNoTab);setStyle(accntType1Tab,accntTypeTab);
		setStyle(depositFlag1Tab,depositFlagTab);setStyle(bankName1Tab,bankNameTab);setStyle(bankNo1Tab,bankNoTab);
		setStyle(accntNoPrivate1Tab,accntNoPrivateTab);setStyle(accntNamePrivate1Tab,accntNamePrivateTab);setStyle(accntBankPrivate1Tab,accntBankPrivateTab);
		setStyle(spdFlag1Tab,spdFlagTab);setStyle(cardPersonNo1Tab,cardPersonNoTab);setStyle(bankAccntId1Tab,bankAccntIdTab);
		setStyle(liquidateFlag1Tab,liquidateFlagTab);setStyle(bankBranchNo1Tab,bankBranchNoTab);
		setStyle(accntBankNoPrivate1Tab,accntBankNoPrivateTab);
		setStyle(accntBankCodePrivate1Tab,accntBankCodePrivateTab);
		setStyle(bankBranchNo1Tab,bankBranchNoTab);
		setStyle(cardPersonNoTypeDesc1Tab,cardPersonNoTypeDescTab);
		setStyle(accntBankPrivateDesc1Tab,accntBankPrivateDescTab);
		setStyle(bankBranchNoDesc1Tab,bankBranchNoDescTab);
		setStyle(cardLicnoExpireDate1Tab,cardLicnoExpireDateTab);
	}else if(record.modiModule == "02"){
		setStyle(busiBgtime1Tab,busiBgtimeTab);setStyle(busiEndtime1Tab,busiEndtimeTab);setStyle(creditSignZh1Tab,creditSignZhTab);
		setStyle(tranLimit1Tab,tranLimitTab);setStyle(dayTranLimit1Tab,dayTranLimitTab);setStyle(tranLimitParam1Tab,tranLimitParamTab);
		setStyle(merRiskZh1Tab,merRiskZhTab);setStyle(tranLimitDebit1Tab,tranLimitDebitTab);
		
	}else if(record.modiModule == "03"){
		setStyle(settlePeriod1Tab,settlePeriodTab);setStyle(feeStlmTypeZh1Tab,feeStlmTypeZhTab);setStyle(feeRate1Tab,feeRateTab);
		setStyle(feeVal1Tab,feeValTab);setStyle(topValue1Tab,topValueTab);
//		setStyle(outVisFeeRate1Tab,outVisFeeRateTab);
//		setStyle(specMccZh1Tab,specMccZhTab);
		setStyle(brandFeeFlagZh1Tab,brandFeeFlagZhTab),
		setStyle(expectDateTab1,expectDateTab);
//		setStyle(ipFeeTypeZh1Tab,ipFeeTypeZhTab);setStyle(ipFeeRate1Tab,ipFeeRateTab);setStyle(ipTypeZh1Tab,ipTypeZhTab);
	}
}


var merAudit = function(record,id){
	if(!record){
		alert("请选择一条记录");
		return;
	}
	if ("0" != record.auditResult) {
		alert("审批已经完成，请不要重复审批！");
		return;
	}
	
	var baseInfoTab = $('#baseInfo'),acntInfoTab = $('#acntInfo'),riskInfoTab = $('#riskInfo'),rateInfoTab = $('#rateInfo'),
	otherInfoTab = $('#otherInfo');
	var titleInfo = "";
	if (record.modiModule=="00") { titleInfo="商户基本信息审核"; baseInfoTab.show(); acntInfoTab.hide(); riskInfoTab.hide(); rateInfoTab.hide(); otherInfoTab.hide();}
	else if (record.modiModule=="01") { titleInfo="商户帐户信息审核"; baseInfoTab.hide(); acntInfoTab.show(); riskInfoTab.hide(); rateInfoTab.hide(); otherInfoTab.hide();}
	else if (record.modiModule=="02") { titleInfo="商户风控信息审核"; baseInfoTab.hide(); acntInfoTab.hide(); riskInfoTab.show(); rateInfoTab.hide(); otherInfoTab.hide();}
	else if (record.modiModule=="03") { titleInfo="商户费率信息审核"; baseInfoTab.hide(); acntInfoTab.hide(); riskInfoTab.hide(); rateInfoTab.show(); otherInfoTab.hide();}
	else { alert("请选择编辑模块！"); return; }
	
	$('#form1').fillObject({obj:record});

	$.ajax({
		url		: 'findRealMerchantInfo.action',
		async	: false,
		data	: {jsonObject:$.toJSON(record)},
		success:function(data){
			if(data.success){
				merName1Tab.val(data.root[0].merName); merOutName1Tab.val(data.root[0].merOutName);
				enName1Tab.val(data.root[0].enName); enOutName1Tab.val(data.root[0].enOutName);
				mcc1Tab.val(data.root[0].mcc); areaCode1Tab.val(data.root[0].areaCode);
				licenseNo1Tab.val(data.root[0].licenseNo); licenseAddr1Tab.val(data.root[0].licenseAddr);
				taxNo1Tab.val(data.root[0].taxNo); certNo1Tab.val(data.root[0].certNo);
				personName1Tab.val(data.root[0].personName); personNo1Tab.val(data.root[0].personNo);
				address1Tab.val(data.root[0].address); area1Tab.val(data.root[0].area);
				posNum1Tab.val(data.root[0].posNum); merContact1Tab.val(data.root[0].merContact);
				merFax1Tab.val(data.root[0].merFax); merPhone1Tab.val(data.root[0].merPhone);
				merketPerson1Tab.val(data.root[0].merketPerson); foundedDate1Tab.val(data.root[0].foundedDate);
				monthRent1Tab.val($.changeDecimal(parseFloat(data.root[0].monthRent)/100)); sdGradeFlag1Tab.val(data.root[0].sdGradeFlag);
				personNoTypeDesc1Tab.val(data.root[0].personNoTypeDesc);
				
				accntBank1Tab.val(data.root[0].accntBank); accntName1Tab.val(data.root[0].accntName);accntNo1Tab.val(data.root[0].accntNo);
				accntType1Tab.val(data.root[0].accntTypeZh); depositFlag1Tab.val(data.root[0].depositFlagZh);
				bankName1Tab.val(data.root[0].bankName); bankNo1Tab.val(data.root[0].bankNo);
				accntNoPrivate1Tab.val(data.root[0].accntNoPrivate); accntNamePrivate1Tab.val(data.root[0].accntNamePrivate);
				accntBankPrivate1Tab.val(data.root[0].accntBankPrivate); spdFlag1Tab.val(data.root[0].spdFlagZh);
				cardPersonNo1Tab.val(data.root[0].cardPersonNo); bankAccntId1Tab.val(data.root[0].bankAccntId);
				liquidateFlag1Tab.val(data.root[0].liquidateFlagZh); bankBranchNo1Tab.val(data.root[0].bankBranchNo);
				accntBankNoPrivate1Tab.val(data.root[0].accntBankNoPrivate); accntBankCodePrivate1Tab.val(data.root[0].accntBankCodePrivate);
				bankBranchNo1Tab.val(data.root[0].bankBranchNo);
				cardPersonNoTypeDesc1Tab.val(data.root[0].cardPersonNoTypeDesc);
				accntBankPrivateDesc1Tab.val(data.root[0].accntBankPrivateDesc);
				bankBranchNoDesc1Tab.val(data.root[0].bankBranchNoDesc);
				
				
				busiBgtime1Tab.val(data.root[0].busiBgtime); busiEndtime1Tab.val(data.root[0].busiEndtime);
				creditSignZh1Tab.val(data.root[0].creditSignZh); tranLimit1Tab.val($.changeDecimal(parseFloat(data.root[0].tranLimit)/100));
				dayTranLimit1Tab.val($.changeDecimal(parseFloat(data.root[0].dayTranLimit)/100)); tranLimitParam1Tab.val(data.root[0].tranLimitParam);
				merRiskZh1Tab.val(data.root[0].merRiskZh);
				
				settlePeriod1Tab.val(data.root[0].settlePeriod); 
				feeStlmTypeZh1Tab.val(data.root[0].feeStlmTypeZh);
				feeRate1Tab.val($.changeDecimalThree(parseFloat(data.root[0].feeRate))); 
				feeVal1Tab.val($.changeDecimal(parseFloat(data.root[0].feeVal)));
				topValue1Tab.val($.changeDecimal(parseFloat(data.root[0].topValue))); 
//				outVisFeeRate1Tab.val($.changeDecimal(parseFloat(data.root[0].outVisFeeRate)));
//				specMccZh1Tab.val(data.root[0].specMccZh); 
				brandFeeFlagZh1Tab.val(data.root[0].brandFeeFlagZh);
				expectDateTab1.val(data.root[0].expectDate);
				tranLimitDebit1Tab.val($.changeDecimal(parseFloat(data.root[0].tranLimitDebit)/100));
				
				bizLicnoExpireDate1Tab.val(data.root[0].bizLicnoExpireDate);
				personNoExpireDate1Tab.val(data.root[0].personNoExpireDate);
				cardLicnoExpireDate1Tab.val(data.root[0].cardLicnoExpireDate);
//				ipTypeZh1Tab.val(data.root[0].ipTypeZh);
//				ipFeeTypeZh1Tab.val(data.root[0].ipFeeTypeZh);
//				ipFeeRate1Tab.val($.changeDecimalThree(parseFloat(data.root[0].ipFeeRate))); 
				
				
			}else{
				alert('操作失败 原因是'+ data.syserr);
				return;
			}
			

		}													
	});
	
	// 页面显示分转元的操作
//	$('#outVisFeeRate').val($.changeDecimal(parseFloat(record.outVisFeeRate)/1000));
	$('#tranLimit').val($.changeDecimal(parseFloat(record.tranLimit)/100));
	$('#dayTranLimit').val($.changeDecimal(parseFloat(record.dayTranLimit)/100));
	
	$('#feeRate').val($.changeDecimalThree(parseFloat(record.feeRate)/1000));
//	$('#ipFeeRate').val($.changeDecimalThree(parseFloat(record.ipFeeRate)/1000));
	$('#feeVal').val($.changeDecimal(parseFloat(record.feeVal)/100));
	$('#topValue').val($.changeDecimal(parseFloat(record.topValue)/100));
	
	$('#monthRent').val($.changeDecimal(parseFloat(record.monthRent)/100));
	$('#tranLimitDebit').val($.changeDecimal(parseFloat(record.tranLimitDebit)/100));
	compareInfo(record);

	$('#auditDialog').dialog("option","title",titleInfo);
	$('#auditDialog').dialog("option","buttons",
				{'通过' : function() {
					$('#auditResult').val("1");
					if ($.formValidator.pageIsValid('1')) {
						$.ajaxForm({
							formId : 'form1',
							url : "doAuditMerchantContorl.action",
							success : function(data) {
								if (data.success) {
									$('#table').flexModifyData(data.root[0]);
									$('#auditDialog').dialog('close');
									alert('商户审核成功！');
									$('#querybutton').trigger('click');
								} else {
									alert('更新失败 原因是'+ data.syserr);
								}
							}
						});
					} else {
						return false;
					}
				},
				'驳回' : function() {
					$('#auditResult').val("2");
					if ($.formValidator.pageIsValid('1')) {
						$.ajaxForm({
							formId : 'form1',
							url : "doAuditMerchant.action",
							success : function(data) {
								if (data.success) {
									$('#table').flexModifyData(data.root[0]);
									$('#auditDialog').dialog('close');
									alert('商户驳回成功！');
									$('#querybutton').trigger('click');
								} else {
									alert('更新失败 原因是'+ data.syserr);
								}
							}
						});
					} else {
						return false;
					}
				},
				'关闭' : function() {
					$(this).dialog('close');
				}
			});
	$('#auditDialog').dialog('open');
};
					
$('#table').flexigrid({ 
		url : 'findMerAudit.action',
		buttons : [
				{
					name : "信息审批",
					bclass : 'page_word',
					id : 'txt',
					onpress : merAudit
				}],
		width : 400,
		sort : "auditResult",											
		usepager : true,
		colModel : [ {
			display : '商户编号',												
			dataIndex : 'orgCode',
			align : 'center',
			sortable:true
		},{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '商户对外经营名称',												
			dataIndex : 'merOutName',											
			sortable:true
		},{
			display : '商户内别码（MCC）',											
			dataIndex : 'mcc',											
			sortable:true
		},{
			display : '商户类型',											
			dataIndex : 'mccZh',											
			sortable:true
		},{
			display : '修改内容',											
			dataIndex : 'modiModule',											
			sortable:true,
			decode:{'00':"基本信息",'01':"帐户信息",'02':"风控信息",'03':"费率信息",'04':'网点编号',noMatch:"未修改"}
		},{
			display : '最后修改时间',
			dataIndex : 'lastUptTime',
			render : function(record, value){
				var dt = "";
				if(value.length=='14'){
					 dt =value.substring(0, 4)+'-'+ value.substring(4,6)+'-'+value.substring(6,8)+' '+value.substring(8,10)+':'+value.substring(10,12)+':'+value.substring(12,14)  ;
				   return dt;
				}else{
					return dt;
					}
				},
			sortable:true	
		},{
			display : '审批时间',
			dataIndex : 'confTime',	
			render : function(record, value){
				var dt = "";
				if(value.length=='14'){
					 dt =value.substring(0, 4)+'-'+ value.substring(4,6)+'-'+value.substring(6,8)+' '+value.substring(8,10)+':'+value.substring(10,12)+':'+value.substring(12,14)  ;
				   return dt;
				}else{
					return dt;
					}
				},
			sortable:true
		},{
			display : '修改人',											
			dataIndex : 'lastUptAcc',											
			sortable:true
		},{
			display : '审批人',											
			dataIndex : 'confAcc',											
			sortable:true
		},{
			display : '修改审批状态',											
			dataIndex : 'auditResult',
			align : 'center',
			sortable:true,
			decode:{'0':"待审批",'1':"审批通过",'2':"审批失败",noMatch:"异常状态"}
		}]
	});
		
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
});

