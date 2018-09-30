$(document).ready(function() {

	$('#startTime').pickdate({dateFmt:"yyyyMMdd"});	
	$('#endTime').pickdate({dateFmt:"yyyyMMdd"});

	$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#tidType').ajaxSelect({url:'findSecCodeList.action?codeType=TID_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#chargeType').ajaxSelect({url:'findSecCodeList.action?codeType=CHARGE_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#instStatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_INST_STATUS',displayField:'codeName',valueField:'codeNo',blank:false});
	$('#q_instStatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_INST_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});
	$('#q_tidOwner').ajaxSelect({url:'findSecCodeList.action?codeType=TID_OWNER',displayField:'codeName',valueField:'codeNo',blank:true});
	
	
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
	
	$('#qChanName').click(function() {
		$('#channelSelect').queryDialogOpen({
				success : function(data) {
				if (data) {
					$('#qChanCode').val(data.channelCode);
					$('#qChanName').val(data.channelName);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});
	
	$('#merchantSelect').queryDialog({
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




$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});


//批量生成二维码
$('#qrCodeBtn').click(function(){
	/*alert("批量生成！");*/
	var qrCount = $("#qrCount").val();
	$.ajax({
		url:'qrcodeProduce.action',
		data:{qrCount:qrCount},
		type: 'POST',
		dataType:'json',	
		success:function(data){			
			if(data.success){
        		alert("批量生成成功！");
        	}else{
        		alert("批量生成失败！");
        	}
		}
	});	
});

//检索rtid rmid
$('#searchBtn').click(function(){
/*	alert("检索");*/
	$('#tid').val(null);
	$('#mid').val(null);
	var qrCodeSeq = $("#qrCodeSeq").val();
	$.ajax({
		url:'searchTidMid.action',
		data:{qrCodeSeq:qrCodeSeq},
		type: 'POST',
		dataType:'json',	
		success:function(data){							
			$('#tid').val(data.rTid);
			$('#mid').val(data.rMid);     
		}
	});	
});

//批量下载
$('#downLoadBtn').click(function(){
	window.open("downQrcodes.action");	
});

//绑定二维码
$('#bindingBtn').click(function(){
	/*alert("绑定");*/
	var qrCodeSeq2 = $("#qrCodeSeq2").val();
	var mid2=$("#mid2").val();
	var tid2=$("#tid2").val();
	$.ajax({
		url:'bindingQrcode.action',
		data:{qrCodeSeq2:qrCodeSeq2,mid2:mid2,tid2:tid2},
		type: 'POST',
		dataType:'json',	
		success:function(data){			
			if(data.success){
        		alert("二维码绑定成功！");
        		$('#tid2').val(null);
        		$('#mid2').val(null);
        		$('#qrCodeSeq2').val(null);
        	}else{
        		alert("二维码绑定失败！");
        	}
		}
	});	
});
		
});