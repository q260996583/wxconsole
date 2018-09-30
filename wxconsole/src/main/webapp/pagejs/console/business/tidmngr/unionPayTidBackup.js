$(document).ready(function() {


	$('#startTime').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#endTime').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	//导出文件
	
	
	$('#downFile').click(function(){
		var dateStart=$('#startTime').val();
		var dateEnd=$('#endTime').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		window.open("exportUnionPayTidBackup.action?startTime="+dateStart+"&endTime="+dateEnd);
		
		
	});	
	
	
	$('#querybutton').click(function(){
		var dateStart=$('#startTime').val();
		var dateEnd=$('#endTime').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		var href="findUnionPayTidBackup.action?startTime="+dateStart+"&endTime="+dateEnd;
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});	
	
});