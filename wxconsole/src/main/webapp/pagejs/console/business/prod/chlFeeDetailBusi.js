$(document).ready(function() {
$('#transTimeStart').pickdate({dateFmt:"yyyyMMdd"});
$('#transTimeEnd').pickdate({dateFmt:"yyyyMMdd"});
$('#stlmDateStart').pickdate({dateFmt:"yyyyMMdd"});
$('#stlmDateEnd').pickdate({dateFmt:"yyyyMMdd"});
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

$('#merCode').click(function(){	
	$('#merCode').val($('#orgCode').val());
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#merCode').val(data.orgCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});

$('#transWay').ajaxSelect({url:'findSecCodeList.action?codeType=MER_TRANS_WAY',displayField:'codeName',valueField:'codeNo',blank:true});
$('#cardType').ajaxSelect({url:'findSecCodeList.action?codeType=MER_CARD_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
$('#transType').ajaxSelect({url:'findSecCodeList.action?codeType=MER_TRANS_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});


//lxl add
$('#table').flexigrid({ 
		url : 'qryMoreTransInfo.action',
		buttons : [],
		width : 400,
		dir : "desc",
		sort : "transTime",											
		usepager : true,
		colModel : [ {
			display : '服务商名称',											
			dataIndex : 'secMerName',											
			sortable:true
		},{
			display : '服务商号',												
			dataIndex : 'secMerNO',											
			sortable:true
		},{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '商户号',												
			dataIndex : 'mid',
			align : 'center',
			sortable:true
		},{
			display : '交易方式',	
			align: 'center',
			dataIndex : 'transWay',											
			sortable:true
		},{
			display : '交易类型',				
			align: 'center',
			dataIndex : 'transType',											
			sortable:true
		},{
			display : '卡类型',		
			align: 'center',
			dataIndex : 'cardType'
		},
		{
			display : '交易金额',												
			dataIndex : 'transAmount',
			align : 'center'
		},
		{
			display : '交易时间',												
			dataIndex : 'transTime',
			align : 'center'
		},
		{
			display : '清算日期',												
			dataIndex : 'stlmDate',
			align : 'center'
		},
		{
			display : '商户收单手续费',												
			dataIndex : 'merFee',
			align : 'center'
		},
		{
			display : '商户结算手续费',												
			dataIndex : 'settleFee',
			align : 'center'
		},
		{
			display : '收单分润金额',												
			dataIndex : 'merProfit',
			align : 'center'
		},
		{
			display : '结算分润金额',												
			dataIndex : 'stlProfit',
			align : 'center'
		},
		{
			display : '分润总计',												
			dataIndex : 'profitSum',
			align : 'center'
		},
		{
			display : '商户收单费率',												
			dataIndex : 'realRate',
			render:fmtRate4,
			align : 'center'
		},
		{
			display : '商户费率封顶值',												
			dataIndex : 'feeStlmMax',
			align : 'center'
		},
		{
			display : '收单分润底价',												
			dataIndex : 'chnlRate',
			render:fmtRate4,
			align : 'center'
		},
		{
			display : '收单分润封顶值',												
			dataIndex : 'chnlMaxFee',
			align : 'center'
		},
		{
			display : '收单分润比例',												
			dataIndex : 'devRate',
			render:fmtRate4,
			align : 'center'
		},
		{
			display : '商户结算费率',												
			dataIndex : 'd0Rate',
			render:fmtRate4,
			align : 'center'
		},
		{
			display : '结算分润底价',												
			dataIndex : 'chlD0Rate',
			render:fmtRate4,
			align : 'center'
		},
		{
			display : '结算分润比例',												
			dataIndex : 'chlD0Ratio',
			render:fmtRate4,
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