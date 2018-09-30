<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务商资金存管</title>
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
			<li><label>商户名称</label><input  id="q_merName" name="merName" type="text" maxlength="200" qtype="string" comparison="like" /></li>
			<li><label>资金类别</label><input  id="q_fundType" name="fundType" type="text" maxlength="30" qtype="string" comparison="like" /></li>
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
	<td class="flabel"><font color="red">*</font>商户名称</td>
	<td class="fcontent"><input class="cdnInput" id="a_merName" name="merName" maxLength="200" type="text" /><div id="a_merNameTip"/></td>
</tr>
<tr>
	<td class="flabel"><font color="red">*</font>资金类别</td>
	<td class="fcontent"><input class="cdnInput" id="a_fundType" name="fundType" maxLength="30" type="text" /><div id="a_fundTypeTip"/></td>
</tr>
</table>
</form>
</div>
<!-- 修改 -->
<div id="updDiv" style="display: none;">
<div id="updtabs" style="border: none;">
	<ul>
   	<li id="infotab"><a href="#updtabs-1">存管信息</a></li>
   	<li id="intab"><a href="#updtabs-2">入账明细</a></li>
   	<li id="outtab"><a href="#updtabs-3">出账明细</a></li>
 	</ul>
 	<div id="updtabs-1">
		<form id="updForm" action="#">
		<input type="hidden" id="u_version" name="version" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel"><font color="red">*</font>序号</td>
			<td class="fcontent"><input class="cdnInput" id="u_seqNo" name="seqNo" maxLength="10" type="text" readonly="readonly" /><div id="u_seqNoTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>商户名称</td>
			<td class="fcontent"><input class="cdnInput" id="u_merName" name="merName" maxLength="200" type="text" /><div id="u_merNameTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>资金类别</td>
			<td class="fcontent"><input class="cdnInput" id="u_fundType" name="fundType" maxLength="30" type="text" /><div id="u_fundTypeTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>入账累计金额</td>
			<td class="fcontent"><input class="cdnInput" id="u_inAmt" name="inAmt" maxLength="14" type="text" readonly="readonly" xtype="money" /><div id="u_inAmtTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>退款金额</td>
			<td class="fcontent"><input class="cdnInput" id="u_outAmt" name="outAmt" maxLength="14" type="text" readonly="readonly" xtype="money" /><div id="u_outAmtTip"/></td>
		</tr>
		<tr>
			<td class="flabel"><font color="red">*</font>余额</td>
			<td class="fcontent"><input class="cdnInput" id="u_balance" name="balance" maxLength="14" type="text" readonly="readonly" xtype="money" /><div id="u_balanceTip"/></td>
		</tr>
		</table>
		</form>
	</div>
 	<div id="updtabs-2">
 		<!-- 查询条件 -->
		<div id="upd-in-queryCondition">
			<form id="upd-in-queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="uiq_seqNo" class="param"/>
				<input type="hidden" name="inoutFlag" id="uiq_inoutFlag" class="param" value="00" />
				<ul class="qry-ul">
					<li><label>资金类别</label><input  id="uiq_fundType" name="fundType" type="text" maxlength="30" qtype="string" comparison="like" /></li>
					<li><label>入账日期</label><input  id="uiq_occurDate" name="occurDate" type="text" maxlength="8" qtype="string" comparison="eq" xtype="date" /></li>
					<li><label>入账方式</label><input  id="uiq_inoutType" name="inoutType" type="text" maxlength="30" qtype="string" comparison="like" /></li>
					<li><input class='bt' id="upd-in-queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
 		<!-- 列表 -->
		<div id="upd-in-table"></div>
 	</div>
 	<div id="updtabs-3">
 		<!-- 查询条件 -->
		<div id="upd-out-queryCondition">
			<form id="upd-out-queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="uoq_seqNo" class="param" />
				<input type="hidden" name="inoutFlag" id="uoq_inoutFlag" class="param" value="01" />
				<ul class="qry-ul">
					<li><label>资金类别</label><input  id="uoq_fundType" name="fundType" type="text" maxlength="30" qtype="string" comparison="like" /></li>
					<li><label>出账日期</label><input  id="uoq_occurDate" name="occurDate" type="text" maxlength="8" qtype="string" comparison="eq" xtype="date"/></li>
					<li><label>出账方式</label><input  id="uoq_inoutType" name="inoutType" type="text" maxlength="30" qtype="string" comparison="like" /></li>
					<li><input class='bt' id="upd-out-queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
 		<div id="upd-out-table"></div>
 	</div>
</div>

