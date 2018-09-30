$(document).ready(function() {

$('#supBrhIdSelect').queryDialog({width : 600, height : 400, 
		flexigrid:{ 
				url : 'findSupmerchant.action', 
				width : 550, dir : "brhId", sort:"brhId", usepager : true, colModel : [
				{display : '机构ID', width : 200, dataIndex : 'brhId', align : 'center', sortable:true},
 				{display : '机构名称', width : 300, dataIndex : 'brhNm', align : 'center'}
 			]
		}
});

//上级选择机构按钮
$('#supBrhId').click(function(){							
	$('#pbrhId').val($('#brhId').val());
	$('#supBrhIdSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#supBrhId').val(data.brhId);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});


$.formValidator.initConfig({onerror: function(msg) { alert(msg); } });

var list=[
{id:"brhId",formValidator:{empty:false}, inputValidator:{min:15,max:15,onerror:"机构号长度必须等于15位"}},
{id:"reserved1",formValidator:{empty:false}, inputValidator:{min:1,max:12,onerror:"简称字数在0-6个汉字之间"}},
{id:"supBrhId",formValidator:{empty:false}, inputValidator:{min:15,max:15,onerror:"上级机构号必须选择"}},
{id:"reservedIn",formValidator:{empty:true}, inputValidator:{min:0,max:22,onerror:"保留标志不得大于22位"}},
{id:"reportFlag",formValidator:{empty:false}, inputValidator:{min:0,max:22,onerror:"必须选择是否出表"}},
{id:"brhNm",formValidator:{empty:false}, inputValidator:{min:1,max:40,onerror:"机构名称不得为空不得大于20个汉字"}},
{id:"brhNmEn",formValidator:{empty:true}, inputValidator:{min:0,max:80,onerror:"机构英文名称不得大于60个字母"}},
{id:"brhAddr",formValidator:{empty:true}, inputValidator:{min:0,max:60,onerror:"机构地址不得大于30个汉字"}},
{id:"brhTel",formValidator:{empty:true}, inputValidator:{min:0,max:40,onerror:"机构电话不得大于40位"}},
{id:"brhFax",formValidator:{empty:true}, inputValidator:{min:0,max:60,onerror:"机构传真不得大于40位"}},
{id:"brhFax",formValidator:{empty:true}, inputValidator:{min:0,max:80,onerror:"Url地址不得大于80位"}},
{id:"brhAcctId",formValidator:{empty:true}, inputValidator:{min:0,max:60,onerror:"机构银行帐号不得大于60位"}},
{id:"brhKey",formValidator:{empty:true}, inputValidator:{min:0,max:3,onerror:"机构索引号不得大于3位"}},
{id:"dataKey",formValidator:{empty:true}, inputValidator:{min:0,max:32,onerror:"数据密钥不得大于32位"}},
{id:"macKey",formValidator:{empty:true}, inputValidator:{min:0,max:32,onerror:"MAC密钥不得大于32位"}},
{id:"reserved2",formValidator:{empty:true}, inputValidator:{min:0,max:20,onerror:"校验位不得大于20位"}},
{id:"misc",formValidator:{empty:true}, inputValidator:{min:0,max:60,onerror:"杂类项不得大于60位"}},
{id:"brhArea",formValidator:{empty:false}}
];


$.someAuthentication(list);	

$('#addchannel').dialog({
	autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : false, width : 800, height : 600
});

$('#channelstatus').dialog({
	autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : false, width : 500, height : 200
});

//编辑机构
var editchannel= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
						
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	$('#orgCode').attr('disabled',"disabled").unFormValidator(true);
    $('#form1 [type=checkbox]').attr("checked","");

	$('#addchannel').dialog("option","title","编辑服务商信息");
	$('#addchannel').dialog("option","buttons", {'更新' : function() {

			if ($.formValidator.pageIsValid('1')) {
				
				$.ajaxForm({
							formId : 'form1', url : "doUpdateChannel.action", dealData : function(data) {
								var brhType = "";
								brhType = brhType
										+ ($('#form1 [name=brh_type_zhifu]').attr("checked") ? "1": "0")
										+ ($('#form1 [name=brh_type_chuzhang]').attr("checked") ? "1": "0")
										+ ($('#form1 [name=brh_type_qudao]').attr("checked") ? "1": "0")
										+ ($('#form1 [name=brh_type_shanghu]').attr("checked") ? "1": "0");
								data.brhTypeCd = brhType;
								data.brhDenyIn='2';
							},
							success : function(data) {
								if (data.success) {
									if($('#form1 [name=brh_type_shanghu]').attr("checked")){
										var uploadfile=$('#upLoadfile').val();
										var str=$('#brhId').val();
										if(uploadfile != null && uploadfile != ''){
											var obj=$('form1').jsonObject();
											$.ajaxFileUpload({
												url:'doUploadCerFile.action?brhId='+str, secureuri:false, fileElementId:'upLoadfile', dataType:'json', data:{jsonObject:$.toJSON(obj)},
												success:function (data){
													if (!data.success) {
														alert(data.syserr);
													}
												}
											});		
										}												
									}
									$('#table').flexModifyData(data.root[0]);
									$('#addchannel').dialog('close');
									alert('服务商更新成功');
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

	$('#addchannel').dialog('open');
};	
						

//启用、停用申请
var channelstatus= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}	
	$('#form3').fillObject({obj:record});
	$('#form3 [type=radio]').attr('checked','');
	$('#result10,#result20').unbind("click");
	$('#result10,#result20').click(function(){
		   if(this.checked){
			   if(this.value=="01"){
				   if(record.status!='00'){
					   alert('只有在停用状态下，才允许提交启用申请！');
					   return false;
				   }
			   }else if(this.value=="00"){	
				   if(record.status!='01'){
					   alert('只有在启用状态下，才允许提交停用申请！');
					   return  false;
				   }
				   if($('#bussBrhRemark').val()==null||$('#bussBrhRemark').val()==""){
					   alert('停机时必须填写停用描述！');
					   return  false;
				   }
			   }
		   }
	});

	$('#form3 :input').trigger('blur');
	$('#channelstatus').dialog("option","title","启用、停用申请");
	$('#channelstatus').dialog("option","buttons", {'提交申请' : function() {
					if (true) {
						if($('#result10').attr("checked")==false && $('#result20').attr("checked")==false){
							alert("请选择机构状态");
							return;
						}
						if($('#result10').attr("checked")==true && $('#result20').attr("checked")==false){
							if($('#bussBrhRemark').val()==null||$('#bussBrhRemark').val()==""){
							alert('停用时必须填写停机描述！');
							return;
							}
						}
						$.ajaxForm({
									formId : 'form3', url : "doUpdatechannelStatus.action", success : function(data) {
										if (data.success) {
											$('#channelstatus').dialog('close');
											$('#table').refresh();
											alert('申请成功');
										} else {
											alert('申请失败');
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

	$('#channelstatus').dialog('open');
};

//新增机构	
var newchannel=function() {
	$('#brhId').attr('disabled',"").unFormValidator(false);
	$('#formreset').click();
	$('#addchannel').dialog("option","title","新增服务商");
	$('#addchannel').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1', url : "doAddChannel.action", dealData : function(data) {
												data.brhDenyIn='2';
												var brhType = "";
												brhType = brhType
												+ ($('#form1 [name=brh_type_zhifu]').attr("checked") ? "1": "0")
												+ ($('#form1 [name=brh_type_chuzhang]').attr("checked") ? "1": "0")
												+ ($('#form1 [name=brh_type_qudao]').attr("checked") ? "1": "0")
												+ ($('#form1 [name=brh_type_shanghu]').attr("checked") ? "1": "0");
												data.brhTypeCd = brhType;
											},
											success : function(data) {
												if (data.success) {
													if($('#form1 [name=brh_type_shanghu]').attr("checked")){
														var uploadfile=$('#upLoadfile').val();
														var str=$('#brhId').val();
														if(uploadfile != null && uploadfile != ''){
															var obj=$('form1').jsonObject();
															$.ajaxFileUpload({
																url:'doUploadCerFile.action?brhId='+str, secureuri:false, fileElementId:'upLoadfile', dataType:'json', data:{jsonObject:$.toJSON(obj)},
																success:function (data){
																	if (!data.success) {
																		alert(data.syserr);
																	}
																}
															});		
														}												
													}
													$('#addchannel').dialog('close');
													$('#table').flexAddData(data.root[0]);
													alert('新增服务商成功');
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
	$('#addchannel').dialog('open');
};	
//注销服务商
var shutdownchannel = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认注销该服务商');
	if(able){
		$.ajax({url:'doShutdownChannel.action', data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('注销成功');
					$('#table').refresh();
				}
				else{
					alert('注销失败 失败原因是'+data.syserror);
				}												
			}
		});
	}
};
//删除服务商信息
var deletechannel = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认删除该服务商信息');
	if(able){
		$.ajax({url:'doDeleteChannel.action', data:{jsonObject:$.toJSON(record)},
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
						
$('#table').flexigrid({url : 'findAllChannel.action', width : 400, dir : "desc", sort : "channelCode", usepager : true,  
buttons: [
{name : "新增", show:'ROLE_CHANNEL_MN_ADD_CZ', bclass : 'page_add', id : 'txt', onpress : newchannel},
{separator : true},
{name : "编辑", show:'ROLE_CHANNEL_MN_EDIT_CZ', bclass : 'page_word', id : 'cel', onpress :editchannel},
{separator : true},
{name : "启用、停用申请", show:'ROLE_CHANNEL_MN_STATUS_CZ', bclass : 'page_word', id : 'txt', onpress : channelstatus},
{separator : true},
{name : "注销", show:'ROLE_CHANNEL_MN_SHUTDOWN_CZ', bclass : 'page_word', id : 'txt', onpress : shutdownchannel},
{separator : true},
{name : "删除", show:'ROLE_CHANNEL_MN_DEL_CZ', bclass : 'page_delete', id : 'txt', onpress : deletechannel},
{separator : true}
],  
colModel : [ 
  { display: '服务商编号', dataIndex: 'channelCode', align: 'center', sortable:true }
, { display: '服务商名称', dataIndex: 'channelName', sortable:true}
, { display: '服务商分润比例(%)', dataIndex: 'profitRateDcm', sortable:true }
, { display: '品牌服务费(%)', dataIndex: 'brandFeeRateDcm', sortable:true }
, { display: '联系人', dataIndex: 'contactName', sortable:true }
, { display: '联系电话', dataIndex: 'contactPhone', sortable:true }
, { display: '服务商审批状态', dataIndex: 'confStatusZh', align: 'center' }
, { display: '服务商状态', dataIndex: 'channelStatusZh', align: 'center' }
]
});
		
$('#querybutton').click(function(){$.queryTable({ formId : 'queryForm', tableId : 'table' }); });						
//初始化查询;
$('#querybutton').trigger('click');
	
});