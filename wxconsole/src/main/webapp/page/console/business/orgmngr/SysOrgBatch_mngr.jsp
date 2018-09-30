<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务商商户批量管理</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label><font color="red">*</font>一级服务商</label><input  id="q_fatherOrgCode" name="fatherOrgCode" type="text" maxlength="30" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>
<!-- 批量修改 -->
<div id="updbthDiv" style="display: none;">
<form id="updbthForm" action="#">
<input class="cdnInput" id="ub_channelCode" name="channelCode" type="hidden" />
<input type="hidden" name="orgCodeList" id="ub_orgCodeList" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<!-- <tr>
	<td class="flabel"><font color="red">*</font>新服务商号</td>
	<td class="fcontent"><input class="cdnInput" id="ub_channelCode" name="channelCode" type="text" /><div id="ub_channelCodeTip"/></td>
</tr> -->
<tr>
	<td class="flabel">新服务商:</td>
	<td>	
		<div class="restree">
			<div id="ub_resourceTree" ></div>
		</div>
	</td>
</tr>
</table>
</form>
</div>
<!-- 全部修改 -->
<div id="updallDiv" style="display: none;">
<form id="updallForm" action="#">
<input class="cdnInput" id="ua_channelCode" name="channelCode" type="hidden" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel"><font color="red">*</font>原服务商号</td>
	<td class="fcontent"><input class="cdnInput" id="ua_srcChannelCode" name="srcChannelCode" type="text" /><div id="ua_srcChannelCodeTip"/></td>
</tr>
<!-- <tr>
	<td class="flabel"><font color="red">*</font>新服务商号</td>
	<td class="fcontent"><input class="cdnInput" id="ua_channelCode" name="channelCode" type="text" /><div id="ua_channelCodeTip"/></td>
</tr> -->
<tr>
	<td class="flabel">新服务商:</td>
	<td>	
		<div class="restree">
			<div id="ua_resourceTree" ></div>
		</div>
	</td>
</tr>
</table>
</form>
</div>

<!-- 查看 -->
<div id="viewDiv" style="display: none;">
<form id="viewForm" action="#">
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel">商户代码</td>
	<td class="fcontent"><input class="cdnInput" id="v_orgCode" name="orgCode" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">一级服务商号</td>
	<td class="fcontent"><input class="cdnInput" id="v_fatherOrgCode" name="fatherOrgCode" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel">商户名称</td>
	<td class="fcontent"><input class="cdnInput" id="v_orgName" name="orgName" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel">联系人</td>
	<td class="fcontent"><input class="cdnInput" id="v_persName" name="persName" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel">联系人电话</td>
	<td class="fcontent"><input class="cdnInput" id="v_persPhone" name="persPhone" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel">EMAIL</td>
	<td class="fcontent"><input class="cdnInput" id="v_email" name="email" readonly="readonly" type="text" /></td>
</tr>
<tr>
	<td class="flabel">地址</td>
	<td class="fcontent"><input class="cdnInput" id="v_orgAddr" name="orgAddr" readonly="readonly" type="text" /></td>
