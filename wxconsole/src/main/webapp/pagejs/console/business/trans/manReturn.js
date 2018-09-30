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
$('#qmerName').click(function(){
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen(
		{clear:function() {
			$('#qmid').val('');
			$('#qmerName').val('');
		},
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
$('#backStat').ajaxSelect({url:'findSecCodeList.action?codeType=BACK_STAT',displayField:'codeName',valueField:'codeNo',blank:true});

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
	$('#posTransDetail').dialog("option","buttons",{
		'通过' : function() {
				$.ajaxForm({
					formId : 'form2',
					url : "doManReturn.action",
					success : function(data) {
						if (data.success) {
							$('#posTransDetail').dialog('close');
							$('#table').refresh();
							alert('退货审批成功');
						} else {
							alert(data.syserr);
						}
					}
				});
			},
			'驳回' : function() {
					$.ajaxForm({
						formId : 'form2',
						url : "doRejectReturn.action",
						success : function(data) {
							if (data.success) {
								$('#posTransDetail').dialog('close');
								$('#table').refresh();
								alert('退货审批成功');
								$('#querybutton').trigger('click');
							} else {
								alert('驳回失败 原因是'+ data.syserr);
							}
						}
					});
			},
			'关闭' : function() {
				$(this).dialog('close');
			}
		});
	$('#posTransDetail').dialog('open');
};

						
$('#table').flexigrid({ 
		url : 'findAllManReturn.action',
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
			display : '原交易日期',												
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
			display : '退货状态',											
			dataIndex : 'backStatZh',
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