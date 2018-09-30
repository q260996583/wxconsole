$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
	{id:"cardBin",formValidator:{empty:false},inputValidator:{min:1,max:14,onerror:"卡BIN长度14位"}}
];


$.someAuthentication(list);

$('#addCardBinBlack').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 200
});

//删除
var deleteCardBinBlack = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认删除该黑名单卡BIN吗');
	if(able){
		$.ajax({
			type : 'POST',
			url:'doDelCardBinBlack.action',
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
var addCardBinBlack=function() {
	$('#formreset').click();
	$('#addCardBinBlack').dialog("option","title","新增黑名单卡BIN");
	$('#addCardBinBlack').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddCardBinBlack.action",
											success : function(data) {
												if (data.success) {
													$('#addCardBinBlack').dialog('close');
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
	$('#addCardBinBlack').dialog('open');
};

						
$('#table').flexigrid({ 
		url : 'findCardBinBlacklist.action',
		buttons : [
				{
					name : "新增",														
					show:'ROLE_MER_BLACK_LIST_MNG_ADD',
					bclass : 'page_add',
					id : 'txt',
					onpress : addCardBinBlack
				},{
					separator : true
				},{
					name : "删除",
					show:'ROLE_MER_BLACK_LIST_MNG_DEL',
					bclass : 'page_word',
					id : 'cel',
					onpress :deleteCardBinBlack
				}],
		 
		width : 400,
		dir : "desc",
		sort : "orgCode",											
		usepager : true,
		colModel : [ 
		    { 
		    	display : '卡BIN', 
		    	dataIndex : 'cardBin', 
		    	width:150, align : 'center', 
		    	sortable:true 
		    },{ 
			   display : '最后操作时间', 
			   dataIndex : 'lastUptTime', 
			   width:150, 
			   align : 'center', 
			   sortable:true, 
			   render : function(record, value){
					var dt = "";
					if(value.length=='14'){
						 dt =value.substring(0, 4)+'-'+ value.substring(4,6)+'-'+value.substring(6,8)+' '+value.substring(8,10)+':'+value.substring(10,12)+':'+value.substring(12,14)  ;
					   return dt;
					}else{
						return dt;
						}
					}
			}
		]
	});
		
	$('#querybutton').click(function(){
		$.queryTable({ formId : 'queryForm', tableId : 'table' });
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
});