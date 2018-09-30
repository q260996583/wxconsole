$(document).ready(function() {

$('#signStat').ajaxSelect({url:'findSecCodeList.action?codeType=SIGN_STAT',displayField:'codeName',valueField:'codeNo',blank:true});

//签到
var pltSign = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	if(record.signStat != '0'){
	   alert('已签到，不得重复签到！');
	   return false;
	}
	var able=confirm('确认签到该机构');
	if(able){
		$.ajax({url:'doSignPlt.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('签到成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};

//签退
var pltSignOff = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认签退该机构');
	if(able){
		$.ajax({url:'doSignOffPlt.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('签退成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};

// 线路测试
var sysEchoTest = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认进行线路测试？');
	if(able){
		$.ajax({url:'doSysEchoTest.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('线路测试成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};

//重置密钥
var resetKey = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认重置密钥该机构');
	if(able){
		$.ajax({url:'doResetKey.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('重置密钥成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};
//重置PIK
var resetPIK = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认重置PIN');
	if(able){
		$.ajax({url:'doResetPIK.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('重置PIN成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};
//重置MAK
var resetMAK = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认重置MAC');
	if(able){
		$.ajax({url:'doResetMAK.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('重置MAC成功');
					$('#table').refresh();
				}
				else{
					alert(data.syserr);
				}												
			}
		});
	}
};
$('#table').flexigrid({ 
		url : 'findPltSign.action',
		buttons : [
				{
					name : "签到",														
					show:'ROLE_PLATFORM_SIGN_CZ',
					bclass : 'page_add',
					id : 'txt',
					onpress : pltSign
				},{
					separator : true
				},{
					name : "签退",
					show:'ROLE_PLATFORM_SIGNOFF_CZ',
					bclass : 'page_delete',
					id : 'cel',
					onpress :pltSignOff
				},{
					separator : true
				},{
					name : "线路测试",
					bclass : 'page_word',
					id : 'cel',
					onpress :sysEchoTest
				},{
					separator : true
				},{
					name : "重置密钥",
					show:'ROLE_PLATFORM_RESETKEY_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :resetKey
				},{
					separator : true
				},{
					name : "重置PIN",
					bclass : 'page_word',
					id : 'cel',
					onpress :resetPIK
				},{
					separator : true
				},{
					name : "重置MAC",
					bclass : 'page_word',
					id : 'cel',
					onpress :resetMAK
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "orgCode",											
		usepager : true,
		colModel : [ {
			display : '内部机构号',												
			dataIndex : 'orgCode',
			align : 'center',
			sortable:true
		},{
			display : '支付机构名称',												
			dataIndex : 'bankName',											
			sortable:true
		},{
			display : '签到状态',												
			dataIndex : 'signStatZh',											
			sortable:true
		},{
			display : '批次号',											
			dataIndex : 'batchNo',											
			sortable:true
		},{
			display : '最后更新时间',											
			dataIndex : 'lastUptTime',
			align : 'center',
			datefmt : 'Y-m-d H:i:s'
		},{
			display : '最后更新用户',											
			dataIndex : 'lastUptAcc',
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
	
});