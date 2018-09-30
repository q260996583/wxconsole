$(document).ready(function() {

	$('#startTime').pickdate({dateFmt:"yyyyMMdd"});	
	$('#endTime').pickdate({dateFmt:"yyyyMMdd"});

	$('#tidBrand1').ajaxSelect({url:'findSecCodeList.action?codeType=TID_BRAND',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidModel1').ajaxSelect({url:'findSecCodeList.action?codeType=TID_MODEL',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#instRemark').ajaxSelect({url:'findSecCodeList.action?codeType=TID_COMM',displayField:'codeName',valueField:'codeNo',blank:true});
	
	$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidType').ajaxSelect({url:'findSecCodeList.action?codeType=TID_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#chargeType').ajaxSelect({url:'findSecCodeList.action?codeType=CHARGE_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#instStatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_INST_STATUS',displayField:'codeName',valueField:'codeNo',blank:false});
	$('#q_instStatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_INST_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#q_tidOwner').ajaxSelect({url:'findSecCodeList.action?codeType=TID_OWNER',displayField:'codeName',valueField:'codeNo',blank:true});

	
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
$('#mid1').click(function(){							
	$('#mid').val($('#orgCode').val());
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#mid1').val(data.orgCode);
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


$("#tidBrand1").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 1,
	max : 50,
	onerror : "终端品牌长度在1-25个汉字之间"
});


$("#tidModel1").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 1,
	max : 50,
	onerror : "终端型号长度在1-25个汉字之间"
});

$("#mid1").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 5,
	max : 15,
	onerror : "商户号长度5-15位"
}).regexValidator({
	regexp : "^[0-9]*$",
	onerror : "商户号只能输入数字"
});

$("#monthFlowFee1").formValidator({
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

$("#person1").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 50,
	onerror : "联系人长度在1-25个汉字之间"
});

$("#phone1").formValidator({
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


$("#workTime1").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 60,
	onerror : "工作时间不得大于60位"
});

$("#address1").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 200,
	onerror : "安装地址不得大于200位"
});

$("#version1").formValidator({
	empty : true,
	oncorrect : "输入正确"
}).inputValidator({
	min : 0,
	max : 10,
	onerror : "版本号不得大于10位"
});

