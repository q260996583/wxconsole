$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
	        {id:"cardNo",formValidator:{empty:false},inputValidator:{min:16,max:19,onerror:"卡号长度16-19位"}},
	   		];


$.someAuthentication(list);	

$('#addCardNo').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 300
});

//删除
var deleteCardBlacklist = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认删除该黑名单卡');
	if(able){
		$.ajax({
			type : 'POST',
			url:'doDelCardBlacklist.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#querybutton').trigger('click');
				}
				else{
					alert('删除失败 失败原因是'+data.syserror);
				}												
			}
		});
	}
};
						


//新增黑名单卡
var addCardBlacklist=function() {
	$('#formreset').click();
	$('#addCardNo').dialog("option","title","新增黑名单卡");
	$('#addCardNo').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddCardBlacklist.action",
											success : function(data) {
												if (data.success) {
													$('#addCardNo').dialog('close');
													$('#querybutton').trigger('click');
													alert('新增成功');
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
	$('#addCardNo').dialog('open');
};	
						
$('#table').flexigrid({ 
		url : 'findCardBlacklist.action',
		buttons : [
				{
					name : "新增",														
					show:'ROLE_CARD_BLACK_LIST_MNG_CZ',
					bclass : 'page_add',
					id : 'txt',
					onpress : addCardBlacklist
				},{
					separator : true
				},{
					name : "删除",
					show:'ROLE_CARD_BLACK_LIST_MNG_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :deleteCardBlacklist
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "cardNo",											
		usepager : true,
		colModel : [ {
			display : '卡号',												
			dataIndex : 'cardNo',
			align : 'center',
			sortable:true
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