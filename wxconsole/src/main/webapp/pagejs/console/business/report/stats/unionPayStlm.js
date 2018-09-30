$(document).ready(function(){	
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
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
		
		var href="findUnionPayStlm.action?reportType="+reportType;			
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
		var href="findUnionPayStlmExl.action?reportType="+reportType;			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		window.open(href);
	});	
	
	$('#downFile').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="exportFailBySpdBankPayApplyFile.action?bankAccntId=15";			
		href = href + "&dateStart="+startDate + "&dateEnd="+endDate;
		window.open(href);
		
	});	
	
});