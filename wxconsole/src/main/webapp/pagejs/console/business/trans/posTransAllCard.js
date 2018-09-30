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

$('#posTransDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});					

$('#creditScoreDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 550
});
$('#contactPosTrans').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 1000,
	height : 400
});
$('#creditPnrDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 450
});

$('#pospStmtStart').pickdate({dateFmt:"yyyyMMdd"});	
$('#pospStmtEnd').pickdate({dateFmt:"yyyyMMdd"});
$('#transSt').ajaxSelect({url:'findSecCodeList.action?codeType=TRANS_ST',displayField:'codeName',valueField:'codeNo',blank:true});
$('#rollbackFlag').ajaxSelect({url:'findSecCodeList.action?codeType=ROLLBACK_FLAG',displayField:'codeName',valueField:'codeNo',blank:true});
$('#cancelFlag').ajaxSelect({url:'findSecCodeList.action?codeType=CANCEL_FLAG',displayField:'codeName',valueField:'codeNo',blank:true});
//$('#txnTypeCode').ajaxSelect({url:'findSecCodeList.action?codeType=TRANS_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
$('#transCode').ajaxSelect({url:'findOutTransSecCodeList.action',displayField:'codeName',valueField:'codeNo',blank:true});

var recordBmp='';
var  viewPosTransDetail = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	
	
	var signs = "signs";
	$('#posTransDetail :input').each(function(i, n) {
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
	
	
	$('#posTransDetail').dialog("option","title","详细信息");
	$('#posTransDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#posTransDetail').dialog('open');
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

var queryPnrPosTrans=function(record,id){
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var a = new Object();
	 a.transSeq = record.transSeq;
	$.ajax({
		url		: 'queryMerPnrSocre.action',
		type : 'POST',
		async	: false,
		data	: {jsonObject:$.toJSON(a)},
		success:function(data){
			if (data.success) {
				var k = data.root[0];
				$('#form4').fillObject({obj:k});
				$('#form4 :input').attr('disabled','disabled');
				$('#creditPnrDetail').dialog("option","title","汇付科技的交易明细");
				$('#creditPnrDetail').dialog("option","buttons",
								{
									'关闭' : function() {
										$(this).dialog('close');
									}
								});
				$('#creditPnrDetail').dialog('open');
			} else {
				alert(data.syserr);
				return ;
			}
		}													
	});
	
	
};

//积分融合支付
var queryCreditScore = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var a = new Object();
	 a.transSeq = record.transSeq;
	 a.tidSeq = record.tidSeq;
	$.ajax({
		url		: 'queryMerCreditScore.action',
		type : 'POST',
		async	: false,
		data	: {jsonObject:$.toJSON(a)},
		success:function(data){
			if (data.success) {
				var k = data.root[0];
				$('#form3').fillObject({obj:k});
				$('#form3 :input').attr('disabled','disabled');
				
//				$('#creditScoreDetail').refreshWithData(data);
				
				$('#creditScoreDetail').dialog("option","title","大丰收积分消费的交易明细");
				$('#creditScoreDetail').dialog("option","buttons",
								{
									'关闭' : function() {
										$(this).dialog('close');
									}
								});

				$('#creditScoreDetail').dialog('open');
			} else {
				alert(data.syserr);
				return ;
			}
		}													
	});
	
	
};
$('#table').flexigrid({ 
		url : 'findPosTransAllCard.action',
		buttons : [{
						name : "详细信息",
						bclass : 'page_excel',
						id : 'cel',
						onpress : viewPosTransDetail
					},{
						separator : true
					},{
						name : "交易详细",
						bclass : 'page_excel',
						id : 'cel',
						onpress : queryPosTransLine
					},{
						separator : true
					},{
						name : "积分融合支付",
						bclass : 'page_excel',
						id : 'cel',
						onpress : queryCreditScore
					},{
						separator : true
					},{
						name : "汇付积分查询",
						bclass : 'page_excel',
						id : 'cel',
						onpress : queryPnrPosTrans
					},{
						separator : true
					},{
						name : "关联交易查询",
						bclass : 'page_excel',
						id : 'cel',
						onpress : queryContactPosTrans
					},{
						separator : true
					}],
					
		width : 400,
		dir : "desc",
		sort : "transSeq",											
		usepager : true,
		colModel : [ {
			display : '中心交易流水',												
			dataIndex : 'transSeq',
			align : 'center',
			sortable:true
		},{
			display : '终端交易流水',											
			dataIndex : 'tidSeq',
			align : 'center'
		},/*{
			display : '交易类型',												
			dataIndex : 'txnTypeCode',											
			sortable:true
		},*/{
			display : '本系统清算日',												
			dataIndex : 'pospStmtDesc',											
			sortable:true
		},{
			display : '中心交易时间',											
			dataIndex : 'transTimeDesc',
			align : 'center'
		},{
			display : '中心交易类型',											
			dataIndex : 'transCodeZh',
			align : 'center'
		},{
			display : '交易金额(元)',											
			dataIndex : 'transAmtDesc',											
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
			dataIndex : 'panSearch',
			align : 'center'
		},{
			display : '交易状态',											
			dataIndex : 'transStZh',
			align : 'center'
		},{
			display : '数字签名',											
			dataIndex : 'signsZh',
			align : 'center'
		}]
	});
		
	
	$('#querybutton').click(function(){
		if(!$('#pospStmtStart').val()){
			alert('起始日期必须填写');
			return false;
		}
		if(!$('#pospStmtEnd').val()){
			alert('结束日期必须填写');
			return false;
		}
		
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	
	$('#exlbutton').click(function(){
		if(!$('#pospStmtStart').val()){
			alert('起始日期必须填写');
			return false;
		}
		if(!$('#pospStmtEnd').val()){
			alert('结束日期必须填写');
			return false;
		}
		
		var href="toOutPosTransExl.action?flag=ALL_CARD&pospStmtEnd="+$('#pospStmtEnd').val()+"&pospStmtStart="+$('#pospStmtStart').val();
		if($('#qmid').val()){href+="&mid="+$('#qmid').val();}
		if($('#qtid').val()){href+="&tid="+$('#qtid').val();}
		if($('#transSeq').val()){href+="&transSeq="+$('#transSeq').val();}
		if($('#tidSeq').val()){href+="&tidSeq="+$('#tidSeq').val();}
		if($('#pan').val()){href+="&panSearch="+$('#pan').val();}
		if($('#transSt').val()){href+="&transSt="+$('#transSt').val();}
		if($('#transCode').val()){href+="&transCode="+$('#transCode').val();}
		if($('#rollbackFlag').val()){href+="&rollbackFlag="+$('#rollbackFlag').val();}
		if($('#cancelFlag').val()){href+="&cancelFlag="+$('#cancelFlag').val();}
		window.open(href);
	});		
	//初始化查询;
	//$('#querybutton').trigger('click');
	
	$('#contactPosTransDetail').flexigrid({
	    url : 'contactPosTrans.action',
		width : 800,
		checkbox : false,
		usepager : false,					
		colModel : [ {
			display : '中心交易流水',												
			dataIndex : 'transSeq',
			align : 'center',
			sortable:true
		},{
			display : '终端交易流水',											
			dataIndex : 'tidSeq',
			align : 'center'
		},{
			display : '本系统清算日',												
			dataIndex : 'pospStmtDesc',											
			sortable:true
		},{
			display : '中心交易时间',											
			dataIndex : 'transTimeDesc',
			align : 'center'
		},{
			display : '中心交易类型',											
			dataIndex : 'transCodeZh',
			align : 'center'
		},{
			display : '交易金额(元)',											
			dataIndex : 'transAmtDesc',											
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
			dataIndex : 'panSearch',
			align : 'center'
		},{
			display : '交易状态',											
			dataIndex : 'transStZh',
			align : 'center'
		},{
			display : '数字签名',											
			dataIndex : 'signsZh',
			align : 'center'
		},{
			display : '冲正标志',											
			dataIndex : 'rollbackFlagZh',
			align : 'center'
		},{
			display : '撤销标志',											
			dataIndex : 'cancelFlagZh',
			align : 'center'
		},{
			display : '清算标志',											
			dataIndex : 'settleFlagZh',
			align : 'center'
		},{
			display : '退款类型',											
			dataIndex : 'signsZh',
			align : 'center'
		},{
			display : '退款数额',											
			dataIndex : 'signsZh',
			align : 'center'
		},{
			display : '已退款金额',											
			dataIndex : 'backAmtDesc',
			align : 'center'
		}]
	});	
	
});