$(document).ready(function() {

$('#posTransDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});					

$('#pospStmt').pickdate({dateFmt:"yyyyMMdd"});	
$('#applyDate').pickdate({dateFmt:"yyyyMMdd"});
$('#realDate').pickdate({dateFmt:"yyyyMMdd"});

$('#stlmStatus').ajaxSelect({url:'findSecCodeList.action?codeType=RETURN_STAT',displayField:'codeName',valueField:'codeNo',blank:true});

var  viewPosTransDetail = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	
	var scoreFlag = record.scoreFlag;
	if(scoreFlag=='1'){
		$('#hid1').show();
		$('#hid2').show();
		$('#hid3').show();
		$('#hid4').show();
		$('#hid5').show();
		$('#hid6').show();
	}
	else{
		$('#hid1').hide();
		$('#hid2').hide();
		$('#hid3').hide();
		$('#hid4').hide();
		$('#hid5').hide();
		$('#hid6').hide();
	}
	$('#posTransDetail').dialog("option","title","详细信息");
	$('#posTransDetail').dialog("option","buttons",
			{'关闭' : function() {
				$(this).dialog('close');
			}
		});
	$('#posTransDetail').dialog('open');
};

						
$('#table').flexigrid({ 
		url : 'findRealReturn.action',
		buttons : [{
						name : "详细信息",
						bclass : 'page_excel',
						id : 'cel',
						onpress : viewPosTransDetail
					},{
						separator : true
					}],
		 
		width : 400,
		dir : "desc",
		sort : "pospStmt",											
		usepager : true,
		colModel : [ {
			display : '原交易清算日期',												
			dataIndex : 'pospStmtDesc',											
			sortable:true
		},{
			display : '原中心交易流水',												
			dataIndex : 'oriTransSeq',
			align : 'center',
			sortable:true
		},{
			display : '原终端交易流水',											
			dataIndex : 'oriTidSeq',
			align : 'center'
		}
		,{
			display : '原交易批次',											
			dataIndex : 'oriBatchNo',
			align : 'center'
		},{
			display : '原交易金额(元)',											
			dataIndex : 'transAmtDesc',											
			sortable:true
		},{
			display : '退货金额(元)',											
			dataIndex : 'backAmtDesc',											
			sortable:true
		},{
			display : '实际退货金额(元)',											
			dataIndex : 'mBackAmtDesc',											
			sortable:true
		},{
			display : '商户编号',											
			dataIndex : 'mid',											
			sortable:true
		},{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '终端号',												
			dataIndex : 'tid',
			align : 'center'
		},{
			display : '主帐号',											
			dataIndex : 'pan',
			align : 'center'
		},{
			display : '退货日期',											
			dataIndex : 'stlmDate',
			align : 'center'
		},{
			display : '退货生效日期',											
			dataIndex : 'realStlmDate',
			align : 'center'
		},{
			display : '退货清算状态',											
			dataIndex : 'stlmStatusZh',
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