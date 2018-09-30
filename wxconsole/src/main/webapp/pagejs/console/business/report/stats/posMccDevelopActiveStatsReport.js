$(document).ready(function(){	
	

	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
	//	var mid=$('#mid').val();
	//	var qmerName=$('#qmerName').val();
		var reportType=$('#reportType').val();
	
		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
		if(!reportType){
			alert("请选择报表类型");
			return;
		}		
		//wxb
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
	
		var href="findPosMccDeveActStatsReport.action?startDate="+startDate+"&endDate="+endDate+"&reportType="+reportType;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		//var mid=$('#mid').val();
		var reportType=$('#reportType').val();
		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
		if(!reportType){
			alert("请选择报表类型");
			return;
		}		
		
		
				
		var href="findPosMccDeveActStatsReportExl.action?startDate="+startDate+"&endDate="+endDate+"&reportType="+reportType;
		window.open(href);
	});	
	
	
})