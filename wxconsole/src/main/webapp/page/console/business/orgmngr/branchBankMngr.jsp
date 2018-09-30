<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>支行信息维护</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style type="text/css">
.fcontent input,.fcontent select,.fcontent textarea{width: 200px;}
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>银行行号</label><input id="q_unionBankNo" name="unionBankNo" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>银行名称</label><input id="q_parentBankNo" name="parentBankNo" type="text" qtype="string" comparison="like" /></li>
			<li><label>上级行号</label><input id="q_bankName" name="bankName" type="text" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>

<!-- 新增界面 -->
<div id="addDiv" style="display: none;">
	<form id="addForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
			<tr>
			    <td class="flabel">银行行号</td>
			    <td class="fcontent"><input class="cdnInput" id="a_unionBankNo" name="unionBankNo" type="text" maxLength="12" /><div id="a_unionBankNoTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">上级行号</td>
			    <td class="fcontent"><input class="cdnInput" id="a_parentBankNo" name="parentBankNo" type="text" maxLength="3"/><div id="a_parentBankNoTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">银行名称</td>
			    <td class="fcontent"><input class="cdnInput" id="a_bankName" name="bankName" type="text" maxLength="100"/><div id="a_bankNameTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">省代码</td>
			    <td class="fcontent"><input class="cdnInput" id="a_proCode" name="proCode" type="text" maxLength="4"/><div id="a_proCodeTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">市代码</td>
			    <td class="fcontent"><input class="cdnInput" id="a_cityCode" name="cityCode" type="text" maxLength="4"/><div id="a_cityCodeTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">区代码</td>
			    <td class="fcontent"><input class="cdnInput" id="a_countryCode" name="countryCode" type="text" maxLength="4"/><div id="a_countryCodeTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">银行地址</td>
			    <td class="fcontent"><input class="cdnInput" id="a_address" name="address" type="text" maxLength="400"/><div id="a_addressTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">邮编</td>
			    <td class="fcontent"><input class="cdnInput" id="a_postCode" name="postCode" type="text" maxLength="10"/><div id="a_postCodeTip"/></td>
			</tr>
		</table>
	</form>
</div>

<!-- 修改界面 -->
<div id="updDiv" style="display: none;">
	<form id="updForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
			<tr>
			    <td class="flabel">银行行号</td>
			    <td class="fcontent"><input class="cdnInput" id="u_unionBankNo" name="unionBankNo" type="text" maxLength="12" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">上级行号</td>
			    <td class="fcontent"><input class="cdnInput" id="u_parentBankNo" name="parentBankNo" type="text" maxLength="3"/><div id="u_parentBankNoTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">银行名称</td>
			    <td class="fcontent"><input class="cdnInput" id="u_bankName" name="bankName" type="text" maxLength="100"/><div id="u_bankNameTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">省代码</td>
			    <td class="fcontent"><input class="cdnInput" id="u_proCode" name="proCode" type="text" maxLength="4"/><div id="u_proCodeTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">市代码</td>
			    <td class="fcontent"><input class="cdnInput" id="u_cityCode" name="cityCode" type="text" maxLength="4"/><div id="u_cityCodeTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">区代码</td>
			    <td class="fcontent"><input class="cdnInput" id="u_countryCode" name="countryCode" type="text" maxLength="4"/><div id="u_countryCodeTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">银行地址</td>
			    <td class="fcontent"><input class="cdnInput" id="u_address" name="address" type="text" maxLength="400"/><div id="u_addressTip"/></td>
			</tr>
			<tr>
			    <td class="flabel">邮编</td>
			    <td class="fcontent"><input class="cdnInput" id="u_postCode" name="postCode" type="text" maxLength="10"/><div id="u_postCodeTip"/></td>
			</tr>
		</table>
	</form>
