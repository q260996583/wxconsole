$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
	        {id:"bankTitle",formValidator:{empty:false},inputValidator:{min:1,max:50,onerror:"总行名称不得为空且最大50位"}},
	        {id:"bankName",formValidator:{empty:false},inputValidator:{min:1,max:50,onerror:"支行名称不得为空且最大50位"}},
	        {id:"bankNo",formValidator:{empty:false},inputValidator:{min:1,max:20,onerror:"行号不得为空且最大20位"},regexValidator:{regexp:"^[0-9]*$",onerror:"行号只能输入数字"}},
	        {id:"accntNo",formValidator:{empty:false},inputValidator:{min:1,max:25,onerror:"账号不得为空且最大25位"},regexValidator:{regexp:"^[0-9]*$",onerror:"账号只能输入数字"}},
	        {id:"accntName",formValidator:{empty:false},inputValidator:{min:1,max:50,onerror:"账户名称不得为空且最大50位"}},
	   		];


$.someAuthentication(list);	

$('#addBankAccnt').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 400
});

$('#editBankAccnt').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 300
});


//编辑机构
var editBankAccnt= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
						
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	$('#orgCode').attr('disabled',"disabled").unFormValidator(true);
	$('#addBankAccnt').dialog("option","title","编辑银行账户信息");
	$('#addBankAccnt').dialog("option","buttons",
					{'更新' : function() {

							if ($.formValidator.pageIsValid('1')) {
								
								$.ajaxForm({
											formId : 'form1',
											url : "doUpdateBankAccnt.action",
											success : function(data) {
												if (data.success) {
													$('#table').flexModifyData(data.root[0]);
													$('#addBankAccnt').dialog('close');
													alert('银行账户更新成功');
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

	$('#addBankAccnt').dialog('open');
};	
						


//新增支付机构	
var addBankAccnt=function() {
	$('#formreset').click();
	$('#addBankAccnt').dialog("option","title","新增银行账户");
	$('#addBankAccnt').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddBankAccnt.action",
											success : function(data) {
												if (data.success) {
													$('#addBankAccnt').dialog('close');
													$('#table').flexAddData(data.root[0]);
													alert('新增银行账户成功');
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
	$('#addBankAccnt').dialog('open');
};	

//设为 备付金存管账户
var markBfj = function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	if (record.inFlag == '1') {
		alert('此账户已是备付金存管账户');
		return;
	}
	if(!confirm('确认将该账户设置为备付金存管账户')){
		return;
	}
	$.ajax({url:'doMarkBfjIn.action', dataType:'json',
		data:{jsonObject:$.toJSON(record)},
		success:function(data){
			if(data.success){
				alert('操作成功');
				$('#table').refresh();
			} else {
				alert('驳回失败 失败原因是'+data.syserr);
			}												
		}
	});
}
$('#table').flexigrid({ 
		url : 'findAllBankAccnt.action',
		buttons : [
				{
					name : "新增",														
					show:'ROLE_BANK_ACCNT_ADD_CZ',
					bclass : 'page_add',
					id : 'txt',
					onpress : addBankAccnt
				},{
					separator : true
				},{
					name : "编辑",
					show:'ROLE_BANK_ACCNT_EDIT_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :editBankAccnt
				},{
					separator : true
				},{
					name : "设为备付金存管账户",
					show:'ROLE_BANK_ACCNT_EDIT_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :markBfj
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "bankAccntId",											
		usepager : true,
		colModel : [ {
			display : '编号',												
			dataIndex : 'bankAccntId',
			align : 'center',
			sortable:true
		},{
			display : '总行名称',											
			dataIndex : 'bankTitle',											
			sortable:true
		},{
			display : '支行名称',											
			dataIndex : 'bankName',											
			sortable:true
		},{
			display : '行号',												
			dataIndex : 'bankNo',											
			sortable:true
		},{
			display : '账号',												
			dataIndex : 'accntNo',											
			sortable:true
		},{
			display : '账户名称',											
			dataIndex : 'accntName',
			align : 'center'
		},{
			display : '是否为备付金存管账户',											
			dataIndex : 'inFlagDesc',
			align : 'center'
		},{
			display : '账户类型',											
			dataIndex : 'bankAccntTypeDesc',
			align : 'center'
		},{
			display : '账户状态',											
			dataIndex : 'accntFlagDesc',
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