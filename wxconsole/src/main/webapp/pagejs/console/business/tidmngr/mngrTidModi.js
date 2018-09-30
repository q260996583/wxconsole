$(document).ready(function() {


	$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#chargeType').ajaxSelect({url:'findSecCodeList.action?codeType=CHARGE_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#instStatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_INST_STATUS',displayField:'codeName',valueField:'codeNo',blank:false});
	$('#q_instStatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_INST_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#q_tidOwner').ajaxSelect({url:'findSecCodeList.action?codeType=TID_OWNER',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidBrand').ajaxSelect({url:'findSecCodeList.action?codeType=TID_BRAND',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidModel').ajaxSelect({url:'findSecCodeList.action?codeType=TID_MODEL',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#instRemark').ajaxSelect({url:'findSecCodeList.action?codeType=TID_COMM',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidType').ajaxSelect({url:'findSecCodeList.action?codeType=TID_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidType1').ajaxSelect({url:'findSecCodeList.action?codeType=TID_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	
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


$("#tidBrand").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 1,
	max : 50,
	onerror : "终端品牌长度在1-25个汉字之间"
});


$("#tidModel").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 1,
	max : 50,
	onerror : "终端型号长度在1-25个汉字之间"
});

$("#mid").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 5,
	max : 15,
	onerror : "商户号长度5-15位"
});

$("#monthFlowFee").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 1,
	max : 10,
	onerror : "最多输入10位数字"
}).regexValidator({
	regexp : "^[0-9]+(\.\[0-9]+)?$",
	onerror : "月流量费只能输入数字"
});

$("#person").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 50,
	onerror : "联系人长度在1-25个汉字之间"
});

$("#phone").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 20,
	onerror : "联系人电话长度在1-20位"
}).regexValidator({
	regexp : "^[0-9]*$",
	onerror : "联系人电话只能输入数字"
});


$("#workTime").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 60,
	onerror : "工作时间不得大于60位"
});

//wxb
$("#installTime").formValidator({
	empty : true,
	
}).inputValidator({
	min : 0,
	max : 60,
	
});

$("#address").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 200,
	onerror : "安装地址不得大于200位"
});

$("#version").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 10,
	onerror : "版本号不得大于10位"
});

$("#tranLimit").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 9,
	onerror : "单笔交易限额(万元)不得大于9位"
}).regexValidator({
	regexp : "^[0-9]+(\.\[0-9]+)?$",
	onerror : "单笔交易限额(万元)只能输入数字"
});
$("#snCode").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 50,
	onerror : "SN号长度在1-50个字符"
}).regexValidator({
	regexp : "^[0-9A-Za-z]*$",
	onerror : "SN号只能输入数字或字母"
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
$('#tidDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});
$('#tidstatus').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 500,
	height : 200
});

//编辑机构
var edittid= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
	if(record.status==99) {alert("注销的终端不能编辑") ;return false;}					
	if (record.preserve1 == "00") { alert("终端信息发生修改，请先审核！"); return false; }
	
	$('#editShow').show();
	$('#addShow').hide();
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	
	$('#tid').attr('disabled',"disabled");
	$('#mid').attr('disabled',"disabled");
	
	$('#addtid').dialog("option","title","编辑终端信息");
	$('#addtid').dialog("option","buttons",
					{'更新' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doUpdateTid.action",
											success : function(data) {
												if (data.success) {
													$('#table').flexModifyData(data.root[0]);
													$('#addtid').dialog('close');
													alert('终端更新成功');
													$('#querybutton').trigger('click');
												} else {
													alert('更新失败 原因是'
															+ data.syserr);
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

	$('#addtid').dialog('open');
};	
						


//新增终端	
var newtid=function() {
	$('#editShow').hide();
	$('#addShow').show();
	$('#tid').attr('disabled',"");
	$('#mid').attr('disabled',"");
	$('#formreset').click();
	$('#addtid').dialog("option","title","新增终端");
	$('#addtid').dialog("option","buttons",{
						'确定' : function() {
//							if($('#form1 [id=tidType]').val()=='02'){
//								var reserved1=$('#reserved1').val();
//								if(reserved1==''){
//									alert("无线终端的SIM卡号不能为空");
//									return false;
//								}
//								var patt=new RegExp("^[0-9]+$");
//								if(reserved1.length!=11||!patt.test(reserved1)){
//									alert("SIM卡号只能是11位数字");
//									return false;
//								}
//								if($('#form1 [id=chargeType]').val()!='1'&&$('#form1 [id=chargeType]').val()!='2'){
//									alert("无线终端的流量费必须向商户或者服务商收取");
//									return false;	
//								}
//								
//							}
//							
//							if($('#form1 [id=tidType]').val()=='01'){
//								if($('#form1 [id=chargeType]').val()!='0'){
//									alert("有线终端无需收取流量费");
//									return false;	
//								}
//							}
							var liquidateFlag=false;
							$.ajax({
								url		: 'findLiquidateFlagByMid.action',
								async	: false,
								data	: {"orgCode":$('#mid').val()},
								success:function(data){
									if(data.success){
										alert("该商户是清算到终端，无法通过前台添加，如需添加终端，请联系技术人员");
										liquidateFlag=true;
									}
								}													
							});
							//清算标识
							if(liquidateFlag) return false;
							
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddTid.action",
											success : function(data) {
												if (data.success) {
													$('#addtid').dialog('close');
													$('#table').flexAddData(data.root[0]);
													alert('新增终端成功');
													$('#querybutton').trigger('click');
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
	$('#addtid').dialog('open');
};	

$('#table').flexigrid({ 
		url : 'findtidModi.action',
		buttons : [
				{
					name : "编辑",														
					show:'ROLE_TID_MN_EDIT_CZ',
					bclass : 'page_add',
					id : 'txt',
					onpress : edittid
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "tid",											
		usepager : true,
		colModel : [ {
			display : '终端号',												
			dataIndex : 'tid',
			align : 'center',
			sortable:true
		}
		,{display:"外部商户号",dataIndex:"merOutCode",sortable:true}
		,{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '安装状态',												
			dataIndex : 'instStatusDesc',
			align : 'center',
			sortable:true
		}
		,{display:"安装时间",dataIndex:"installTime",align:"center",sortable:true}
		/*,{
			display : '当前批次号',											
			dataIndex : 'batchNo',											
			sortable:true
		}*/,{ display:"终端所属者",
			dataIndex:"tidOwnerDesc",
			align:"center",
			sortable:true}
		,{
			display : '终端状态',											
			dataIndex : 'tidStatusZh',
			align : 'center'
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
		}/*,{
			display : '服务商名称',											
			dataIndex : 'channelName',
			align : 'center'
		}*/
		/*,{
			display : '修改状态',											
			dataIndex : 'preserve1',
			align : 'center',
			decode:{'00':"已修改",noMatch:"未修改"}
		}*/]
	});
		
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	
	//wxb
	$("#instStatus").change(function(){
		var d = new Date();
	    var month = d.getMonth() + 1;
	    var strDate = d.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
		var str = d.getFullYear()+ month+strDate;
		var status=$("#instStatus").val();		
		if(status=="01"){
			$("#installTime").val(str);
		}		
	});
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
	
	
});