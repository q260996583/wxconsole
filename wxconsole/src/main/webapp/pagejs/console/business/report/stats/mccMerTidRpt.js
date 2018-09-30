$(document).ready(function(){	
	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	
	$('#querybutton').click(function(){
		var endDate = $('#endDate').val();
		
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findMccMerTidRpt.action?endDate="+endDate;
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});		
	
	$('#downFileExl').click(function(){
		var endDate = $('#endDate').val();
		
		if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findMccMerTidRptExl.action?endDate="+endDate;
		window.open(href);
	});	
	
});