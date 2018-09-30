$(document).ready(function(){	


	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#orgCode').ajaxSelect({url:'findAllBank.action',displayField:'bankName',valueField:'orgCode',blank:true});
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var orgCode=$('#orgCode').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		//wxb
		if(dateStart>dateEnd){
			alert("起始日期不能晚于结束日期");
			return false;
		}
		var href="findBankDevideFeeNetting.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&orgCode="+orgCode;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var orgCode=$('#orgCode').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		var href="findBankDevideFeeNettingExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&orgCode="+orgCode;
		window.open(href);
	});	
	
	
})