</tr>
</table>
</table>
</form>
</div>
<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<script type="text/javascript">
<!--
var urls = {
	updbth:'batchChangeOrgChannel.action',
	updall:'changeAllChannelOrg.action',
	list:'channelOrgPage.action',
	excel:'findSysOrgExcel.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"updbthForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#ub_channelCode").formValidator({validatorgroup:"1", onshow: "请选择新服务商号"})
		.inputValidator({min:1,onerrormin:"新服务商号必须填写"});  /* 必填检测*/  
	
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updallForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#ua_srcChannelCode").formValidator({validatorgroup:"2", onshow: "请选择原服务商号"})
		.inputValidator({min:1,onerrormin:"原服务商号必须填写"});  /* 必填检测*/ 
	$("#ua_channelCode").formValidator({validatorgroup:"2", onshow: "请选择新服务商号"})
		.inputValidator({min:1,onerrormin:"新服务商号必须填写"});  /* 必填检测*/ 
	
	
	// updbthForm
	$('#updbthDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 400
	, title: '批量修改商户一级服务商', buttons:{
		'批量修改' : function() {
			var selectRes="";
			$('#ub_resourceTree a.checked').each(function(i){
				selectRes=$(this).parent().attr('id');
			});	
			if(selectRes==""){
				alert("必须选择一个新服务商");
				return;												
			}
			if(selectRes.trim()=="-2"){
				alert("请勿选择所有服务商");
				return;
			}
			$('#ub_channelCode').val(selectRes);
			if($.formValidator.pageIsValid('1')) {
				$.ajaxForm({formId : 'updbthForm', url : urls.updbth,
				success : function(data) {
					if (data.success) { 
						$('#updbthDiv').dialog('close'); alert('操作成功');  $('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// updallForm
	$('#updallDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 400
	, title: '修改服务商下全部商户', buttons:{
		'全部修改' : function() {
			var selectRes="";
			$('#ua_resourceTree a.checked').each(function(i){
				selectRes=$(this).parent().attr('id');
			});	
			if(selectRes==""){
				alert("必须选择一个新服务商");
				return;												
			}
			if(selectRes.trim()=="-2"){
				alert("请勿选择所有服务商");
				return;
			}
			$('#ua_channelCode').val(selectRes);
			if($.formValidator.pageIsValid('2')) {
				$.ajaxForm({formId : 'updallForm', url : urls.updall,
				success : function(data) {
					if (data.success) { 
						$('#updbthDiv').dialog('close'); alert('操作成功');  $('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '商户信息', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});

	// EDIT BATCH
	var editbth = function(record,id) {		
		var orgCodeList=""; 
		var data = $('#table').flexAllSelectData(); 
		$.each(data,function(i) { 
			if (i== 0) {orgCodeList = orgCodeList + this.orgCode} 
			else { orgCodeList = orgCodeList + ',' + this.orgCode}
		});
		if( orgCodeList == "" ){ alert("请选择一个商户"); return; }
		$('#ub_orgCodeList').val(orgCodeList);
		$.jyform.resetForm('updbthForm');
		var urlStr= 'findMerChannelTree.action';
		$('#ub_resourceTree').jsTree({url:urlStr,theme_name:'radio'});	
		$('#updbthDiv').dialog('open');
	};
	// EDIT ALL
	var editall = function(record,id) {	
		$.jyform.resetForm('updallForm');
		$('#ua_srcChannelCode').val($('#q_fatherOrgCode').val());
		var urlStr= 'findMerChannelTree.action';
		$('#ua_resourceTree').jsTree({url:urlStr,theme_name:'radio'});	
		$('#updallDiv').dialog('open');
	};
	// VIEW
	var view = function(record, id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : '', checkbox : true, usepager : true, dbClickRecord: view,
		buttons : [
		 {name: "批量修改服务商", show:'', bclass: 'grid_add', id: 'txt', onpress : editbth },{separator : true }
		,{name: "服务商商户转移", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : editall },{separator : true }
//		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 { display: '商户代码', dataIndex: 'orgCode', width: 140, align: 'center', sortable: true }
		,{ display: '一级服务商号', dataIndex: 'fatherOrgCode', width: 140, align: 'center', sortable: true }
		,{ display: '商户名称', dataIndex: 'orgName', width: 150, align: 'center', sortable: true }
		,{ display: '联系人', dataIndex: 'persName', width: 100, align: 'center', sortable: true }
		,{ display: '联系人电话', dataIndex: 'persPhone', width: 100, align: 'center', sortable: true }
		,{ display: 'EMAIL', dataIndex: 'email', width: 100, align: 'center', sortable: true }
		,{ display: '地址', dataIndex: 'orgAddr', width: 150, align: 'center', sortable: true }
		]
	});
	// $.jyform.sysCodeBoxes();
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('.bt').button();
	$('#queryBtn').click(function(){
		if ($('#q_fatherOrgCode').val().trim() != '' ) {
			$.queryTable({formId : 'queryForm', tableId : 'table'});
		} else { alert('请选择一级服务商. ');}
	});
	// $('#queryBtn').click();
	channelCodeDialogBind('q_fatherOrgCode', function(data) { $('#q_fatherOrgCode').val(data.channelCode); });
	channelCodeDialogBind('ua_srcChannelCode', function(data) { $('#ua_srcChannelCode').val(data.channelCode); });
});
//-->
</script>
</body>