<!-- Dialog 入账明细  -->
<!-- 新增入账明细 -->
<div id="addInDtlDiv" style="display: none;">
<form id="addInDtlForm" action="#">
	<input type="hidden" name="seqNo" id="aid_seqNo" />
	<input type="hidden" name="inoutFlag" id="aid_inoutFlag" value="00" />
	<table id="addInDtlTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	</table>
</form>
</div>
<!-- 修改入账明细 -->
<div id="updInDtlDiv" style="display: none;">
<form id="updInDtlForm" action="#">
	<input type="hidden" name="seqNo" id="uid_seqNo" />
	<input type="hidden" name="version" id="uid_version" />
	<input type="hidden" name="dtlNo" id="uid_dtlNo" />
	<input type="hidden" name="inoutFlag" id="uid_inoutFlag" value="00" />
	<table id="updInDtlTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	</table>
</form>
</div>

<!-- Dialog 出账明细  -->
<!-- 新增出账明细 -->
<div id="addOutDtlDiv" style="display: none;">
<form id="addOutDtlForm" action="#">
	<input type="hidden" name="seqNo" id="aod_seqNo" />
	<input type="hidden" name="inoutFlag" id="aod_inoutFlag" value="01" />
	<table id="addOutDtlTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	</table>
</form>
</div>
<!-- 修改出账明细 -->
<div id="updOutDtlDiv" style="display: none;">
<form id="updOutDtlForm" action="#">
	<input type="hidden" name="seqNo" id="uod_seqNo" />
	<input type="hidden" name="version" id="uod_version" />
	<input type="hidden" name="dtlNo" id="uod_dtlNo" />
	<input type="hidden" name="inoutFlag" id="uod_inoutFlag" value="01" />
	<table id="updOutDtlTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	</table>
</form>
</div>

<script type="text/javascript" src="r/js/tpl/fieldBuilder.js"></script>
<jsp:include page="pub/othchnlfunddtl_fld.jsp" />

<script type="text/javascript">
var urls = {
	add:'addChnlFund.action',
	upd:'updChnlFund.action',
	del:'delChnlFund.action',
	detail:'chnlFundData.action',
	sublist:'chnlFundDtlPage.action',
	addsub:'addChnlFundDtl.action',
	updsub:'updChnlFundDtl.action',
	delsub:'delChnlFundDtl.action',
	list:'chnlFundPage.action',
	excel:'chnlFundExcel.action',
	excelDtl:'chnlFundDtlExcel.action'
};
var fb = new FieldBuilder(fields);