</div>

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
	<form id="viewForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
			<tr>
			    <td class="flabel">银行行号</td>
			    <td class="fcontent"><input class="cdnInput" id="v_unionBankNo" name="unionBankNo" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">上级行号</td>
			    <td class="fcontent"><input class="cdnInput" id="v_parentBankNo" name="parentBankNo" type="text" readonly="readonly"/></td>
			</tr>
			<tr>
			    <td class="flabel">银行名称</td>
			    <td class="fcontent"><input class="cdnInput" id="v_bankName" name="bankName" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">省代码</td>
			    <td class="fcontent"><input class="cdnInput" id="v_proCode" name="proCode" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">市代码</td>
			    <td class="fcontent"><input class="cdnInput" id="v_cityCode" name="cityCode" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">区代码</td>
			    <td class="fcontent"><input class="cdnInput" id="v_countryCode" name="countryCode" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">银行地址</td>
			    <td class="fcontent"><input class="cdnInput" id="v_address" name="address" type="text" readonly="readonly"/></td>
			</tr>
			<tr>
			    <td class="flabel">邮编</td>
			    <td class="fcontent"><input class="cdnInput" id="v_postCode" name="postCode" type="text" readonly="readonly"/></td>
			</tr>
			<tr>
			    <td class="flabel">创建人</td>
			    <td class="fcontent"><input class="cdnInput" id="v_recAcc" name="recAcc" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">创建时间</td>
			    <td class="fcontent"><input class="cdnInput" id="v_recTime" name="recTime" type="text" xtype="datetime" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">最后修改人</td>
			    <td class="fcontent"><input class="cdnInput" id="v_lastUptAcc" name="lastUptAcc" type="text" readonly="readonly" /></td>
			</tr>
			<tr>
			    <td class="flabel">最后修改时间</td>
			    <td class="fcontent"><input class="cdnInput" id="v_lastUptTime" name="lastUptTime" type="text" xtype="datetime" readonly="readonly" /></td>
			</tr>
		</table>
	</form>
</div>

<!-- 导入界面 -->
<div id="impDiv" style="display: none;">
	<form id="impForm" action="impBranchBank.action">
		<input type="file" name=""/>
	</form>
</div>
<script type="text/javascript">
var urls = {
	list:'branchBankPage.action',
	excel:'branchBankExcel.action',
	add:'addBranchBank.action',
	upd:'updBranchBank.action',
	del:'deleteBranchBank.action'
};

