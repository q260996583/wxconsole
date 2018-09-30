$(document).ready(function() {
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);


$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

$('#kftpay').click(function(){
	var dateStart=$('#dateStart').val();
	var dateEnd=$('#dateEnd').val();

	if(!dateStart){
		alert("请输入开始日期"+dateStart);
		return;
	}
	if(!dateEnd){
		alert("请输入结束日期"+dateEnd);
		return;
	}
	  var cf = confirm("确定支付？");
      if (!cf) {
          return;
      }

	$.ajax({url:'kftPay.action',	
		   data:{'dateStart':dateStart,'dateEnd':dateEnd},
		   dataType : 'json',			
			type : "POST",
		   success:function(data){
		     	if(data.success == true){
		     		alert("划款完成");				
				}else {		
					alert(data.syserr);
				}		     
				$('#querybutton').trigger('click');
			   }
		   });
	
});	

$('#KftTradeQuery').click(function(){

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
	  var cf = confirm("交易查询?");
      if (!cf) {
          return;
      }
	
	$.ajax({url:'kftTradeQuery.action',	
		   data:{'dateStart':dateStart,'dateEnd':dateEnd},
		   dataType : 'json',			
			type : "POST",
		   success:function(data){
		     	if(data.success == true){
				alert("支付查询完成");
				}else{
					alert(data.syserr);
				}
				$('#querybutton').trigger('click');
		   }
		   });
});	

$('#KftDishonorQuery').click(function(){

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
	  var cf = confirm("退票查询?");
      if (!cf) {
          return;
      }
	
	$.ajax({url:'kftDishonorQuery.action',	
		   data:{'dateStart':dateStart,'dateEnd':dateEnd},
		   dataType : 'json',			
			type : "POST",
		   success:function(data){
		     	if(data.success == true){
		     	alert("退票查询完成");
				}else {					
					alert(data.syserr);
				}
				$('#querybutton').trigger('click');
			   }
		   });
});	
					
$('#table').flexigrid({ 
		url : 'findSzkftPayApplyPage.action',
		width : 400,
		dir : "desc",
		sort : "merName",											
		usepager : true,
		colModel : [ {
			display : '商户名称',												
			dataIndex : 'merName',
			align : 'center',
			sortable:true
		},{
			display : '商户账户全称',												
			dataIndex : 'privateAccntName',											
			sortable:true
		},{
			display : '商户编号',												
			dataIndex : 'mid',											
			sortable:true
		},{
			display : '商户账号',												
			dataIndex : 'privateAccntNo',											
			sortable:true
		},{
			display : '开户行',											
			dataIndex : 'privateAccntBank',											
			sortable:true
		},{
			display : '清算额',											
			dataIndex : 'stlmAmt',	
			render : function(record, value) {
				return (value == '0' || value =='') ? '0.00' :value/100;
			},
			sortable:true
		},{
			display : '应收流量费',											
			dataIndex : 'flowFee',
			render : function(record, value) {
				return (value == '0' || value =='') ? '0.00' :value/100;
			},
			align : 'center'
		},{
			display : '应付款金额',											
			dataIndex : 'realAmt',
			render : function(record, value) {
				return (value == '0' || value =='') ? '0.00' :value/100;
			},
			align : 'center'
		},{
			display : '是否配置行号/网点号',											
			dataIndex : 'bankInfoFlag',
			render : function(record, value) {
				return (value == '0' || value =='') ? '未配置' :'已配置';
			},
			align : 'center'
		},{
			display : '失败原因',											
			dataIndex : 'failureDetail',
			align : 'center'
		},{
			display : '支付状态',				
			dataIndex : 'payStat',
			render : function(record, value) {
				return (value =='1') ? '成功' :((value =='2') ? '失败' :((value =='3') ? '快付通处理中' :((value =='7') ? '退票' :((value =='8') ? '未响应' :((value =='9') ? '未请求' :(value=='6'?'冻结':'未知状态'))))));	
			},
			align : 'center'
		},{
			display : '支付日期',				
			dataIndex : 'payDate',
			align : 'center'
		}]
	});


$('#sumtable').flexigrid({ 
	url : 'findSzkftPayApplyPageSum.action',
	width : 400,
	dir : "desc",
	sort : "merName",											
	usepager : false,
	colModel : [ {
		display : '总笔数',												
		dataIndex : 'totalNum',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '总金额',												
		dataIndex : 'totalAmt',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		sortable:true
	},{
		display : '成功笔数',												
		dataIndex : 'successNum',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '成功金额',											
		dataIndex : 'successAmt',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		sortable:true
	},{
		display : '失败笔数',											
		dataIndex : 'failureNum',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '失败金额',											
		dataIndex : 'failureAmt',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		align : 'center'
	},{
		display : '快付通处理中笔数',											
		dataIndex : 'kftUnhandleNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '快付通处理中金额',											
		dataIndex : 'kftUnhandleAmt',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		align : 'center'
	},{
		display : '未响应笔数',											
		dataIndex : 'fftReqNum',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '未响应金额',											
		dataIndex : 'fftReqAmt',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		align : 'center'
	},{
		display : '未请求笔数',											
		dataIndex : 'fftUnReqNum',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '未请求金额',											
		dataIndex : 'fftUnReqAmt',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		align : 'center'
	},{
		display : '冻结笔数',											
		dataIndex : 'freezeNum',	
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		sortable:true
	},{
		display : '冻结金额',											
		dataIndex : 'freezeAmt',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		},
		align : 'center'
	},{
		display : '退票笔数',											
		dataIndex : 'returnNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '退票金额',											
		dataIndex : 'returnAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}]
});



	
	$('#querybutton').click(function(){
		
		if(!$('#dateStart').val()){
			alert('起始清算日期必须填写');
			return false;
		}
		if(!$('#dateEnd').val()){
			alert('结束清算日期必须填写');
			return false;
		}
		
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
		
		$.queryTable({
			formId : 'queryForm',
			tableId : 'sumtable'
		});
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
});