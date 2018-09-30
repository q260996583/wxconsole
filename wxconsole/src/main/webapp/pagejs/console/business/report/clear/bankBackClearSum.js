$(document).ready(function(){
	$('#tableTest').queryDialog({
     	width : 600,
     	height : 400
	});
	$('#mccSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findMccDesc.action',					
				width : 550,
				dir : "mcc",
				sort:"mcc",
				usepager : true,
				colModel : [ {
					display : 'MCC码',
					width : 100,
					dataIndex : 'mcc',
					align : 'center',
					sortable:true
				}, {
					display : '描述',
					width : 300,
					dataIndex : 'mccDesc',
					align : 'center'
				}
				, {
					display : '总扣率(%)',
					width : 100,
					dataIndex : 'rateBackup',
					align : 'center'
				}]
			}
	});
	
	//上级选择机构按钮
	$('#qmccDesc').click(function(){							
		$('#qmcc').val($('#qmcc').val());
		$('#mccSelect').dialog("option","title","行业类别信息");
		$('#mccSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#qmcc').val(data.mcc);
				$('#qmccDesc').val(data.mccDesc);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});
	
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var qmcc=$('#qmcc').val();
		var qmccDesc=$('#qmccDesc').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!qmcc){
			alert("请输入行业类别");
			return;
		}
		//wxb
		if(dateStart>dateEnd){
			alert("开始日期不能晚于结束日期！");
			return false;
		}
		var href="findBankBackClearSum.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&mcc="+qmcc+"&mccDesc="+encodeURI(encodeURI(qmccDesc));
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var qmcc=$('#qmcc').val();
		var qmccDesc=$('#qmccDesc').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!qmcc){
			alert("请输入行业类别");
			return;
		}
		
		var href="findBankBackClearSumExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&mcc="+qmcc+"&mccDesc="+encodeURI(encodeURI(qmccDesc));
		window.open(href);
	});	
	
	
})