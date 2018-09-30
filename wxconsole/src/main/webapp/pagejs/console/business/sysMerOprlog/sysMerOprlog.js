$(document).ready(function() {
$('#tidDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});
var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$.ajax({
		type : 'POST',
		url : 'findSysMerOprlogDetail.action',
		data:{jsonObject : $.toJSON(record)},
		success : function(data) {
			if (data.success) {
				if (data.root.length > 0) {
					var rec = data.root[0];
					$('#form2').fillObject({obj:rec});
				} else {
					alert("未找到公告");
				}
			} else {
				alert("未找到公告");
			}
		}
	});
	$('#form2 :input').attr('disabled','disabled');
	$('#tidDetail').dialog("option","title","详细信息");
	$('#tidDetail').dialog("option","buttons",{'关闭' : function() {
			$('#form2 :input').attr('disabled','');
			$(this).dialog('close');
		}
	});
	$('#tidDetail').dialog('open');
};

$('#table').flexigrid({ 
		url : 'findSysMerOprlog.action',
		buttons : [
			{
				name : "详细信息",
				bclass : 'page_excel',
				id : 'cel',
				onpress : viewtid
			},{
				separator : true
			}],
		width : 400,
		dir : "desc",
		sort : "oprNo",											
		usepager : true,
		colModel : [{
			display : '序号',
			dataIndex : 'oprNo',
			align : 'center',
			sortable:true
			
		},{
			display : '操作时间',
			dataIndex : 'oprTime',
			align : 'center',
			sortable:true
			
		},{
			display : '操作员登录名',
			dataIndex : 'oprLoginId',
			align : 'center'
		},{
			display : '操作员姓名',
			dataIndex : 'oprUserId',
			align : 'center'
		},{
			display : '操作名称',
			dataIndex : 'resZh', 
			align : 'center',
			sortable:true
		},{
			display : '操作所在IP',
			dataIndex : 'oprIp',
			align : 'center'
		},{
			display : '操作状态',
			dataIndex : 'oprSuccess',
			align : 'center',
			decode:{'00':"成功",'01':"失败"}
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