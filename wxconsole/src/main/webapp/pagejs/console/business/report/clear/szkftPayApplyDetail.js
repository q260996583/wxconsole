$(document).ready(function() {
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
 
    
//——————————————————————————————————————————商户选择    
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
//——————————————————————————————————————————商户选择    
/*    $("#dateStart").formValidator({
        empty : false,
        onshow : "请输入内容",
        oncorrect : "√"
    }).inputValidator({
        min : 1,
        max : 80,
        onerror : "拓展方名称不能为空"
    });
*/
$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

$('#downFileExl').click(function(){
	var dateStart=$('#dateStart').val();
	var dateEnd=$('#dateEnd').val();
	
	var mid=$('#mid').val();
	var payStat=$('#payStat').val();
	var reconResult=$('#reconResult').val();
	var artiAddFlag=$('#artiAddFlag').val();

	// alert("artiAddFlag:"+artiAddFlag);
	if(!dateStart){
		alert("请输入开始日期");
		return;
	}
	if(!dateEnd){
		alert("请输入结束日期");
		return;
	}
	var href="findSzkftPayApplyPageExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&mid="+mid
	+"&payStat="+payStat+"&reconResult="+reconResult+"&artiAddFlag="+artiAddFlag;
	window.open(href);
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
		align : 'center'
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
	},{
		display : '对账状态',				
		dataIndex : 'reconResult',
		render : function(record, value) {
			return (value =='00') ? '金额不平' :((value =='01') ? '落账' :((value =='02') ? '快付通落账' :((value =='03') ? '已处理' :((value =='04') ? '对平' :(value =='99') ? '未对账' :'其他'))));	
		},
		align : 'center'
	},{
		display : '是否手工录入',											
		dataIndex : 'artiAddFlag',
		render : function(record, value) {
			return (value == '1') ? '是' :'否';
		},
		align : 'center'
	},{
		display : '是否冻结',											
		dataIndex : 'freezeFlag',
		render : function(record, value) {
			return (value == '1') ? '是' :'否';
		},
		align : 'center'
	}]
});


///////////////
$('#sumtable').flexigrid({ 
	url : 'findSzkftPayApplyPageSum.action',
	width : 400,
											
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
		display : '退票金额<',											
		dataIndex : 'returnAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}     ,{
		display : '>金额不平笔数',											
		dataIndex : 'diffAmtNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '金额不平金额',											
		dataIndex : 'diffAmtAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}
  ,{
		display : '落账笔数',											
		dataIndex : 'fftDownNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '落账金额',											
		dataIndex : 'fftDownAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}
,{
		display : '深圳代付落账笔数',											
		dataIndex : 'szdfDownNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '深圳代付落账金额',											
		dataIndex : 'szdfDownAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}
,{
		display : '落账已处理笔数',											
		dataIndex : 'downHandledNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '落账已处理金额',											
		dataIndex : 'downHandledAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}
  ,{
		display : '对平笔数',											
		dataIndex : 'reconFairNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '对平金额',											
		dataIndex : 'reconFairAmt',
		align : 'center',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0.00' :value/100;
		}
	}
  ,{
		display : '未对账笔数',											
		dataIndex : 'unReconNum',
		render : function(record, value) {
			return (value == '0' || value =='') ? '0' :value;
		},
		align : 'center'
	},{
		display : '未对账金额',											
		dataIndex : 'unReconAmt',
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