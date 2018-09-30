$(document).ready(function() {

var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#jsonObject').val($.toJSON(record));
	$('#noticeDetailForm').attr('action', 'findConsoleNoticeContentDetail.action');
	$('#noticeDetailForm')[0].submit();
	$('#noticeTitle').html(record.title + '<br/><small>'+frmDate(record.startTime) + '</small>');
	$('#tidDetail').dialog('open');
};
$('#tidDetail').dialog({autoOpen : false,bgiframe : true,modal : true,resizable : false,draggable : false,width : 800,height : 500});
$('#tidDetail').dialog("option","title","公告内容");
$('#tidDetail').dialog("option","buttons",{'关闭' : function() { $('#form2 :input').attr('disabled',''); $(this).dialog('close'); } });

$('#table').flexigrid({ 
url : 'findConsoleNoticeInfoFormal.action',dir : "desc", sort : "noticeSeq", usepager : true, dbClickRecord: viewtid ,
buttons : [
 { name : "详细信息", bclass : 'grid_edit', id : 'cel', onpress : viewtid }
],
colModel : [  
 { display : '序号', dataIndex : 'noticeSeq', align : 'center', sortable:true, width: 100 }
,{ display : '标题', dataIndex : 'title', sortable:true, width: 300 }
,{ display : '部门', dataIndex : 'groupNoDesc', sortable:true, width: 80 }
,{ display : '起效时间', dataIndex : 'startTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '失效时间', dataIndex : 'endTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '审核人', dataIndex : 'audUser', sortable:true, width: 140 }
,{ display : '审核时间', dataIndex : 'audTime', sortable:true, render: fmtTime, width: 140 }]
});

$.jyform.components();
$('.bt').button();
$('#querybutton').click(function(){ $.queryTable({ formId : 'queryForm', tableId : 'table' }); });						

//初始化查询;
$('#querybutton').trigger('click');

});