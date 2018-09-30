$(document).ready(function() {

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

var list=[
{id:"title",formValidator:{empty:false},inputValidator:{min:1,max:255,onerror:"标题必填"}},
{id:"content",formValidator:{empty:false},inputValidator:{min:1,max:4000,onerror:"内容必填"}}
];
$.someAuthentication(list);	
$('#addtid').dialog({autoOpen : false,bgiframe : true,modal : true,resizable : false,draggable : false,width : 800,height : 500});
$('#tidDetail').dialog({autoOpen : false,bgiframe : true,modal : true,resizable : false,draggable : false,width : 800,height : 500});
//编辑公告
var edittid= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var urlStr= 'findMerChannelTreeWithChecked.action?jsonObject='+$.toJSON(record);
	$('#resourceTree').jsTreeExtend({url:urlStr,theme_name:'checkbox'});
	$.ajax({
		type : 'POST',dataType:'json',
		url : 'findNoticeDetail.action',
		data:{jsonObject : $.toJSON(record)},
		success : function(data) {
			if (data.success) {
				if (data.root.length > 0) {
					var rec = data.root[0];
//					$('#form1').fillObject({obj:rec});
					$.jyform.fillForm('form1', rec);
				} else {
					alert("未找到公告");
				}
			} else {
				alert("未找到公告");
			}
		}
	});
	$('#form1 :input').trigger('blur');
	$('#addtid').dialog("option","title","编辑公告信息");
	$('#addtid').dialog("option","buttons",
		{'更新' : function() {
			if ($.formValidator.pageIsValid('1')) {
				var selectRes="";
				$('#resourceTree a.undetermined,#resourceTree a.checked').each(function(i){
					selectRes=selectRes+$(this).parent().attr('id')+",";
				});	
				if(selectRes==""){
					alert("服务商不能为空");
					return;												
				}
				$.ajaxForm({
					formId : 'form1',
					url : "doUpdateNoticeInfo.action",
					dealData:function(data){																								
						data.channelStr=selectRes; return data;
					},
					success : function(data) {
						if (data.success) {
							$('#table').flexModifyData(data.root[0]);
							$('#addtid').dialog('close');
							alert('公告更新成功');
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
	$('#addtid').dialog('open');
};	
var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	var urlStr= 'findMerChannelTreeWithChecked.action?jsonObject='+$.toJSON(record);
	$('#v_resourceTree').jsTreeExtend({url:urlStr,theme_name:'checkbox',onchange:function(){}});
	$.ajax({
		type : 'POST', dataType:'json',
		url : 'findNoticeDetail.action',
		data:{jsonObject : $.toJSON(record)},
		success : function(data) {
			if( console ) console.log(data);
			if (data.success) {
				if (data.root.length > 0) {
					var rec = data.root[0];
//					$('#form2').fillObject({obj:rec});
					$.jyform.fillForm('form2', rec);
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
	$('#tidDetail').dialog("option","buttons",{'关闭' : function() { $('#form2 :input').attr('disabled',''); $(this).dialog('close'); } });
	$('#tidDetail').dialog('open');
};

//新增公告	
var newtid=function() {
	$('#formreset').click();
	var urlStr= 'findMerChannelTree.action';
	$('#resourceTree').jsTreeExtend({url:urlStr,theme_name:'checkbox'});		
	$('#addtid').dialog("option","title","新增公告");
	$('#addtid').dialog("option","buttons",{
		'确定' : function() {
			if ($.formValidator.pageIsValid('1')) {
				var selectRes="";
				$('#resourceTree a.undetermined,#resourceTree a.checked').each(function(i){
					selectRes=selectRes+$(this).parent().attr('id')+",";
				});	
				if(selectRes==""){
					alert("服务商不能为空");
					return;												
				}
				$.ajaxForm({formId : 'form1', url : "doInsertNoticeInfo.action",
					dealData:function(data){data.channelStr=selectRes; return data; },
					success : function(data) {
						if (data.success) {
							$('#addtid').dialog('close');
							$('#table').flexAddData(data.root[0]);
							alert('新增公告成功');
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
//提交公告
var commit = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认提交该公告');
	if(able){
		$.ajax({url:'doCommitNoticeInfo.action',
			data:{jsonObject:$.toJSON(record)},dataType:'json',
			success:function(data){
				if(data.success){
					alert('提交成功');
					$('#table').refresh();
				} else{
					alert('提交失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};
//删除公告
var deleteNotice = function(record,id){
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	var able=confirm('确认删除该公告');
	if(able){
		$.ajax({url:'doDeleteNoticeInfo.action',
			data:{jsonObject:$.toJSON(record)},dataType:'json',
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#table').refresh();
				} else{
					alert('删除失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

$('#table').flexigrid({ 
url : 'findNoticeInfo.action',dir : "desc", sort : "noticeSeq", usepager : true, dbClickRecord: viewtid ,
buttons : [
{ name : "新增", bclass : 'grid_add', id : 'txt', show: 'ROLE_NOTICE_INFO_ADD', onpress :newtid },{ separator : true }
,{ name : "修改", bclass : 'grid_edit', id : 'txt', show: 'ROLE_NOTICE_INFO_UPD', onpress : edittid },{ separator : true }
,{ name : "提交", bclass : 'grid_edit', id : 'txt', show: 'ROLE_NOTICE_INFO_COMMIT', onpress : commit },{ separator : true }
,{ name : "删除", bclass : 'grid_del', id : 'txt', show: 'ROLE_NOTICE_INFO_DEL', onpress : deleteNotice },{ separator : true }
,{ name : "详细信息", bclass : 'grid_edit', id : 'cel', onpress : viewtid }
],
colModel : [  
 { display : '序号', dataIndex : 'noticeSeq', align : 'center', sortable:true, width: 100 }
,{ display : '标题', dataIndex : 'title', sortable:true, width: 300 }
,{ display : '起效时间', dataIndex : 'startTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '失效时间', dataIndex : 'endTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '状态', dataIndex : 'statusDesc', sortable:true, width: 120 }]
});

$.jyform.components();
$('.bt').button();
bindEditor({btn:'a_contentEditBtn', compId:'content', fldId:'content' });
bindPreview({btn:'v_previewBtn', compId:'v_content', fldId:'content'});
bindKindEditor({btnId:'a_kindEditBtn',textareaId:'content'});
bindKindPreview({btnId:'v_kindPreviewBtn',textareaId:'v_content'});
$('#querybutton').click(function(){ $.queryTable({ formId : 'queryForm', tableId : 'table' }); });						

//初始化查询;
$('#querybutton').trigger('click');

});