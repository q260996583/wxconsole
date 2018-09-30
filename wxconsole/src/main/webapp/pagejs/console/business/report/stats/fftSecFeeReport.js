$(document).ready(function(){	
	$('#monthStr').pickdate({dateFmt:"yyyyMM"});
	$('#querybutton').click(function(){
		var monthStr = $('#monthStr').val();
		if(monthStr == ""){
			alert("请选择查询时间！");
			return;
		}
		var reportType = 'FFT_FEE_PS';
		var href="findfftTransReport.action?reportType="+reportType;			
		href = href + "&monthStr="+monthStr ;		
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});		
	$('#downFileExl').click(function(){
	var monthStr = $('#monthStr').val();
		
		if(monthStr == ""){
			alert("请选择查询时间！");
			return;
		}
		var reportType = 'FFT_FEE_PS';
		var href="findfftTransGatherReportExl.action?reportType="+reportType;			
		href = href + "&monthStr="+monthStr ;
		window.open(href);
	});	
	
});