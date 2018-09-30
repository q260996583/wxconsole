<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公告信息管理</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/notice/conNoticeCheck.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
	<input type="hidden" name="status" comparison="eq" ftype="stringlist" qtype="stringlist" value="03,04"/>
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">标题:</td>
		<td class="qinput">
			<input type="text" name="title" comparison="like" qtype="string" />
		</td>
		<td class="qlabel">起效时间:</td>
		<td class="qinput">
			<input type="text" id="q_startTimeBgn" name="startTime" comparison="gt" qtype="string" xtype="datetime"/>
		</td>
		<td class="qlabel">到:</td>
		<td class="qinput">
			<input type="text" id="q_startTimeEnd" name="startTime" comparison="lt" qtype="string" xtype="datetime"/>
		</td>
	</tr>
	<tr>
		<td class="qlabel">状态:</td>
		<td class="qinput">
			<select type="text" id="q_status" name="status" comparison="eq" ctype="NOTICE_STATUS_MNGR" multiple="multiple" ></select>
		</td>
		<td class="qlabel">失效时间:</td>
		<td class="qinput">
			<input type="text" id="q_endTimeBgn" name="endTime" comparison="gt" qtype="string" xtype="datetime"/>
		</td>
		<td class="qlabel">到:</td>
		<td class="qinput">
			<input type="text" id="q_endTimeEnd" name="endTime" comparison="lt" qtype="string" xtype="datetime"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffff"  colspan="6" align="center">
		<input id="querybutton" class="bt" value="查询"  type="button">
		<input class="bt" value="重置" type="reset" />
	  </td>
	</tr>
</table>
</form>
</div>
<div id="table"></div>
<div id="addtid" style="display: none;">
<form id="form1" >
<input type="hidden" name="noticeSeq" />
<input type="hidden" name="version" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tbody>
		<tr >
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>标题：</td>
			<td class="finput"><input type="text" id="title" name="title" maxLength="255" /><div id="titleTip"></div>
			</td>
		</tr>
		<tr>
			<td class="flabel">部门：</td>
			<td class="finput"><input type="text" id="v_groupNoDesc" name="groupNoDesc" />
			</td>
		</tr>
		<tr>
			<td class="flabel">
				<FONT color=red>&nbsp;*</FONT>内容：<br/>
				<a id="previewBtn" class="bt" href="javascript:void(0);">预览</a>
			</td>
			<td class="finput"><textarea type="text" id="content" name="content" ></textarea><div id="contentTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">是否置顶：</td>
			<td class="finput"><select id="topFlag" name="topFlag" >
			<option value="0">不置顶</option>
			<option value="1">置顶</option>
			</select><div id="topFlagTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">起效时间：</td>
			<td class="finput"><input type="text" id="startTime" name="startTime" xtype="datetime" readonly="readonly" /><div id="startTimeTip"></div>
			</td>
		</tr>
		<tr >
			<td class="flabel">失效时间：</td>
			<td class="finput"><input type="text" id="endTime" name="endTime" xtype="datetime" readonly="readonly" /><div id="endTimeTip"></div>
			</td>
		</tr>
	</tbody>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="tidDetail" style="display: none;">
<form id="form2" >
<input type="hidden" name="noticeSeq" />
<input type="hidden" name="version" />
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tbody>
		<tr >
			<td class="flabel"><FONT color=red>&nbsp;*</FONT>标题：</td>
			<td class="finput"><input type="text" id="v_title" name="title" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">
				<FONT color=red>&nbsp;*</FONT>内容：<br/>
				<a id="v_kindPreviewBtn" class="bt" href="javascript:void(0);">预览</a>
			</td>
			<td class="finput"><textarea id="v_content" name="content" readonly="readonly"></textarea>
			</td>
		</tr>
		<tr >
			<td class="flabel">是否置顶：</td>
			<td class="finput"><select id="v_topFlag" name="topFlag" readonly="readonly">
			<option value="0">不置顶</option>
			<option value="1">置顶</option>
			</select>
			</td>
		</tr>
		<tr >
			<td class="flabel">状态：</td>
			<td class="finput"><input type="text" id="v_statusDesc" name="statusDesc" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">起效时间：</td>
			<td class="finput"><input type="text" id="v_startTime" name="startTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">失效时间：</td>
			<td class="finput"><input type="text" id="v_endTime" name="endTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">记录创建时间：</td>
			<td class="finput"><input type="text" id="v_recCrtTime" name="recCrtTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">记录创建账号：</td>
			<td class="finput"><input type="text" id="v_recCrtAcc" name="recCrtAcc" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">最后更新时间：</td>
			<td class="finput"><input type="text" id="v_lastUptTime" name="lastUptTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
		<tr >
			<td class="flabel">最后更新账号：</td>
			<td class="finput"><input type="text" id="v_lastUptAcc" name="lastUptAcc" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="flabel">公告目标操作员:</td>
			<td>	
				<div class="restree">
					<div id="v_resourceTree" ></div>
				</div>
			</td>
		</tr>
		<tr>
			<td class="flabel">
				<FONT color=red>&nbsp;*</FONT>审核意见：<br/>
			</td>
			<td class="finput"><textarea id="v_audRemark" name="audRemark"  maxLength="400"></textarea>
			</td>
		</tr>
		<tr>
			<td class="flabel">
				审核时间：<br/>
			</td>
			<td class="finput"><input type="text" id="v_audTime" name="audTime" xtype="datetime" readonly="readonly"/>
			</td>
		</tr>
	</tbody>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>
