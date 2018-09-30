$(document).ready(function(){	

	$('#payFeeStat').ajaxSelect({url:'findSecCodeList.action?codeType=FEE_DIFF_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	
	$('#editReckonPay').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 300,
		height : 300
	});


	var record=new Object();
	record.stlmDate=stlmDate;
	record.orgCode=orgCode;	
	
		
	$('#checkResultDetailGrid').flexigrid({
		url:'findCheckPayFeeResultDetail.action',
		buttons : [{
				name : "导出excel",
				bclass : 'page_write',
				id : 'importExcel',
				onpress : function() {
					if (this.p.total == 0) {
						alert('没有数据可以导出');
						return;
					}
					var isnot = confirm("确定需要导出 "
							+ this.p.total
							+ " 条数据?");
					if (isnot) {
						var url = 'exportCheckPayFeeResultDetail.action';
						$(this).flexFile(
								url);
					}
				}
			} ],
		limit : 20,		
		width : 400,
		dir : "asc",
		sort : "checkStat",
		usepager : true,
		colModel :[{
			display : '终端号',
			dataIndex : 'tid',
			align : 'center',
			sortable:true
		},{
			display : '机构交易日期',
			dataIndex : 'transTimeSub',
			align : 'center',
			sortable:true
		},{
			display : '机构流水号',
			dataIndex : 'bankSeq',
			align : 'center',
			sortable:true
		},{
			display : '交易日期',
			dataIndex : 'locTransDate',
			align : 'center',
			sortable:true
		},{
			display : '流水号',
			dataIndex : 'transSeq',
			align : 'center',
			sortable:true
		},{
			display : '交易金额',
			dataIndex : 'transAmt',
			align : 'center',
			sortable:true
		},{
			display : '银联手续费',
			dataIndex : 'cupsFee',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(value);
				
			}
		},
		{
			display : '银联品牌服务费',
			dataIndex : 'cupsBrandFee',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(value);
				
			}
		},
		{
			display : '手续费',
			dataIndex : 'fftFee',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(value);
				
			}
		},
		{
			display : '品牌服务费',
			dataIndex : 'fftBrandFee',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(value);
				
			}
		},
		{
			display : '手续费差异',
			dataIndex : 'feeDiff',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(value);
				
			}
		},
		{
			display : '品牌服务费差异',
			dataIndex : 'brandFeeDiff',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(value);
				
			}
		},{
			display : '差异类型',
			dataIndex : 'stat',
			align : 'center',
			sortable:true,
			render:function(row,value){
				var color;
				var checkStatZh;
				if(value=="01"){
					color="#009999";
					checkStatZh="手续费差异";
				}
				if(value=="02"){
					color="#FF0033";
					checkStatZh="品牌服务费差异";
				}
				if(value=="03"){
					color="#0033FF";
					checkStatZh="均有差异";
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
	
	
	$('#querysup').click(function(){
		var result=$('#payFeeStat').val();
		var thef=new Array();
		thef.push({"field":"stlmDate","data":{"type":"string","value":stlmDate,"comparison":"eq"}});
		thef.push({"field":"orgCode","data":{"type":"string","value":orgCode,"comparison":"eq"}});
		if(result){
			thef.push({"field":"stat","data":{"type":"string","value":result,"comparison":"eq"}});
		}
		$('#checkResultDetailGrid').flexReload(thef);
		
	});
	
	//初始化查询;
	$('#querysup').click();

});