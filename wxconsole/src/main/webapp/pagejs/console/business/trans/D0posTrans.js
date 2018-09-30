var reloadTimer = false;
var reloadGrid = function() { $('#querybutton').click(); };
var reloadIntervalEvent = function( newInterval ) {
	if (reloadTimer) clearInterval(reloadTimer);
	if ( newInterval && newInterval > 0 ) {
		reloadTimer = setInterval("reloadGrid()", newInterval);
	} else {
		if (reloadTimer) clearInterval(reloadTimer);
	}
};

var exportTrans = function(){
	if ( $('#pospStmtEnd').val() == '' || $('#pospStmtStart').val() == '' ) {
		alert('请选择日期范围. ');
		return ;
	}
	var href="toOutPosTransExl.action?flag=HIDDEN&pospStmtEnd="+$('#pospStmtEnd').val()+"&pospStmtStart="+$('#pospStmtStart').val();
	if($('#qmid').val()){href+="&mid="+$('#qmid').val();}
	if($('#qtid').val()){href+="&tid="+$('#qtid').val();}
	if($('#transSeq').val()){href+="&transSeq="+$('#transSeq').val();}
	if($('#tidSeq').val()){href+="&tidSeq="+$('#tidSeq').val();}
	if($('#pan').val()){href+="&panSearch="+$('#pan').val();}
	if($('#transSt').val()){href+="&transSt="+$('#transSt').val();}
	if($('#transCode').val()){href+="&transCode="+$('#transCode').val();}
	if($('#rollbackFlag').val()){href+="&rollbackFlag="+$('#rollbackFlag').val();}
	if($('#cancelFlag').val()){href+="&cancelFlag="+$('#cancelFlag').val();}
	if($('#backType').val()){href+="&backType="+$('#backType').val();}
	window.open(href);
}