$(function() {
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_unionBankNo").formValidator({validatorgroup:"1", onshow: "请输入银行行号"})
		.inputValidator({min:12, max:12, onerror:'银行行号为12位数字'}).regexValidator({regexp:"^[0-9]*$",onerror:"银行行号只能输入数字"});
	$("#a_parentBankNo").formValidator({validatorgroup:"1", onshow: "请输入上级行号"})
		.inputValidator({min:1,onerrormin:"上级行号必须填写", max:3, onerrormax:'上级行号最大长度为3'}).regexValidator({regexp:"^[0-9]*$",onerror:"上级行号只能输入数字"});
	$("#a_bankName").formValidator({validatorgroup:"1", onshow: "请银行名称"})
		.inputValidator({min:1,onerrormin:"银行名称必须填写", max:100, onerrormax:'银行名称最大长度为100'});
	$("#a_proCode").formValidator({validatorgroup:"1", onshow: "请输入省代码"})
		.inputValidator({min:0, max:4, onerrormax:'省代码最大长度4位'}).regexValidator({regexp:"^[0-9]*$",onerror:"省代码只能输入数字"});
	$("#a_cityCode").formValidator({validatorgroup:"1", onshow: "请输入市代码"})
		.inputValidator({min:0, max:4, onerrormax:'市代码最大长度4位'}).regexValidator({regexp:"^[0-9]*$",onerror:"市代码只能输入数字"});
	$("#a_countryCode").formValidator({validatorgroup:"1", onshow: "请输入区代码"})
		.inputValidator({min:0, max:4, onerrormax:'区代码最大长度4位'}).regexValidator({regexp:"^[0-9]*$",onerror:"区代码只能输入数字"});
	$("#a_address").formValidator({validatorgroup:"1", onshow: "请输入银行地址"})
		.inputValidator({min:0, max:400, onerrormax:'银行地址最大长度400位'});
	$("#a_postCode").formValidator({validatorgroup:"1", onshow: "请输入邮编"})
		.inputValidator({min:0, max:10, onerrormax:'邮编最大长度10位'}).regexValidator({regexp:"^[0-9]*$",onerror:"邮编只能输入数字"});
		
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#u_unionBankNo").formValidator({validatorgroup:"2", onshow: "请输入银行行号"})
		.inputValidator({min:12, max:12, onerror:'银行行号为12位数字'}).regexValidator({regexp:"^[0-9]*$",onerror:"银行行号只能输入数字"});
	$("#u_parentBankNo").formValidator({validatorgroup:"2", onshow: "请输入上级行号"})
		.inputValidator({min:1,onerrormin:"上级行号必须填写", max:3, onerrormax:'上级行号最大长度为3'}).regexValidator({regexp:"^[0-9]*$",onerror:"上级行号只能输入数字"});
	$("#u_bankName").formValidator({validatorgroup:"2", onshow: "请银行名称"})
		.inputValidator({min:1,onerrormin:"银行名称必须填写", max:100, onerrormax:'银行名称最大长度为100'});
	$("#u_proCode").formValidator({validatorgroup:"2", onshow: "请输入省代码"})
		.inputValidator({min:0, max:4, onerrormax:'省代码最大长度4位'}).regexValidator({regexp:"^[0-9]*$",onerror:"省代码只能输入数字"});
	$("#u_cityCode").formValidator({validatorgroup:"2", onshow: "请输入市代码"})
		.inputValidator({min:0, max:4, onerrormax:'市代码最大长度4位'}).regexValidator({regexp:"^[0-9]*$",onerror:"市代码只能输入数字"});
	$("#u_countryCode").formValidator({validatorgroup:"2", onshow: "请输入区代码"})
		.inputValidator({min:0, max:4, onerrormax:'区代码最大长度4位'}).regexValidator({regexp:"^[0-9]*$",onerror:"区代码只能输入数字"});
	$("#u_address").formValidator({validatorgroup:"2", onshow: "请输入银行地址"})
		.inputValidator({min:0, max:400, onerrormax:'银行地址最大长度400位'});
	$("#u_postCode").formValidator({validatorgroup:"2", onshow: "请输入邮编"})
		.inputValidator({min:0, max:10, onerrormax:'邮编最大长度10位'}).regexValidator({regexp:"^[0-9]*$",onerror:"邮编只能输入数字"});
	
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '支行信息详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});

	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 550
	, title: '支行信息新增', buttons:{
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
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 550
	, title: '支行信息修改', buttons:{
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
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};
	
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
		if ( confirm('是否删除该银行?') ) {
			$.ajax({url:urls.del, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : '', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		 {name: "新增支行", show:'', bclass: 'grid_edit', id: 'txt', onpress : add },{separator : true }
		,{name: "编辑支行", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "删除支行", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : del },{separator : true }
		// ,{name: "导入支行", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : imp },{separator : true }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 { display : '银行行号', dataIndex : 'unionBankNo', width : 80, align : 'center', sortable:true }
		,{ display : '上级行号', dataIndex : 'parentBankNo', width : 80, align : 'center', sortable:true }
		,{ display : '银行名称', dataIndex : 'bankName', width : 80, align : 'center', sortable:true }
		,{ display : '省代码', dataIndex : 'proCode', width : 80, align : 'center', sortable:true }
		,{ display : '市代码', dataIndex : 'cityCode', width : 80, align : 'center', sortable:true }
		,{ display : '区代码', dataIndex : 'countryCode', width : 80, align : 'center', sortable:true }
		,{ display : '银行地址', dataIndex : 'address', width : 80, align : 'center', sortable:true }
		,{ display : '邮编', dataIndex : 'postCode', width : 80, align : 'center', sortable:true }
		,{ display : '创建人', dataIndex : 'recAcc', width : 80, align : 'center', sortable:true }
		,{ display : '创建时间', dataIndex : 'recTime', width : 80, align : 'center', sortable:true, render: fmtTime }
		,{ display : '最后修改人', dataIndex : 'lastUptAcc', width : 80, align : 'center', sortable:true }
		,{ display : '最后修改时间', dataIndex : 'lastUptTime', width : 80, align : 'center', sortable:true, render: fmtTime }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$.jyform.components();
	// 
	$('#viewDiv').fullScreen();
	$('.bt').button();
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
});
//-->
</script>
</body>