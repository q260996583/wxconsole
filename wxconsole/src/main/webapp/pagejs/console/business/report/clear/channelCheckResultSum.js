$(document).ready(function(){	
	
	

	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#getCheckFile').ajaxSelect({url:'findSecCodeList.action?codeType=DOWNLOAD_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#checkFlag').ajaxSelect({url:'findSecCodeList.action?codeType=ACCT_STAT',displayField:'codeName',valueField:'codeNo',blank:true});
	
	//查看详细
	var viewDetail=function(record,id){
		if(!record){
			alert('请选择一条记录');
			return;
		}
		var channelCode=record.channelCode;
		var checkDate=record.checkDate;
		var channelName=record.channelName;
		window.open('queryChannelCheckResultDetail.action?checkDate='+checkDate+'&channelCode='+channelCode
				+'&channelName='+encodeURI(encodeURI(channelName)));
		
		return ;
	};
	
	$('#table').flexigrid({ 
		url : 'findChannelCheckResultSum.action',
		
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
		sort : "checkDate",											
		usepager : true,
		colModel : [ {
			display : '清算日期',												
			dataIndex : 'checkDate',
			align : 'center',
			sortable:true
		},{
			display : '服务商号',												
			dataIndex : 'channelCode',	
			align : 'center',
			sortable:true
		},{
			display : '服务商名称',												
			dataIndex : 'channelName',	
			align : 'center',
			sortable:true
		},{
			display : '支付机构笔数',												
			dataIndex : 'transNum',	
			align : 'center',
			sortable:true,
			render:function(record,value){
				return    value;
				
			}
		},{
			display : '支付机构金额',											
			dataIndex : 'transAmtBefore',
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
				
			}
		},{
			display : '下载状态',											
			dataIndex : 'getCheckFileZh'
		},{
			display : '对账状态',											
			dataIndex : 'checkFlagZh'
		}]
	});
		
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
	
	
})