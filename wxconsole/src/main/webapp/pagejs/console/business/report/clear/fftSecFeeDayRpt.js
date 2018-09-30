$(document).ready(function(){	
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	
	$('#querybutton').click(function(){
		var reportType = $('#reportType').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(reportType == ""){
			alert("请选择报表类型！");
			return;
		}
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		
		var href="findFftDevFee.action?reportType="+reportType;			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});		
	
	$('#downFileExl').click(function(){
		var reportType = $('#reportType').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(reportType == ""){
			alert("请选择报表类型！");
			return;
		}
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findFftDevFeeExl.action?reportType="+reportType;			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		window.open(href);
	});	
	
});