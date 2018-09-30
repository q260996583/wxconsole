$(document).ready(function() {
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

$('#bankSelect').queryDialog({
 	width : 600,
 	height : 400,												
	flexigrid:{ 
			url : 'findAllBank.action',					
			width : 550,
			dir : "orgCode",
			sort:"orgCode",
			usepager : true,
			colModel : [ {
				display : '支付机构代码',
				width : 200,
				dataIndex : 'orgCode',
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

//上级选择机构按钮
$('#bankCode').click(function(){							
//	$('#bankId').val($('#orgCode').val());
	$('#bankSelect').dialog("option","title","支付机构信息");
	$('#bankSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#bankCode').val(data.orgCode);
//			$('#qbankName').val(data.bankName);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});

//$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});

$('#searchstatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});

$('#searchconfstatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_CONF_STAT',displayField:'codeName',valueField:'codeNo',blank:true});

//异步请求得到特费商户类型
$.ajax({
	type : 'POST',
	url : 'findSecCodeList.action?codeType=TID_STATUS',
	success : function(data) {
		if (data.success) {

			// 先清空下拉框的值再赋值
			var amerStatus = $("#status");
			var bmerStatus = $("#statusDetail");
			var cmerStatus = $("#statusDetail1");
			amerStatus.empty();
			bmerStatus.empty();
			amerStatus.append("<option value='' selected>" + '请选择' + "</option>");
			bmerStatus.append("<option value=''>" + '请选择' + "</option>");
			cmerStatus.append("<option value=''>" + '请选择' + "</option>");
			if (data.root.length > 0) {
				// 填充并回显
				for (var i = data.root.length-1; i >=0; i--) {
					var rt = data.root[i];
					amerStatus.append("<option value='" + rt.codeNo + "' >"
							+ rt.codeName + "</option>");
					bmerStatus.append("<option value='" + rt.codeNo + "'>"
							+ rt.codeName + "</option>");
					cmerStatus.append("<option value='" + rt.codeNo + "'>"
							+ rt.codeName + "</option>");
				}
			
			} else {
				amerStatus
						.append("<option value=' '> 数据库中没有终端类型可选</option>");
				bmerStatus
						.append("<option value=' '> 数据库中没有终端类型可选</option>");
				cmerStatus.append("<option value=' '> 数据库中没有终端类型可选</option>");
			}

		} else {
			alert('操作失败 原因是' + data.syserr);
		}
	}
});

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
	        {id:"bankCode",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:10,onerror:"银行长度在1-10个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "银行仅能输入数字，字母"}},
	        {id:"tid",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:8,onerror:"终端号长度在1-8个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "终端号仅能输入数字，字母"}},
	        {id:"mid",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:15,onerror:"商户号在1-15个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "商户号仅能输入数字，字母"}},
	        {id:"tidOut",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:8,onerror:"外部终端号在1-8个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "外部终端号仅能输入数字，字母"}},	       
	        {id:"tidOutStlm",formValidator:{empty:true}
	        	,inputValidator:{min:0,max:32,onerror:"外部终端对帐号在1-32个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "外部终端对帐号仅能输入数字，字母"}}
	       ,{id:"remark",formValidator:{empty:true}
       			,inputValidator:{min:0,max:200,onerror:"备注不能超过200个字"}}
	       ,{id:"status",formValidator:{empty:false},inputValidator:{min:1,max:10,onerror:"请选择状态"} }	
	        	
	   	];


$.someAuthentication(list);	

$('#addOuterTid').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});
$('#merOuterTidDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});
$('#tidkey').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 500,
	height : 200
});

//新增终端	
var newtid=function() {
	$('#formreset').click();
	$('#addOuterTid').dialog("option","title","新增外部终端");
//	$('#tid').attr('disabled',"false");
//	$('#mid').attr('disabled',"false");
//	$('#bankCode').attr('disabled',"false");
	$('#form1 :input').attr('disabled',false);
	$('#addOuterTid').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								
								$.ajaxForm({
											formId : 'form1',
											url : "addMerOuterTid.action",
											success : function(data) {
												if (data.success) {
													$('#addOuterTid').dialog('close');
													$('#querybutton').trigger('click');
													alert('新增外部终端成功');
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
	$('#addOuterTid').dialog('open');
};	

//编辑机构
var edittid= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
						
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	
	$('#tid').attr('disabled',"disabled").unFormValidator(false);
	$('#mid').attr('disabled',"disabled").unFormValidator(false);
	$('#bankCode').attr('disabled',"disabled").unFormValidator(false);
	
	$('#addOuterTid').dialog("option","title","编辑外部终端信息");
	$('#addOuterTid').dialog("option","buttons",
					{'更新' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doUpdateMerOuterTid.action",
											success : function(data) {
												if (data.success) {
													$('#addOuterTid').dialog('close');
													$('#querybutton').trigger('click');
													alert("外部终端更新成功");
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

	$('#addOuterTid').dialog('open');
};	
						

var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	$('#merOuterTidDetail').dialog("option","title","详细信息");
	$('#merOuterTidDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#merOuterTidDetail').dialog('open');
};


//删除终端
var shutdowntid = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认要删除该外部终端');
	if(able){
		$.ajax({url:'doDeleteMerOuterTid.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#table').refresh();
				}
				else{
					alert('删除失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};
//主密钥申请
var editHsmkey= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}	
	var status = record['status'];
	if(status!='01'){
		alert("只有启用的外部终端才能申请主秘钥。");
		return ;
	}
	$('#form3').fillObject({obj:record});
	
	$('#tidkey').dialog("option","title","外部终端主秘钥申请");
	$('#tidkey').dialog("option","buttons",
			{'确定' : function() {
					if (true) {
						var key = $('#key').val();
						var test = /^[A-Za-z0-9]+$/;
						if(key.length==32){
							alert("主秘钥长度只能是32个字");
							return ;
						}
						else if(!test.test(key)){
							alert("主秘钥只能是数字或者字母");
							return ;
						}
						$.ajaxForm({
									formId : 'form3',
									url : "doGetOuterTidKey.action",
									success : function(data) {
										if (data.success) {
											$('#tidkey').dialog('close');
											$('#table').refresh();
											alert('外部终端申请主秘钥成功');
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

	$('#tidkey').dialog('open');
};


//批结算签退签到
var  tidRegister= function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var status = record['status'];
	if(status!='01'){
		alert("只有启用的外部终端才能批结算签退签到");
		return ;
	}
	var able=confirm('确认该终端批结算签退签到?');
	if(able){
		$.ajax({url:'doOuterTidRegister.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('批结算成功');
					$('#table').refresh();
				}
				else{
					alert('申请批结算 失败原因是'+data.syserr);
				}												
			}
		});
	}
};


var updateRegister = function(record,id){
	var able=confirm('确认要批量签到?');
	if(able){
		$.ajax({url:'updateRegister.action',
			success:function(data){
				if(data.success){
					alert('批量签到成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};

$('#table').flexigrid({ 
		url : 'queryMerOuterTid.action',
		buttons : [
				{
					name : "新增",														
					show:'ROLE_OUTER_TID_ADD_CZ',
					bclass : 'page_add',
					id : 'txt',
					onpress : newtid
				},{
					separator : true
				}
				,{
					name : "编辑",
					show:'ROLE_TID_MN_EDIT_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :edittid
				},{
					separator : true
				},
				{
					name : "删除",
					show:'ROLE_OUTER_TID_DEL_CZ',
					bclass : 'page_word',
					id : 'txt',
					onpress : shutdowntid
				}
				,{
					name : "详细信息",
					bclass : 'page_excel',
					id : 'cel',
					onpress : viewtid
				},{
					separator : true
				}
				,{
					name : "终端主秘钥设置",
//					show:'ROLE_TID_MN_HSMKEY_CZ',
					bclass : 'page_word',
					id : 'txt',
					onpress :editHsmkey
				},{
					separator : true
				}
//				,{
//					name : "批结算签退签到",
//					show:'ROLE_TID_MN_STATUS_CZ',
//					bclass : 'page_word',
//					id : 'txt',
//					onpress : tidRegister
//				},{
//					separator : true
//				}
//				,
//				{
//					separator : true
//				}
//				,{
//					name : "批量签到",
//					show:'ROLE_TID_MN_CZ',
//					bclass : 'page_word',
//					id : 'txt',
//					onpress : updateRegister
//				},{
//					separator : true
//				}
				],
		 
		width : 400,
		dir : "desc",
		sort : "bankCode",											
		usepager : true,
		colModel : [ {
			display : '银行',												
			dataIndex : 'bankCode',
			align : 'center',
			sortable:true
		},{
			display : '终端号',												
			dataIndex : 'tid',											
			sortable:true
		},{
			display : '商户号',												
			dataIndex : 'mid',											
			sortable:true
		},{
			display : '外部终端号',											
			dataIndex : 'tidOut',											
			sortable:true
		},{
			display : '外部银行商户号',												
			dataIndex : 'merOutCode',											
			sortable:true
		},{
			display : '外部终端对帐号',											
			dataIndex : 'tidOutStlm',											
			sortable:true
		},{
			display : '终端状态',												
			dataIndex : 'statusZh',
			align : 'center'
		},
		{
			display : '秘钥状态',												
			dataIndex : 'keyStatusZh',
			align : 'center'
		},
		{
			display : '审核状态',												
			dataIndex : 'confStatZh',
			align : 'center'
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