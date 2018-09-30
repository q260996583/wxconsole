<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务商分润表</title>
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
			<li><label>开始日期</label><input  id="q_bgnSday" name="bgnSday" type="text" xtype="date" qtype="string" comparison="ge" /></li>
			<li><label>结束日期</label><input  id="q_endSday" name="endSday" type="text" xtype="date" qtype="string" comparison="le" /></li>
			<li><label>付款账户</label><select  id="q_bankAccntId" name="bankAccntId" qtype="string" comparison="eq" ></select></li>
			<li><label>状态</label><select id="q_status" name="status" ctype="PAY_REQ_STATUS" multiple="multiple" comparison="eq" ></select></li>
			<li><label>备注</label><input id="q_remark" name="remark" type="text" qtype="string" comparison="like" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
<div id="viewtabs" style="border: none;">
	<ul>
    	<li id="baseinfotab" ><a href="#viewtabs-1">基本信息</a></li>
    	<li id="mchntdtltab"><a href="#viewtabs-2">商户汇总</a></li>
    	<li id="transdtltab"><a href="#viewtabs-3">交易明细</a></li>
    	<li id="settledtltab"><a href="#viewtabs-4">出账明细</a></li>
    	<li id="errdtltab"><a href="#viewtabs-5">差错明细</a></li>
  	</ul>
  	<div id="viewtabs-1">
  		<form id="viewForm" action="#">
		<input name="version" type="hidden" />
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
		    <td class="flabel">序号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_seqNo" name="seqNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">申请表编号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_payBillNo" name="payBillNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">开始日期</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bgnSday" name="bgnSday" type="text" xtype="date" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">结束日期</td>
		    <td class="fcontent"><input class="cdnInput" id="v_endSday" name="endSday" type="text" xtype="date" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">支付机构号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankId" name="bankId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">申请类型</td>
		    <td class="fcontent"><input class="cdnInput" id="v_payReqType" name="payReqTypeDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">清算金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_stlmAmt" name="stlmAmt" xtype="money" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">商户开户行</td>
			<td class="fcontent"><input class="cdnInput" id="v_accntBankStringListDesc" name="accntBankStringListDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">流量费</td>
		    <td class="fcontent"><input class="cdnInput" id="v_flowFee" name="flowFee" xtype="money" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">强扣金额</td>
			<td class="fcontent"><input class="cdnInput" id="v_minusAmt" name="minusAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">应付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_realAmt" name="realAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">实付金额</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankRealAmt" name="bankRealAmt" xtype="money" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">清算笔数</td>
		    <td class="fcontent"><input class="cdnInput" id="v_stlmCount" name="stlmCount" type="text" readonly="readonly" /></td>
		</tr>
		
		<tr>
		    <td class="flabel">状态</td>
		    <td class="fcontent"><input class="cdnInput" id="v_status" name="statusDesc" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_remark" name="remark" type="text" readonly="readonly"></textarea></td>
		</tr>
		<tr>
		    <td class="flabel">剔除交易备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_crtFailRemark" name="crtFailRemark"  readonly="readonly"></textarea></td>
		</tr>
		<tr>
		    <td class="flabel">不出账备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_appFailRemark" name="appFailRemark" readonly="readonly"></textarea></td>
		</tr>
		<tr>
		    <td class="flabel">出款失败备注</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_amtFailRemark" name="amtFailRemark" readonly="readonly"></textarea></td>
		</tr>
		</table>
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>付款账户</caption>
		<tr>
		    <td class="flabel">付款账户编号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankAccntId" name="bankAccntId" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">行号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankNo" name="bankNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_accntNo" name="accntNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">支行名</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankName" name="bankName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">总行名</td>
		    <td class="fcontent"><input class="cdnInput" id="v_bankTitle" name="bankTitle" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">账户名称</td>
		    <td class="fcontent"><input class="cdnInput" id="v_accntName" name="accntName" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		
		<table id="viewChannelTable" class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>服务商配置</caption>
		<tr>
		    <td class="flabel">服务商编号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_channelCode" name="channelCode" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商行号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlBankNo" name="chnlBankNo" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">服务商账号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlAccntNo" name="chnlAccntNo" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商银行名称</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlBankName" name="chnlBankName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商账户名</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlAccntName" name="chnlAccntName" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
		    <td class="flabel">服务商持卡人证件号</td>
		    <td class="fcontent"><input class="cdnInput" id="v_chnlPersonCardNo" name="chnlPersonCardNo" type="text" readonly="readonly" /></td>
		</tr>
		</table>
		
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>审核信息</caption>
		<tr>
			<td class="flabel">审核时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_audTime" name="audTime" type="text" xtype="time" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">审核人</td>
			<td class="fcontent"><input class="cdnInput" id="v_audUser" name="audUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
		    <td class="flabel">审核意见</td>
		    <td class="fcontent"><textarea class="cdnInput" id="v_audRemark" name="audRemark" readonly="readonly" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">确认时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_secAudTime" name="secAudTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">确认用户</td>
			<td class="fcontent"><input class="cdnInput" id="v_secAudUser" name="secAudUser" type="text" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="flabel">确认意见</td>
			<td class="fcontent"><textarea class="cdnInput" id="v_secAudRemark" name="secAudRemark" readonly="readonly"></textarea></td>
		</tr>
		</table>
		
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<caption>更新信息</caption>
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" id="v_lastUpdOrg" name="lastUpdOrg" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">最后更新用户</td>
			<td class="fcontent"><input class="cdnInput" id="v_lastUpdUser" name="lastUpdUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_lastUpdTime" name="lastUpdTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">创建用户</td>
			<td class="fcontent"><input class="cdnInput" id="v_createUser" name="createUser" type="text" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="flabel">创建时间</td>
			<td class="fcontent"><input class="cdnInput" id="v_createTime" name="createTime" type="text" xtype="time" readonly="readonly"/></td>
		</tr>
		</table>
		</form>
  	</div>
  	<div id="viewtabs-2">
  		<!-- 查询条件 -->
		<div id="mchntdtl_queryCondition">
			<form id="mchntdtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="mchntdtl_q_seqNo" class="param" />
				<ul class="qry-ul">
					<li><label>商户号</label><input id="mchntdtl_q_mid" name="mid" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="mchntdtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="mchntdtl_table"></div>
  	</div>
  	<div id="viewtabs-3">
  		<!-- 查询条件 -->
		<div id="transdtl_queryCondition">
			<form id="transdtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="transdtl_q_seqNo" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input  id="transdtl_q_stlmDate" name="stlmDate" type="text" xtype="date" qtype="string" comparison="eq" /></li>
					<li><label>交易流水号</label><input  id="transdtl_q_transSeq" name="transSeq" type="text" maxlength="12" qtype="string" comparison="like" /></li>
			
					<li><input class='bt' id="transdtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="transdtl_table"></div>
  	</div>
  	<div id="viewtabs-4">
  		<!-- 查询条件 -->
		<div id="settledtl_queryCondition">
			<form id="settledtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="settledtl_q_seqNo" class="param" />
				<ul class="qry-ul">
					<li><label>商户号</label><input id="settledtl_q_mid" name="mid" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="settledtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="settledtl_table"></div>
  	</div>
  	<div id="viewtabs-5">
  		<!-- 查询条件 -->
		<div id="errdtl_queryCondition">
			<form id="errdtl_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="payReqSeq" id="errdtl_q_seqNo" type="text" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>商户号</label><input id="errdtl_q_mid" name="mid" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="errdtl_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="errdtl_table"></div>
  	</div>
