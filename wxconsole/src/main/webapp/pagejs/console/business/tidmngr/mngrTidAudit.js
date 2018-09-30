$(document).ready(function() {


	$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidType').ajaxSelect({url:'findSecCodeList.action?codeType=TID_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#chargeType').ajaxSelect({url:'findSecCodeList.action?codeType=CHARGE_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
//	$('#confStat').ajaxSelect({url:'findSecCodeList.action?codeType=TID_CONF_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	
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
					display : '服务商代码',
					width : 200,
					dataIndex : 'channelCode',
					align : 'center',
					sortable:true
				}, {
					display : '服务商名称',
					width : 300,
					dataIndex : 'channelName',
					align : 'center'
				}]
			}
	});
	
	$('#qChanName').click(function() {
		$('#channelSelect').queryDialogOpen({
				success : function(data) {
				if (data) {
					$('#qChanCode').val(data.channelCode);
					$('#qChanName').val(data.channelName);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});
	
	$('#merchantSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllMerchant.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				colModel : [ {
					display : '商户代码',
					width : 200,
					dataIndex : 'orgCode',
					align : 'center',
					sortable:true
				}, {
					display : '商户名称',
					width : 300,
					dataIndex : 'merName',
					align : 'center'
				}]
			}
});

//上级选择机构按钮
$('#qmerName').click(function(){
	//$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({
		success:function(data){
		if(data){
			$('#qmid').val(data.orgCode);
			$('#qmerName').val(data.merName);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});

//上级选择机构按钮
$('#mid').click(function(){							
	$('#mid').val($('#orgCode').val());
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#mid').val(data.orgCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});



$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

$('#addtid').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});


//终端基本信息
var tid1Tab = $('#tid1'),tidBrand1Tab = $('#tidBrand1'),tidModel1Tab = $('#tidModel1'),
tidTypeZh1Tab = $('#tidTypeZh1'),mid1Tab = $('#mid1'),monthFlowFee1Tab = $('#monthFlowFee1'),
person1Tab = $('#person1'),phone1Tab = $('#phone1'),workTime1Tab = $('#workTime1'),
address1Tab = $('#address1'),version1Tab = $('#version1'),tranLimit1Tab = $('#tranLimit1'),
signPerm1Tab = $('#signPerm1'),queryPerm1Tab = $('#queryPerm1'),consumPerm1Tab = $('#consumPerm1'),
conRevoPerm1Tab = $('#conRevoPerm1'),reversalPerm1Tab = $('#reversalPerm1'),settlePerm1Tab = $('#settlePerm1'),
returnPerm1Tab = $('#returnPerm1'),preAuthPerm1Tab = $('#preAuthPerm1'),chargeTypeZh1Tab=$('#chargeTypeZh1');


var tidTab = $('#tid'),tidBrandTab = $('#tidBrand'),tidModelTab = $('#tidModel'),
tidTypeZhTab = $('#tidTypeZh'),midTab = $('#mid'),monthFlowFeeTab = $('#monthFlowFee'),
personTab = $('#person'),phoneTab = $('#phone'),workTimeTab = $('#workTime'),
addressTab = $('#address'),versionTab = $('#version'),tranLimitTab = $('#tranLimit'),
signPermTab = $('#signPerm'),queryPermTab = $('#queryPerm'),consumPermTab = $('#consumPerm'),
conRevoPermTab = $('#conRevoPerm'),reversalPermTab = $('#reversalPerm'),settlePermTab = $('#settlePerm'),
returnPermTab = $('#returnPerm'),preAuthPermTab = $('#preAuthPerm'),reserved1Tab=$('#reserved1'),chargeTypeZhTab=$('#chargeTypeZh');



function setStyle(tab1Cell,tabCell){
		if(tab1Cell.val() == tabCell.val()){ 
			tabCell.css("color","black");tabCell.css("border","1px solid #99bbe8"); }
		else{ tabCell.css("color","red");tabCell.css("border","1px solid red");}
}

function compareInfo(){
	setStyle(tid1Tab,tidTab);setStyle(tidBrand1Tab,tidBrandTab);setStyle(tidModel1Tab,tidModelTab);setStyle(tidTypeZh1Tab,tidTypeZhTab);
	setStyle(mid1Tab,midTab);setStyle(monthFlowFee1Tab,monthFlowFeeTab);setStyle(person1Tab,personTab);setStyle(phone1Tab,phoneTab);
	setStyle(workTime1Tab,workTimeTab);setStyle(address1Tab,addressTab);setStyle(version1Tab,versionTab);setStyle(tranLimit1Tab,tranLimitTab);
	setStyle(signPerm1Tab,signPermTab);setStyle(queryPerm1Tab,queryPermTab);setStyle(consumPerm1Tab,consumPermTab);
	setStyle(conRevoPerm1Tab,conRevoPermTab);setStyle(reversalPerm1Tab,reversalPermTab);setStyle(settlePerm1Tab,settlePermTab);
	setStyle(returnPerm1Tab,returnPermTab);setStyle(preAuthPerm1Tab,preAuthPermTab);
	setStyle(chargeTypeZh1Tab,chargeTypeZhTab);
}

//审批
var edittid= function(record, id) {
	if (record.tid==null) {
		alert("请选择一条记录");
		return;
	}			
		
	if ("01" != record.confStat) {
		alert("审批已经完成，请不要重复审批！");
		return;
	}
	var titleInfo="";
	var tidAddTab=$('#tidAddAudit');
	var tidUpateTab=$('#tidUpdateAudit');
	if(record.preserve2=="00") {tidAddTab.show(); tidUpateTab.hide();titleInfo="新增终端审核";}
	else if(record.preserve2=="01") {tidUpateTab.show(); tidAddTab.hide();titleInfo="终端编辑审核";}
	else{alert("请选择一条记录！"); return; }
	
	$('#form1').fillObject({obj:record});	
	
	if(record.preserve2=="01"){
			$.ajax({
				url		: 'findRealTid.action',
				async	: false,
				data	: {jsonObject:$.toJSON(record)},
				success:function(data){
					if(data.success){
						tid1Tab.val(data.root[0].tid);tidBrand1Tab.val(data.root[0].tidBrand); 
						tidModel1Tab.val(data.root[0].tidModel); tidTypeZh1Tab.val(data.root[0].tidTypeZh); 
						mid1Tab.val(data.root[0].mid); monthFlowFee1Tab.val(data.root[0].monthFlowFee); 
						person1Tab.val(data.root[0].person); phone1Tab.val(data.root[0].phone); 
						workTime1Tab.val(data.root[0].workTime);address1Tab.val(data.root[0].address); 
						version1Tab.val(data.root[0].version); 
						tranLimit1Tab.val(data.root[0].tranLimit); 
						chargeTypeZh1Tab.val(data.root[0].chargeTypeZh);
					}else{
						alert('操作失败 原因是'+ data.syserr);
						return;
					}
				}													
			});
			
			//compareInfo();
		}

	
	$('#addtid').dialog("option","title",titleInfo);
	$('#addtid').dialog("option","buttons",
			{'通过' : function() {
				$('#confStat').val("02");
				$('#preserve2').val(record.preserve2);
				$.ajaxForm({
					formId : 'form1',
					url : "doTidAddAudit.action",
					success : function(data) {
						if (data.success) {
							$('#table').flexModifyData(data.root[0]);
							alert('商户审核成功！');
							$('#addtid').dialog('close');
							$('#querybutton').trigger('click');
						} else {
							alert('更新失败 原因是'+ data.syserr);
						}
					}
				});
			},
			'驳回' : function() {
				$('#confStat').val("03");
					$.ajaxForm({
						formId : 'form1',
						url : "doTidAddAudit.action",
						success : function(data) {
							if (data.success) {
								$('#table').flexModifyData(data.root[0]);
								alert('商户驳回成功！');
								$('#addtid').dialog('close');
								$('#querybutton').trigger('click');
							} else {
								alert('更新失败 原因是'+ data.syserr);
							}
						}
					});
			},
			'关闭' : function() {
				$(this).dialog('close');
			}
		});

	$('#addtid').dialog('open');
};	
						

$('#table').flexigrid({ 
		url : 'findtidAudit.action',
		buttons : [
					{
						name : "终端信息审批",														
						show:'ROLE_TID_INFO_AUDIT_BUT',
						bclass : 'page_add',
						id : 'txt',
						onpress : edittid
					}],
		width : 400,
		sort : "confStat",											
		usepager : true,
		colModel : [ {
			display : '终端号',												
			dataIndex : 'tid',
			align : 'center',
			sortable:true
		},{
			display : '商户编号',												
			dataIndex : 'mid',
			align : 'center',
			sortable:true
		},{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '终端类型',											
			dataIndex : 'tidTypeZh',											
			sortable:true
		},{
			display : '终端品牌',											
			dataIndex : 'tidBrand',											
			sortable:true
		},{
			display : '终端型号',												
			dataIndex : 'tidModel',											
			sortable:true
		},{
			display : '当前批次号',											
			dataIndex : 'batchNo',											
			sortable:true
		},{
			display : '终端状态',											
			dataIndex : 'tidStatusZh',
			align : 'center'
		},{
			display : '服务商名称',											
			dataIndex : 'channelName',
			align : 'center'
		},{
			display : '修改人',											
			dataIndex : 'lastUptAcc',											
			sortable:true
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
			display : '审批人',											
			dataIndex : 'confAcc',											
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
			display : '修改审批状态',											
			dataIndex : 'confStat',
			align : 'center',
			sortable:true,
			decode:{'00':"草稿",'01':"待审批",'02':"审批通过",'03':"驳回",noMatch:"异常状态"}
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