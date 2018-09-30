$(document).ready(function(){	
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	
	$('#querybutton').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		else if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		//wxb
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
		var href="findCupsSumReport.action?";			
		href = href + "startDate="+startDate + "&endDate="+endDate;
		
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});		
	
	$('#downFileExl').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		else if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findCupsSumReportExl.action?";			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		window.open(href);
	});	
	
});