$("#snCode1").formValidator({
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
						
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	
	$('#tid1').attr('disabled',"disabled").unFormValidator(false);
	$('#mid1').attr('disabled',"disabled").unFormValidator(false);
	
    $('#form1 [type=checkbox]').attr("checked","");
    if (record.tidAuth.substr(0,1) == 1)
		$('#form1 [name=signPerm]').attr("checked","checked");
	if (record.tidAuth.substr(1,1) == 1)
		$('#form1 [name=queryPerm]').attr("checked","checked");
	if (record.tidAuth.substr(2,1) == 1)
		$('#form1 [name=consumPerm]').attr("checked","checked");
	if (record.tidAuth.substr(3,1) == 1)
		$('#form1 [name=conRevoPerm]').attr("checked","checked");
	if (record.tidAuth.substr(4,1) == 1)
		$('#form1 [name=reversalPerm]').attr("checked","checked");
	if (record.tidAuth.substr(5,1) == 1)
		$('#form1 [name=settlePerm]').attr("checked","checked");
	if (record.tidAuth.substr(6,1) == 1)
		$('#form1 [name=returnPerm]').attr("checked","checked");
	if (record.tidAuth.substr(7,1) == 1)
		$('#form1 [name=preAuthPerm]').attr("checked","checked");
	
	$('#addtid').dialog("option","title","编辑终端信息");
	$('#addtid').dialog("option","buttons",
					{'更新' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doUpdateTid.action",
											dealData : function(data) {
												data.signPerm = ($('#form1 [name=signPerm]').attr("checked") ? "1": "0");
												data.queryPerm = ($('#form1 [name=queryPerm]').attr("checked") ? "1": "0");
												data.consumPerm = ($('#form1 [name=consumPerm]').attr("checked") ? "1": "0");
												data.conRevoPerm = ($('#form1 [name=conRevoPerm]').attr("checked") ? "1": "0");
												data.reversalPerm = ($('#form1 [name=reversalPerm]').attr("checked") ? "1": "0");
												data.settlePerm = ($('#form1 [name=settlePerm]').attr("checked") ? "1": "0");
												data.returnPerm = ($('#form1 [name=returnPerm]').attr("checked") ? "1": "0");
												data.preAuthPerm = ($('#form1 [name=preAuthPerm]').attr("checked") ? "1": "0");
											},
											success : function(data) {
												if (data.success) {
													$('#table').flexModifyData(data.root[0]);
													$('#addtid').dialog('close');
													alert('终端更新成功');
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
						

//启用、停用申请
var tidstatus= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}	
	$('#form3').fillObject({obj:record});
	$('#form3 [type=radio]').attr('checked','');
	$('#result02,#result01').unbind("click");
	$('#result02,#result01').click(function(){
		   if(this.checked){
			   if(this.value=="01"){
				   if(record.status!='00' && record.status!='02'){
					   alert('只有在未启用、停用状态下，才允许启用！');
					   return false;
				   }
			   }else if(this.value=="02"){	
				   if(record.status!='01'){
					   alert('只有在启用状态下，才允许提交停用');
					   return  false;
				   }
			   }
		   }
	});

	$('#form3 :input').trigger('blur');
	$('#tidstatus').dialog("option","title","启用、停用");
	$('#tidstatus').dialog("option","buttons",
			{'确定' : function() {
					if (true) {
						if($('#result01').attr("checked")==false && $('#result02').attr("checked")==false){
							alert("请选择终端状态");
							return;
						}
						$.ajaxForm({
									formId : 'form3',
									url : "doUpdateTidStatus.action",
									success : function(data) {
										if (data.success) {
											$('#tidstatus').dialog('close');
											$('#table').refresh();
											alert('操作成功');
										} else {
											alert(data.syserr);
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

	$('#tidstatus').dialog('open');
};

var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 [type=checkbox]').attr("checked","");
    if (record.tidAuth.substr(0,1) == 1)
		$('#form2 [name=qsignPerm]').attr("checked","checked");
	if (record.tidAuth.substr(1,1) == 1)
		$('#form2 [name=qqueryPerm]').attr("checked","checked");
	if (record.tidAuth.substr(2,1) == 1)
		$('#form2 [name=qconsumPerm]').attr("checked","checked");
	if (record.tidAuth.substr(3,1) == 1)
		$('#form2 [name=qconRevoPerm]').attr("checked","checked");
	if (record.tidAuth.substr(4,1) == 1)
		$('#form2 [name=qreversalPerm]').attr("checked","checked");
	if (record.tidAuth.substr(5,1) == 1)
		$('#form2 [name=qsettlePerm]').attr("checked","checked");
	if (record.tidAuth.substr(6,1) == 1)
		$('#form2 [name=qreturnPerm]').attr("checked","checked");
	if (record.tidAuth.substr(7,1) == 1)
		$('#form2 [name=qpreAuthPerm]').attr("checked","checked");
	$('#form2 :input').attr('disabled','disabled');
	$('#form2 :input.bt').attr('disabled','');
	$('#tidDetail').dialog("option","title","详细信息");
	$('#tidDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#tidDetail').dialog('open');
};

//新增终端	
var newtid=function() {
	$('#tid1').attr('disabled',"").unFormValidator(false);
	$('#mid1').attr('disabled',"").unFormValidator(false);
	$('#formreset').click();
	$('#addtid').dialog("option","title","新增终端");
	$('#addtid').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddTid.action",
											dealData : function(data) {
												data.signPerm = ($('#form1 [name=signPerm]').attr("checked") ? "1": "0");
												data.queryPerm = ($('#form1 [name=queryPerm]').attr("checked") ? "1": "0");
												data.consumPerm = ($('#form1 [name=consumPerm]').attr("checked") ? "1": "0");
												data.conRevoPerm = ($('#form1 [name=conRevoPerm]').attr("checked") ? "1": "0");
												data.reversalPerm = ($('#form1 [name=reversalPerm]').attr("checked") ? "1": "0");
												data.settlePerm = ($('#form1 [name=settlePerm]').attr("checked") ? "1": "0");
												data.returnPerm = ($('#form1 [name=returnPerm]').attr("checked") ? "1": "0");
												data.preAuthPerm = ($('#form1 [name=preAuthPerm]').attr("checked") ? "1": "0");
											},
											success : function(data) {
												if (data.success) {
													$('#addtid').dialog('close');
													$('#table').flexAddData(data.root[0]);
													alert('新增终端成功');
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
//注销终端
var shutdowntid = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认注销该终端');
	if(able){
		$.ajax({url:'doShutdownTid.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('注销成功');
					$('#table').refresh();
				}
				else{
					alert('注销失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

//主密钥申请
var editHsmkey = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认该终端主密钥申请?');
	if(able){
		$.ajax({url:'doUpdateTidHsmkey.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('申请成功');
					$('#table').refresh();
				}
				else{
					alert('申请失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

//重置主密钥锁定
var resetLock = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able = confirm('确认重置该终端主密钥锁定?');
	if(able){
		$.ajax({url:'doResetTmkLock.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('申请成功');
					$('#table').refresh();
				}
				else{
					alert('操作失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};
// 启用测试模式(主密钥可重复下载)
var enableTestModeTmkLock = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able = confirm('确认启用测试模式?');
	if(able){
		$.ajax({url:'doEnableTestModeTmkLock.action',
			data:{jsonObject:$.toJSON(record)},type:'POST',dataType:'json',
			success:function(data){
				if(data.success){
					alert('启用成功');
					$('#table').refresh();
				} else{
					alert('操作失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};
//启用测试模式(主密钥可重复下载)
var disableTestModeTmkLock = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able = confirm('确认停用测试模式(状态将会置为已锁定，可通过重置解锁)?');
	if(able){
		$.ajax({url:'doDisableTestModeTmkLock.action',
			data:{jsonObject:$.toJSON(record)},type:'POST',dataType:'json',
			success:function(data){
				if(data.success){
					alert('停用成功');
					$('#table').refresh();
				} else{
					alert('操作失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

//查看二维码  wxb
$('#previewBtn').click(function(){
	var tid = $("#form2 input[name=tid]").val();
	window.open("previewQrcode.action?tid="+tid);   //在新页面中打开二维码图片
	/*$.ajax({
		   type: "POST",
		   url: "previewQrcode.action?tid="+tid,	//请求的后台地址
		   data: {tid:tid},								//前台传给后台的参数
		   success: function(data){					//data:后台返回值
			   window.open("previewQrcode.action?tid="+tid);
		   },
		   error:function(data){
			   alert("该终端没有二维码");
		   }
		});*/
		
});

//下载二维码  wxb
$('#downLoadBtn').click(function(){
	var tid = $("#form2 input[name=tid]").val();
	var mid = $("#form2 input[name=mid]").val();
	window.open("downLoadQrcode.action?tid="+tid+"&mid="+mid);	
});
//新增二维码  wxb
$('#newQrcodeBtn').click(function(){
	//alert("新增！");
	var tid = $("#form2 input[name=tid]").val();
	var mid = $("#form2 input[name=mid]").val();
	$.ajax({
		url:'newQrcode.action',
		data:{tid:tid,mid:mid},
		type: 'POST',
		dataType:'json',	
		success:function(data){			
			if(data.success){
        		alert("新增成功！");
        	}else{
        		alert("该终端已有二维码");
        	}
		}
	});	
});



$("#table").flexigrid({url:"findAllTid.action",width:400,dir:"desc",sort:"tid",usepager:true
,buttons:[
	 {name:"详细信息",bclass:"page_excel",id:"cel",onpress:viewtid},{separator:true}
	,{name:"新增终端",show:"ROLE_TID_MN_ADD_CZ",bclass:"page_excel",id:"cel",onpress:newtid},{separator:true}
	,{name:"启用、停用",show:"ROLE_TID_MN_STATUS_CZ",bclass:"page_word",id:"txt",onpress:tidstatus},{separator:true}
	,{name:"注销",show:"ROLE_TID_MN_SHUTDOWN_CZ",bclass:"page_word",id:"txt",onpress:shutdowntid},{separator:true}
	,{name:"重置主密钥锁定",show:"ROLE_TID_RESET_HSM_LOCK",bclass:"page_word",id:"txt",onpress:resetLock}
	,{name:"启用测试模式",show:"ROLE_TID_ENABLE_TEST_MODE",bclass:"page_word",id:"txt",onpress:enableTestModeTmkLock}
	,{name:"停用测试模式",show:"ROLE_TID_DISABLE_TEST_MODE",bclass:"page_word",id:"txt",onpress:disableTestModeTmkLock}
	,{separator:true}
]
,colModel:[
	 {display:"终端号",dataIndex:"tid",align:"center",sortable:true}
	 ,{display:"外部商户号",dataIndex:"merOutCode",sortable:true}
	 ,{display:"商户名称",dataIndex:"merName",sortable:true}
	 ,{display:"对外商户名称",dataIndex:"merOutName",sortable:true}
	 ,{display:"主密钥锁定标识",dataIndex:"lockFlagDesc",align:"center"}
	 ,{display:"安装状态",dataIndex:"instStatusDesc",align:"center",sortable:true}
	 ,{display:"安装时间",dataIndex:"installTime",align:"center",sortable:true}          //wxb
	 ,{display:"终端所属者",dataIndex:"tidOwnerDesc",align:"center",sortable:true}
	 ,{display:"终端状态",dataIndex:"tidStatusZh",align:"center"}	 
	 ,{display:"终端类型",dataIndex:"tidTypeZh",sortable:true}
	 ,{display:"终端品牌",dataIndex:"tidBrand",sortable:true}
	 ,{display:"终端型号",dataIndex:"tidModel",sortable:true}
	//,{display:"当前批次号",dataIndex:"batchNo",sortable:true}
	//,{display:"终端审批状态",dataIndex:"confStatZh",align:"center"}	
	//,{display:"服务商名称",dataIndex:"channelName",align:"center"}
	
]});
		
	
	$('#querybutton').click(function(){
		//wxb
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
	$('#downFileExl').click(function(){
		var href="toDownMerTidFileExl.action?1=1";
		if($('#tid').val()){href+="&tid="+$('#tid').val();}
		if($('#tidBrand').val()){href+="&tidBrand="+encodeURI(encodeURI($('#tidBrand').val()));}
		if($('#tidModel').val()){href+="&tidModel="+encodeURI(encodeURI($('#tidModel').val()));}
		if($('#status').val()){href+="&tidStatus="+$('#status').val();}
		if($('#tidType').val()){href+="&tidType="+$('#tidType').val();}
		if($('#qChanCode').val()){href+="&channelCode="+$('#qChanCode').val();}
		if($('#qmid').val()){href+="&orgCode="+$('#qmid').val();}
		if($('#chargeType').val()){href+="&chargeType="+$('#chargeType').val();}
		if($('#reserved1').val()){href+="&reserved1="+$('#reserved1').val();}
		if($('#startTime').val()){href+="&startTime="+$('#startTime').val();}
		if($('#endTime').val()){href+="&endTime="+$('#endTime').val()+"245959";}//页面time格式'20170321      ', 数据库格式'20170214152603'
		if($('#snCode').val()){href+="&snCode="+$('#snCode').val();}
		if($('#q_instStatus').val()){href+="&instStatus="+$('#q_instStatus').val();}
		if($('#q_tidOwner').val()){href+="&tidOwner="+$('#tidOwner').val();}
		
		window.open(href);
	});	
	
});