<jsp:include page="pub/kindEditor.jsp" />
</body>
<script>
$(document).ready(function() {
//	$('#q_startTimeBgn').pickdate({dateFmt:"yyyyMMddHHmmss"});	
//	$('#q_startTimeEnd').pickdate({dateFmt:"yyyyMMddHHmmss"});
//	$('#q_endTimeBgn').pickdate({dateFmt:"yyyyMMddHHmmss"});	
//	$('#q_endTimeEnd').pickdate({dateFmt:"yyyyMMddHHmmss"});
//	$('#startTime').pickdate({dateFmt:"yyyyMMddHHmmss"});	
//	$('#endTime').pickdate({dateFmt:"yyyyMMddHHmmss"});
//	$('#q_status').ajaxSelect({url:'findSecCodeList.action?codeType=NOTICE_STATUS_CHK',displayField:'codeName',valueField:'codeNo',blank:true});
$.formValidator.initConfig({ validatorgroup:"2", formid:"form2", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
$("#v_audRemark").formValidator({validatorgroup:"2", onshow: "请输入审核意见"})
	.inputValidator({min:1,onerrormin:"审核意见必须填写", max:400, onerrormax:'审核意见最大长度为400'})  /* 必填检测和长度检测*/ 
	.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 

$('#addtid').dialog({autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : false, width : 800, height : 500 });
$('#tidDetail').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : false, width : 800, height : 500 });

					
var  viewtid = function(record,id) {
	if (!record) { alert("请选择一条记录"); return; }
	var urlStr= 'findConsoleNoticeUserTreeWithChecked.action?jsonObject='+$.toJSON(record);
	$('#v_resourceTree').jsTree({url:urlStr,theme_name:'checkbox',onchange:function(){}});
	$.ajax({
		type : 'POST', dataType:'json',
		url : 'findConsoleNoticeDetail.action',
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
	$('#tidDetail').dialog('open');
};

//撤回公告
var revoke = function(record,id){
	if(!record){ alert('请选择一条记录'); return false; }
	record.content = '';
	if(confirm('确认撤回该公告')){
		$.ajax({url:'doRevokeConsoleNoticeInfo.action', data:{jsonObject:$.toJSON(record)}, dataType:'json',
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

$('#table').flexigrid({url : 'findConsoleNoticeInfoToAudit.action', dir: "desc", sort: "noticeSeq", usepager: true, dbClickRecord: viewtid ,
buttons: [
 {name: "审核", bclass: 'grid_edit', id: 'txt', show: 'ROLE_CONSOLE_NOTICE_INFO_REL|ROLE_CONSOLE_NOTICE_INFO_REJ', onpress: viewtid },{separator: true }
,{name: "撤回", bclass: 'grid_edit', id: 'cel', show: 'ROLE_CONSOLE_NOTICE_INFO_REK', onpress: revoke },{separator: true }
,{name: "详细信息", bclass: 'grid_edit', id: 'cel', onpress: viewtid }
],
colModel: [
 { display : '序号', dataIndex : 'noticeSeq', align : 'center', sortable:true, width: 100 }
,{ display : '标题', dataIndex : 'title', sortable:true, width: 300 }
,{ display : '部门', dataIndex : 'groupNoDesc', sortable:true, width: 80 }
,{ display : '起效时间', dataIndex : 'startTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '失效时间', dataIndex : 'endTime', sortable:true, render: fmtTime, width: 140 }
,{ display : '状态', dataIndex : 'statusDesc', sortable:true, width: 120 }
]
});

$('#tidDetail').dialog("option","title","详细信息");
$('#tidDetail').dialog("option","buttons",{
	<sec:authorize ifAllGranted="ROLE_CONSOLE_NOTICE_INFO_REL">
	'审核通过' : function() {
		if($.formValidator.pageIsValid('2')) {
			if(confirm('确认发布该公告')){
				$.ajaxForm({formId : 'form2', url : 'doReleaseConsoleNoticeInfo.action',
					dealData:function(data){																								
						data.content = ''; 
						return data;
					},
					success : function(data) {
						if(data.success){
							alert('审核成功');
							$('#table').refresh();
							$('#tidDetail').dialog('close');
						} else {
							alert('发布失败 失败原因是'+data.syserr);
						}	
					}});
			}
		} else { return false; }
	},
	</sec:authorize>
	<sec:authorize ifAllGranted="ROLE_CONSOLE_NOTICE_INFO_REJ">
	'审核驳回' : function() {
		if($.formValidator.pageIsValid('2')) {
			if(confirm('确认驳回该公告')){
				$.ajaxForm({formId : 'form2', url : 'doRejectConsoleNoticeInfo.action',
					dealData:function(data){																								
						data.content = ''; 
						return data;
					},
					success : function(data) {
						if(data.success){
							alert('驳回成功');
							$('#table').refresh();
							$('#tidDetail').dialog('close');
						} else {
							alert('驳回失败 失败原因是'+data.syserr);
						}		
					}});
			}
		} else { return false; }
	},
	</sec:authorize>
	'关闭' : function() {$(this).dialog('close');} });

$.jyform.components();
$('.bt').button();
bindKindPreview({btnId:'v_kindPreviewBtn',textareaId:'v_content', preview:'findNoticePreview.action'});
$('#querybutton').click(function(){ $.queryTable({ formId : 'queryForm', tableId : 'table' }); });						
	
//初始化查询;
$('#querybutton').trigger('click');

});
</script>
</html>