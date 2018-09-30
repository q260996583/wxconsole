$(document).ready(function(){
	$('#tableTest').queryDialog({
     	width : 600,
     	height : 400
	});
	
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#mark').ajaxSelect({url:'findSecCodeList.action?codeType=BILL_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		var href="findScoreOrgReturnRpt.action?dateStart="+dateStart+"&dateEnd="+dateEnd
		+"&transSeq="+transSeq+"&mark="+mark+"&backType="+backType;
		document.getElementById("printFrame").contentWindow.location.replace(href);
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		var href="findScoreOrgReturnRptExl.action?dateStart="+dateStart+"&dateEnd="
		+dateEnd+"&transSeq="+transSeq+"&mark="+mark+"&backType="+backType;
		window.open(href);
	});	
	
	$('#downYLFile').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		var href="findScoreOrgReturnExl.action?dateStart="+dateStart+"&dateEnd="
		+dateEnd+"&transSeq="+transSeq+"&mark="+mark+"&backType="+backType;
		window.open(href);
	});
})