</div>
</div>
<form id="exForm" action="exportConfirmFile.action" target="_blank" method="post">
	<input id="ex_seqNo" type="hidden" name="seqNo" /> 
</form>
<jsp:include page="/page/console/business/orgmngr/dialog_channelCode.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	accntdtl:'payReqAccntChnlQryDetail.action',
	accntdtlExcel:'payReqAccntChnlQryDetailExcel.action',
	transdtl:'payReqTransChnlQryDetail.action',
	transdtlExcel:'payReqTransChnlQryDetailExcel.action',
	list:'payReqChnlQryPage.action',
	listAccBank:'listAccBank.action',
	excel:'payReqChnlQryPageExcel.action',
	exportConfirm:'exportConfirmFile.action',
	listErr:'payReqPayErrRelPage.action',
	listErrExcel:'payReqPayErrRelPageExcel.action'
};

var bankAccntBox = function(options) {
	var opt = $.extend({
		valueField:'bankAccntId',
		displayField:'bankName',
		render:function(res){return res.bankName;},
		failedMsg:'获取支付账户失败!'
	},options);
	if ( !opt.url ) {
		opt.url = 'findBankAccntCombo.action';
	}
	jQuery.jyform.ajaxSelectBox(opt);
};

$(function() {
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '付款申请单详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});	
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#mchntdtltab').hide(); $('#transdtltab').hide(); $('#settledtltab').hide();$('#errdtltab').hide();
		if (record.payReqType == '01') { 
			$('#mchntdtltab').show(); $('#transdtltab').show(); 
			$.ajax({url:urls.listAccBank ,data:{payReqNo:record.seqNo}, type:'POST', dataType:'json',
				success:function(data){
					if (data.success) {
						if (isArray(data.root)) {
							$.each(data.root,function(i,n){
								if (i==0) {
									accntBankStringList = data.root[i].accntBankNo;
									accntBankStringListDesc = data.root[i].accntBankNoDesc;
								} else {
									accntBankStringList += "," + data.root[i].accntBankNo; 
									accntBankStringListDesc += "," + data.root[i].accntBankNoDesc; 
								}
							});
						} else {
							accntBankStringList = data.root.accntBankNo;
							accntBankStringListDesc = data.root.accntBankNoDesc;
						}
						//record.accntBankStringList = accntBankStringList;
						//record.accntBankStringListDesc = accntBankStringListDesc;
						$('#v_accntBankStringListDesc').val(accntBankStringListDesc);
					}	
				}});
			$('#mchntdtl_q_seqNo').val(record.seqNo);
			$('#mchntdtl_queryBtn').click();
			$('#transdtl_q_seqNo').val(record.seqNo);
			$('#transdtl_queryBtn').click();
		}
		if (record.payReqType == '02') { 
			$('#settledtltab').show();
			$('#settledtl_q_seqNo').val(record.seqNo);
			$('#settledtl_queryBtn').click();
			$('#errdtltab').show();
			$('#errdtl_q_seqNo').val(record.seqNo);
			$('#errdtl_queryBtn').click();
		}
		
		$('#viewDiv').dialog('open');
		$('#baseinfotab > a').click();
	};
	
	var exConfirm = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$('#ex_seqNo').val(record.seqNo);
		$('#exForm').submit();
	}
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'seqNo', dir : 'desc', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		   {name: "导出分润确认函", bclass: 'grid_excel',  id : 'excel',  onpress: exConfirm }
		  ,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 { display: '序号', dataIndex: 'seqNo', width: 80, align: 'center', sortable: true }
		,{ display: '服务商', dataIndex: 'channelCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '开始日期', dataIndex: 'bgnSday', width: 100, align: 'center', sortable: true, render: fmtDate  }
		,{ display: '结束日期', dataIndex: 'endSday', width: 100, align: 'center', sortable: true, render: fmtDate  }
		,{ display: '交易笔数', dataIndex: 'stlmCount', width: 80, align: 'center', sortable: true }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '服务商分润金额', dataIndex: 'stlmAmt', width: 100, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '强扣金额', dataIndex: 'minusAmt', width: 100, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '其他金额', dataIndex: 'otherAmt', width: 100, align: 'center', sortable: true, render: fmtMoney }
		,{ display: '付款金额', dataIndex: 'realAmt', width: 90, align: 'right', sortable: true, render: fmtMoney }
		,{ display: '收款人全称', dataIndex: 'chnlAccntName', width: 80, align: 'center', sortable: true }
		,{ display: '开户行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '账号', dataIndex: 'accntNo', width: 80, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'remark', width: 80, align: 'center', sortable: true }
		,{ display: '状态', dataIndex: 'statusDesc', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#mchntdtl_table').flexigrid({
		url : urls.accntdtl, height: 330, sort : 'dtlNo', dir : 'desc', checkbox : false, usepager : true, 
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#mchntdtl_table').flexFile(urls.accntdtlExcel,{seqNo:$('#mchntdtl_q_seqNo').val()}); } }
		],
		colModel : [ 
       	 { display: '序号', dataIndex: 'dtlNo', width: 80, align: 'center', sortable: true }
   		,{ display: '服务商编号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
   		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
   		,{ display: '商户名称', dataIndex: 'merName', width: 80, align: 'center', sortable: true }
   		,{ display: '清算金额', dataIndex: 'stlmAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '流量费', dataIndex: 'flowFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '应付金额', dataIndex: 'realAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '实付金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
   		,{ display: '清算笔数', dataIndex: 'stlmCount', width: 80, align: 'center', sortable: true }
   		,{ display: '账户类型', dataIndex: 'accntTypeDesc', width: 80, align: 'center', sortable: true }
   		,{ display: '行号', dataIndex: 'bankNo', width: 80, align: 'center', sortable: true }
   		,{ display: '账户名称', dataIndex: 'accntName', width: 80, align: 'center', sortable: true }
   		,{ display: '账号', dataIndex: 'accntNo', width: 80, align: 'center', sortable: true }
   		,{ display: '支行名', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
   		,{ display: '持卡人证件号', dataIndex: 'cardPersonNo', width: 80, align: 'center', sortable: true }
   		,{ display: '总行名', dataIndex: 'bankTitleDesc', width: 80, align: 'center', sortable: true }
   		,{ display: '商户确认状态', dataIndex: 'dtlStatus', width: 80, align: 'center', sortable: true }
   		,{ display: '确认用户', dataIndex: 'confUser', width: 80, align: 'center', sortable: true }
   		,{ display: '确认时间', dataIndex: 'confTime', width: 80, align: 'center', sortable: true, render:fmtTime }
   		,{ display: '出账状态', dataIndex: 'applyStateDesc', width: 80, align: 'center', sortable: true }
   		]
	});
	
	$('#transdtl_table').flexigrid({
		url : urls.transdtl, height: 330, sort : 'transTime', dir : 'desc', checkbox : false, usepager : true, 
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#transdtl_table').flexFile(urls.transdtlExcel,{seqNo:$('#transdtl_q_seqNo').val()}); }}
		],
		colModel : [
		 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
		,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '发卡行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '发卡方手续费', dataIndex: 'cardFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方封顶值', dataIndex: 'feeCardMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方固定值', dataIndex: 'feeCardVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '总收益', dataIndex: 'totRev', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费率', dataIndex: 'payRate', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费', dataIndex: 'payFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '收单方手续费', dataIndex: 'fftFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户费率', dataIndex: 'realFeeType', width: 80, align: 'center', sortable: true }
		,{ display: '银行品牌服务费', dataIndex: 'bankBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商品牌服务费', dataIndex: 'allBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费清算标', dataIndex: 'brandFeeFlag', width: 80, align: 'center', sortable: true }
		,{ display: '银行实际清算金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费费率', dataIndex: 'realBrandfeeType', width: 80, align: 'center', sortable: true }
		,{ display: '服务商方收益', dataIndex: 'devFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '出账状态', dataIndex: 'mhtApplyStDesc', width: 80, align: 'center', sortable: true }
		,{ display: '出账时间', dataIndex: 'mhtApplyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '出账操作人', dataIndex: 'mhtApplyUser', width: 80, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#settledtl_table').flexigrid({
		url : urls.transdtl, height: 330, sort : 'transTime', dir : 'desc', checkbox : false, usepager : true, 
		buttons : [
		 {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#settledtl_table').flexFile(urls.transdtlExcel,{seqNo:$('#settledtl_q_seqNo').val()}); }}
		],
		colModel : [ 
		{ display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
		,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '发卡行', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '发卡方手续费', dataIndex: 'cardFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方封顶值', dataIndex: 'feeCardMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡方固定值', dataIndex: 'feeCardVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '总收益', dataIndex: 'totRev', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费率', dataIndex: 'payRate', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '支付机构手续费', dataIndex: 'payFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '收单方手续费', dataIndex: 'fftFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户费率', dataIndex: 'realFeeType', width: 80, align: 'center', sortable: true }
		,{ display: '银行品牌服务费', dataIndex: 'bankBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商品牌服务费', dataIndex: 'allBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费清算标', dataIndex: 'brandFeeFlag', width: 80, align: 'center', sortable: true }
		,{ display: '银行实际清算金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '品牌服务费费率', dataIndex: 'realBrandfeeType', width: 80, align: 'center', sortable: true }
		,{ display: '服务商方收益', dataIndex: 'devFee', width: 80, align: 'center', sortable: true, render:fmtMoney  }
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '出账状态', dataIndex: 'mhtApplyStDesc', width: 80, align: 'center', sortable: true }
		,{ display: '出账时间', dataIndex: 'mhtApplyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '出账操作人', dataIndex: 'mhtApplyUser', width: 80, align: 'center', sortable: true }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#errdtl_table').flexigrid({
		url : urls.listErr, height: 330, sort : 'errSeq', dir : 'desc', checkbox : false, usepager : true,
		buttons : [
		  {name: "导出", bclass: 'grid_excel',  id : 'excel',  onpress: function() { $('#errdtl_table').flexFile(urls.listErrExcel); } }
		],
		colModel : [ 
       	  	 { display : '差错序号', dataIndex : 'errSeq', width : 80, align : 'center', sortable:true }
			,{ display : '差错类型', dataIndex : 'errTypeDesc', width : 180, align : 'center', sortable:true }
			,{ display : '原交易匹配标识', dataIndex : 'mateFlagDesc', width : 80, align : 'center', sortable:true }
			,{ display : '处理状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			//,{ display : '代理机构标识码', dataIndex : 'agentOrgCode', width : 80, align : 'center', sortable:true }
			//,{ display : '发送机构标识码', dataIndex : 'sendOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 80, align : 'center', sortable:true }
			,{ display : '系统跟踪号', dataIndex : 'errSystemTraceNo', width : 80, align : 'center', sortable:true }
			,{ display : '交易传输时间', dataIndex : 'txnTransTime', width : 80, align : 'center', sortable:true ,render: fmtTime10 }
			,{ display : '主帐号', dataIndex : 'pan', width : 80, align : 'center', sortable:true }
			,{ display : '差错金额', dataIndex : 'errAmt', width : 80, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '应收手续费', dataIndex : 'orgReceiveFeeAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '应付手续费', dataIndex : 'orgPayFeeAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '分期付款附加手续费', dataIndex : 'addintionFeeAmt', width : 80, align : 'center', sortable:true,render: fmtMoney }
			,{ display : '持卡人交易手续费', dataIndex : 'cardPersonFeeAmt', width : 80, align : 'center', sortable:true,render: fmtMoney }
			,{ display : '应收费用', dataIndex : 'receiveAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '应付费用', dataIndex : 'payAmt', width : 80, align : 'center', sortable:true ,render: fmtMoney }
			,{ display : '差错原因', dataIndex : 'errReason', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易日期时间', dataIndex : 'transTime', width : 80, align : 'center', sortable:true,render: fmtTime10 }
			,{ display : '上一笔交易清算日期', dataIndex : 'pospStmt', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易金额', dataIndex : 'transAmt', width : 80, align : 'center', sortable:true,render: fmtMoney }
			,{ display : '上一笔交易检索参考号', dataIndex : 'referenceNum', width : 80, align : 'center', sortable:true }
			,{ display : '上一笔交易系统追踪号', dataIndex : 'systemTraceId', width : 80, align : 'center', sortable:true }
			,{ display : '交易返回码', dataIndex : 'respCode', width : 80, align : 'center', sortable:true }
			//,{ display : '报文类型', dataIndex : 'packetType', width : 80, align : 'center', sortable:true }
			//,{ display : '交易处理码(3域)', dataIndex : 'procCode', width : 80, align : 'center', sortable:true }
			//,{ display : '商户类型', dataIndex : 'mcc', width : 80, align : 'center', sortable:true }
			//,{ display : '终端标识号', dataIndex : 'tid', width : 80, align : 'center', sortable:true }
			//,{ display : '服务点条件码', dataIndex : 'pointCondCode', width : 80, align : 'center', sortable:true }
			//,{ display : '授权标识应答码', dataIndex : 'authRespCode', width : 80, align : 'center', sortable:true }
			//,{ display : '接收机构标识码', dataIndex : 'receiveOrgCode', width : 80, align : 'center', sortable:true }
			//,{ display : '发卡银行标识码', dataIndex : 'cardBankNo', width : 80, align : 'center', sortable:true }
			//,{ display : '服务点输入方式', dataIndex : 'pointEntryCode', width : 80, align : 'center', sortable:true }
			//,{ display : '接收/转出机构标志码', dataIndex : 'transferOutOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '转出卡号', dataIndex : 'transferOutCard', width : 80, align : 'center', sortable:true }
			,{ display : '转入机构标识码', dataIndex : 'transferInOrgCode', width : 80, align : 'center', sortable:true }
			,{ display : '转入卡号', dataIndex : 'transferInCard', width : 80, align : 'center', sortable:true }
			//,{ display : '卡序列号', dataIndex : 'cardSeqNum', width : 80, align : 'center', sortable:true }
			//,{ display : '终端读取能力', dataIndex : 'tidReadAblity', width : 80, align : 'center', sortable:true }
			//,{ display : 'IC卡条件代码', dataIndex : 'icCondCode', width : 80, align : 'center', sortable:true }
			//,{ display : 'ECI标识', dataIndex : 'eciFlag', width : 80, align : 'center', sortable:true }
			,{ display : '受理/发卡方标识', dataIndex : 'orgTypeDesc', width : 80, align : 'center', sortable:true }
			,{ display : '来源文件', dataIndex : 'fileName', width : 80, align : 'center', sortable:true }
			,{ display : '付款单号', dataIndex : 'payReqSeq', width : 80, align : 'center', sortable:true }
			,{ display : '记录创建时间', dataIndex : 'recTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '记录创建人', dataIndex : 'recAcc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUptTime', width : 80, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新人', dataIndex : 'lastUptAcc', width : 80, align : 'center', sortable:true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	bankAccntBox({selectId:'q_bankAccntId',emptyOpt:true});
	bankAccntBox({selectId:'a_bankAccntId',emptyOpt:true});
	$.jyform.components();	
	channelCodeDialogBind('a_channelCode', function(data) { $('#a_channelCode').val(data.channelCode);$('#a_channelName').val(data.channelName); });
	// 
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		//wxb
		var startTime=$("#q_bgnSday").val();
		var endTime=$("#q_endSday").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能晚于结束日期！");
				return false;
			}
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	$('#errdtl_queryBtn').click(function(){$.queryTable({formId : 'errdtl_queryForm', tableId : 'errdtl_table'});});
	$('#mchntdtl_queryBtn').click(function(){$.queryTable({formId : 'mchntdtl_queryForm', tableId : 'mchntdtl_table'});});
	$('#transdtl_queryBtn').click(function(){$.queryTable({formId : 'transdtl_queryForm', tableId : 'transdtl_table'});});
	$('#settledtl_queryBtn').click(function(){$.queryTable({formId : 'settledtl_queryForm', tableId : 'settledtl_table'});});
	
});
//-->
</script>
</body>