$(document).ready(function() {
//	$('#q_startTimeBgn').pickdate({dateFmt:"yyyyMMddHHmmss"});	
//	$('#q_startTimeEnd').pickdate({dateFmt:"yyyyMMddHHmmss"});
//	$('#q_endTimeBgn').pickdate({dateFmt:"yyyyMMddHHmmss"});	
//	$('#q_endTimeEnd').pickdate({dateFmt:"yyyyMMddHHmmss"});
//	$('#startTime').pickdate({dateFmt:"yyyyMMddHHmmss"});	
//	$('#endTime').pickdate({dateFmt:"yyyyMMddHHmmss"});
//	$('#q_status').ajaxSelect({url:'findSecCodeList.action?codeType=NOTICE_STATUS_CHK',displayField:'codeName',valueField:'codeNo',blank:true});
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

$('#addtid').dialog({autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : false, width : 800, height : 500 });
$('#tidDetail').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : false, width : 800, height : 500 });

					
var  viewtid = function(record,id) {
	if (!record) { alert("请选择一条记录"); return; }
	var urlStr= 'findMerChannelTreeWithChecked.action?jsonObject='+$.toJSON(record);
	$('#v_resourceTree').jsTreeExtend({url:urlStr,theme_name:'checkbox',onchange:function(){}});
	$.ajax({
		type : 'POST', dataType:'json',
		url : 'findNoticeDetail.action',
		data:{jsonObject : $.toJSON(record)},
		success : function(data) {
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
	$('#tidDetail').dialog("option","buttons",{'关闭' : function() {$('#form2 :input').attr('disabled','');$(this).dialog('close');} });
	$('#tidDetail').dialog('open');
};

//驳回公告
var reject = function(record,id){
	if(!record){ alert('请选择一条记录'); return false; }
	if(confirm('确认驳回该公告')){
		$.ajax({url:'doRejectNoticeInfo.action', dataType:'json',
			data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('驳回成功');
					$('#table').refresh();
				} else {
					alert('驳回失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};
//发布公告
var release = function(record,id){
	if(!record){ alert('请选择一条记录'); return false; }
	if(confirm('确认发布该公告')){
		$.ajax({url:'doReleaseNoticeInfo.action', dataType:'json', data:{jsonObject:$.toJSON(record)},
			success:function(data){
				if(data.success){
					alert('发布成功');
					$('#table').refresh();
				} else{
					alert('发布失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

//撤回公告
var revoke = function(record,id){
	if(!record){ alert('请选择一条记录'); return false; }
	if(confirm('确认撤回该公告')){
		$.ajax({url:'doRevokeNoticeInfo.action', data:{jsonObject:$.toJSON(record)}, dataType:'json',
			success:function(data){
				if(data.success){
					alert('撤回成功');
					$('#table').refresh();
				} else{
					alert('撤回失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

$('#table').flexigrid({url : 'findNoticeInfo.action', dir: "desc", sort: "noticeSeq", usepager: true, dbClickRecord: viewtid ,
buttons: [
 {name: "发布", bclass: 'grid_edit', id: 'txt', show: 'ROLE_NOTICE_INFO_REL', onpress: release },{separator: true }
,{name: "驳回", bclass: 'grid_edit', id: 'txt', show: 'ROLE_NOTICE_INFO_REJ', onpress: reject },{separator: true }
,{name: "撤回", bclass: 'grid_edit', id: 'cel', show: 'ROLE_NOTICE_INFO_REK', onpress: revoke },{separator: true }
,{name: "详细信息", bclass: 'grid_edit', id: 'cel', onpress: viewtid }
],
colModel: [
 { display : '序号', dataIndex : 'noticeSeq', align : 'center', sortable:true, width: 100 }
,{ display : '标题', dataIndex : 'title', sortable:true, width: 300 }
,{ display : '起效时间', dataIndex : 'startTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '失效时间', dataIndex : 'endTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '状态', dataIndex : 'statusDesc', sortable:true, width: 120 }
]
});
		
$.jyform.components();
$('.bt').button();
bindPreview({btn:'v_previewBtn', compId:'v_content', fldId:'content'});

$('#querybutton').click(function(){ $.queryTable({ formId : 'queryForm', tableId : 'table' }); });						
	
//初始化查询;
$('#querybutton').trigger('click');

});