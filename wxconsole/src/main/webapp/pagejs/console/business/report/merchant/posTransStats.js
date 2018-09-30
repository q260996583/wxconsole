$(document).ready(function(){
	$('#tableTest').queryDialog({
     	width : 600,
     	height : 400
	});
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
	

	$('#startDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#endDate').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		var mid=$('#mid').val();
	//	var qmerName=$('#qmerName').val();
		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
		//wxb
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
		var href="findPosTransStats.action?startDate="+startDate+"&endDate="+endDate+"&mid="+mid;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		var mid=$('#mid').val();

		
		if(!startDate){
			alert("请输入开始日期");
			return;
		}
		if(!endDate){
			alert("请输入结束日期");
			return;
		}
				
		var href="findPosTransStatsExl.action?startDate="+startDate+"&endDate="+endDate+"&mid="+mid;
		window.open(href);
	});	
	
	
})