$(document).ready(function() {
$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
          	{id:"groupNo",formValidator:{empty:false},inputValidator:{min:1,max:5,onerror:"组号必填最多5位"}},
	        {id:"groupName",formValidator:{empty:false},inputValidator:{min:1,max:100,onerror:"组名称必填最多100位"}}
	   	];
$.someAuthentication(list);	
$('#addtid').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 1000,
	height : 500
});
$('#tidDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 1000,
	height : 500
});
//编辑交易组
var edittid= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#groupNo').attr('readonly',true);
	$('#form1').fillObject({obj:record});
	$.ajax({
		url:'findAllTxnCodeWithChecked.action?groupNo='+record.groupNo,
		async:false,
		success:function(data){
			$('#txnGrid').refreshWithData(data);
		}													
	});
	$('#form1 :input').trigger('blur');
	$('#addtid').dialog("option","title","编辑交易组信息");
	$('#addtid').dialog("option","buttons",
		{'更新' : function() {
			if ($.formValidator.pageIsValid('1')) {
				var txnCodes=$('#txnGrid').flexAllSelectData();
				if(txnCodes.length == 0){
					alert('请选择交易码');
					return;
				}
				var group = $('#form1').jsonObject();
				$.ajax({
					url : "doUpdateTxnGroup.action",
					data:{jsonObject:$.toJSON(group),jsonArray:$.toJSON(txnCodes)},
					success : function(data) {
						if (data.success) {
							$('#addtid').dialog('close');
							$('#table').flexModifyData(data.root[0]);
							alert('修改交易组成功');
						} else {
							alert(data.syserr);
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
	$('#addtid').dialog('open');
};	
var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$.ajax({
		url:'findAllTxnCodeWithChecked.action?groupNo='+record.groupNo,
		async:false,
		success:function(data){
			$('#v_txnGrid').refreshWithData(data);
		}													
	});
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	$('#tidDetail').dialog("option","title","详细信息");
	$('#tidDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
			$(this).dialog('close');
			}
		});
	$('#tidDetail').dialog('open');
};

//新增交易组	
var newtid=function(record,id) {
	$('#formreset').click();
	$.ajax({
		url:'findAllTxnCode.action',
		async:false,
		success:function(data){
			$('#txnGrid').refreshWithData(data);
		}													
	});
	$('#groupNo').attr('readonly',false);
	$('#addtid').dialog("option","title","新增交易组");
	$('#addtid').dialog("option","buttons",{
		'确定' : function() {
			if ($.formValidator.pageIsValid('1')) {
				var txnCodes=$('#txnGrid').flexAllSelectData();
				if(txnCodes.length == 0){
					alert('请选择交易码');
					return;
				}
				var group = $('#form1').jsonObject();
				$.ajax({
					url : "doInsertTxnGroup.action",
					data:{jsonObject:$.toJSON(group),jsonArray:$.toJSON(txnCodes)},
					success : function(data) {
						if (data.success) {
							$('#addtid').dialog('close');
							$('#table').flexAddData(data.root[0]);
							alert('新增交易组成功');
						} else {
							alert(data.syserr);
						}
					}
				});
			} else {
				return false;
			}
		},
		'关闭' : function() {$(this).dialog('close');}
	});
	$('#addtid').dialog('open');
};	

//删除交易组
var deleteNotice = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认删除该交易组');
	if(able){
		$.ajax({url:'doDeleteTxnGroup.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#table').flexRemoveData(data.root[0]);
				}
				else{
					alert('删除失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

$('#table').flexigrid({ 
		url : 'findTxnGroup.action',
		buttons : [
			{
				name : "新增",
				bclass : 'page_word',
				id : 'txt',
				show: 'ROLE_TXN_GUP_ADD',
				onpress :newtid
			},{
				separator : true
			},{
				name : "修改",
				bclass : 'page_word',
				id : 'txt',
				show: 'ROLE_TXN_GUP_UPD',
				onpress : edittid
			},{
				separator : true
			}/*,{
				name : "删除",
				bclass : 'page_word',
				id : 'txt',
				show: 'ROLE_TXN_GUP_DEL',
				onpress : deleteNotice
			},{
				separator : true
			}*/,{
				name : "详细信息",
				bclass : 'page_excel',
				id : 'cel',
				onpress : viewtid
			},{
				separator : true
			}],
		width : 400,
		dir : "desc",
		sort : "groupNo",											
		usepager : true,
		colModel : [ {
			display : '组号',												
			dataIndex : 'groupNo',
			align : 'center',
			sortable:true
		},{
			display : '组名称',												
			dataIndex : 'groupName',											
			sortable:true
		}]
	});
	$('#txnGrid').flexigrid({
	    url : 'findAllTxnCode.action',
		limit : 100,
		width : 400,
		checkbox : true,
		usepager : false,					
		colModel : [
				{
					display : '交易名称',
					width : 200,
					dataIndex : 'txnName',
					align : 'center'
				},{
					display : '请求消息类型',
					width : 100,
					dataIndex : 'msgTypeReq',
					align : 'center'
				},{
					display : '交易处理码',
					width : 150,
					dataIndex : 'procCode',
					align : 'center'
				},{
					display : '服务点条件码',
					width : 80,
					dataIndex : 'condCode',
					align : 'center'
				},{
					display : '网络管理信息码',
					width : 80,
					dataIndex : 'netCode',
					align : 'center'
				},{
					display : '交易类型码',
					width : 80,
					dataIndex : 'txnTypeCode',
					align : 'center'
				}]
	});
	$('#v_txnGrid').flexigrid({
	    url : 'findAllTxnCode.action',
		limit : 100,
		width : 400,
		checkbox : true,
		usepager : false,					
		colModel : [
				{
					display : '交易名称',
					width : 200,
					dataIndex : 'txnName',
					align : 'center'
				},{
					display : '请求消息类型',
					width : 100,
					dataIndex : 'msgTypeReq',
					align : 'center'
				},{
					display : '交易处理码',
					width : 150,
					dataIndex : 'procCode',
					align : 'center'
				},{
					display : '服务点条件码',
					width : 80,
					dataIndex : 'condCode',
					align : 'center'
				},{
					display : '网络管理信息码',
					width : 80,
					dataIndex : 'netCode',
					align : 'center'
				},{
					display : '交易类型码',
					width : 80,
					dataIndex : 'txnTypeCode',
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