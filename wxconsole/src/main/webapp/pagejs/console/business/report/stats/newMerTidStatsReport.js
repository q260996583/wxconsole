$(document).ready(function(){	
	$('#tableTest').queryDialog({
     	width : 600,
     	height : 400
	});
	$('#channelSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllChannel.action',					
				width : 550,
				dir : "channelCode",
				sort:"channelCode",
				usepager : true,
				colModel : [ {
					display : '服务商代码',
					width : 200,
					dataIndex : 'channelCode',
					align : 'center',
					sortable:true
				}, {
					display : '服务商名称',
					width : 300,
					dataIndex : 'channelName',
					align : 'center'
				}]
			}
	});
	
	//选择服务商按钮
	
	$('#channelName').click(function() {
		$('#channelSelect').queryDialogOpen({
			clear : function() {
				$('#channelName').val('');
				$('#channelCode').val('');
			},
			success : function(data) {
				if (data) {
					$('#channelCode').val(data.channelCode);
					$('#channelName').val(data.channelName);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});	

	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		var reportType=$('#reportType').val();
	//	var qmerName=$('#qmerName').val();
		var channelCode = $('#channelCode').val();
	//	var channelName = $('#channelName').val();
		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
		if(!reportType){
			alert("请选择报表类型");
			return;
		}
		//wxb
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
		var href="findMerTidStatsReport.action?startDate="+startDate+"&endDate="+endDate+"&reportType="+reportType+"&channelCode="+channelCode;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		var reportType=$('#reportType').val();
		var channelCode = $('#channelCode').val();
		//var channelName = $('#channelName').val();
		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
		if(!reportType){
			alert("请选择报表类型");
			return;
		}
		
		var href="findMerTidStatsReportExl.action?startDate="+startDate+"&endDate="+endDate+"&reportType="+reportType+"&channelCode="+channelCode;
		window.open(href);
	});	
	
	
})