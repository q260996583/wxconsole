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
	
	//停用导出文件按钮
	$('#downFile').attr('disabled', true);
	//停用生成新退款文件按钮
	$('#downYLFile').attr('disabled', true);
	//判断机构号是不是建行
	var isJHBrank = false;
	
	
	//上级选择机构按钮
	$('#qbankName').click(function(){							
		$('#bankId').val($('#orgCode').val());
		$('#bankSelect').dialog("option","title","支付机构信息");
		$('#bankSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#bankId').val(data.orgCode);
				$('#qbankName').val(data.bankName);
				if(data.orgCode=='1230000002'){
					isJHBrank = true;
					//$('#trType').show();
					//停用导出文件按钮
					$('#downFile').attr('disabled', true);
					//停用生成新退款文件按钮
					$('#downYLFile').attr('disabled', true);
				}
				else{
					isJHBrank = false;
					$('#trType').hide();
					//启用导出文件按钮
					$('#downFile').attr('disabled', false);
					//启用生成新退款文件按钮
					$('#downYLFile').attr('disabled', false);
					
				}
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});

	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
	$('#mark').ajaxSelect({url:'findSecCodeList.action?codeType=BILL_RESULT',displayField:'codeName',valueField:'codeNo',blank:true});
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		var bankFee = $('#bankFee').val();
		
		if(!bankId){
			alert("请选择支付机构");
			return;
		}
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
			alert("开始日期不能晚于结束日期！");
			return false;
		}
//		if(isJHBrank){
//			if(bankFee==''){
//				alert("请选择银行扣率");
//				return;
//			}
//		}
		var href="findManReturnRpt.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="
		+bankId+"&transSeq="+transSeq+"&mark="+mark+"&backType="+backType+"&bankFee="+bankFee;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		var bankName = $('#qbankName').val();
		
		var bankFee = $('#bankFee').val();
		if(!bankId){
			alert("请选择支付机构");
			return;
		}
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
//		if(isJHBrank){
//			if(bankFee==''){
//				alert("请选择银行扣率");
//				return;
//			}
//		}
		var href="findManReturnRptExl.action?dateStart="+dateStart+"&dateEnd="
		+dateEnd+"&bankId="+bankId+"&transSeq="+transSeq+"&mark="+mark
		+"&backType="+backType+"&bankFee="+bankFee+"&bankName="+encodeURI(encodeURI(bankName));
		window.open(href);
	});	
	
	$('#downFile').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		
		window.open("exportManReturnRptFile.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&transSeq="+transSeq+"&mark="+mark+"&backType="+backType);
		
		
	});	
	
	
	$('#downYLFile').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var transSeq=$('#transSeq').val();
		var mark=$('#mark').val();
		var backType=$('#backType').val();
		
		var a = new Object();
		a.firstDate = dateStart;
		a.lastDate = dateEnd;
		a.bankId = bankId;
		if(transSeq){
			a.transSeq = transSeq;
		}
		if(mark){
			a.mark = mark;
		}
		if(backType){
			a.backType = backType;
		}
		if(bankId!='1230000001'){
			alert("只有银联才可生成新退款文件");
			return ;
		}
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		
		
//		window.open("exportManReturnRptFile.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&transSeq="+transSeq+"&mark="+mark+"&backType="+backType);
		
		$.ajax({
			url		: 'creatNewReturnFile.action',
			type : 'POST',
			async	: false,
			data	: {jsonObject:$.toJSON(a)},
			success:function(data){
				if (data.success) {
					alert("操作成功");				
				} else {
					alert("操作失败"+data.syserr);
					return ;
				}
			}													
		});
		
		
	});
	
	
	// set default query condition:bankId
	$('#bankId').val('1230000001');
	$('#qbankName').val('银联总对总');
	//启用导出文件按钮
	$('#downFile').attr('disabled', false);
	//启用生成新退款文件按钮
	$('#downYLFile').attr('disabled', false);
})