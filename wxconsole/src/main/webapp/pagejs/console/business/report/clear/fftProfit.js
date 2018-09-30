$(document).ready(function(){	
	
	$('#thisMonth').pickdate({dateFmt:"yyyyMM"});	
	
	$('#querybutton').click(function(){
		var thisMonth=$('#thisMonth').val();
		
		if(!thisMonth){
			alert("请选择年月");
			return;
		}
		
		var href="findFftProfit.action?thisMonth="+thisMonth;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});		
	
	$('#downFileExl').click(function(){
		var thisMonth=$('#thisMonth').val();
		
		if(!thisMonth){
			alert("请选择年月");
			return;
		}
		
		var href="findFftProfitExl.action?thisMonth="+thisMonth;		
		window.open(href);
	});	
	
});