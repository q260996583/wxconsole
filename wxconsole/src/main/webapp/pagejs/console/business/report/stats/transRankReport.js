$(document).ready(function(){	
	$('#merSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllMerchant.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				colModel : [ {
					display : '商户代码',
					width : 200,
					dataIndex : 'orgCode',
					align : 'center',
					sortable:true
				}, {
					display : '商户名称',
					width : 300,
					dataIndex : 'merName',
					align : 'center'
				}]
			}
	});
	
	//上级选择机构按钮
	$('#qmerName').click(function(){							
		$('#orgCode').val($('#mid').val());
		$('#merSelect').dialog("option","title","商户信息");
		$('#merSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#mid').val(data.orgCode);
				$('#qmerName').val(data.merName);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
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
		//var mid=$('#mid').val();
	//	var qmerName=$('#qmerName').val();
		var reportType=$('#reportType').val();
		var seqType=$('#seqType').val();
		var count=$('#count').val();
		var mid=$('#mid').val();
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}if(!reportType){
			alert("请选择报表类型");
			return;
		}		
		if(!seqType){
			alert("请选择报表排序");
			return;
		}
		//wxb
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
		var channelCode = $('#channelCode').val();
		if(isNaN(count)) {
			alert("检索条数只能填写数字");
			return;
		}
	
		var href="findTransRankReport.action?startDate="+startDate+"&endDate="+endDate+"&reportType="+reportType+"&count="+count+"&seqType="+seqType+"&mid="+mid+"&channelCode="+channelCode;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		//var mid=$('#mid').val();
		var seqType=$('#seqType').val();
		var count=$('#count').val();
		var reportType=$('#reportType').val();
		var mid=$('#mid').val();
		var channelCode = $('#channelCode').val();
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}if(!reportType){
			alert("请选择报表类型");
			return;
		}		
		if(!seqType){
			alert("请选择报表排序");
			return;
		}
		if(isNaN(count)) {
			alert("检索条数只能填写数字");
			return;
		}	
		var href="findTransRankReportExl.action?startDate="+startDate+"&endDate="+endDate+"&reportType="+reportType+"&count="+count+"&seqType="+seqType+"&mid="+mid+"&channelCode="+channelCode;
		window.open(href);
	});	
	
	
});