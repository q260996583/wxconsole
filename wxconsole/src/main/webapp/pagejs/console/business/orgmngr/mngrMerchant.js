$(document).ready(function() {
	
	$('#startTime').pickdate({dateFmt:"yyyyMMdd"});
	$('#endTime').pickdate({dateFmt:"yyyyMMdd"});
	
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

$('#merProdDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
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
				display : '类别',
				width : 100,
				dataIndex : 'mccGrpDesc',
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
				display : '服务代码',
				width : 200,
				dataIndex : 'channelCode',
				align : 'center',
				sortable:true
			}, {
				display : '服务名称',
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
$('#q_mccGrp').ajaxSelect({url:'findSecCodeList.action?codeType=MCC_GRP_DESC',displayField:'codeName',valueField:'codeNo',blank:true});
$('#q_mccGrpImp').ajaxSelect({url:'findSecCodeList.action?codeType=MCC_GRP_DESC',displayField:'codeName',valueField:'codeNo',blank:true});
$('#q_prodStatusd0').ajaxSelect({url:'findSecCodeList.action?codeType=D0_PROD_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
$('#q_salesChannel').ajaxSelect({url:'findSecCodeList.action?codeType=MER_SALES_CHANNEL',displayField:'codeName',valueField:'codeNo',blank:true});

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

$('#freePassword').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 400
});

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
	$('#personNoExpireDate').val(frmBSDate(record.personNoExpireDate));
	$('#cardLicnoExpireDate').val(frmBSDate(record.cardLicnoExpireDate));
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
//				   if($('#channgeRemark').val()==null||$('#channgeRemark').val()==""){
//					   alert('停机时必须填写停用描述！');
//					   return  false;
//				   }
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
//						if($('#result10').attr("checked")==true && $('#result20').attr("checked")==false){
//							if($('#channgeRemark').val()==null||$('#channgeRemark').val()==""){
//							alert('停用时必须填写停机描述！');
//							return;
//							}
//						}
						
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
						
//						$.ajaxForm({
//									formId : 'form3',
//									url : "doUpdateMerchantStatus.action",
//									success : function(data) {
//										if (data.success) {
//											$('#merchantstatus').dialog('close');
//											$('#table').refresh();
//											alert('修改成功');
//										} else {
//											alert('修改失败');
//										}
//									}
//								});
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
	if(able){
		record.status='99';
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

//免密
var  freePassword=function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	
	var bussBrhStatus = '';
	$('#form6').fillObject({obj:record});
	$('#form6 [type=radio]').attr('checked','');
	$('#result30,#result40').unbind("click");
	$('#result30,#result40').click(function(){
		   if(this.checked){
			   bussBrhStatus = this.value;
			   if(this.value=="开通"){
				   if(record.freePW=='开通'){
					   alert('只有在关闭状态下才能开通！');
					   return false;
				   }
			   }else if(this.value=="关闭"){	
				   if(record.freePW=='关闭'){
					   alert('只有在开通状态下才能关闭！');
					   return  false;
				   }
			   }
		   }
	});
	

	$('#form6 :input').trigger('blur');
	$('#freePassword').dialog("option","title","免密设置");
	$('#freePassword').dialog("option","buttons",
			{'修改' : function() {
					if (true) {
						if($('#result30').attr("checked")==false && $('#result40').attr("checked")==false){
							alert("请选择免密状态");
							return;
						}
//						if($('#result10').attr("checked")==true && $('#result20').attr("checked")==false){
//							if($('#channgeRemark').val()==null||$('#channgeRemark').val()==""){
//							alert('停用时必须填写停机描述！');
//							return;
//							}
//						}
						
						//封装修改的数据
						record.remark=$('#channgeRemark').val();
						record.freePW=bussBrhStatus;
						$.ajax({url:'doUpdateFreePWStat.action',
							data:{jsonObject:$.toJSON(record)},
							success:function(data){
								if(data.success){
									alert('修改成功');
									$('#table').refresh();
									$('#freePassword').dialog('close');
								}
								else{
									alert('修改失败 失败原因是'+data.syserr);
								}												
							}
						});
						
//						$.ajaxForm({
//									formId : 'form3',
//									url : "doUpdateMerchantStatus.action",
//									success : function(data) {
//										if (data.success) {
//											$('#merchantstatus').dialog('close');
//											$('#table').refresh();
//											alert('修改成功');
//										} else {
//											alert('修改失败');
//										}
//									}
//								});
					} else {
						return false;
					}
	
				},
				'关闭' : function() {
					$(this).dialog('close');
				}
			});

	$('#freePassword').dialog('open');
};

$('#table').flexigrid({ 
		url : 'findAllMerchant.action',
		buttons : [
//				{
//					name : "新增",														
//					show:'ROLE_MERCHANT_MN_ADD_CZ',
//					bclass : 'page_add',
//					id : 'txt',
//					onpress : newMerchant
//				},{
//					separator : true
//				},{
//					name : "编辑",
//					show:'ROLE_MERCHANT_MN_EDIT_CZ',
//					bclass : 'page_word',
//					id : 'cel',
//					onpress :editmerchant
//				},{
//					separator : true
//				},
				{
					name : "详细信息",
					bclass : 'page_excel',
					id : 'cel',
					onpress : view
				},{
					separator : true
				}
				,{name: "附件信息维护", show: 'ROLE_MERCHANT_MN_ATHMNG_CZ', bclass: 'page_word', id: 'txt', onpress: uploadAthBtn },{separator: true}
				,{
					name : "启用、停用修改",
					show:'ROLE_MERCHANT_MN_STATUS_CZ',
					bclass : 'page_word',
					id : 'txt',
					onpress : merchantstatus
				},{
					separator : true
				},
//				},{
//					name : "交易权限",
//					show:'ROLE_MERCHANT_MN_TRANS_GROUP_CZ',
//					bclass : 'page_word',
//					id : 'txt',
//					onpress : merchantTransGroup
//				},{
//					separator : true
//				},
				{
					name : "注销",
					show:'ROLE_MERCHANT_MN_STATUS_CZ',
					bclass : 'page_word',
					id : 'txt',
					onpress : shutdownmerchant
				},{
					separator : true
				}
				,{
					name : "免密",
					show:'ROLE_MERCHANT_MN_STATUS_CZ',
					bclass : 'page_word',
					id : 'txt',
					onpress : freePassword
				},{
					separator : true
				},{
					name : "产品详情",
					bclass : 'page_word',
					id : 'txt',
					onpress : merProdView
				},{
					separator : true
				}
				],
		dir : "desc",
		sort : "confTime",											
		usepager : true,
		colModel : [ {
			display : '服务名称',												
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
			display : '商户对外经营名称',												
			dataIndex : 'merOutName',											
			sortable:true
		},{
			display : '销售渠道',											
			dataIndex : 'salesChannelDesc',											
			sortable:true
		},{
			display : 'D0产品',											
			dataIndex : 'prodStatusd0Desc',											
			sortable:true
		},{
			display : 'MCC',											
			dataIndex : 'mcc',											
			sortable:true
		},{
			display : 'MCC描述',											
			dataIndex : 'mccZh',											
			sortable:true
		}
		,{ display: '审核时间', dataIndex: 'confTime', align: 'center',  render:fmtTime}
		,{ display: '商户类别(预期)', dataIndex: 'mccGrpImpDesc', align: 'center'}
		,{ display: '商户类别(结算)', dataIndex: 'mccGrpDesc', align: 'center'}
		,{ display: '借记费率(%)', dataIndex : 'debitRate', align : 'right', render:fmtRate4 }
		,{ display: '借记封顶费', dataIndex : 'debitMaxFee', align : 'right', render:fmtMoney }
		,{ display: '贷记费率(%)', dataIndex : 'creditRate', align : 'right', render:fmtRate4 }
		,{ display: '微信费率(%)', dataIndex : 'wechatPayRate', align : 'right', render:fmtRate4 }
		,{ display: '外卡费率(%)', dataIndex : 'outCardRate', align : 'right', render:fmtRate4 }
		,{ display: '支付宝费率(%)', dataIndex : 'alipayPayRate', align : 'right', render:fmtRate4 }
		
		,{
			display : '商户审批状态',												
			dataIndex : 'confStatusZh',
			align : 'center'
		},{
			display : '商户状态',											
			dataIndex : 'merStatusZh',
			align : 'center'
		}
		,{ display: '免密开关', dataIndex : 'freePW', align : 'center' }
		]
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
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("开始时间不能晚于结束时间！");
				return false;
			}
		}
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
});


var  merProdView = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var mer = new Object();
	mer.mid = record.mid;
	mer.productId = "0000002";
	$('#prodform :input').val('');
	$('#prodform :input').attr('disabled','disabled');
	$("#prodImg").attr('src','images/timg.jpg');
	$.ajax({url:'qryMerReviewAllInfo.action', type:'POST', dataType:'json', data:{jsonObject:$.toJSON(mer)}
	,success:function(data){
		if ( data.success ) {
			if ( data.root && data.root[0] && data.root[0].status ) {
				$('#prodform').fillObject({obj:data.root[0]});
				var prodSrc = "getRealMerProdImage.action?mid=" + record.mid + "&athType=MER_D0_PROD_PROT";
				$("#prodImg").attr('src',prodSrc);
				prodDtl(data.root[0]);
			} else {
				alert('未查询到审核信息. ');
			}
		} else {
			alert('操作失败 原因是'+ data.syserr); 
		}
	}});
};
function prodDtl(merProd) {
	$('#merProdDetail').dialog("option","title","产品详情");
	var buttonMap = {};
	if(merProd.status == '0') {
		buttonMap['暂停'] = prodStop;
	}
	if(merProd.status == '88') {
		buttonMap['恢复'] = prodRecovery;
	}
	buttonMap['取消'] = function() {
		$('#prodform :input').attr('disabled','');
		$(this).dialog('close');
	};
	$('#merProdDetail').dialog("option","buttons",buttonMap);
	$('#merProdDetail').dialog('open');
}
function prodStop() {
	if(!confirm("确认立刻暂停该商户D0结算产品？")) {
		return false;
	}
	$('#prodStatus').val('88');
	$.ajaxForm({
		formId : 'prodform',
		url : "doUpdateMerProd.action",
		success : function(data) {
			if (data.success) {
				$('#querybutton').trigger('click');
				$('#merProdDetail').dialog('close');
				alert('成功！');
			} else {
				alert('更新失败 原因是'+ data.syserr);
			}
		}
	});
}
function prodRecovery() {
	if(!confirm("确认立刻恢复该商户D0结算产品？")) {
		return false;
	}
	$('#prodStatus').val('0');
	$.ajaxForm({
		formId : 'prodform',
		url : "doUpdateMerProd.action",
		success : function(data) {
			if (data.success) {
				$('#querybutton').trigger('click');
				$('#merProdDetail').dialog('close');
				alert('成功！');
			} else {
				alert('更新失败 原因是'+ data.syserr);
			}
		}
	});
}
