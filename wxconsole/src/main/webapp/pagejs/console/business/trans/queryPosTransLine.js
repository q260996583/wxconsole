$(document).ready(function(){	
	
	$('#posTransLineDetailGrid').flexigrid({
		url:'findPosTransLine.action',
		limit : 20,		
		width : 400,
		dir : "asc",
		sort : "checkStat",
		usepager : true,
		colModel :[{
			display : '机构交易日期',
			dataIndex : 'bankStlmDate',
			align : 'center',
			sortable:true
		},
		{
			display : '机构交易流水号',
			dataIndex : 'bankSeq',
			align : 'center',
			sortable:true
		},
		{
			display : '系统交易日期',
			dataIndex : 'stlmDate',
			align : 'center',
			sortable:true
		},
		{
			display : '系统交易流水号',
			dataIndex : 'transSeq',
			align : 'center',
			sortable:true
		},{
			display : '终端号',
			dataIndex : 'tid',
			align : 'center',
			sortable:true
		},
		{
			display : '金额',
			dataIndex : 'transAmt',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
				
			}
		}
		,{
			display : '交易类型',
			dataIndex : 'transCodeZh',
			align : 'center',
			sortable:true
		},
		{
			display : '对账结果',
			dataIndex : 'checkStat',
			align : 'center',
			sortable:true,
			render:function(row,value){
				var color;
				var checkStatZh;
				if(value=="01"){
					color="#009999";
					checkStatZh="系统落账";
				}
				if(value=="02"){
					color="#FF0033";
					checkStatZh="机构落账";
				}
				if(value=="03"){
					color="#0033FF";
					checkStatZh="日切系统";
				}
				if(value=="04"){
					color="#999900";
					checkStatZh="日切机构";
				}
				if(value=="05"){
					color="#000000";
					checkStatZh="已退款";
				}
				return '<div style="color:'+color+'">'+checkStatZh+'</div>';
				
				
			}
		}]
	});
	
	$('#reconBillgridResult').click(function(){
		var result=$('#reconBillgridResult').val();
		var thef=new Array();
		thef.push({"field":"searchDate","data":{"type":"string","value":searchDate,"comparison":"eq"}});
		thef.push({"field":"bankId","data":{"type":"string","value":bankId,"comparison":"eq"}});
		if(result){
			thef.push({"field":"checkStat","data":{"type":"string","value":result,"comparison":"eq"}});
		}
		$('#checkResultDetailGrid').flexReload(thef);
	});						
	
	//初始化查询;
	$('#reconBillgridResult').trigger('change');
	
	

});