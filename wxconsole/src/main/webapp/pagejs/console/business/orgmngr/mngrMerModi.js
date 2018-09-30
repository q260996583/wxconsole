$(document).ready(function() {

$("#bankSelect").queryDialog({width:600,height:400,flexigrid:{url:"findAllBank.action",width:550,dir:"bankId",sort:"bankId",usepager:true
,colModel:[
 {display:"支付机构代码",width:200,dataIndex:"orgCode",align:"center",sortable:true}
,{display:"支付机构名称",width:300,dataIndex:"bankName",align:"center"}
]}});
	
//上级选择机构按钮
$('#addBankCode').click(function() {            
	$('#bankSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#addBankCode').val(data.orgCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});

$("#merStatementsType").change(function () {
	if($('#merStatementsType').val() == "T1"){
		$('#a_merStatementsRate').val("");
	}
});  
$("#outMidSelect").queryDialog({width:600,height:400,flexigrid:{url:"findAllOutMid.action",width:550,dir:"merOutCode",sort:"merOutCode",usepager:true
,colModel:[
 {display:"外部商户号",width:200,dataIndex:"merOutCode",align:"center",sortable:true}
,{display:"外部商户名称",width:300,dataIndex:"cardAcceptName",align:"center"}
]}});

//上级选择机构按钮
$('#editMerOutCodeNew').click(function() { 
	var k =$('#editBankCode').val();
	$('#inputBankCode').val(k);
	$('#outMidSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#editMerOutCodeNew').val(data.merOutCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});

$("#accntBankNoSelect").queryDialog({width:600,height:400,flexigrid:{url:"findAccntBankNo.action",width:550,dir:"bankCode",sort:"bankCode",usepager:true
,colModel:[
 {display:"内部编号",width:200,dataIndex:"bankCode",align:"center",sortable:true}
,{display:"开户银行编号",width:200,dataIndex:"szdfBankCode",align:"center",sortable:true}
,{display:"开户银行名称",width:300,dataIndex:"szdfBankName",align:"center"}
]}});

$("#branchBankSelect").queryDialog({width:600,height:400,flexigrid:{url:"branchBankComobo.action",width:550,dir:"mcc",sort:"mcc",usepager:true
,colModel:[
 {display:"银行行号",dataIndex:"unionBankNo",width:80,align:"center",sortable:true}
,{display:"上级行号",dataIndex:"parentBankNo",width:80,align:"center",sortable:true}
,{display:"银行名称",dataIndex:"bankName",width:80,align:"center",sortable:true}
,{display:"银行地址",dataIndex:"address",width:80,align:"center",sortable:true}
]}});

//修改页面 开户行选择
$('#bankBranchNo').click(function() {
	$('#branchBankSelect').queryDialogOpen({
		clear : function() {
			$('#bankBranchNo').val('');
			$('#accntBankPrivate').val('');
			$('#bankBranchNoDesc').val('');
			$('#accntBankPrivateDesc').val('');
		},
		success : function(data) {
			if (data) {
				$('#bankBranchNo').val(data.unionBankNo);
				$('#accntBankPrivate').val(data.parentBankNo);
				$('#bankBranchNoDesc').val(data.bankName);
				$('#accntBankPrivateDesc').val(data.parentBankNoDesc);
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});

$('#accntBankCodePrivate').click(function() {
	$('#accntBankNoSelect').queryDialogOpen({
			clear : function() {
				$('#accntBankCodePrivate').val('');
			},
			success : function(data) {
			if (data) {
				$('#accntBankCodePrivate').val(data.bankCode);
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});

$('#tranLimitParam').ajaxSelect({url:'findNormalTxnGroup.action',displayField:'groupName',valueField:'groupNo',blank:true});

$.formValidator.initConfig({ onerror : function(msg) { alert(msg); } });

/*$("#merName").formValidator({validatorgroup:"1", onshow: "请输入服务商编码"})
.inputValidator({min:15, max:15, onerror:'服务商编码为15位数字'})   必填检测和长度检测
.regexValidator({regexp : "^999999999(?=.*[0-9]).{3}000$",onerror : "服务商号格式为 999999999 + 3位数字  + 000"});*/

$("#merName").formValidator({validatorgroup:"1", onshow: "请输入商户名称"})
.inputValidator({min:1, max:100, onerror:'商户名称必填且最大100字'});
$("#merOutName").formValidator({validatorgroup:"1", onshow: "请输入商户对外经营名称"})
.inputValidator({min:1, max:100, onerror:'商户对外经营名称必填且最大100字'});
$("#mcc").formValidator({validatorgroup:"1", onshow: "请输入商户类别号"})
.inputValidator({min:1, max:4, onerror:'商户类别号为4位数字'})
.regexValidator({regexp : "^[0-9]*$",onerror : "商户类别号为4位数字"});
$("#areaCode").formValidator({validatorgroup:"1", onshow: "请输入地区代码"})
.inputValidator({min:1, max:4, onerror:'地区代码为4位数字'})
.regexValidator({regexp : "^[0-9]*$",onerror : "地区代码为4位数字"});
$("#licenseNo").formValidator({validatorgroup:"1", onshow: "请输入营业执照统一社会信用代码码"})
.inputValidator({min:1, max:30, onerror:'营业执照统一社会信用代码码必填且最大30字符'})
.regexValidator({regexp : "^[0-9a-zA-Z]*$",onerror : "营业执照只能是字母或数字"});
$("#bizLicnoExpireDate").formValidator({validatorgroup:"1", onshow: "请输入营业执照有效期"})
.inputValidator({min:1, max:30, onerror:'营业执照有效期必填且最多30位'});
$("#licenseAddr").formValidator({validatorgroup:"1", onshow: "请输入营业执照注册地址"})
.inputValidator({min:1, max:200, onerror:'营业执照注册地址必填且最多200位'});
$("#personName").formValidator({validatorgroup:"1", onshow: "请输入商户法定代表人姓名"})
.inputValidator({min:1, max:30, onerror:'商户法定代表人姓名必填且最多30个字'});
$("#personNoExpireDate").formValidator({validatorgroup:"1", onshow: "请输入商户法定代表人证件有效期"})
.inputValidator({min:1, max:30, onerror:'商户法定代表人证件有效期必填且最多30位'});
$("#address").formValidator({validatorgroup:"1", onshow: "请输入商户装机地址"})
.inputValidator({min:1, max:200, onerror:'商户装机地址必填且最多200个字'});
$("#merContact").formValidator({validatorgroup:"1", onshow: "请输入商户联系人"})
.inputValidator({min:1, max:30, onerror:'商户联系人必填且最多30个字'});
$("#merPhone").formValidator({validatorgroup:"1", onshow: "请输入商户联系电话"})
.inputValidator({min:1, max:50, onerror:'商户联系电话必填且最多50个字'})
.regexValidator({regexp:"^[0-9]*$",onerror:"商户联系电话仅能输入数字"});
$("#monthRent").formValidator({validatorgroup:"1", onshow: "请输入月租金"})
.inputValidator({min:0, max:8, onerror:'月租金最多8位'})
.regexValidator({regexp:"^[0-9]*$",onerror:"月租金只能是数字"});
$("#accntNoPrivate").formValidator({validatorgroup:"1", onshow: "请输入商户账户号码"})
.inputValidator({min:1,max:30,onerror:"商户账户号码必填且最多30位"})
.regexValidator({regexp:"^[0-9]+$",onerror:"商户账户号码只能输入数字"});
$("#accntNamePrivate").formValidator({validatorgroup:"1", onshow: "请输入商户账户名称"})
.inputValidator({min:1,max:100,onerror:"商户账户名称不能为空且最多100位"});
$("#accntBankPrivate").formValidator({validatorgroup:"1", onshow: "请输入开户行总行号"})
.inputValidator({min:1,max:3,onerror:"开户行总行号必填且最多3位"})
.regexValidator({regexp:"^[0-9]*$",onerror:"开户行总行号只能是数字"});
$("#bankBranchNo").formValidator({validatorgroup:"1", onshow: "请输入开户行支行号"})
.inputValidator({min:1,max:16,onerror:"开户行支行号必填且最多16位"})
.regexValidator({regexp:"^[0-9]*$",onerror:"开户行支行号只能是数字"});
$("#accntBankNoPrivate").formValidator({validatorgroup:"1", onshow: "请输入开户行网点号"})
.inputValidator({min:0, max:20, onerror:'开户行网点号最多20位'})
.regexValidator({regexp:"^[0-9]*$",onerror:"开户行网点号只能是数字"});
$("#debitRate").formValidator({validatorgroup:"1", onshow: "请输入借记交易费率"})
.inputValidator({min:1,max:8,onerror:"手续费率必须填写"})
.regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#creditRate").formValidator({validatorgroup:"1", onshow: "请输入贷记交易费率"})
.inputValidator({min:1,max:8,onerror:"手续费率必须填写"})
.regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#debitMaxFee").formValidator({validatorgroup:"1", onshow: "请输入商户手续费封顶值"})
.inputValidator({min:0,max:11,onerror:"商户手续费封顶值(元)最多11个字"})
.regexValidator({regexp:"^\\d{0,8}(\\.\\d{0,2})?$",onerror:"0.00 =< 商户手续费封顶值(元) < 10000000.00"});
$("#wechatPayRate").formValidator({validatorgroup:"1", onshow: "请输入微信交易费率"})
.inputValidator({min:1,max:8,onerror:"手续费率必须填写"})
.regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#outCardRate").formValidator({validatorgroup:"1", onshow: "请输入外卡交易费率"})
.inputValidator({min:1,max:8,onerror:"手续费率必须填写"})
.regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#alipayPayRate").formValidator({validatorgroup:"1", onshow: "请输入支付宝交易费率"})
.inputValidator({min:1,max:8,onerror:"手续费率必须填写"})
.regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});

$('#foundedDate').pickdate({dateFmt:"yyyyMMdd"});
$('#busiBgtime').pickdate({dateFmt:"HH:mm:ss"});	
$('#busiEndtime').pickdate({dateFmt:"HH:mm:ss"});
$('#expectDate').pickdate({minDate:'%y-%M-#{%d}',dateFmt:"yyyyMMdd"});
$('#editStartDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
$('#editEndDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
$('#bizLicnoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#personNoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#cardLicnoExpireDate').pickdate({dateFmt:"yyyyMMdd"});

$('#creditSign').ajaxSelect({url:'findSecCodeList.action?codeType=CREDIT_SIGN',displayField:'codeName',valueField:'codeNo',blank:true});
$('#accntType').ajaxSelect({url:'findSecCodeList.action?codeType=ACCNT_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
$('#depositFlag').ajaxSelect({url:'findSecCodeList.action?codeType=DEPOSIT_FLAG',displayField:'codeName',valueField:'codeNo',blank:true});
$('#feeStlmType').ajaxSelect({url:'findSecCodeList.action?codeType=FEE_STLM_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
$('#merRisk').ajaxSelect({url:'findSecCodeList.action?codeType=MER_RISK',displayField:'codeName',valueField:'codeNo',blank:true});
$('#bankAccntId').ajaxSelect({url:'findBankInfo.action',displayField:'bankName',valueField:'bankAccntId',blank:false});
$('#personNoType').ajaxSelect({url:'findSecCodeList.action?codeType=CRD_TYPE',displayField:'codeName',valueField:'codeNo',blank:false});
$('#cardPersonNoType').ajaxSelect({url:'findSecCodeList.action?codeType=CRD_TYPE',displayField:'codeName',valueField:'codeNo',blank:false});
$('#mccGrp').ajaxSelect({url:'findSecCodeList.action?codeType=MCC_GRP_DESC',displayField:'codeName',valueField:'codeNo',blank:false});

$('#q_mccGrp').ajaxSelect({url:'findSecCodeList.action?codeType=MCC_GRP_DESC',displayField:'codeName',valueField:'codeNo',blank:true});
$('#q_mccGrpImp').ajaxSelect({url:'findSecCodeList.action?codeType=MCC_GRP_DESC',displayField:'codeName',valueField:'codeNo',blank:true});

$("#modiDialog").dialog({autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:800,height:600});
$("#merchantTransGroup").dialog({autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:500,height:200});
$("#accBankDialog").dialog({autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:500,height:200});

var isCanEdit = function(record){
	if (record.modiModule == "") { return true; }
	else if (record.modiModule == "00") { alert("商户基本信息发生修改，请先审核！"); return false; }
	else if (record.modiModule == "01") { alert("商户帐户信息发生修改，请先审核！"); return false; }
	else if (record.modiModule == "02") { alert("商户风控信息发生修改，请先审核！"); return false; }
	else if (record.modiModule == "03") { alert("商户费率信息发生修改，请先审核！"); return false; }
	else if (record.modiModule == "04") { alert("开户行网点信息发生修改，请先审核！"); return false; }
	else { return true; }
};

var merAudit = function(record,id){
	if (!isCanEdit(record)) { return;}
	var titleInfo = "";
	var modiModuleTab = $('#modiModule');
	
	var baseInfoTab = $('#baseInfo'),acntInfoTab = $('#acntInfo'),riskInfoTab = $('#riskInfo'),rateInfoTab = $('#rateInfo'),otherInfoTab = $('#otherInfo');

	if (modiModuleTab.val()=="00") { titleInfo="商户基本信息编辑"; baseInfoTab.show(); acntInfoTab.hide(); riskInfoTab.hide(); rateInfoTab.hide(); otherInfoTab.hide();}
	else if (modiModuleTab.val()=="01") { titleInfo="商户帐户信息编辑"; baseInfoTab.hide(); acntInfoTab.show(); riskInfoTab.hide(); rateInfoTab.hide(); otherInfoTab.hide();}
	else if (modiModuleTab.val()=="02") { titleInfo="商户风控信息编辑"; baseInfoTab.hide(); acntInfoTab.hide(); riskInfoTab.show(); rateInfoTab.hide(); otherInfoTab.hide();}
	else if (modiModuleTab.val()=="03") { titleInfo="商户费率信息编辑"; baseInfoTab.hide(); acntInfoTab.hide(); riskInfoTab.hide(); rateInfoTab.show(); otherInfoTab.hide();}
	else { alert("请选择编辑模块！"+modiResultTab.val()); return; }

	// 进行编辑时页面显示分转元的操作
	$('#tranLimit').val($.changeDecimal(parseFloat(record.tranLimit)/100));
	$('#dayTranLimit').val($.changeDecimal(parseFloat(record.dayTranLimit)/100));
	
	$('#feeRate').val($.changeDecimalThree(parseFloat(record.feeRate)/1000));
	$('#feeVal').val($.changeDecimal(parseFloat(record.feeVal)/100));
	$('#topValue').val($.changeDecimal(parseFloat(record.topValue)/100));
	
	$('#monthRent').val($.changeDecimal(parseFloat(record.monthRent)/100));
	$('#tranLimitDebit').val($.changeDecimal(parseFloat(record.tranLimitDebit)/100));
	
	$('#modiDialog').dialog("option","title",titleInfo);
	$('#modiDialog').dialog("option","buttons",
				{'确定' : function() {
					if($('#bankAccntId').val()=='14'){
						if($('#accntBankCodePrivate').val()=='' || $('#accntBankNoPrivate').val()==''){
							alert("开户行网点编号和开户银行编号不能为空");
							return false;
						}
					}
					if (!$('#bankBranchNo').val()||$('#bankBranchNo').val()=='') {
						alert("商户开户行号不能为空");
						return false;
					}
					if (!$('#accntBankPrivate').val()||$('#accntBankPrivate').val()=='') {
						alert("商户开户银行不能为空");
						return false;
					}
					//验证数字合法性,只能两位小数，整数位不能超过12为
					var checkNum = /^\d{0,12}(\.\d{0,2})?$/;
					var checkNumDate = /^\d{8}$/;
//					if($('#outVisFeeRate').val().length==0){
//						$('#outVisFeeRate').val('0');
//					}
//					else if(!checkNum.test($('#outVisFeeRate').val())){
//						alert("外卡手续费率(%)填写不正确");
//						return false;
//					}
					
					if($('#tranLimit').val().length==0){
						$('#tranLimit').val('0');
					}
					else if(!checkNum.test($('#tranLimit').val())){
						alert("非借记卡单笔交易限额(元)填写不正确");
						return false;
					}
					
					if($('#dayTranLimit').val().length==0){
						$('#dayTranLimit').val('0');
					}
					else if(!checkNum.test($('#dayTranLimit').val())){
						alert("日交易限额填写不正确");
						return false;
					}
					
					if($('#dayTranLimit').val().length==0){
						$('#dayTranLimit').val('0');
					}
					else if(!checkNum.test($('#dayTranLimit').val())){
						alert("日交易限额填写不正确");
						return false;
					}
					
					if($('#feeRate').val().length==0){
						$('#feeRate').val('0');
					}else if(!/^\d{0,5}(\.\d{0,3})?$/.test($('#feeRate').val())){
						alert("手续费率(%)填写不正确");
						return false;
					}
//					if($('#ipFeeRate').val().length==0){
//						$('#ipFeeRate').val('0');
//					}
//					else if(!/^\d{0,5}(\.\d{0,3})?$/.test($('#feeRate').val())){
//						alert("建行分期手续费率(%)填写不正确");
//						return false;
//					}
					
					if($('#feeVal').val().length==0){
						$('#feeVal').val('0');
					}
					else if(!checkNum.test($('#feeVal').val())){
						alert("手续费固定值(元)填写不正确");
						return false;
					}
					
					if($('#topValue').val().length==0){
						$('#topValue').val('0');
					} else if(!checkNum.test($('#topValue').val())){
						alert("手续费封顶值(元)填写不正确");
						return false;
					}
					
					// 借贷记费率
					if($('#debitRate').val().length==0) {
						$('#debitRate').val('0');
					} else if(!/^\d{0,2}(\.\d{0,4})?$/.test($('#debitRate').val())){
						alert("借记交易费率(%)填写不正确");
						return false;
					}
					if($('#creditRate').val().length==0) {
						$('#creditRate').val('0');
					} else if(!/^\d{0,2}(\.\d{0,4})?$/.test($('#creditRate').val())){
						alert("贷记记交易费率(%)填写不正确");
						return false;
					}
					if($('#debitMaxFee').val().length==0){
						$('#debitMaxFee').val('0');
					} else if(!checkNum.test($('#debitMaxFee').val())){
						alert("借记交易封顶费(元)填写不正确");
						return false;
					}
					//lxl 20161205 start
					if($('#wechatPayRate').val().length==0) {
						$('#wechatPayRate').val('0');
					} else if(!/^\d{0,2}(\.\d{0,4})?$/.test($('#wechatPayRate').val())){
						alert("微信交易费率(%)填写不正确");
						return false;
					}
					if($('#outCardRate').val().length==0) {
						$('#outCardRate').val('0');
					} else if(!/^\d{0,2}(\.\d{0,4})?$/.test($('#outCardRate').val())){
						alert("外卡交易费率(%)填写不正确");
						return false;
					}
					if($('#alipayPayRate').val().length==0) {
						$('#alipayPayRate').val('0');
					} else if(!/^\d{0,2}(\.\d{0,4})?$/.test($('#alipayPayRate').val())){
						alert("支付宝交易费率(%)填写不正确");
						return false;
					}
					//lxl 20161205 end
					if($('#monthRent').val().length==0){
						$('#monthRent').val('0');
					}
					else if(!checkNum.test($('#monthRent').val())){
						alert("月租金(元)填写不正确");
						return false;
					}
					
					if($('#tranLimitDebit').val().length==0){
						$('#tranLimitDebit').val('0');
					}
					else if(!checkNum.test($('#tranLimitDebit').val())){
						alert("借记卡单笔交易限额(元)填写不正确");
						return false;
					}
					
					if(modiModuleTab.val() =="03") {
						if($('#merStatementsType').val() == "T1"){
							$('#a_merStatementsRate').val("");
						}
						else if($('#merStatementsType').val() == "D0"){
							if($('#a_merStatementsRate').val() == ""){
								alert("垫资手续费不能为空当结算类型为D0");
								return false;
							}
							if($('#a_merStatementsRate').val() > 1 || $('#a_merStatementsRate').val() < 0.02){
								alert("垫资手续费不在正确范围");
								return false;
							}	
						}
						if(!checkNumDate.test($('#expectDate').val())){
							alert("请确认填写预期日期或预期日期格式是否正确");
							return false;
						}
					}else if(modiModuleTab.val()!="03"){
						$('#expectDate').val('');
					}
					var personNoType = $('#personNoType').val();
			   		var cardPersonNoType = $('#cardPersonNoType').val();
			   		var personNo = $('#personNo').val();
			   		var cardPersonNo = $('#cardPersonNo').val();
			   		var checkNum = /(^\d{15}$)|(^\d{17}([0-9]|X|x)$)/ ;
			   		if (!personNoType) {
			   	    	alert('法人证件类型必填');
			   	    	return false;
			   	    }
			   	 	if (!personNo) {
						alert('法人证件号必填');
				    	return false;
				    }
			   	 	if (personNoType == '1') {
				    	if (!checkNum.test(personNo)) {
				    		alert('法人证件号非法');
				    		return false;
				    	}
				    }
			   	 	if (accntType == '1') {
				   	 	if (!cardPersonNoType) {
				   	 		alert('商户开户人证件类型必填');
					    	return false;
					    }
				   	 	if (cardPersonNoType == '1') {
					    	if (!checkNum.test(cardPersonNo)) {
					    		alert('商户开户人证件号非法');
					    		return false;
					    	}
					    }
				   		if (!cardPersonNo) {
				   			alert('商户开户人证件号必填');
					    	return false;
					    }
			   	 	}
					// 将页面上填写的元为单位的金额重新转为分
					$('#tranLimit').val(parseFloat($('#tranLimit').val())*100);
					$('#dayTranLimit').val(parseFloat($('#dayTranLimit').val())*100);
					$('#feeRate').val(parseFloat($('#feeRate').val())*1000);
					$('#feeVal').val(parseFloat($('#feeVal').val())*100);
					$('#topValue').val(parseFloat($('#topValue').val())*100);
					$('#monthRent').val(parseFloat($('#monthRent').val())*100);
					$('#tranLimitDebit').val(parseFloat($('#tranLimitDebit').val())*100);
					
					if ($.formValidator.pageIsValid('1')) {
						$.ajaxForm({formId: 'form1', url: "doUpdateMerchant.action",
							success : function(data) {
								if (data.success) {
									$('#table').flexModifyData(data.root[0]);
									$('#modiDialog').dialog('close');
									alert('商户更新成功,请进行审核！');
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
	$('#modiDialog').dialog('open');
};

$("#addmerchantOut").dialog({autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:700,height:500});
$("#editmerchantOut").dialog({autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:700,height:500});

//新增外部商户号
var addOuterMer= function(record, id) {
	
	//清空文本框中的数据
	$('#addBankCode').val("");
	$('#addMerOutCode').val("");
	
	$('#addmerchantOut').dialog("option","title","新增外部商户号");
	$('#addmerchantOut').dialog("option","buttons",{
		'确定' : function() {
			var newOutMerId = $('#addBankCode').val();;
			if(newOutMerId=='1230000001'){
				alert("不能新增银联对应的外部商户号！");
				return ;
			}
			
			if ($.formValidator.pageIsValid('1')) {
				$.ajaxForm({
							formId : 'addouterForm',
							url : "doAddMerchantOut.action",
							success : function(data) {
								if (data.success) {
									$('#addmerchantOut').dialog('close');
//									$('#table').flexAddData(data.root[0]);
									$('#outerMertable').refreshWithData(data);
									alert('新增外部商户号成功');
									
								} else {
									alert(data.syserr);
								}
							}
						});
			} else {
				return false;
			}

		},
		'关闭' : function() {$(this).dialog('close');}
	});
	$('#addmerchantOut').dialog('open');
};
//修改外部商户号
var editouterMer= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var newOutMerId = record.bankCode;
	/*if(newOutMerId=='1230000001'){
		alert("银联对应的外部商户号不能修改！");
		return ;
	}*/
	$('#editmerchantOut').fillObject({obj:record});
	$('#editMerOutCodeNew').val(record.merOutCode);
	$('#editmerchantOut').dialog("option","title","修改外部商户转换关系");
	$('#editmerchantOut').dialog("option","buttons",{
		'确定' : function() {
			
			var startDate = $('#editStartDate').val();
			var endDate = $('#editEndDate').val();

			if(!startDate){
				alert("起效清算日不能为空");
				return;
			}
			if(!endDate){
				alert("失效清算日不能为空");
				return;
			}
			if ($.formValidator.pageIsValid('1')) {
				$.ajaxForm({
							formId : 'editouterForm',
							url : "doUpdOuterMer.action",
							success : function(data) {
								if (data.success) {
									$('#editmerchantOut').dialog('close');
//									$('#table').flexAddData(data.root[0]);
									$('#outerMertable').refreshWithData(data);
									alert('修改外部商户转换关系成功');
								} else {
									alert(data.syserr);
								}
							}
						});
			} else {
				return false;
			}

		},
		'关闭' : function() {$(this).dialog('close');}
	});
	$('#editmerchantOut').dialog('open');
};
//删除外部商户号
var deleteOuterMer= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var newOutMerId = record.bankCode;
	if(newOutMerId=='1230000001'){
		alert("银联对应的外部商户号不能删除！");
		return ;
	}
	var able=confirm('确认删除该外部商户号');
	if(able){
		$.ajax({url:'doDelOuterMer.action', data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					$('#outerMertable').refreshWithData(data);
					alert('删除成功');
				}
				else{
					alert('删除失败 失败原因是'+data.syserror);
				}												
			}
		});
	}
};

//交易权限
var merchantTransGroup= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}	
	$('#form5').fillObject({obj:record});

	$('#merchantTransGroup').dialog("option","title","交易权限");
	$('#merchantTransGroup').dialog("option","buttons",{
		'确定': function() {
			if(!$('#tranLimitParam').val()){ alert("请选择商户交易权限组"); return; }
			$.ajaxForm({formId : 'form5', url : "doUpdateMerchantTransGroup.action",
				success : function(data) {
					if (data.success) {
						$('#merchantTransGroup').dialog('close');
						$('#table').refresh();
						alert('操作成功');
					} else {
						alert(data.syserr);
					}
				}
			});
		},'关闭' : function() {$(this).dialog('close'); }
	});

	$('#merchantTransGroup').dialog('open');
};



//开户行网点编辑
var accntBank= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}	
	if (!isCanEdit(record)) { return;}
	$('#form2').fillObject({obj:record});
	$('#accBankDialog').dialog("option","title","开户行网点编辑");
	$('#accBankDialog').dialog("option","buttons",{
		'确定' : function() {
			$.ajaxForm({formId: 'form2', url: "updateAccntBankNo.action",
				success: function(data) {
					if (data.success) {
						$('#table').flexModifyData(data.root[0]);
						$('#accBankDialog').dialog('close');
						alert('商户更新成功,请进行审核！');
						$('#querybutton').trigger('click');
					} else {
						alert('更新失败 原因是'+ data.syserr);
					}
				}
			});
		}
		,'关闭': function() { $(this).dialog('close'); }
	});
	$('#accBankDialog').dialog('open');
};

$('#outerMertable').flexigrid({url: 'queryMerchantOut.action',
buttons: [
 {name:"新增",bclass:"page_add",id:"txt",onpress:addOuterMer},{separator:true}
,{name:"编辑",bclass:"page_edit",id:"cel",onpress:editouterMer},{separator:true}
,{name:"删除",bclass:"page_delete",id:"txt",onpress:deleteOuterMer},{separator:true}
],limit: 100, width: 400, checkbox: false, usepager: false
, colModel:[
 {display:"内部商户号",width:100,dataIndex:"merCode",align:"center"}
,{display:"支付机构号",width:100,dataIndex:"bankCode",align:"center"}
,{display:"支付机构名称",width:100,dataIndex:"bankName",align:"center"}
,{display:"外部商户号",width:100,dataIndex:"merOutCode",align:"center"}
,{display:"起效清算日",width:100,dataIndex:"startDate",align:"center"}
,{display:"失效清算日",width:100,dataIndex:"endDate",align:"center"}
,{display:"最后更新时间",width:100,dataIndex:"lastUpdTime",align:"center"}
]});	

$("#outerMertable").dialog({autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:750,height:550});
//维护外部商户号
var editOuterMerchant= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}	
	$('#addMerCode').val(record.orgCode);
	$('#editMerCode').val(record.orgCode);
	$.ajax({url:"queryMerchantOut.action",async:false,data:{jsonObject:$.toJSON(record)},success:function(data){$("#outerMertable").refreshWithData(data)}});
	
	$('#outerMertable').dialog("option","title","编辑外部商户号信息");
	$('#outerMertable').dialog("option","buttons",{'关闭': function(){$(this).dialog('close');}} );
	$('#outerMertable').dialog('open');
};

$("#table").flexigrid({url:"findMerchantForUpdate.action"
,buttons:[
  {name:"基本信息修改",show:"ROLE_MER_NOR_EDIT_CZ",bclass:"page_word",id:"txt",onpress:function(record,id){if(!record){alert("请选择一条记录");return}$("#form1").fillObject({obj:record});$("#modiModule").val("00");merAudit(record,id)}},{separator:true}
 ,{name:"帐户信息修改",show:"ROLE_MER_NOR_EDIT_CZ",bclass:"page_word",id:"txt",onpress:function(record,id){if(!record){alert("请选择一条记录");return}$("#form1").fillObject({obj:record});$("#modiModule").val("01");merAudit(record,id)}},{separator:true}
// ,{name:"风控信息修改",show:"ROLE_MER_NOR_EDIT_CZ",bclass:"page_word",id:"txt",onpress:function(record,id){if(!record){alert("请选择一条记录");return}$("#form1").fillObject({obj:record});$("#modiModule").val("02");merAudit(record,id)}},{separator:true}
 ,{name:"费率信息修改",show:"ROLE_MER_NOR_EDIT_CZ",bclass:"page_word",id:"txt",onpress:function(record,id){if(!record){alert("请选择一条记录");return}$("#form1").fillObject({obj:record});$("#modiModule").val("03");merAudit(record,id)}},{separator:true}
 ,{name:"维护外部商户号",show:"ROLE_MER_NOR_EDIT_CZ",bclass:"page_word",id:"cel",onpress:editOuterMerchant},{separator:true}
 ,{name:"交易权限(无需审核)",show:"ROLE_MERCHANT_MN_TRANS_GROUP_CZ",bclass:"page_word",id:"txt",onpress:merchantTransGroup},{separator:true}
],dir:"desc",sort:"orgCode",usepager:true
,colModel:[
  {display:"商户编号",dataIndex:"orgCode",align:"center",sortable:true}
 ,{display:"商户名称",dataIndex:"merName",sortable:true}
 ,{display:"商户对外经营名称",dataIndex:"merOutName",sortable:true}
 ,{display:"MCC",dataIndex:"mcc",sortable:true}
 ,{display:"MCC描述",dataIndex:"mccZh",sortable:true}
 ,{display:'商户类别(结算)', dataIndex: 'mccGrpDesc', align: 'center'}
 ,{display:'商户类别(预期)', dataIndex: 'mccGrpImpDesc', align: 'center'}
// ,{display:"外部商户号",dataIndex:"merOutCode",sortable:true}
 ,{display:"修改内容",dataIndex:"modiModule",sortable:true,decode:{"00":"基本信息","01":"帐户信息","02":"风控信息","03":"费率信息",noMatch:"未修改"}}
]});

$("#querybutton").click(function(){$.queryTable({formId:"queryForm",tableId:"table"})});		
//初始化查询;
$('#querybutton').trigger('click');

$("#mccSelect").queryDialog({width:600,height:400,flexigrid:{url:"findMccDesc.action",width:500,dir:"mcc",usepager:true
,colModel:[
 {display:"MCC",width:30,dataIndex:"mcc",align:"center"}
,{display:"描述",width:150,dataIndex:"mccDesc",align:"center"}
]}});

// MCC按钮
$('#mcc').click(function() {	
	$('#mccSelect').queryDialogOpen({
		success : function(data) {
			if (data) {
				$('#mcc').val(data.mcc);				
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
	
$("#areaCodeSelect").queryDialog({width:600,height:400,flexigrid:{url:"findAreaCodeList.action",width:500,dir:"codeNo",usepager:true
,colModel:[
 {display:"地区代码",width:200,dataIndex:"codeNo",align:"center"}
,{display:"地区描述",width:300,dataIndex:"codeName",align:"center"}
]}});

// 地区代码按钮
$('#areaCode').click(function() {	
	$('#areaCodeSelect').queryDialogOpen({
		success : function(data) {
			if (data) {
				$('#areaCode').val(data.codeNo);
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
});