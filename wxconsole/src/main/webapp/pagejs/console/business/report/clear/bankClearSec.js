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
	$('#clearTransCode').ajaxSelect({url:'findClearTransType.action',displayField:'transType',valueField:'clearTransCode',blank:true});
	
	$('#querybutton').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var qbankName=$('#qbankName').val();
		var qmcc=$('#qmcc').val();
		var mid=$('#mid').val();
		var clearTransCode=$('#clearTransCode').val();
		
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
		if(!qmcc){
			alert("请输入行业类别");
			return;
		}
		//wxb
		if(dateStart>dateEnd){
			alert("开始日期不能晚于结束日期！");
			return false;
		}
		var href="findBankClearSec.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&mcc="+qmcc+"&bankName="+encodeURI(encodeURI(qbankName))+"&mid="+mid+"&clearTransCode="+clearTransCode;
		document.getElementById("printFrame").contentWindow.location.replace(href);
		
		
	});	
	
	$('#downFileExl').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var bankId=$('#bankId').val();
		var qbankName=$('#qbankName').val();
		var qmcc=$('#qmcc').val();
		var mid=$('#mid').val();
		var clearTransCode=$('#clearTransCode').val();
		
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
		if(!qmcc){
			alert("请输入行业类别");
			return;
		}
		
		var href="findBankClearSecExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&bankId="+bankId+"&mcc="+qmcc+"&bankName="+encodeURI(encodeURI(qbankName))+"&mid="+mid+"&clearTransCode="+clearTransCode;
		window.open(href);
	});	
	
	// set default query condition:bankId
	$('#bankId').val('1230000001');
	$('#qbankName').val('银联总对总');
});