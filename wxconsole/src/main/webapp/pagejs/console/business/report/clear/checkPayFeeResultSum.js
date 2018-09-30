$(document).ready(function(){	
	$('#bankSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllBank.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				colModel : [ {
					display : '支付机构代码',
					width : 200,
					dataIndex : 'orgCode',
					align : 'center',
					sortable:true
				}, {
					display : '支付机构名称',
					width : 300,
					dataIndex : 'bankName',
					align : 'center'
				}]
			}
	});
	
	//上级选择机构按钮
	$('#qbankName').click(function(){							
		$('#bankId').val($('#orgCode').val());
		$('#bankSelect').dialog("option","title","支付机构信息");
		$('#bankSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#bankId').val(data.orgCode);
				$('#qbankName').val(data.bankName);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});

	$('#theDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#theDateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#downloadStat').ajaxSelect({url:'findSecCodeList.action?codeType=DOWNLOAD_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#acctStat').ajaxSelect({url:'findSecCodeList.action?codeType=ACCT_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	
	//查看详细
	var viewDetail=function(record,id){
		if(!record){
			alert('请选择一条记录');
			return;
		}
		window.open('queryCheckPayFeeResultDetail.action?stlmDate='+record.stlmDate+'&orgCode='+record.orgCode);
		return ;
	};
	
	$('#table').flexigrid({ 
		url : 'findCheckPayFeeResultSum.action',
		buttons : [
					{
						name : "详细信息",
						bclass : 'page_excel',
						id : 'cel',
						onpress : viewDetail
					},{
						separator : true
					}],
					
		limit : 20,
		limitOptions : [20, 50, 100, 200],
		width : 400,
		dir : "desc",
		sort : "stlmDate",											
		usepager : true,
		colModel : [ {
			display : '清算日期',												
			dataIndex : 'stlmDate',
			align : 'center',
			sortable:true
		},{
			display : '支付机构名称',												
			dataIndex : 'bankName',	
			align : 'center',
			sortable:true
		},{
			display : '支付机构手续费总金额',												
			dataIndex : 'cupsFee',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '支付机构品牌服务费总金额',											
			dataIndex : 'cupsBrandFee',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '支付机构交易笔数',											
			dataIndex : 'cupsTxnCnt',	
			align : 'center',
			sortable:true
		},{
			display : '支付机构入账金额',											
			dataIndex : 'cupsIncomeAmt',
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '手续费总金额',											
			dataIndex : 'fee',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '品牌服务费总金额',											
			dataIndex : 'brandFee',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '交易笔数',											
			dataIndex : 'txnCnt',	
			align : 'center',
			sortable:true
		},{
			display : '总误差笔数',											
			dataIndex : 'errorTxnCnt',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return   Math.abs($.changeDecimal(parseInt(value)));
				
			}
		},{
			display : '手续费误差总金额',											
			dataIndex : 'errorFee',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '品牌服务费误差总金额',											
			dataIndex : 'errorBrandFee',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value));
				
			}
		},{
			display : '下载状态',											
			dataIndex: 'downloadStatZh'
		},{
			display : '对账状态',											
			dataIndex : 'acctStatZh'
		}]
	});
		
	
	$('#querybutton').click(function(){
		var bankId=$('#bankId').val();
		if(!bankId){
			alert("请选择支付机构");
			return false;
		}
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	//$('#querybutton').trigger('click');
	// set default query condition:bankId
	$('#bankId').val('1230000001');
	$('#qbankName').val('银联总对总');
	
})