$(document).ready(function(){	
	
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	
	$('#errType').ajaxSelect({url:'findSecCodeList.action?codeType=ERR_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});

	$('#querybutton').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var errType = $('#errType').val();
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
		var href="findCupsRoundSumReport.action?";			
		href = href + "startDate="+startDate + "&endDate="+endDate;
		if (errType) {
			href += "&errType=" + errType;
		}
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});		
	
	$('#downFileExl').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var errType = $('#errType').val();
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		else if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findCupsRoundSumReportExl.action?";			
		href = href + "startDate="+startDate + "&endDate="+endDate;
		if (errType) {
			href += "&errType=" + errType;
		}
		window.open(href);
	});	
	
});