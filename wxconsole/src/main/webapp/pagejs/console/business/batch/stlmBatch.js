var loadCtrlInfo = function() {
	$.ajax({url:'findSysCtrl.action',
		success:function(data){		
			document.getElementById("qsday").value=data.root[0].sday;
			document.getElementById("qbatchSt").value=data.root[0].batchSt;
			document.getElementById("qbatchStName").value=data.root[0].batchStName;
	}});
};
var refresh = function(){
	loadCtrlInfo();
	$('#querybutton').trigger('click');
};

function startRefresh(){
	timeID = setInterval('refresh()', 20000);   
};

$(document).ready(function() {

$('#transTime').pickdate({dateFmt:"yyyyMMdd"});	
$('#transTimeEnd').pickdate({dateFmt:"yyyyMMdd"});

loadCtrlInfo();

//日切
var updateSysCtrl = function(record,id){
	var batchSt=$('#qbatchSt').val();
	if(batchSt != '00'){
		alert('前一清分日批处理未成功，不可日切!');
		return;
	}
	var able=confirm('确认日切?');
	if(able){
		$.ajax({
			dataType:'txt',
			url:'updateSysCtrl.action',
			success:function(data){
				alert('操作成功');
				$.ajax({url:'findSysCtrl.action',
					success:function(data){		
						document.getElementById("qsday").value=data.root[0].sday;
						document.getElementById("qbatchSt").value=data.root[0].batchSt;
						document.getElementById("qbatchStName").value=data.root[0].batchStName;
				}});
				$('#table').refresh();										
			}
		});
	}
};
//批处理
var updateStlmBatch = function(record,id){
	var batchSt=$('#qbatchSt').val();
	if(batchSt != '09'){
		alert('日切状态未成功，不可执行批处理!');
		return;
	}
	var able=confirm('确认执行批处理吗?');
	if(able){
		$.ajax({
			dataType:'txt',
			url:'updateStlmBatch.action',
			success:function(data){
				alert('操作成功');
				$.ajax({url:'findSysCtrl.action',
					success:function(data){		
						document.getElementById("qsday").value=data.root[0].sday;
						document.getElementById("qbatchSt").value=data.root[0].batchSt;
						document.getElementById("qbatchStName").value=data.root[0].batchStName;
				}});
				$('#table').refresh();					
			}
		});
	}
};

						
$('#table').flexigrid({ 
		url : 'findStlmBatch.action',
		buttons : [{
						name : "日切",
						show:'ROLE_BATCH_STLM_UPDATE_SYS_CTRL_CZ',
						bclass : 'page_word',
						id : 'txt',
						onpress : updateSysCtrl
					},{
						separator : true
					},{
						name : "批处理",
						show:'ROLE_BATCH_STLM_UPDATE_STLM_BATCH_CZ',
						bclass : 'page_word',
						id : 'txt',
						onpress : updateStlmBatch
					},{
						separator : true
					}],
		 
		width : 400,
		dir : "desc",
		sort : "stepNo",											
		usepager : true,
		colModel : [ {
			display : '清算日期',												
			dataIndex : 'stlmDate',
			align : 'center',
			sortable:true
		},{
			display : '步骤序列号',											
			dataIndex : 'stepNo',
			align : 'center'
		},{
			display : '步骤名称',												
			dataIndex : 'stepName',											
			sortable:true
		},{
			display : '步骤说明',												
			dataIndex : 'stepDes',											
			sortable:true
		},{
			display : '步骤服务命令行',											
			dataIndex : 'stepCmmd',
			align : 'center'
		},{
			display : '步骤类型',											
			dataIndex : 'stepTypeName',											
			sortable:true
		},{
			display : '所有者类型',												
			dataIndex : 'ownerTypeName',											
			sortable:true
		},{
			display : '有效性',												
			dataIndex : 'tid',
			align : 'center'
		},{
			display : '处理状态',											
			dataIndex : 'procStName',
			align : 'center'
		},{
			display : '错误代码',											
			dataIndex : 'errorCode',
			align : 'center'
		},{
			display : '更新时间',											
			dataIndex : 'updDt',
			align : 'center'
		}]
	});
		
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
	startRefresh();
});