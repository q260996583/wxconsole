$(document).ready(function(){	

	$('#reconBillgridResult').ajaxSelect({url:'findSecCodeList.action?codeType=CHECK_DFS_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#checkFlag').ajaxSelect({url:'findSecCodeList.action?codeType=CHECK_DFS_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	
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
	record.channelCode=channelCode;
	record.checkDate=checkDate;	
	
	
var editReckonPay = function(record,id){
    	
    	if(!record){
    		alert("请选择一条记录");
    		return;
    	}
    	$('#form2').fillObject({obj:record});
    	$('#oldCheckFlag').val(record.checkStat);
    	$('#editReckonPay').dialog("option","title","状态修改");
    	$('#editReckonPay').dialog("option","buttons",
    					{'更改状态' : function(){
    						
    						if($('#form2 #checkFlag').val()!="" && $('#form2 #checkFlag').val()!="undefined")
    						{
    							$.ajaxForm({
									formId : 'form2',
									url : "doUpdateChannelCheckResultStat.action",												
									dealData : function(data) {
										//record.reckonResult = $('#reckonResult').val();
									},
									success : function(data) {
										if (data.success) {
											//$('#reconBillgrid').flexModifyData(data.root[0]);
											$('#editReckonPay').dialog('close');
											alert('对账状态更新成功');
											$('#querysup').click();
											doFindChannelResultCount();
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
		url:'findChannelCheckResultDetail.action',
		buttons : [{
			name : "修改状态",
		    bclass : 'page_word',
		    id : 'txt',
		    onpress : editReckonPay
		  },
		  {
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
			} 
		],
		limit : 20,		
		width : 400,
		dir : "asc",
		sort : "checkStat",
		usepager : true,
		colModel :[{
			display : '机构交易日期',
			dataIndex : 'destTransTime',
			align : 'center',
			sortable:true
		},
		{
			display : '机构交易流水号',
			dataIndex : 'destTransSeq',
			align : 'center',
			sortable:true
		},
		{
			display : '交易日期',
			dataIndex : 'transTime',
			align : 'center',
			sortable:true
		},
		{
			display : '交易流水号',
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
			display : '交易总金额',
			dataIndex : 'transAmtBefore',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
			}
		}
		,{
			display : '积分总金额',
			dataIndex : 'scoreAmt',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
			}
		}
		,{
			display : '银联交易金额',
			dataIndex : 'transAmtAfter',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
			}
		}
		,{
			display : '交易类型',
			dataIndex : 'txnTypeZh',
			align : 'center',
			sortable:true
		},
		{
			display : '对账结果',
			dataIndex : 'checkFlag',
			align : 'center',
			sortable:true,
			render:function(row,value){
				var color;
				var checkStatZh;
				if(value=="01"){
					color="#009999";
					checkStatZh="落账";
				}
				if(value=="02"){
					color="#FF0033";
					checkStatZh="机构落账";
				}
				if(value=="03"){
					color="#0033FF";
					checkStatZh="日切";
				}
				if(value=="04"){
					color="#999900";
					checkStatZh="日切机构";
				}
				if(value=="05"){
					color="#663366";
					checkStatZh="金额异常";
				}
				if(value=="07"){
					color="#000000";
					checkStatZh="已退款";
				}
				return '<div style="color:'+color+'">'+checkStatZh+'</div>';
			}
		}]
	});
	
	$('#querysup').click(function(){
		var checkFlag=$('#reconBillgridResult').val();
		var txnType=$('#txnType').val();
		var thef=new Array();
		thef.push({"field":"checkDate","data":{"type":"string","value":checkDate,"comparison":"eq"}});
		thef.push({"field":"channelCode","data":{"type":"string","value":channelCode,"comparison":"eq"}});
		if(checkFlag){
			thef.push({"field":"checkFlag","data":{"type":"string","value":checkFlag,"comparison":"eq"}});
		}
		if(txnType){
			thef.push({"field":"txnType","data":{"type":"string","value":txnType,"comparison":"eq"}});
		}
		$('#checkResultDetailGrid').flexReload(thef);
		
	});
	
	//初始化查询;
	$('#querysup').click();
	doFindChannelResultCount();
	function doFindChannelResultCount(){
		$.ajax({
			url:'dofindChannelResultCount.action',
			dataType:'json',
			data:{jsonObject : $.toJSON(record)},
			success:function(data){
				$('#form3').fillObject({obj:data});
				
				$('#orgTransNum').text(data.orgTransNum);
				$('#orgTransAmt').text($.changeDecimal(parseFloat(data.orgTransAmt)/100));
				$('#orgScoreAmt').text($.changeDecimal(parseFloat(data.orgScoreAmt)/100));
				$('#fftTransNum').text(data.fftTransNum);
				$('#fftTransAmt').text($.changeDecimal(parseFloat(data.fftTransAmt)/100));
				$('#fftScoreAmt').text($.changeDecimal(parseFloat(data.fftScoreAmt)/100));
				
				$('#fftDownLoadCnt').text(data.fftDownLoadCnt);
				$('#fftDownLoadAmt').text($.changeDecimal(parseFloat(data.fftDownLoadAmt)/100));
				$('#fftDownLoadScoreAmt').text($.changeDecimal(parseFloat(data.fftDownLoadScoreAmt)/100));
				
				$('#orgDownLoadCnt').text(data.orgDownLoadCnt);
				$('#orgDownLoadAmt').text($.changeDecimal(parseFloat(data.orgDownLoadAmt)/100));
				$('#orgDownLoadScoreAmt').text($.changeDecimal(parseFloat(data.orgDownLoadScoreAmt)/100));
				
				$('#fftDayCutCnt').text(data.fftDayCutCnt);
				$('#fftDayCutAmt').text($.changeDecimal(parseFloat(data.fftDayCutAmt)/100));
				$('#fftDayCutScoreAmt').text($.changeDecimal(parseFloat(data.fftDayCutScoreAmt)/100));
				
				$('#orgDayCutCnt').text(data.orgDayCutCnt);
				$('#orgDayCutAmt').text($.changeDecimal(parseFloat(data.orgDayCutAmt)/100));
				$('#orgDayCutScoreAmt').text($.changeDecimal(parseFloat(data.orgDayCutScoreAmt)/100));
				
				$('#returnCnt').text(data.returnCnt);
				$('#returnAmt').text($.changeDecimal(parseFloat(data.returnAmt)/100));
				$('#returnScoreAmt').text($.changeDecimal(parseFloat(data.returnScoreAmt)/100));
				
			}
		});
	}
	
	

});