$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"addForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#a_merName").formValidator({validatorgroup:"1", onshow: "请输入商户名称"})
		.inputValidator({min:1,onerrormin:"商户名称必须填写", max:200, onerrormax:'商户名称最大长度为200'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#a_fundType").formValidator({validatorgroup:"1", onshow: "请输入资金类别"})
		.inputValidator({min:1,onerrormin:"资金类别必须填写", max:30, onerrormax:'资金类别最大长度为30'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"2", formid:"updForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#u_seqNo").formValidator({validatorgroup:"2", onshow: "请输入序号"})
		.inputValidator({min:0,onerrormin:"序号必须填写", max:9999999999, onerrormax:'序号取值在0~9999999999',type:'value'}) /* 数字检查 */ 
	$("#u_merName").formValidator({validatorgroup:"2", onshow: "请输入商户名称"})
		.inputValidator({min:1,onerrormin:"商户名称必须填写", max:200, onerrormax:'商户名称最大长度为200'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	$("#u_fundType").formValidator({validatorgroup:"2", onshow: "请输入资金类别"})
		.inputValidator({min:1,onerrormin:"资金类别必须填写", max:30, onerrormax:'资金类别最大长度为30'})  /* 必填检测和长度检测*/ 
		.functionValidator({fun:chkCNLen}); /* 中文长度检测*/ 
	// addForm
	$('#addDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 500, height : 250
	, title: '新增服务商资金存管记录', buttons:{
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
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 800, height : 500
	, title: '修改服务商资金存管记录', buttons:{
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
		$('#uiq_seqNo').val(record.seqNo);
		$('#uoq_seqNo').val(record.seqNo);
		$('#updDiv').dialog('open');
		$('#infotab').click();
		$('#upd-in-queryBtn').click();
		$('#upd-out-queryBtn').click();
	};
	// DEL
	var del = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否删除记录?') ) {
			$.ajax({url:urls.del, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort: 'seqNo', checkbox : false, usepager : true, dbClickRecord: edit,
		buttons : [
		 {name: "新增", show:'', bclass: 'grid_add', id: 'txt', onpress : add },{separator : true }
		,{name: "编辑", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : edit },{separator : true }
		,{name: "删除", show:'', bclass: 'grid_del',  id : 'cel',  onpress : del },{separator : true }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		{ display: '序号', dataIndex: 'seqNo', width: 80, align: 'center', sortable: true }
		,{ display: '商户名称', dataIndex: 'merName', width: 120, align: 'center', sortable: true }
		,{ display: '资金类别', dataIndex: 'fundType', width: 80, align: 'center', sortable: true }
		,{ display: '入账累计金额', dataIndex: 'inAmt', width: 100, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '退款金额', dataIndex: 'outAmt', width: 100, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '余额', dataIndex: 'balance', width: 100, align: 'center', sortable: true, render:fmtMoney }
		]
	});
	
	// 明细界面配置 -----
	
	// 入账明细
	fb.buildTableFormFields('addInDtlTable',[
	 "merName","fundType"
	,{name:"occurDate", desc:"入账日期" }
	,{name:"ttlAmt", desc:"入账金额" }
	,{name:"inoutType", desc:"入账方式"}
	,"remark"
	], {});
	fb.buildTableFormFields('updInDtlTable',[
 	 "merName","fundType"
 	,{name:"occurDate", desc:"入账日期" }
 	,{name:"ttlAmt", desc:"入账金额" }
 	,{name:"inoutType", desc:"入账方式"}
 	,"remark"
 	], {});
	// 出账明细
	fb.buildTableFormFields('addOutDtlTable',[
	 "merName","fundType"
	,{name:"occurDate", desc:"出账日期" }
	,{name:"ttlAmt", desc:"出账金额" }
	,{name:"inoutType", desc:"出账方式"}
	,"remark"
	], {});
	fb.buildTableFormFields('updOutDtlTable',[
 	 "merName","fundType"
 	,{name:"occurDate", desc:"出账日期" }
 	,{name:"ttlAmt", desc:"出账金额" }
 	,{name:"inoutType", desc:"出账方式"}
 	,"remark"
 	], {});	
	
	$.formValidator.initConfig({ validatorgroup:"3", formid:"addInDtlTable", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('addInDtlTable','3');
	$.formValidator.initConfig({ validatorgroup:"4", formid:"updInDtlTable", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('updInDtlTable','4');
	$.formValidator.initConfig({ validatorgroup:"5", formid:"addOutDtlTable", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('addOutDtlTable','5');
	$.formValidator.initConfig({ validatorgroup:"6", formid:"updOutDtlTable", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	fb.buildFormValidate('updOutDtlTable','6');
	// dialog
	// addInDtlForm
	$('#addInDtlDiv').dialog({ autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: true, width: 500, height: 320
	, title: '新增入账明细记录', buttons:{
		'新增' : function() {
			if($.formValidator.pageIsValid('3')) {
				$.ajaxForm({formId : 'addInDtlForm', url : urls.addsub,
				success : function(data) {
					if (data.success) { 
						$('#addInDtlDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#upd-in-table').flexAddData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// updInDtlForm
	$('#updInDtlDiv').dialog({ autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: true, width : 500, height : 320
	, title: '修改入账明细记录', buttons:{
		'保存修改' : function() {
			if($.formValidator.pageIsValid('4')) {
				$.ajaxForm({formId : 'updInDtlForm', url : urls.updsub,
				success : function(data) {
					if (data.success) { 
						$('#updInDtlDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#upd-in-table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// addOutDtlForm
	$('#addOutDtlDiv').dialog({ autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: true, width: 500, height: 320
	, title: '新增出账明细记录', buttons:{
		'新增' : function() {
			if($.formValidator.pageIsValid('5')) {
				$.ajaxForm({formId : 'addOutDtlForm', url : urls.addsub,
				success : function(data) {
					if (data.success) { 
						$('#addOutDtlDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#upd-out-table').flexAddData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// updOutDtlForm
	$('#updOutDtlDiv').dialog({ autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: true, width : 500, height : 320
	, title: '修改出账明细记录', buttons:{
		'保存修改' : function() {
			if($.formValidator.pageIsValid('6')) {
				$.ajaxForm({formId : 'updOutDtlForm', url : urls.updsub,
				success : function(data) {
					if (data.success) { 
						$('#updOutDtlDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#upd-out-table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	// operation method. 
	var addInDtl = function() {
		$.jyform.resetForm('addInDtlForm');
		$('#aid_seqNo').val($('#uiq_seqNo').val());
		$('#addInDtlTable :input[name="merName"]').val($('#u_merName').val());
		$('#addInDtlTable :input[name="fundType"]').val($('#u_fundType').val());
		$('#addInDtlDiv').dialog('open');
	};
	var editInDtl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updInDtlForm');
		$.jyform.fillForm('updInDtlForm', record);
		$('#updInDtlDiv').dialog('open');
	};
	var delInDtl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否删除记录?') ) {
			$.ajax({url:urls.delsub, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#upd-in-table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	
	var addOutDtl = function() {
		$.jyform.resetForm('addOutDtlForm');
		$('#aod_seqNo').val($('#uoq_seqNo').val());
		$('#addOutDtlTable :input[name="merName"]').val($('#u_merName').val());
		$('#addOutDtlTable :input[name="fundType"]').val($('#u_fundType').val());
		$('#addOutDtlDiv').dialog('open');
	};
	var editOutDtl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('updOutDtlForm');
		$.jyform.fillForm('updOutDtlForm', record);
		$('#updOutDtlDiv').dialog('open');
	};
	var delOutDtl = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if ( confirm('是否删除记录?') ) {
			$.ajax({url:urls.delsub, data:{jsonObject:$.toJSON(record)}, type:'POST', dataType:'json',
				success:function(data){ if(data.success){ alert('操作成功'); $('#upd-out-table').refresh(); } else{ alert('操作失败：'+data.syserr); }												
			}});
		}
	};
	
	// upd dtl datagrid
	$('#upd-in-table').flexigrid({
		url : urls.sublist, height: 200, sort : 'dtlNo', checkbox : false, usepager : true, dbClickRecord: editInDtl,
		buttons : [
		 {name: "新增", show:'', bclass: 'grid_add', id: 'txt', onpress : addInDtl },{separator : true }
		,{name: "编辑", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : editInDtl },{separator : true }
		,{name: "删除", show:'', bclass: 'grid_del',  id : 'cel',  onpress : delInDtl }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#upd-in-table').flexFile(urls.excelDtl,{seqNo:$('#uiq_seqNo').val(),inoutFlag:$('#uiq_inoutFlag').val()});} }
		],
		colModel : [ 
		// { display: '明细序号', dataIndex: 'dtlNo', width: 80, align: 'center', sortable: true }
		 { display: '入账日期', dataIndex: 'occurDate', width: 100, align: 'center', sortable: true, render: fmtDate }
		,{ display: '商户名称', dataIndex: 'merName', width: 120, align: 'center', sortable: true }
		,{ display: '资金类别', dataIndex: 'fundType', width: 80, align: 'center', sortable: true }
		,{ display: '入账金额', dataIndex: 'ttlAmt', width: 100, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '入账方式', dataIndex: 'inoutType', width: 100, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'remark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#upd-out-table').flexigrid({
		url : urls.sublist,  height: 200, sort : 'dtlNo', checkbox : false, usepager : true, dbClickRecord: editOutDtl,
		buttons : [
		 {name: "新增", show:'', bclass: 'grid_add', id: 'txt', onpress : addOutDtl },{separator : true }
		,{name: "编辑", show:'', bclass: 'grid_edit',  id : 'cel',  onpress : editOutDtl },{separator : true }
		,{name: "删除", show:'', bclass: 'grid_del',  id : 'cel',  onpress : delOutDtl }
		,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#upd-out-table').flexFile(urls.excelDtl,{seqNo:$('#uoq_seqNo').val(),inoutFlag:$('#uoq_inoutFlag').val()});} }
		],
		colModel : [ 
		// { display: '明细序号', dataIndex: 'dtlNo', width: 80, align: 'center', sortable: true }
		 { display: '出账日期', dataIndex: 'occurDate', width: 100, align: 'center', sortable: true, render: fmtDate }
		,{ display: '商户名称', dataIndex: 'merName', width: 120, align: 'center', sortable: true }
		,{ display: '资金类别', dataIndex: 'fundType', width: 80, align: 'center', sortable: true }
		,{ display: '出账金额', dataIndex: 'ttlAmt', width: 100, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '出账方式', dataIndex: 'inoutType', width: 100, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'remark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$.jyform.components();
	$('.bt').button();
	
	$('#updtabs').tabs(); $('#updtabs').fixTabInDialog('updDiv');
	// add tab click event
	$('#infotab').click(function(){
		$.ajax({url:urls.detail, type:'POST', dataType:'json', async:false, data:{seqNo: $('#u_seqNo').val()}
			,success: function(data) { if ( data && data.success ){ $.jyform.fillForm('updForm', data.root[0]); } else { alert('加载存管信息失败：' + data.syserr);} }});		
	});
	// 更新窗口关闭后刷新grid dialog close
	$( "#updDiv" ).on( "dialogclose", function( event, ui ) { $('#table').refresh(); } );

	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#upd-in-queryBtn').click(function(){$.queryTable({formId : 'upd-in-queryForm', tableId : 'upd-in-table'});});
	$('#upd-out-queryBtn').click(function(){$.queryTable({formId : 'upd-out-queryForm', tableId : 'upd-out-table'});});
	$('#queryBtn').click();
});
</script>
</body>
</html>