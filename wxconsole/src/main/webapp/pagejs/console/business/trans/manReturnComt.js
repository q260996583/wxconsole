$(document).ready(function() {

$('#posTransDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});					

$('#importReturnFileDiv').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 500,
	height : 200
});	

$('#pospStmt').pickdate({dateFmt:"yyyyMMdd"});	

var  viewPosTransDetail = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#posTransDetail').dialog("option","title","详细信息");
	$('#posTransDetail').dialog("option","buttons",
			{'提交' : function() {
				
				var backAmt = $('#backAmt').val();
				//验证只能是正整数或者正两位小数
				if(!/^\d{0,8}(\.\d{0,2})?$/.test(backAmt)){
					alert('退货金额请正确填写，只能是正数且最多两位小数');
					return false;
				}
				backAmt = parseFloat(backAmt);
				
				var scoreFlag = $('#scoreFlag').val();
				//判断是不是积分交易
				if(scoreFlag=="1"){
					var scoreTransAmtDesc = parseFloat($('#scoreTransAmtDesc').val());
					if(!$('#backAmt').val()){
						alert('退货金额必须填写');
						return false;
					}else if(backAmt > scoreTransAmtDesc){
						alert('退货金额大于交易金额');
						return false;
					}else if(backAmt== 0){
						alert('退货金额必须大于零');
						return false;
					}
				}
				else{
					var transAmtDesc = parseFloat($('#transAmtDesc').val());
					if(!$('#backAmt').val()){
						alert('退货金额必须填写');
						return false;
					}else if(backAmt > transAmtDesc){
						alert('退货金额大于交易金额');
						return false;
					}else if(backAmt== 0){
						alert('退货金额必须大于零');
						return false;
					}
				}
					$.ajaxForm({
						formId : 'form2',
						url : "doCommitReturn.action",
						success : function(data) {
							if (data.success) {
								$('#posTransDetail').dialog('close');
								$('#table').refresh();
								alert('退货提交成功');
							} else {
								alert(data.syserr);
							}
						}
					});
			},
			'关闭' : function() {
				$(this).dialog('close');
			}
		});
	$('#posTransDetail').dialog('open');
};

/*上传批量导入文件*/
var  importReturnFile = function(record,id) {
	$('#importReturnFileDiv').dialog("option","title","上传批量退货文件");
	$('#importReturnFileDiv').dialog("option","buttons",
					{'确定' : function() {
						var obj=$('#form1').jsonObject();
						$.ajaxFileUpload({
							url:'doImportReturnFile.action',			
							secureuri:false,
							fileElementId:'upLoadfile',
							dataType: 'json',
							data:{jsonObject:$.toJSON(obj)},
							success:function (data, status){
								if(data.success){
									 $('#importReturnFileDiv').dialog('close');
									 alert(data.syserr);
								}
								else {
									 alert(data.syserr);
								}
							}
						});			
					},
					'关闭' : function() {
						$(this).dialog('close');
					}
				});

	$('#importReturnFileDiv').dialog('open');
	
};
						
$('#table').flexigrid({ 
		url : 'findCommitReturn.action',
		buttons : [{
						name : "详细信息",
						bclass : 'page_excel',
						id : 'cel',
						onpress : viewPosTransDetail
					},{
						separator : true
					},{
						name : "批量退货模板下载",
						show:'ROLE_POS_TRANS_INPORT_RETURN_CZ',
						bclass : 'page_add',
						id : 'cel',
						onpress : function(){$('#downForm').submit();}
					},{
						name : "上传批量退货文件",
						show:'ROLE_POS_TRANS_INPORT_RETURN_CZ',
						bclass : 'page_add',
						id : 'cel',
						onpress : importReturnFile
					},{
						separator : true
					}],
		 
		width : 400,
		dir : "desc",
		sort : "transSeq",											
		usepager : true,
		colModel : [ {
			display : '中心交易流水',												
			dataIndex : 'transSeq',
			align : 'center',
			sortable:true
		},{
			display : '终端交易流水',											
			dataIndex : 'tidSeq',
			align : 'center'
		},{
			display : '本系统清算日',												
			dataIndex : 'pospStmtDesc',											
			sortable:true
		},{
			display : '中心交易时间',											
			dataIndex : 'transTimeDesc',
			align : 'center'
		},{
			display : '中心交易类型',											
			dataIndex : 'transCodeZh',
			align : 'center'
		},{
			display : '交易金额(元)',											
			dataIndex : 'transAmtDesc',											
			sortable:true
		},{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '终端号',												
			dataIndex : 'tid',
			align : 'center'
		},{
			display : '主帐号',											
			dataIndex : 'pan',
			align : 'center'
		},{
			display : '交易状态',											
			dataIndex : 'transStZh',
			align : 'center'
		},{
			display : '退货状态',											
			dataIndex : 'backStatZh',
			align : 'center'
		}]
	});
		
	
	$('#querybutton').click(function(){
		if(!$('#pospStmt').val()){
			alert('中心交易清算日期必须填写');
			return false;
		}
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	//$('#querybutton').trigger('click');
	
});