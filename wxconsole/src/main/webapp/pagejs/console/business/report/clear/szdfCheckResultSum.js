$(document).ready(function(){	
	$('#theDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#theDateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	
	//查看详细
	var viewDetail=function(record,id){
		if(!record){
			alert('请选择一条记录');
			return;
		}		   //queryCheckResultDetail
		window.open('querySzdfCheckResultDetail.action?searchDate='+record.theDate
				+'&fftDownLoadCnt='+record.fftDownLoadCnt+'&fftDownLoadAmt='+(record.fftDownLoadAmt)/100
				+'&szdfDownLoadCnt='+record.szdfDownLoadCnt+'&szdfDownLoadAmt='+(record.szdfDownLoadAmt)/100
				+'&fftCnt='+record.fftCnt+'&fftAmt='+(record.fftAmt)/100
				+'&szdfCnt='+record.szdfCnt+'&szdfAmt='+(record.szdfAmt)/100		
		        +'&handleCnt='+record.handleCnt+'&handleAmt='+(record.handleAmt)/100
                +'&amtDiffCnt='+record.amtDiffCnt+'&amtDiffAmt='+(record.amtDiffAmt)/100);
		return ;
	};
	
	$('#table').flexigrid({ 
		url : 'findSzdfCheckResultSum.action',
		
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
			display : '支付日期',												
			dataIndex : 'theDate',
			align : 'center',
			sortable:true
		},{
			display : '深圳代付笔数',												
			dataIndex : 'szdfCnt',	
			render : function(record, value) {
				return (value == '0' || value =='') ? '0' :value;
			},
			sortable:true
		},{
			display : '深圳代付金额',											
			dataIndex : 'szdfAmt',
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
				
			}
		},{
			display : '笔数',											
			dataIndex : 'fftCnt',
			render : function(record, value) {
				return (value == '0' || value =='') ? '0' :value;
			},
			sortable:true
		},{
			display : '金额',											
			dataIndex : 'fftAmt',
			render:function(record,value){
				return    $.changeDecimal(parseFloat(value)/100);
				
			}
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
});