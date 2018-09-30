<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>风控商户延迟清算管理</title>
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
			<li><label>商户号</label><input  id="q_mid" name="mid" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>

<!-- 锁定界面 -->
<div id="lockDiv" style="display: none;">
<form id="lockForm" action="#">
<input id="l_version" type="hidden" name="version" />
<table id="lockTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	
</table>
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel"><font color="red">*</font>延迟清算原因</td>
		<td class="fcontent"><input class="cdnInput" id="l_remark" maxLength="15" type="text" /><div id="l_remarkTip"/></td>
	</tr>
</table>
</form>
</div>

<!-- 解冻界面 -->
<div id="unlockDiv" style="display: none;">
<form id="unlockForm" action="#">
<input id="ul_version" type="hidden" name="version" />
<table id="unlockTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	
</table>
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel"><font color="red">*</font>解除延迟清算原因</td>
		<td class="fcontent"><input class="cdnInput" id="ul_remark" maxLength="15" type="text" /><div id="ul_remarkTip"/></td>
	</tr>
</table>
</form>
</div>
<script type="text/javascript" src="r/js/tpl/fieldBuilder.js"></script>
<script type="text/javascript">
var urls = {
	lock:'lockRiskLockMchnt.action',
	unlock:'unlockRiskLockMchnt.action',
	list:'findAllMerchant.action',
};

var fields = 
	[
	 {name:'mid', desc:'外部商户号(银联)'  , jtype:'String', length: 15}
	,{name:'version', desc:'VERSION'  , jtype:'Long', length: 10}
	,{name:'orgCode', desc:'内部机构号'  , jtype:'String', length: 15}
	,{name:'merName', desc:'商户名称'  , jtype:'String', length: 100}
	,{name:'payOrgCode', desc:'对应支付机构代码'  , jtype:'String', length: 20}
	,{name:'merOutName', desc:'商户对外经营名称'  , jtype:'String', length: 100}
	,{name:'enName', desc:'商户英文名称'  , jtype:'String', length: 100}
	,{name:'enOutName', desc:'商户对外英文名称'  , jtype:'String', length: 100}
	,{name:'mcc', desc:'商户类别码（MCC）'  , jtype:'String', length: 10}
	,{name:'areaCode', desc:'地区代码'  , jtype:'String', length: 10}
	,{name:'licenseNo', desc:'营业执照统一社会信用代码'  , jtype:'String', length: 30}
	,{name:'licenseAddr', desc:'营业执照注册地址'  , jtype:'String', length: 200}
	,{name:'personName', desc:'商户法定代表人姓名'  , jtype:'String', length: 20}
	,{name:'personNo', desc:'商户法定代表人身份证号'  , jtype:'String', length: 20}
	,{name:'address', desc:'商户装机地址'  , jtype:'String', length: 500}
	,{name:'busiBgtime', desc:'营业开始时间'  , jtype:'String', length: 10}
	,{name:'busiEndtime', desc:'营业结束时间'  , jtype:'String', length: 10}
	,{name:'area', desc:'营业面积'  , jtype:'String', length: 20}
	,{name:'posNum', desc:'收银台数'  , jtype:'Long', length: 5}
	,{name:'accntBank', desc:'开户银行名称（他行）'  , jtype:'String', length: 60}
	,{name:'accntName', desc:'账户名称'  , jtype:'String', length: 100}
	,{name:'accntNo', desc:'账户号码'  , jtype:'String', length: 20}
	,{name:'accntType', desc:'账户类型'  , jtype:'String', length: 2}
	,{name:'bankName', desc:'行名'  , jtype:'String', length: 100}
	,{name:'bankNo', desc:'行号'  , jtype:'String', length: 20}
	,{name:'feeStlmType', desc:'手续费收取类型'  , jtype:'String', length: 2}
	,{name:'feeRate', desc:'手续费率' ,xtype:'feeRate' , jtype:'Long', length: 5}
	,{name:'feeVal', desc:'手续费固定值'  , jtype:'Long', length: 10}
	,{name:'topValue', desc:'手续费封顶值'  , jtype:'Long', length: 10}
	,{name:'merContact', desc:'商户联系人'  , jtype:'String', length: 60}
	,{name:'merFax', desc:'商户传真'  , jtype:'String', length: 20}
	,{name:'merPhone', desc:'商户联系电话'  , jtype:'String', length: 30}
	,{name:'accntNoPrivate', desc:'对私帐户号码'  , jtype:'String', length: 20}
	,{name:'accntNamePrivate', desc:'对私帐户名称'  , jtype:'String', length: 100}
	,{name:'cardPersonNo', desc:'商户身份证号码'  , jtype:'String', length: 18}
	,{name:'accntBankPrivate', desc:'对私开户行'  , jtype:'String', length: 100}
	,{name:'bankAccntId', desc:'备付金账户序列号'  , jtype:'Long', length: 5}
	];
