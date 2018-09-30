<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
<head>
<title><f:message key="application.title" /></title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style type="text/css">
.fcontent input,.fcontent select{width: 200px;}
.fcontent textarea {width: 60%; }
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
#a_mid_btn>.ui-button-text{padding: 0 4px;}
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>商户号</label><input id="q_orgCode" name="orgCode" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>商户名</label><input id="q_merName" name="merName" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			
			<li><label>营业执照统一社会信用代码</label><input  id="q_licenseNo" name="licenseNo" type="text" maxlength="30" qtype="string" comparison="like" /></li>
			<li><label>法人证件号</label><input  id="q_certNo" name="certNo" type="text" maxlength="30" qtype="string" comparison="like" /></li>
			<li><label>备注</label><input  id="q_remark" name="remark" type="text" maxlength="600" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>
<!-- 新增 -->
<div id="addDiv" style="display: none;">
<form id="addForm" action="#">
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel"><font color="red">*</font>商户号</td>
	<td class="fcontent">
		<input class="cdnInput" id="a_orgCode" name="orgCode" maxLength="15" type="text" />
		<a href="javascript:void(0);" class='bt' id="a_mid_btn" >...</a>
		<div id="a_orgCodeTip"/>
	</td>
</tr>
<tr>
	<td class="flabel">商户名</td>
	<td class="fcontent"><input class="cdnInput" id="a_merName" name="merName" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">营业执照统一社会信用代码</td>
	<td class="fcontent"><input class="cdnInput" id="a_licenseNo" name="licenseNo" maxLength="30" type="text" /><div id="a_licenseNoTip"/></td>
</tr>
<tr>
	<td class="flabel">法人证件号</td>
	<td class="fcontent"><input class="cdnInput" id="a_certNo" name="certNo" maxLength="30" type="text" /><div id="a_certNoTip"/></td>
</tr>
<tr>
	<td class="flabel">备注</td>
	<td class="fcontent"><textarea class="cdnInput" id="a_remark" name="remark" maxLength="600" type="text" ></textarea><div id="a_remarkTip"/></td>
</tr>
</table>
</form>
</div>
<!-- 修改 -->
<div id="updDiv" style="display: none;">
<form id="updForm" action="#">
<input name="version" type="hidden" />
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
<tr>
	<td class="flabel"><font color="red">*</font>商户号</td>
	<td class="fcontent"><input class="cdnInput" id="u_orgCode" name="orgCode" type="text" readonly="readonly" /><div id="u_orgCodeTip"/></td>
</tr>
<tr>
	<td class="flabel">商户名</td>
	<td class="fcontent"><input class="cdnInput" id="u_merName" name="merName" type="text" readonly="readonly" /></td>
</tr>
<tr>
	<td class="flabel">营业执照统一社会信用代码</td>
	<td class="fcontent"><input class="cdnInput" id="u_licenseNo" name="licenseNo" maxLength="30" type="text" /><div id="u_licenseNoTip"/></td>
</tr>
<tr>
	<td class="flabel">法人证件号</td>
	<td class="fcontent"><input class="cdnInput" id="u_certNo" name="certNo" maxLength="30" type="text" /><div id="u_certNoTip"/></td>
</tr>
<tr>
	<td class="flabel">备注</td>
	<td class="fcontent"><textarea class="cdnInput" id="u_remark" name="remark" maxLength="600" ></textarea><div id="u_remarkTip"/></td>
</tr>
</table>
</form>
</div>

