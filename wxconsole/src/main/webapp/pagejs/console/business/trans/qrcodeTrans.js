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

var exportQrcTrans = function(){
	if ( $('#orderDateEnd').val() == '' || $('#orderDatebg').val() == '' ) {
		alert('请选择日期范围. ');
		return ;
	}
	var href="toOutQrcTransExl.action?flag=HIDDEN&orderDateEnd="+$('#orderDateEnd').val()+"&orderDatebg="+$('#orderDatebg').val();
	if($('#qmid').val()){href+="&mid="+$('#qmid').val();}
	if($('#orderType').val()){href+="&orderType="+$('#orderType').val();}
	if($('#qtid').val()){href+="&qtid="+$('#qtid').val();}
	if($('#qrcChannel').val()){href+="&qrcChannel="+$('#qrcChannel').val();}
	if($('#qrcPaymentStatus').val()){href+="&qrcPaymentStatus="+$('#qrcPaymentStatus').val();}
	window.open(href);
}

$(document).ready(function() {
	
$('#transferPayorg').ajaxSelect({url:'findAllBank.action',displayField:'bankName',valueField:'orgCode',blank:true});
$('#merchantSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllMerchantDialog.action',					
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
	$('#merchantSelect').queryDialogOpen({success:function(data){
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

$('#qrcTransDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});					

$('#orderDatebg').pickdate({dateFmt:"yyyyMMdd"});	
$('#orderDateEnd').pickdate({dateFmt:"yyyyMMdd"});
$('#clearDate').pickdate({dateFmt:"yyyyMMdd"});

var recordBmp='';
var  viewQrcTransDetail = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	
	var signs = "signs";
	$('#qrcTransDetail :input').each(function(i, n) {
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
	
	
	$('#qrcTransDetail').dialog("option","title","详细信息");
	$('#qrcTransDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#qrcTransDetail').dialog('open');
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
	


//关联交易查询
var queryContactPosTrans=function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	};
	$.ajax({
		url:'contactPosTrans.action',
		async:false,
		data	: {"referenceNum":record.referenceNum,"transSeq":record.transSeq},
		success:function(data){
			if(data.root[0]!=null){
				$('#contactPosTransDetail').refreshWithData(data);
				
				$('#contactPosTrans').dialog("option","title","关联交易");
				$('#contactPosTrans').dialog("option","buttons",{'关闭' : function() {
						$(this).dialog('close');
					}
				});
				$('#contactPosTrans').dialog('open');
			}else{
				alert("没有相关联的交易");
				return;
			}
		}													
	});
	
	
};

$('#table').flexigrid({ 
	url : 'findQrcTrans.action', width : 400, dir : "desc", sort : "transSeq", usepager : true, 
	buttons : [
		 {name: "详细信息", bclass: 'page_excel', id: 'cel', onpress: viewQrcTransDetail },{separator: true }
		,{name: "导出",show:'ROLE_POS_TRANS_EXPORT_CZ', bclass: 'page_excel', id: 'cel', onpress: exportQrcTrans },{separator: true }
	],
	colModel : [
	       	 { display: '机构号', dataIndex: 'instId', align: 'center', sortable:true }
	     	,{ display: '商户号', dataIndex: 'mid', sortable:true, align: 'center' }
	     	,{ display: '终端号', dataIndex: 'tid', sortable:true, algin:'center' }
	     	//,{ display: '订单号', dataIndex: 'orderId', sortable:true, algin:'center'}
	     	,{ display: '商户名称', dataIndex: 'merName', sortable:true, algin:'center'}
	     	,{ display: '订单日期', dataIndex: 'orderTimeDesc', align: 'center' , sortable:true }
	     	,{ display: '清算日期', dataIndex: 'orderDate', align: 'center' }
	     	,{ display: '结算日期', dataIndex: 'clearDate', align: 'center' }
	     	,{ display: '订单类型', dataIndex: 'orderType', sortable:true }	
	     	,{ display: '交易类型', dataIndex: 'transType', align: 'center',sortable:true  }
	     	,{ display: '流水号', dataIndex: 'platformSeq', align: 'center', sortable:true }
	     	,{ display: '二维码渠道号', dataIndex: 'qrcChannel', align: 'center' }
	     	,{ display: '渠道标志', dataIndex: 'qrcChannelFlag', align: 'center' }
	     	,{ display: '支付状态', dataIndex: 'qrcPaymentStatus', align: 'center' }
	     	,{ display: '结算状态', dataIndex: 'checkFlag', align: 'center' }
	     	,{ display: '交易金额', dataIndex: 'tradeAmount', align: 'center' }
	     	,{ display: '手续费', dataIndex: 'feeAmount', align: 'center' }
	     	,{ display: 'BIPI应答码', dataIndex: 'bipiRespCode', align: 'center' }
	     	,{ display: 'BIPI应答信息', dataIndex: 'bipiRespMessage', align: 'center'}
	     	//,{ display: 'BIPI跟踪号', dataIndex: 'bipiTraceId', align: 'center' }
	     	,{ display: '小票打印标志', dataIndex: 'printFlag', align: 'center' }
	     	]
	});
	
	$('#querybutton').click(function(){ 
		//wxb
		var startTime=$("#pospStmtStart").val();
		var endTime=$("#pospStmtEnd").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能晚于结束日期！");
				return false;
			}
		}
		$.queryTable({ formId : 'queryForm', tableId : 'table' }); });		
	
	// Set Table Reload Interval. 
	$('#reloadIntervalField').change(function(){reloadIntervalEvent($('#reloadIntervalField').val());});
	reloadIntervalEvent($('#reloadIntervalField').val());
});