var fb = new FieldBuilder(fields);
$(function() {
	// init Validator 
	$.formValidator.initConfig({ validatorgroup:"1", formid:"lockForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#l_remark").formValidator({validatorgroup:"1", onshow: "请填写冻结原因"})
		.inputValidator({min:1,onerrormin:"冻结原因必填", max:400, onerrormax:'冻结原因最多400位'});
	
	$.formValidator.initConfig({ validatorgroup:"2", formid:"unlockForm", onerror : function(msg,obj) { 	alert(msg); $(obj).focus();} });
	$("#ul_remark").formValidator({validatorgroup:"2", onshow: "请填写解冻原因"})
		.inputValidator({min:1,onerrormin:"解冻原因必填", max:400, onerrormax:'解冻原因最多400位'});
	
	fb.buildTableFormFields('lockTable',[
   	"mid"
   	,{name:"orgCode",id:"l_orgCode"}
   	,"merName"
   	,"merOutName"
   	,"mcc"
   	,"areaCode"
   	,"feeRate"
   	,"topValue"
   	], {readonly:"readonly"});
	
	fb.buildTableFormFields('unlockTable',[
	"mid"
	,{name:"orgCode",id:"ul_orgCode"}
	,"merName"
	,"merOutName"
	,"mcc"
	,"areaCode"
	,"feeRate"
	,"topValue"
	], {readonly:"readonly"});
	
	// lockForm
	$('#lockDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '延迟清算', buttons:{
		'延迟清算' : function() {
			if($.formValidator.pageIsValid('1')) {
				var record = new Object();
				record.orgCode = $('#l_orgCode').val();
				record.version = $('#l_version').val();
				if ( confirm('是否延迟清算该商户,锁定后该商户无法进行出帐流程?') ) {
					$.ajax({url:urls.lock, data:{jsonObject:$.toJSON(record),remark:$('#l_remark').val()}, type:'POST', dataType:'json',
						success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh();$('#lockDiv').dialog('close'); } else{ alert('操作失败：'+data.syserr); }												
					}});
				}
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// unlockForm
	$('#unlockDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '解除延迟清算', buttons:{
		'解除延迟清算' : function() {
			if($.formValidator.pageIsValid('2')) {
				var record = new Object();
				record.orgCode = $('#ul_orgCode').val();
				record.version = $('#ul_version').val();
				if ( confirm('是否解除延迟清算?') ) {
					$.ajax({url:urls.unlock, data:{jsonObject:$.toJSON(record),remark:$('#ul_remark').val()}, type:'POST', dataType:'json',
						success:function(data){ if(data.success){ alert('操作成功'); $('#table').refresh();$('#unlockDiv').dialog('close'); } else{ alert('操作失败：'+data.syserr); }												
					}});
				}
			} else { return false; }}
		,'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// LOCK
	var lock = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('lockForm');
		$.jyform.resetForm('lockForm');
		$.jyform.fillForm('lockForm', record);
		$('#lockDiv').dialog('open');
	};
	
	// UNLOCK
	var unlock = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('unlockForm');
		$.jyform.resetForm('unlockForm');
		$.jyform.fillForm('unlockForm', record);
		$('#unlockDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : '', checkbox : false, usepager : true, 
		buttons : [
			 {name: "延迟清算", show:'ROLE_RISK_MHT_LOCK', bclass: 'grid_add', id: 'txt', onpress : lock },{separator : true }
			,{name: "解除延迟清算", show:'ROLE_RISK_MHT_UNLOCK', bclass: 'grid_add', id: 'txt', onpress : unlock },{separator : true }
			,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 	 {display : '服务商名称',dataIndex : 'channelName', width : 120,align : 'center',sortable:true}
		 	,{display : '内部商户编号',dataIndex : 'orgCode', width : 180,align : 'center',sortable:true}
		 	,{display : '商户名称',dataIndex : 'merName', width : 120,sortable:true}
		 	,{display : '商户对外经营名称',dataIndex : 'merOutName', width : 120,sortable:true}
		 	,{display : '冻结状态',dataIndex : 'lockFlagDesc', width : 80,align : 'center'}
		 	,{display : '商户类别码（MCC）',dataIndex : 'mcc', width : 80,sortable:true}
		 	,{display : '商户类型',dataIndex : 'mccZh', width : 120,sortable:true}
		 	,{display : '外部商户编号',dataIndex : 'merOutCode', width : 180,align : 'center',sortable:true}
		 	,{display : '商户状态',dataIndex : 'merStatusZh', width : 80,align : 'center'}
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	
	//$('#viewDiv').fullScreen();
	
	$('.bt').button();
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
});
//-->
</script>
</body>