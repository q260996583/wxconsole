$().ready(function() {
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"});	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"});
    $("#dateStart").val(new Date().Format("yyyyMMdd"));
    $("#dateEnd").val(new Date().Format("yyyyMMdd"));
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		var href="findSzkftPayApply.action?dateStart="+dateStart+"&dateEnd="+dateEnd;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});		
	
	

});
