$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
	        {id:"bankId",formValidator:{empty:false},inputValidator:{min:5,max:15,onerror:"外部机构号长度5-15位"}},
	        {id:"bankName",formValidator:{empty:false},inputValidator:{min:1,max:60,onerror:"机构名称不得为空不得大于30个汉字"}},
	        {id:"conType",formValidator:{empty:false}},
	        {id:"feeRateDcm",formValidator:{empty:false},inputValidator:{min:1,max:10,onerror:"手续费率不得为空"}},
	   		{id:"remark",formValidator:{empty:true},inputValidator:{min:0,max:200,onerror:"备注不得大于200位"}},
	   		];


$.someAuthentication(list);	

$('#addbank').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 300
});

$('#editbank').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 300
});


//编辑机构
var editbank= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
						
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	$('#orgCode').attr('disabled',"disabled");
	$('#addbank').dialog("option","title","编辑支付机构信息");
	$('#addbank').dialog("option","buttons",
					{'更新' : function() {

							if ($.formValidator.pageIsValid('1')) {
								
								$.ajaxForm({
											formId : 'form1',
											url : "doUpdateBank.action",
											success : function(data) {
												if (data.success) {
													$('#table').flexModifyData(data.root[0]);
													$('#addbank').dialog('close');
													alert('支付机构更新成功');
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

	$('#addbank').dialog('open');
};	
						


//新增支付机构	
var newbank=function() {
	$('#formreset').click();
	$('#addbank').dialog("option","title","新增支付机构");
	$('#addbank').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddBank.action",
											success : function(data) {
												if (data.success) {
													$('#addbank').dialog('close');
													$('#table').flexAddData(data.root[0]);
													alert('新增支付机构成功');
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
	$('#addbank').dialog('open');
};	
						
$('#table').flexigrid({ 
		url : 'findAllBank.action',
		buttons : [
				{
					name : "新增",														
					show:'ROLE_BANK_MN_ADD_CZ',
					bclass : 'page_add',
					id : 'txt',
					onpress : newbank
				},{
					separator : true
				},{
					name : "编辑",
					show:'ROLE_BANK_MN_EDIT_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :editbank
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "orgCode",											
		usepager : true,
		colModel : [ {
			display : '内部机构号',												
			dataIndex : 'orgCode',
			align : 'center',
			sortable:true
		},{
			display : '支付机构名称',												
			dataIndex : 'bankName',											
			sortable:true
		},{
			display : '手续费率(%)',												
			dataIndex : 'feeRateDcm',											
			sortable:true
		},{
			display : '接入方式',											
			dataIndex : 'conTypeZh',											
			sortable:true
		},{
			display : '外部机构号',											
			dataIndex : 'bankId',											
			sortable:true
		},{
			display : '备注',											
			dataIndex : 'remark',
			align : 'center'
		},{
			display : '最后更新时间',											
			dataIndex : 'lastUptTime',
			align : 'center'
		},{
			display : '最后更新用户',											
			dataIndex : 'lastUptAcc',
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