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
	

	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#backCode').ajaxSelect({url:'findSecCodeList.action?codeType=BACK_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var mid=$('#mid').val();
		var qmerName=$('#qmerName').val();
		var backCode=$('#backCode').val();
		
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
		if(!mid){
			alert("请输入商户");
			return;
		}
		
		var href="findMerBackClearDetail.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&mid="+mid+"&merName="+encodeURI(encodeURI(qmerName))+"&backCode="+backCode;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var mid=$('#mid').val();
		var qmerName=$('#qmerName').val();
		var backCode=$('#backCode').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!mid){
			alert("请输入商户");
			return;
		}
		
		var href="findMerBackClearDetailExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&mid="+mid+"&merName="+encodeURI(encodeURI(qmerName))+"&backCode="+backCode;
		window.open(href);
	});	
	
	
})