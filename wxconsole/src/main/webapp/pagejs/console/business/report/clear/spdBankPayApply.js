$(document).ready(function(){	

	$('#bankSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllBank.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				checkbox : true,
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
				if(data.length>1){
					$('#bankId').val("");
					$('#qbankName').val("");
					for(var i = 0 ;i<data.length; i++){
						if(i==data.length-1){
							$('#bankId').val($('#bankId').val()+data[i].orgCode ) ;
							$('#qbankName').val($('#qbankName').val()+data[i].bankName);
						}else{
							$('#bankId').val($('#bankId').val()+data[i].orgCode +",") ;
							$('#qbankName').val($('#qbankName').val()+data[i].bankName +",");
						}
					}
				}else{
					$('#bankId').val(data.orgCode ) ;
					$('#qbankName').val(data.bankName);
				}
				
				return true;
			}else {
				$('#bankId').val("");
				$('#qbankName').val("");
				return true;
			}
		}});
	});
	
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		var href="findSpdBankPayApply.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFile').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var bankName=$('#qbankName').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		window.open("exportSpdBankPayApplyFile.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&bankName="+encodeURI(encodeURI(bankName)));
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankName=$('#qbankName').val();
		var bankId=$('#bankId').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}

		var href="findSpdBankPayApplyExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&bankName="+encodeURI(encodeURI(bankName));
		window.open(href);
	});	
	
	//银联代付失败走浦发集中代付
	$('#downFileUnionPay').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankName=$('#qbankName').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		window.open("exportFailBySpdBankPayApplyFile.action?bankAccntId=15&dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankName="+encodeURI(encodeURI(bankName)));
		
		
	});	
	//深圳代付通失败走浦发集中代付
	$('#downFileSzdf').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankName=$('#qbankName').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		window.open("exportFailBySpdBankPayApplyFile.action?bankAccntId=14&dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankName="+encodeURI(encodeURI(bankName)));
		
		
	});
	
	// set default query condition:bankId
	$('#bankId').val('1230000001');
	$('#qbankName').val('银联总对总');
	
});