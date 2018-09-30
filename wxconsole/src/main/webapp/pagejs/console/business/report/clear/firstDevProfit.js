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
	
	//上级选择机构按钮
	$('#qchannelName').click(function(){							
		$('#orgCode').val($('#channelCode').val());
		$('#channelSelect').dialog("option","title","服务商信息");
		$('#channelSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#orgCode').val(data.channelCode);
				$('#qchannelName').val(data.channelName);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});
	
	$('#thisMonth').pickdate({dateFmt:"yyyyMM"});	
	
	$('#querybutton').click(function(){
		var thisMonth=$('#thisMonth').val();
		var orgCode=$('#orgCode').val();
		var channelName=$('#qchannelName').val();
		
		if(!thisMonth){
			alert("请选择年月");
			return;
		}
		
		var href="findFirstDevProfit.action?thisMonth="+thisMonth+"&orgCode="+orgCode
		+"&channelName="+encodeURI(encodeURI(channelName));
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});		
	
	$('#downFileExl').click(function(){
		var thisMonth=$('#thisMonth').val();
		var orgCode=$('#orgCode').val();
		var channelName=$('#qchannelName').val();
		
		if(!thisMonth){
			alert("请选择年月");
			return;
		}
		
		var href="findFirstDevProfitExl.action?thisMonth="+thisMonth+"&orgCode="+orgCode
		+"&channelName="+encodeURI(encodeURI(channelName));		
		window.open(href);
	});	
	
});