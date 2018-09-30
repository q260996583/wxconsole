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
				checkbox : false,
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
				if(data.length>1){
					$('#bankId').val("");
					$('#qbankName').val("");
					for(var i = 0 ;i<data.length; i++){
						if(i==data.length-1){
							$('#bankId').val($('#bankId').val()+data[i].orgCode ) ;
							$('#qbankName').val($('#qbankName').val()+data[i].bankName);
						}else{
							$('#bankId').val($('#bankId').val()+data[i].orgCode +",") ;
							$('#qbankName').val($('#qbankName').val()+data[i].bankName +",");
						}
					}
				}else{
					$('#bankId').val(data.orgCode ) ;
					$('#qbankName').val(data.bankName);
				}
				
				return true;
			}else {
				alert("请选择机构号");
				return false;
			}
		}});
	});

	$('#theDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#theDateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#downLoadStat').ajaxSelect({url:'findSecCodeList.action?codeType=DOWNLOAD_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	//$('#accStat').ajaxSelect({url:'findSecCodeList.action?codeType=ACCT_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	
	//查看详细
	var viewDetail=function(record,id){
		if(!record){
			alert('请选择一条记录');
			return;
		}
		var bankId=record.bankId;
		if(bankId=="1230000001"){
			window.open('queryCheckResultDetail.action?searchDate='+record.theDate+'&bankId='+record.bankId
					+'&fftDownLoadCnt='+record.fftDownLoadCnt+'&fftDownLoadAmt='+(record.fftDownLoadAmt)/100
					+'&orgDownLoadCnt='+record.orgDownLoadCnt+'&orgDownLoadAmt='+(record.orgDownLoadAmt)/100
					+'&fftDayCutCnt='+record.fftDayCutCnt+'&fftDayCutAmt='+(record.fftDayCutAmt)/100
					+'&orgDayCutCnt='+record.orgDayCutCnt+'&orgDayCutAmt='+(record.orgDayCutAmt)/100
					+'&returnCnt='+record.returnCnt+'&returnAmt='+(record.returnAmt)/100
					+'&bankName='+encodeURI(encodeURI(record.bankName))+'&bankTxnCnt='+record.bankTxnCnt
					+'&bankTxnAmt='+(record.bankTxnAmt)/100+'&sysTxnCnt='+record.sysTxnCnt+'&sysTxnAmt='+(record.sysTxnAmt)/100);

		}
		else if(bankId="1230000002"){
			window.open('queryCheckJHResultDetail.action?searchDate='+record.theDate+'&bankId='+record.bankId
					+'&fftDownLoadCnt='+record.fftDownLoadCnt+'&fftDownLoadAmt='+(record.fftDownLoadAmt)/100
					+'&orgDownLoadCnt='+record.orgDownLoadCnt+'&orgDownLoadAmt='+(record.orgDownLoadAmt)/100
					+'&fftDayCutCnt='+record.fftDayCutCnt+'&fftDayCutAmt='+(record.fftDayCutAmt)/100
					+'&orgDayCutCnt='+record.orgDayCutCnt+'&orgDayCutAmt='+(record.orgDayCutAmt)/100
					+'&returnCnt='+record.returnCnt+'&returnAmt='+(record.returnAmt)/100
					+'&monNoEqCnt='+record.monNoEqCnt+'&monNoEqAmt='+(record.monNoEqAmt)/100
					+'&bankName='+encodeURI(encodeURI(record.bankName))+'&bankTxnCnt='+record.bankTxnCnt
					+'&bankTxnAmt='+(record.bankTxnAmt)/100+'&sysTxnCnt='+record.sysTxnCnt+'&sysTxnAmt='+(record.sysTxnAmt)/100);

		}
		
		return ;
	};
	
	$('#table').flexigrid({ 
		url : 'findCheckResultSum.action',
		
		buttons : [
					{
						name : "详细信息",
						bclass : 'page_excel',
						id : 'cel',
						onpress : viewDetail
					},{
						separator : true
					}],
					
		limit : 100,
		limitOptions : [20, 50, 100, 200],
		width : 400,
		dir : "desc",
		sort : "theDate",											
		usepager : true,
		colModel : [ {
			display : '清算日期',												
			dataIndex : 'theDate',
			align : 'center',
			sortable:true
		},{
			display : '支付机构名称',												
			dataIndex : 'bankName',	
			align : 'center',
			sortable:true
		},{
			display : '支付机构笔数',												
			dataIndex : 'bankTxnCnt',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    value;
				
			}
		},{
			display : '支付机构金额',											
			dataIndex : 'bankTxnAmt',
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
				
			}
		},{
			display : 'POS收单平台笔数',											
			dataIndex : 'sysTxnCnt',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    value;
				
			}
		},{
			display : 'POS收单平台金额',											
			dataIndex : 'sysTxnAmt',
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
				
			}
		},{
			display : '下载状态',											
			dataIndex : 'downLoadStatZh'
		},{
			display : '对账状态',											
			dataIndex : 'accStatZh',
			render:function(record,value){
				if (record.accStat=='0') {
					value = '未对账';
				} else if (record.accStat=='2') {
					value = '已对账,已对平';
				} else if (record.accStat=='3') {
					value = '已对账,未对平';
				}
				return value;
			}
		}]
	});
		
	
	$('#querybutton').click(function(){
		//wxb
		var startTime=$("#theDate").val();
		var endTime=$("#theDateEnd").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能晚于结束日期");
				return false;
			}
		}
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	// set default query condition:bankId
	$('#bankId').val('1230000001');
	$('#qbankName').val('银联总对总');

	//初始化查询;
	$('#querybutton').trigger('click');
	
	
})