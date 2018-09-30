$(document).ready(function(){	
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	
	$('#querybutton').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(startDate==""){
			alert("查询开始时间不能够为空！");
			return;
		}
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findPeopleQuarterRpt.action?startDate="+startDate+"&endDate="+endDate;
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});		
	
	$('#downFileExl').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(startDate==""){
			alert("查询开始时间不能够为空！");
			return;
		}
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findPeopleQuarterRptExl.action?startDate="+startDate+"&endDate="+endDate;
		window.open(href);
	});	
	
});