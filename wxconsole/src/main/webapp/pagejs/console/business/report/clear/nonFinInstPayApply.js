$(document).ready(function(){	

	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		var href="findNonFinInstPayApply.action?dateStart="+dateStart+"&dateEnd="+dateEnd;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFile').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		window.open("exportNonFinInstPayApplyFile.action?dateStart="+dateStart+"&dateEnd="+dateEnd);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}

		var href="findNonFinInstPayApplyExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd;
		window.open(href);
	});	

	
	//合同弹出层
	$('#addReconFile').dialog({ title:"新增文件",
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 400,
		height : 200
		});
	
	//新增按钮
	var addButtons={"新增":function(){			
			var obj=$('#addReconFile').jsonObject();
			$.ajaxFileUpload({
				url:'insertNonFinInstFile.action',			
				secureuri:false,
				fileElementId:'upLoadfile',
				dataType: 'json',
				data:{jsonObject:$.toJSON(obj)},
				success:function (data, status){
					 if(data.success){
						  $('#addReconFile').dialog('close');
						  //$('#querybutton').trigger('click');

						  var list = data.root;
						  
						  alert('导入成功');
	  
					  }
					 else {
						  alert(data.syserr);
					  }
				}			
			});			
	},"关闭":function(){
		$(this).dialog('close');
	}};
	
	$('#insertForm').click(function(){
		$('#addReconFile').fillObject();							 
		$('#addReconFile').dialog('option','buttons',addButtons);
		$('#addReconFile').dialog('open');
	});
});