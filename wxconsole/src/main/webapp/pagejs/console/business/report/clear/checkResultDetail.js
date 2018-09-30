$(document).ready(function(){	

	$('#reconBillgridResult').ajaxSelect({url:'findSecCodeList.action?codeType=CHECK_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#checkStat').ajaxSelect({url:'findSecCodeList.action?codeType=CHECK_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	
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
	record.searchDate=searchDate;
	record.bankId=bankId;	
	
	
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
									url : "doUpdateCheckResultStat.action",												
									dealData : function(data) {
										//record.reckonResult = $('#reckonResult').val();
									},
									success : function(data) {
										if (data.success) {
											//$('#reconBillgrid').flexModifyData(data.root[0]);
											$('#editReckonPay').dialog('close');
											alert('对账状态更新成功');
											$('#querysup').click();
//											$('#reconBillgridResult').trigger('change');
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
		url:'findCheckResultDetail.action',
		buttons : [{
			name : "修改状态",
		    bclass : 'page_word',
		    id : 'txt',
		    onpress : editReckonPay
		  },  {
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
						var url = 'exportCheckJHResultDetail.action';
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
			dataIndex : 'checkStatZh',
			align : 'center',
			sortable:true
		}]
	});
	
//	$('#reconBillgridResult').change(function(){
//		
//	});						
	
	
	$('#querysup').click(function(){
		var result=$('#reconBillgridResult').val();
		var transType=$('#transType').val();
		var thef=new Array();
		thef.push({"field":"searchDate","data":{"type":"string","value":searchDate,"comparison":"eq"}});
		thef.push({"field":"bankId","data":{"type":"string","value":bankId,"comparison":"eq"}});
		if(result){
			thef.push({"field":"checkStat","data":{"type":"string","value":result,"comparison":"eq"}});
		}
		if(transType){
			thef.push({"field":"transCode","data":{"type":"string","value":transType,"comparison":"eq"}});
		}
		$('#checkResultDetailGrid').flexReload(thef);
		
	});
	
	//初始化查询;
	$('#querysup').click();
//	$('#reconBillgridResult').trigger('change');
	
	/*$.ajax({
		url:'findReckonType.action',
		dataType:'json',
		data:{reckonType:record.reckonType,reckonId:record.reckonId},
		success:function(data){				
			$('#totalTable td,#totalLogTable td').each(function(i,n){
				if(n.id in data){
						if(n.id.indexOf("Amt")>0)						
						n.innerHTML= $.changeFenToYuan(data[n.id]);
						else n.innerHTML=data[n.id];
				}
				if(n.id in record){
					if(n.id.indexOf("Amt")>0)						
						n.innerHTML= $.changeFenToYuan(record[n.id]);
						else n.innerHTML=record[n.id];
				}
				
			});
			$('#reconBillgridResult').unbind('change');
			$('#reconBillgridResult').bind('change',function(){
				var result=$('#reconBillgridResult').val();
				var thef=new Array();
				thef.push({"field":"reckonId","data":{"type":"string","value":record.reckonId,"comparison":"eq"}});
				if(result){
					thef.push({"field":"reckonResult","data":{"type":"string","value":result,"comparison":"eq"}});
				}
				$('#reconBillgrid').flexReload(thef);
			});		
			$('#reconBillgridResult').trigger('change');
				
		}
		
	});*/

});