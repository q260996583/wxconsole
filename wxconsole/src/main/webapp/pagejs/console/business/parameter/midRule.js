$(document).ready(function() {
$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});
$("#paramValue").formValidator({
	empty : false,
	onshow : "请输入内容",
	oncorrect : "√"
}).regexValidator({
	regexp : "^[0-9_]{3}$",
	onerror : "必须是三位数字"
});
$('#addOper').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});

//编辑规则
var editRule= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
	$('#form1').fillObject({obj:record});		
	$('#addOper').dialog("option","title","编辑商户编码生成规则");
	$('#addOper').dialog("option","buttons",
		{'更新' : function() {
				if ($.formValidator.pageIsValid('1')) {
					$.ajaxForm({
								formId : 'form1',
								url : "doUpdateMidRule.action",
								success : function(data) {
									if (data.success) {
										$('#table').flexModifyData(data.root[0]);
										$('#addOper').dialog('close');
										alert('规则更新成功');
									} else {
										alert('更新失败 原因是'
												+ data.syserr);
									}
								}
							});
				} else {
					return false;
				}

			},
			'关闭' : function() {
				$(this).dialog('close');
			}
		});
	$('#addOper').dialog('open');
};	
						
$('#table').flexigrid({ 
		url : 'findMidRule.action',
		buttons : [
				{
					name : "编辑",
					bclass : 'page_excel',
					id : 'cel',
					onpress : editRule
				}],
		width : 400,
		dir : "desc",
		sort : "paramCode",											
		usepager : true,
		colModel : [ {
			display : '规则内容',												
			dataIndex : 'paramValue',
			align : 'center',
			sortable:true
		},{
			display : '描述',												
			dataIndex : 'paramDesc',
			align : 'center',
			sortable:true
		},]
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