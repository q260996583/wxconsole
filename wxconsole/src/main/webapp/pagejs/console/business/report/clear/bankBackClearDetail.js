$(document).ready(function(){
	$('#tableTest').queryDialog({
     	width : 600,
     	height : 400
	});
	$('#bankSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllBank.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				colModel : [ {
					display : '支付机构代码',
					width : 200,
					dataIndex : 'orgCode',
					align : 'center',
					sortable:true
				}, {
					display : '支付机构名称',
					width : 300,
					dataIndex : 'bankName',
					align : 'center'
				}]
			}
	});
	
	//上级选择机构按钮
	$('#qbankName').click(function(){							
		$('#bankId').val($('#orgCode').val());
		$('#bankSelect').dialog("option","title","支付机构信息");
		$('#bankSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#bankId').val(data.orgCode);
				$('#qbankName').val(data.bankName);
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
		var bankId=$('#bankId').val();
		var qbankName=$('#qbankName').val();
		var backCode=$('#backCode').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!bankId){
			alert("请输入支付机构");
			return;
		}
		//wxb
		if(dateStart>dateEnd){
			alert("开始日期不能晚于结束日期！");
			return false;
		}
		
		var href="findBankBackClearDetail.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&bankName="+encodeURI(encodeURI(qbankName))+"&backCode="+backCode;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var qbankName=$('#qbankName').val();
		var backCode=$('#backCode').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if(!bankId){
			alert("请输入支付机构");
			return;
		}
		
		var href="findBankBackClearDetailExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&bankName="+encodeURI(encodeURI(qbankName))+"&backCode="+backCode;
		window.open(href);
	});	
	
	// set default query condition:bankId
	$('#bankId').val('1230000001');
	$('#qbankName').val('银联总对总');
})