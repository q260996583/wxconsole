$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
{id:"orgCode",formValidator:{empty:false},inputValidator:{min:15,max:15,onerror:"商户号长度15位"}},
{id:"licenseNo",formValidator:{empty:false},inputValidator:{max:30}},
{id:"certNo",formValidator:{empty:false},inputValidator:{max:30}},
{id:"remark",formValidator:{empty:false},inputValidator:{max:600}}
];


$.someAuthentication(list);	

$('#addMer').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 600,
	height : 300
});

//删除
var deleteMerBlacklist = function(record,id){
	
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认删除该黑名单商户');
	if(able){
		$.ajax({
			type : 'POST',
			url:'doDelMerBlacklist.action',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#querybutton').trigger('click');
				}
				else{
					alert('删除失败 失败原因是'+data.syserror);
				}												
			}
		});
	}
};
						


//新增黑名单卡
var addMerBlacklist=function() {
	$('#formreset').click();
	$('#addMer').dialog("option","title","新增黑名单商户");
	$('#orgCode').removeAttr("disabled");
	$('#addMer').dialog("option","buttons",{
						'确定' : function() {
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
											formId : 'form1',
											url : "doAddMerBlacklist.action",
											success : function(data) {
												if (data.success) {
													$('#addMer').dialog('close');
													$('#querybutton').trigger('click');
													alert('新增成功');
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
	$('#addMer').dialog('open');
};
var updMerBlacklist = function(record, id) {
	if(!record) { alert('请选择一条记录'); return false; }
	$('#formreset').click();
	$('#form1').fillObject({obj:record});
	$('#orgCode').attr("disabled","disabled");
	$('#orgCode').val(record.orgCode);
	$('#addMer').dialog("option", "title", "修改黑名单商户");
	$('#addMer').dialog("option","buttons",{
		'确定' : function() {
			if ($.formValidator.pageIsValid('1')) {
				$.ajaxForm({formId: 'form1', url: "doUpdMerBlacklist.action",
					success : function(data) {
						if (data.success) {
							$('#addMer').dialog('close');
							$('#querybutton').trigger('click');
							alert('修改成功');
						} else { alert(data.syserr); }
				}});
			} else {
				return false;
			}
		}, '关闭': function() {$(this).dialog('close');}
	});
	$('#addMer').dialog('open');
} ;
						
$('#table').flexigrid({ 
		url : 'findMerBlacklist.action',
		buttons : [
				{
					name : "新增",														
					show:'ROLE_MER_BLACK_LIST_MNG_ADD',
					bclass : 'page_add',
					id : 'txt',
					onpress : addMerBlacklist
				},{
					separator : true
				},{
					name : "修改",														
					show:'ROLE_MER_BLACK_LIST_MNG_UPD',
					bclass : 'page_dtb',
					id : 'txt',
					onpress : updMerBlacklist
				},{
					separator : true
				},{
					name : "删除",
					show:'ROLE_MER_BLACK_LIST_MNG_DEL',
					bclass : 'page_word',
					id : 'cel',
					onpress :deleteMerBlacklist
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "orgCode",											
		usepager : true,
		colModel : [ 
		    { display : '商户号', dataIndex : 'orgCode', width:150, align : 'center', sortable:true }
		   ,{ display : '营业执照统一社会信用代码', dataIndex : 'licenseNo', width:150, align : 'center', sortable:true }
		   ,{ display : '法人证件号', dataIndex : 'certNo', width:150, align : 'center', sortable:true }
		   ,{ display : '备注', dataIndex : 'remark', align : 'center', sortable:true }
		]
	});
		
	$('#querybutton').click(function(){
		$.queryTable({ formId : 'queryForm', tableId : 'table' });
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
});