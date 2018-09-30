$(document).ready(function(){	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#querybutton').click(function(){
		var endDate = $('#endDate').val();
		var startDate = $('#startDate').val();
		 if(endDate==""){
			alert("查询截止日期不能为空！");
			return;
		}
		if(startDate==""){
			alert("查询开始日期不能为空！");
			return;
		}
		var href="findTerCountRpt.action?endDate="+endDate+"&startDate="+startDate;			
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
	});			
	
	
	$('#downFileExl').click(function(){
		var endDate = $('#endDate').val();
		var startDate = $('#startDate').val();
		if(endDate==""){
			alert("查询截止日期不能为空！");
			return;
		}
		if(startDate==""){
				alert("查询开始日期不能为空！");
				return;
		}
		
		var href="findTerCountRptExl.action?endDate="+endDate+"&startDate="+startDate;			
		window.open(href);
	});	
	
});