$(document).ready(function() {
$('#useObj').ajaxSelect({url:'findSecCodeList.action?codeType=D0_PROD_OBJ',displayField:'codeName',valueField:'codeNo',blank:true});
$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=PROD_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
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
//lxl add
$('#table').flexigrid({ 
		url : 'qryProdInfos.action',
		width : 400,
		dir : "desc",
		sort : "productId",											
		usepager : true,
		colModel : [ {
			display : '产品编号',												
			dataIndex : 'productId',
			align : 'center',
			sortable:true
		},{
			display : '产品对象',												
			dataIndex : 'userObjDesc',											
			sortable:true
		},{
			display : '产品名称',												
			dataIndex : 'productName',											
			sortable:true
		},{
			display : '产品说明',											
			dataIndex : 'productDesc',											
			sortable:true
		},{
			display : '最低签约费率',
			render:fmtRate4,
			dataIndex : 'lowFee',											
			sortable:true
		},{
			display : '最高签约费率',
			render:fmtRate4,
			dataIndex : 'talFee',											
			sortable:true
		},{
			display : '发布状态',												
			dataIndex : 'statusDesc',
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