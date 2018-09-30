$(document).ready(function(){	

	$('#theDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	
	
	$('#downFileDetail').click(function(){
		var theDate=$('#theDate').val();
		
		if(!theDate){
			alert("请输入日期");
			return;
		}
		
		$.ajax({
			url		: 'bleaCEBFile.action',
			async	: false,
			data	: {"theDate":theDate,"flag":"TXT"},
			success:function(data){
				if(data.success){
					var href="exportCEBFileDetail.action?flag=TXT&theDate="+theDate;
					window.open(href);
				}else{
					alert("没有对账文件");
				}
			}													
		});
		
	});	
	
	$('#downFileSum').click(function(){
		var theDate=$('#theDate').val();
		
		if(!theDate){
			alert("请输入日期");
			return;
		}
		
		$.ajax({
			url		: 'bleaCEBFile.action',
			async	: false,
			data	: {"theDate":theDate,"flag":"END"},
			success:function(data){
				if(data.success){
					var href="exportCEBFileDetail.action?flag=END&theDate="+theDate;
					window.open(href);
				}else{
					alert("没有对账文件");
				}
			}													
		});
	});	
})