<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
// <!--
var urls = {
	add:'doAddMerBlacklist.action',
	upd:'doUpdMerBlacklist.action',
	del:'doDelMerBlacklist.action',
	list:'findMerBlacklist.action',
	excel:'findMerBlacklistExcel.action'
};

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_orgCode").formValidator({validatorgroup:"1", onshow: "请输入商户号"})
		.inputValidator({min:15,onerrormin:"商户号长度为15位", max:15, onerrormax:'商户号长度为15位'});  /* 必填检测和长度检测*/ 
	$("#a_licenseNo").formValidator({validatorgroup:"1", onshow: "请输入营业执照统一社会信用代码"})
		.inputValidator({max:30, onerrormax:'营业执照统一社会信用代码最大长度为30'}); 
	$("#a_certNo").formValidator({validatorgroup:"1", onshow: "请输入法人证件号"})
		.inputValidator({max:30, onerrormax:'法人证件号最大长度为30'}); 
	$("#a_remark").formValidator({validatorgroup:"1", onshow: "请输入备注"})
		.inputValidator({max:600, onerrormax:'备注最大长度为600'})
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#u_orgCode").formValidator({validatorgroup:"2", onshow: "请输入内部机构号"})
		.inputValidator({min:15,onerrormin:"商户号长度为15位", max:15, onerrormax:'商户号长度为15位'});  /* 必填检测和长度检测*/ 
	$("#u_licenseNo").formValidator({validatorgroup:"2", onshow: "请输入营业执照统一社会信用代码"})
		.inputValidator({max:30, onerrormax:'营业执照统一社会信用代码最大长度为30'});   
	$("#u_certNo").formValidator({validatorgroup:"2", onshow: "请输入法人证件号"})
		.inputValidator({max:30, onerrormax:'法人证件号最大长度为30'});  
	$("#u_remark").formValidator({validatorgroup:"2", onshow: "请输入备注"})
		.inputValidator({max:600, onerrormax:'备注最大长度为600'})   
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '新增', buttons:{
		'新增' : function() {
			if($.formValidator.pageIsValid('1')) {
				$.ajaxForm({formId : 'addForm', url : urls.add,
				success : function(data) {
					if (data.success) { 
						$('#addDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexAddData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// updForm
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '修改', buttons:{
		'保存' : function() {
			if($.formValidator.pageIsValid('2')) {
				$.ajaxForm({formId : 'updForm', url : urls.upd,
				success : function(data) {
					if (data.success) { 
						$('#updDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});

	// ADD
	var add = function() {
		$.jyform.resetForm('addForm');
		$('#addDiv').dialog('open');
	};
	// UPD
	var edit = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updForm');
		$.jyform.fillForm('updForm', record);
		$('#updDiv').dialog('open');
	};
	// DEL
	var del = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('确认删除黑名单商户['+ record.orgCode +']') ) {
			$.ajax({url : urls.del, type:'POST', dataType:'json',data:{jsonObject: $.toJSON(record) },
				success : function(data) {
					if (data.success) { 
						alert('操作成功'); $('#table').refresh();
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
		}
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : '', checkbox : false, usepager : true, dbClickRecord: edit,
		buttons : [
		 {name: "新增", show:'ROLE_MER_BLACK_LIST_MNG_ADD', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		,{name: "编辑", show:'ROLE_MER_BLACK_LIST_MNG_UPD', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "删除", show:'ROLE_MER_BLACK_LIST_MNG_DEL', bclass: 'grid_del',  id : 'cel',  onpress : del },{separator : true }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 { display: '商户号', dataIndex: 'orgCode', width: 140, align: 'center', sortable: true }
		,{ display: '商户名', dataIndex: 'merName', width: 200, align: 'center', sortable: true }
		,{ display: '营业执照统一社会信用代码', dataIndex: 'licenseNo', width: 120, align: 'center', sortable: true }
		,{ display: '法人证件号', dataIndex: 'certNo', width: 120, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'remark', width: 240, align: 'center', sortable: true }
		]
	});
	// $.jyform.sysCodeBoxes();
	$('.bt').button();
	$('input[readonly=readonly]').css({'backgroundColor':'#f2f2f2','border':'0'});
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	midDialogBind('a_mid_btn', function(data) { $('#a_orgCode').val(data.mid).focus(); $('#a_merName').val(data.merName); });
});
//-->
</script>
</body>