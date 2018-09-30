$(document).ready(function() {
$('#merchantSelect').queryDialog({
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
$('#mid').click(function(){							
	$('#mid').val($('#orgCode').val());
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#mid').val(data.orgCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});



//$('#status').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});

$('#searchstatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});


$('#searchconfstatus').ajaxSelect({url:'findSecCodeList.action?codeType=TID_CONF_STAT',displayField:'codeName',valueField:'codeNo',blank:true});

//异步请求得到特费商户类型
$.ajax({
	type : 'POST',
	url : 'findSecCodeList.action?codeType=TID_STATUS',
	success : function(data) {
		if (data.success) {

			// 先清空下拉框的值再赋值
			var amerStatus = $("#status");
			var bmerStatus = $("#statusDetail");
			var cmerStatus = $("#statusDetail1");
			amerStatus.empty();
			bmerStatus.empty();
			amerStatus.append("<option value='' selected>" + '请选择' + "</option>");
			bmerStatus.append("<option value=''>" + '请选择' + "</option>");
			cmerStatus.append("<option value=''>" + '请选择' + "</option>");
			if (data.root.length > 0) {
				// 填充并回显
				for (var i = data.root.length-1; i >=0; i--) {
					var rt = data.root[i];
					amerStatus.append("<option value='" + rt.codeNo + "' >"
							+ rt.codeName + "</option>");
					bmerStatus.append("<option value='" + rt.codeNo + "'>"
							+ rt.codeName + "</option>");
					cmerStatus.append("<option value='" + rt.codeNo + "'>"
							+ rt.codeName + "</option>");
				}
			
			} else {
				amerStatus
						.append("<option value=' '> 数据库中没有终端类型可选</option>");
				bmerStatus
						.append("<option value=' '> 数据库中没有终端类型可选</option>");
				cmerStatus.append("<option value=' '> 数据库中没有终端类型可选</option>");
			}

		} else {
			alert('操作失败 原因是' + data.syserr);
		}
	}
});

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
	        {id:"bankCode",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:10,onerror:"银行长度在1-10个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "银行仅能输入数字，字母"}},
	        {id:"tid",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:8,onerror:"终端号长度在1-8个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "终端号仅能输入数字，字母"}},
	        {id:"mid",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:15,onerror:"商户号在1-15个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "商户号仅能输入数字，字母"}},
	        {id:"tidOut",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:8,onerror:"外部终端号在1-8个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "外部终端号仅能输入数字，字母"}},
	        {id:"merOutCode",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:15,onerror:"外部银行商户号在1-15个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "外部银行商户号仅能输入数字，字母"}},
	        {id:"tidOutStlm",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:32,onerror:"外部终端对帐号在1-32个字之间"}
	        	,regexValidator:{regexp : "^[A-Za-z0-9]+$",onerror : "外部终端对帐号仅能输入数字，字母"}}
	       ,{id:"status",formValidator:{empty:false},inputValidator:{min:1,max:10,onerror:"请选择状态"} }	
	        	
	   	];


$.someAuthentication(list);	

$('#addOuterTid').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});
$('#merOuterTidDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});
$('#tidkey').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 500,
	height : 200
});


//编辑机构
var edittid= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}			
	
	var confStat = record["confStat"];
	if(confStat!="01"){
		alert("只能审批处于待审批的外部终端");
		return;
	}
	$('#form1').fillObject({obj:record});		
	$('#form1 :input').trigger('blur');
	
	$('#form2 :input').attr('disabled','disabled');
	$('#tid').attr('disabled',"disabled").unFormValidator(false);
	$('#mid').attr('disabled',"disabled").unFormValidator(false);
	$('#bankCode').attr('disabled',"disabled").unFormValidator(false);
	$('#tidOut').attr('disabled',"disabled").unFormValidator(false);
	$('#merOutCode').attr('disabled',"disabled").unFormValidator(false);
	$('#tidOutStlm').attr('disabled',"disabled").unFormValidator(false);
	$('#status').attr('disabled',"disabled").unFormValidator(false);
	$('#remark').attr('disabled',"disabled");
	
	$('#addOuterTid').dialog("option","title","审核外部终端信息");
	$('#addOuterTid').dialog("option","buttons",
					{'通过' : function() {
							
								$.ajaxForm({
											formId : 'form1',
											url : "doMerOuterTidExmTrue.action",
											success : function(data) {
												if (data.success) {
													$('#addOuterTid').dialog('close');
													$('#querybutton').trigger('click');
													alert("审核成功");
												} else {
								 					alert('更新失败 原因是'
															+ data.syserr);
												}
											}
										});
							

						},'驳回' : function() {
							
								$.ajaxForm({
											formId : 'form1',
											url : "doMerOuterTidExmFalse.action",
											success : function(data) {
												if (data.success) {
													$('#addOuterTid').dialog('close');
													$('#querybutton').trigger('click');
													alert("驳回成功");
												} else {
								 					alert('更新失败 原因是'
															+ data.syserr);
												}
											}
										});
						

						},
						'关闭' : function() {
							$(this).dialog('close');
						}
					});

	$('#addOuterTid').dialog('open');
};	
						

var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	$('#merOuterTidDetail').dialog("option","title","详细信息");
	$('#merOuterTidDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#merOuterTidDetail').dialog('open');
};


//删除终端
var shutdowntid = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认要删除该外部终端');
	if(able){
		$.ajax({url:'doDeleteMerOuterTid.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#table').refresh();
				}
				else{
					alert('删除失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};







$('#table').flexigrid({ 
		url : 'queryMerOuterTidExm.action',
		buttons : [
				{
					name : "审核",
					show:'ROLE_TID_MN_EDIT_CZ',
					bclass : 'page_word',
					id : 'cel',
					onpress :edittid
				},{
					separator : true
				},{
					name : "详细信息",
					bclass : 'page_excel',
					id : 'cel',
					onpress : viewtid
				},{
					separator : true
				}				
				],
		 
		width : 400,
		dir : "desc",
		sort : "bankCode",											
		usepager : true,
		colModel : [ {
			display : '银行',												
			dataIndex : 'bankCode',
			align : 'center',
			sortable:true
		},{
			display : '终端号',												
			dataIndex : 'tid',											
			sortable:true
		},{
			display : '商户号',												
			dataIndex : 'mid',											
			sortable:true
		},{
			display : '外部终端号',											
			dataIndex : 'tidOut',											
			sortable:true
		},{
			display : '外部银行商户号',												
			dataIndex : 'merOutCode',											
			sortable:true
		},{
			display : '外部终端对帐号',											
			dataIndex : 'tidOutStlm',											
			sortable:true
		},{
			display : '终端状态',												
			dataIndex : 'statusZh',
			align : 'center'
		},
		{
			display : '秘钥状态',												
			dataIndex : 'keyStatusZh',
			align : 'center'
		},
		{
			display : '审核状态',												
			dataIndex : 'confStatZh',
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