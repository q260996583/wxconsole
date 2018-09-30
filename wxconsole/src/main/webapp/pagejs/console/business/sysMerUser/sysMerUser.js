$(document).ready(function() {

	var unlock = function(record,id){
		if(!record){
			alert('请选择一条记录');
			return false;
		}
		var able=confirm('确认解锁该用户?');
		if(able){
			$.ajax({url:'unlockSysMerUser.action',
				data:{jsonObject:$.toJSON(record)},
				success:function(data){
					if(data.success){
						alert('解锁成功');
						$('#table').refresh();
					}
					else{
						alert('解锁失败 失败原因是'+data.syserr);
					}												
				}
			});
		}
	};
	
$('#table').flexigrid({ 
		url : 'findSysMerUser.action',
		buttons : [
			{
				name : "解锁用户",
				bclass : 'page_excel',
				id : 'cel',
				show:'ROLE_USER_MER_UNLOCK',
				onpress : unlock
			}],
		width : 400,
		dir : "desc",
		sort : "userid",											
		usepager : true,
		colModel : [{
			display : '用户号',
			dataIndex : 'userid',
			align : 'center',
			sortable:true
			
		},{
			display : '用户登录名',
			dataIndex : 'loginid',
			align : 'center',
			sortable:true
			
		},{
			display : '用户名称',
			dataIndex : 'username',
			align : 'center'
		},{
			display : '服务商号',
			dataIndex : 'channel',
			align : 'center'
		},{
			display : '商户号',
			dataIndex : 'mid', 
			align : 'center',
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
});