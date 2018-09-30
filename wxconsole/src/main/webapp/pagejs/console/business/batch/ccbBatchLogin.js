$(document).ready(function() {

$('#transTime').pickdate({dateFmt:"yyyyMMdd"});	
$('#transTimeEnd').pickdate({dateFmt:"yyyyMMdd"});

$.ajax({url:'findOuterTidCtrl.action',
	success:function(data){		
		document.getElementById("qcurrIdSeq").value=data.root[0].currIdSeq;
		document.getElementById("qcycleStat").value=data.root[0].cycleStat;
		document.getElementById("qcycleStatName").value=data.root[0].cycleStatName;
		document.getElementById("qupdatetime").value=data.root[0].updatetime;
}});

//批量签到
var updateOuterTidCtrl = function(record,id){
	var batchSt=$('#qcycleStat').val();
	if(batchSt != '2'){
		alert('前一次批量签到未结束，不可开始批量签到!');
		return;
	}
	var able=confirm('确认开始批量签到?');
	if(able){
		$.ajax({
			dataType:'txt',
			url:'updateOuterTidCtrl.action',
			success:function(data){
				alert('操作成功');
				$.ajax({url:'findOuterTidCtrl.action',
					success:function(data){		
						document.getElementById("qcurrIdSeq").value=data.root[0].currIdSeq;
						document.getElementById("qcycleStat").value=data.root[0].cycleStat;
						document.getElementById("qcycleStatName").value=data.root[0].cycleStatName;
				}});
				$('#table').refresh();										
			}
		});
	}
};

//单个终端签到
var  tidRegister= function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var status = record['status'];
	if(status!='01'){
		alert("只有启用的外部终端才能批结算签退签到");
		return ;
	}
	var able=confirm('确认该终端批结算签退签到?');
	if(able){
		$.ajax({url:'doOuterTidRegister.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('签到成功');
					$('#table').refresh();
				}
				else{
					alert('签到失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};
						
$('#table').flexigrid({ 
		url : 'findOuterTidHsm.action',
		buttons : [{
						name : "批量签到",
						show:'ROLE_BATCH_STLM_UPDATE_OUTER_TID_CTRL_CZ',
						bclass : 'page_word',
						id : 'txt',
						onpress : updateOuterTidCtrl
					},{
						separator : true
					},{
						name : "单个终端签到",
						show:'ROLE_TID_MN_STATUS_CZ',
						bclass : 'page_word',
						id : 'txt',
						onpress : tidRegister
					},{
						separator : true
					}],
		 
		width : 400,
		dir : "desc",
		sort : "mid",											
		usepager : true,
		colModel : [ {
			display : '银行编码',												
			dataIndex : 'bankCode',
			align : 'center',
			sortable:true
		},{
			display : '商户号',											
			dataIndex : 'mid',
			align : 'center'
		},{
			display : '终端号',												
			dataIndex : 'tid',											
			sortable:true
		},{
			display : '签到状态',												
			dataIndex : 'signStatName',											
			sortable:true
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
	
	
	
	function reflesh(){	
		document.location.reload();
	}
	
	 $(document).ready(function() {
		 timeID = setTimeout(reflesh,70000);   
	  });
});