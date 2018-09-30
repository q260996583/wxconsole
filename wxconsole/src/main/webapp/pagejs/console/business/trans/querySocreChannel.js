$(document).ready(function() {

$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	
$('#channelSelect').queryDialog({
 	width : 600,
 	height : 400,												
	flexigrid:{ 
			url : 'findAllChannel.action',					
			width : 550,
			dir : "channelCode",
			sort:"channelCode",
			usepager : true,
			colModel : [ {
				display : '服务商代码',
				width : 200,
				dataIndex : 'channelCode',
				align : 'center',
				sortable:true
			}, {
				display : '服务商名称',
				width : 300,
				dataIndex : 'channelName',
				align : 'center'
			}]
		}
});

$('#qChanName').click(function() {
	$('#channelSelect').queryDialogOpen({
		clear : function() {
			$('#qChanCode').val('');
			$('#qChanName').val('');
		},
			success : function(data) {
			if (data) {
				$('#qChanCode').val(data.channelCode);
				$('#qChanName').val(data.channelName);
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});

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
//$('#merchantSelect').dialog("option","title","商户信息");
$('#merchantSelect').queryDialogOpen({
	clear : function() {
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


$('#table').flexigrid({ 
		url : 'findScoreChannelApply.action',
		width : 400,
		dir : "desc",
		sort : "stlmDate",											
		usepager : true,
		colModel : [ {
			display : '清算日期',												
			dataIndex : 'stlmDate',											
			sortable:true
		},{
			display : '服务商号',											
			dataIndex : 'channelCode',
			sortable:true
		},{
			display : '商户号',												
			dataIndex : 'mid',
			align : 'center',
			sortable:true
		},{
			display : '商户名称',											
			dataIndex : 'merName',
			sortable:true
		},{
			display : '实际清算金额(元)',											
			dataIndex : 'realAmt',											
			sortable:true
		},{
			display : '大丰收营销费',											
			dataIndex : 'markerFee',											
			sortable:true
		},{
			display : '乐币',												
			dataIndex : 'coin',											
			sortable:true
		},{
			display : '乐豆',												
			dataIndex : 'bean',
			sortable:true
		},{
			display : '赠送金额',											
			dataIndex : 'giftAmt',
			sortable:true
		},{
			display : '大丰收实扣金额',											
			dataIndex : 'channelRealAmt',
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
	
	
	$('#exlbutton').click(function(){
		if(!$('#dateStart').val()){
			alert("开始时间不能为空");
			return false;
		}
		if(!$('#dateEnd').val()){
			alert("结束时间不能为空");
			return false;
		}
		
		var href="toOutScoreChannelApplyExl.action?dateStart="+$('#dateStart').val()+"&dateEnd="+$('#dateEnd').val();
		if($('#qmid').val()){href+="&mid="+$('#qmid').val();}
		if($('#qChanCode').val()){href+="&channelCode="+$('#qChanCode').val();}
		
		window.open(href);
	});	
});