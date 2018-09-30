$(document).ready(function(){	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		//var mid=$('#mid').val();
		//	var qmerName=$('#qmerName').val();
		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
		//wxb
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
		var href="findPosTransSummary.action?startDate="+startDate+"&endDate="+endDate;
		document.getElementById("printFrame").contentWindow.location.replace(href);		
	});	
	
	$('#downFileExl').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		//var mid=$('#mid').val();	
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}				
		var href="findPosTransSummaryExl.action?startDate="+startDate+"&endDate="+endDate;
		window.open(href);
	});		
});		