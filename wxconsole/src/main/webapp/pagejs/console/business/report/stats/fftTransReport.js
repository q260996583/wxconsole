$(document).ready(function(){	
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
	
	
	
	
	
	
	
	
	
	
	$('#startDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"});
	$('#thisMonth').pickdate({dateFmt:"yyyyMM"});	
	
	$('#querybutton').click(function(){
		var reportType = $('#reportType').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(reportType == ""){
			alert("请选择报表类型！");
			return;
		}
		else if(startDate==""){
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
		var href="findfftTransReport.action?reportType="+reportType;			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});		
	
	$('#downFileExl').click(function(){
		var reportType = $('#reportType').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		if(reportType == ""){
			alert("请选择报表类型！");
			return;
		}
		else if(startDate==""){
			alert("查询开始时间不能为空！");
			return;
		}
		else if(endDate==""){
			alert("查询结束时间不能够为空！");
			return;
		}
		var href="findfftTransGatherReportExl.action?reportType="+reportType;			
		href = href + "&startDate="+startDate + "&endDate="+endDate;
		window.open(href);
	});	
	
});