$(document).ready(function(){	

	//$('#reconBillgridResult').ajaxSelect({url:'findSecCodeList.action?codeType=CHECK_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	//          $('#checkStat').ajaxSelect({url:'findSecCodeList.action?codeType=CHECK_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	
	$('#editReckonPay').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 300,
		height : 200
	});


	var record=new Object();
	record.searchDate=searchDate;
	
	
var editReckonPay = function(record,id){
    	
    	if(!record){
    		alert("请选择一条记录");
    		return;
    	}
    	$('#form2').fillObject({obj:record});
    	
    	$('#editReckonPay').dialog("option","title","状态修改");
    	$('#editReckonPay').dialog("option","buttons",
    					{'更改状态' : function(){
    						
    						if($('#form2 #reckonResult').val()!="" && $('#form2 #reckonResult').val()!="undefined")
    						{
    							$.ajaxForm({
									formId : 'form2',
									url : "doUpdateSzdfCheckResultStat.action",												
									dealData : function(data) {
										//record.reckonResult = $('#reckonResult').val();
									},
									success : function(data) {
										if (data.success) {
											//$('#reconBillgrid').flexModifyData(data.root[0]);
											$('#editReckonPay').dialog('close');
											alert('对账状态更新成功');
											$('#reconBillgridResult').trigger('change');
										} else {
											alert('更新失败 原因是' + data.syserr);
										}
									}
								});
    						}
    						else
    						{
    							alert("请选择状态");
    							return false;
    						}
    					},
    					'关闭' : function(){
    						$(this).dialog('close');
    					}
    					}
    					);
    	$('#editReckonPay').dialog('open');
    };
		
	$('#checkResultDetailGrid').flexigrid({
		url:'findSzdfCheckResultDetail.action',
		buttons : [{
			name : "修改状态",
		    bclass : 'page_word',
		    id : 'txt',
		    onpress : editReckonPay
		  }],
		limit : 20,		
		width : 400,
		dir : "asc",
		sort : "status",
		usepager : true,
		colModel :[{
			display : '支付日期',
			dataIndex : 'checkDate',
			align : 'center',
			sortable:true
		},
		{
			display : '商户号',
			dataIndex : 'mid',
			align : 'center',
			sortable:true
		},
		{
			display : '订单号',
			dataIndex : 'orderNo',
			align : 'center',
			sortable:true
		},
		{
			display : '金额',
			dataIndex : 'amount',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);			
			}
		},
		{
			display : '对账结果',
			dataIndex : 'status',
			align : 'center',
			sortable:true,
			render:function(row,value){
				var color;
				var statusZh;
				if(value=="01"){
					color="#009999";
					statusZh="落账";
				}
				if(value=="02"){
					color="#FF0033";
					statusZh="深圳代付落账";
				}
				
				if(value=="00"){
					color="#999900";
					statusZh="对账不平";
				}
				if(value=="03"){
					color="#000000";
					statusZh="已处理";
				}
				return '<div style="color:'+color+'">'+statusZh+'</div>';	
			}
		}]
	});
	
	$('#reconBillgridResult').change(function(){
		var result=$('#reconBillgridResult').val();
		var thef=new Array();
		thef.push({"field":"searchDate","data":{"type":"string","value":searchDate,"comparison":"eq"}});
		if(result){
			thef.push({"field":"status","data":{"type":"string","value":result,"comparison":"eq"}});
		}
		$('#checkResultDetailGrid').flexReload(thef);
	});						
	
	//初始化查询;
	$('#reconBillgridResult').trigger('change');

});