$(document).ready(function(){	
	$('#tableTest').queryDialog({
     	width : 600,
     	height : 400
	});
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var channelCode = $('#channelCode').val();
		var channelName = $('#channelName').val();
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		else if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		else if(channelCode==""){
			alert("查询服务商不能够为空！");
			return;
		}
		var href="findfftTransReport.action?reportType=FIRSTCHN_TXN_DAY_PNR";			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		href = href + "&channelCode="+channelCode + "&channelName="+encodeURI(encodeURI(channelName));
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});		
	
	$('#downFileExl').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var channelCode = $('#channelCode').val();
		var channelName = $('#channelName').val();
		
		if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		else if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		else if(channelCode==""){
			alert("查询服务商不能够为空！");
			return;
		}
		var href="findfftTransGatherReportExl.action?reportType=FIRSTCHN_TXN_DAY_PNR";			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		href = href + "&channelCode="+channelCode+ "&channelName="+encodeURI(encodeURI(channelName));;
		window.open(href);
	});	
	
});