$(document).ready(function() {
	


$('#D0posTransDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});					

$('#pospStmtStart').pickdate({dateFmt:"yyyyMMdd"});	
$('#pospStmtEnd').pickdate({dateFmt:"yyyyMMdd"});
$('#transSt').ajaxSelect({url:'findSecCodeList.action?codeType=TRANS_ST',displayField:'codeName',valueField:'codeNo',blank:true});
$('#rollbackFlag').ajaxSelect({url:'findSecCodeList.action?codeType=ROLLBACK_FLAG',displayField:'codeName',valueField:'codeNo',blank:true});
$('#cancelFlag').ajaxSelect({url:'findSecCodeList.action?codeType=CANCEL_FLAG',displayField:'codeName',valueField:'codeNo',blank:true});
//$('#txnTypeCode').ajaxSelect({url:'findSecCodeList.action?codeType=TRANS_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
$('#transCode').ajaxSelect({url:'findOutTransSecCodeList.action',displayField:'codeName',valueField:'codeNo',blank:true});
$('#backType').ajaxSelect({url:'findSecCodeList.action?codeType=BACK_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});

var recordBmp='';
var  viewD0PosTransDetail = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	
	
	var signs = "signs";
	$('#D0posTransDetail :input').each(function(i, n) {
		if (signs in record) {
			signs = record[signs];
			if(signs=='1'){
				$('#signs').hide();
				$('#signsButton').attr('disabled', true);
				recordBmp = '';
			}
			else {
				$('#signs').show();
				$('#signsButton').attr('disabled', false);
				recordBmp = record;
			}
		}
	});
	
	
	$('#D0posTransDetail').dialog("option","title","详细信息");
	/*$('#D0posTransDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});*/
	var transSeq=$('#transSeq').val();
	$('#D0posTransDetail').dialog("option","buttons",
			{'通过' : function() {
				/*$(this).dialog('close');*/
				var cf = confirm("确认通过D0交易流水审核吗？");
				if (!cf) { return; }
				var transSeq=$('#transSeq').val();
				var merStatementsType =$('#merStatementsType').val();
				$.ajax({
					url:'updOutcomeStat.action',
					data:{transSeq:transSeq,merStatementsType:merStatementsType},
					type: 'POST',
					dataType:'json',	
					success:function(data){			
						if(data.success){
			        		alert("审核通过！");
			        	}else{
			        		alert("审核失败！");
			        	}
					}
				});
			},
			'驳回' : function() {
					/*$.ajaxForm({
						formId : 'form2',
						url : "updMerStatementsType.action",
						data:transSeq,
						success : function(data) {
							if (data.success) {
								$('#D0posTransDetail').dialog('close');
								alert('交易驳回成功！');
								$('#querybutton').trigger('click');
							} else {
								alert('更新失败 原因是'+ data.syserr);
							}
						}
					});*/
					var transSeq=$('#transSeq').val();
					var outcomeStat=$('#outcomeStat').val();
					$.ajax({
						url:'updMerStatementsType.action',
						data:{transSeq:transSeq,outcomeStat:outcomeStat},
						type: 'POST',
						dataType:'json',	
						success:function(data){			
							if(data.success){
				        		alert("交易已驳回！");
				        	}else{
				        		alert("交易驳回失败！");
				        	}
						}
					});
			},
			'关闭' : function() {
				$(this).dialog('close');
			}
		});
	$('#D0posTransDetail').dialog('open');
};


$('#signsButton').click(function(){
	if(recordBmp!=''){
//		alert(record.msgType);
//		alert(record.procCode);
//		alert(record.tidSeq);
//		alert(record.txnTypeCode);
		window.open('exportSignPdf.action?transSeq='+recordBmp.transSeq+'&transTime='+recordBmp.transTime+'&tidSeq='+recordBmp.tidSeq);

		return ;
	}
	
});	


var queryPosTransLine = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	window.open('queryPosTransLine.action?transSeq='+record.transSeq+'&tidSeq='+record.tidSeq);

	return ;
};
	


$('#table').flexigrid({ 
	url : 'findD0PosTrans.action', width : 400, dir : "desc", sort : "transSeq", usepager : true, 
	buttons : [
		 {name: "详细信息", bclass: 'page_excel', id: 'cel', onpress: viewD0PosTransDetail },{separator: true }
		/*,{name: "关联交易查询", bclass: 'page_excel', id: 'cel', onpress: queryContactPosTrans },{separator: true }
		,{name: "导出",show:'ROLE_POS_TRANS_EXPORT_CZ', bclass: 'page_excel', id: 'cel', onpress: exportTrans },{separator: true }*/
	],
	colModel : [
	       	 { display: '中心交易流水', dataIndex: 'transSeq', align: 'center', sortable:true }
	     	,{ display: '终端交易流水', dataIndex: 'tidSeq', align: 'center' }
	     	,{ display: '终端号', dataIndex: 'tid', align: 'center' }
	     	,{ display: '商户号', dataIndex: 'mid', align: 'center' }
	     	,{ display: '商户名称', dataIndex: 'merName',align: 'center' }
	     	,{ display: '中心交易时间', dataIndex: 'transTime', sortable:true, render: fmtTime }
	     	,{ display: '交易金额（元）', dataIndex: 'transAmt',align: 'center' }
	     	,{ display: '交易状态', dataIndex: 'transSt', align: 'center' }
	     	,{ display: '交易类型', dataIndex: 'transCodeZh', align: 'center' }	
	     	,{ display: '商户出款状态', dataIndex: 'outcomeStat', align: 'center' }
	     	,{ display: '主帐号', dataIndex: 'pan', align: 'center' }
	     	,{ display: '发卡行', dataIndex: 'issuerName', align: 'center' }
	     	,{ display: '卡种', dataIndex: 'debitCreditFlag', align: 'center' }
	     	,{ display: '应答码', dataIndex: 'respCodeLocal', align: 'center', render: function(row, value) { if ( row.respCodeLocal != '00' ) { return '<font style="color:red;">' + value + '</font>'; } return value; } }
	     	
	]
	});
	
	$('#querybutton').click(function(){ 
		$.queryTable({ formId : 'queryForm', tableId : 'table' });
	});		
	
	
	// Set Table Reload Interval. 
	$('#reloadIntervalField').change(function(){reloadIntervalEvent($('#reloadIntervalField').val());});
	reloadIntervalEvent($('#reloadIntervalField').val());
});