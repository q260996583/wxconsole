<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商户账户出入账记录查询</title>
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
<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
<div id="viewtabs" style="border: none;">
	<ul>
    	<li id="v_baseinfotab" ><a href="#viewtabs-1">基本信息</a></li>
    	<li id="v_transreltab"><a href="#viewtabs-2">关联交易</a></li>
    	<li id="v_settlereltab"><a href="#viewtabs-3">关联交易</a></li>
  	</ul>
	<div id="viewtabs-1">
	<form id="viewForm" action="#">
	<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<tr>
			<td class="flabel">记录号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_logSeqNo" name="logSeqNo" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作类型</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_oprTypeDesc" name="oprTypeDesc" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">商户号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_mid" name="mid" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">清算日期</td>
			<td class="fcontent"><input class="cdnInput" id="v_stlmDate" xtype="date" name="stlmDate" maxLength="15" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">调整金额</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_balance" xtype="money" name="balance" maxLength="12" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_oprUser" name="oprUser" maxLength="30" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">操作时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_oprTime" xtype="datetime" name="oprTime" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">冻结标识</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="v_lockStatusDesc" name="lockStatusDesc" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">备注</td>
			<td class="fcontent"><textarea class="cdnInput" readonly id="v_remark" name="remark" ></textarea></td>
		</tr>
		<tr>
			<td class="flabel">出账处理付款单序号</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_payReqSeq" name="payReqSeq" maxLength="20" type="text" /></td>
		</tr>
		<tr>
			<td class="flabel">状态</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_statusDesc" name="statusDesc" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新机构</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdOrg" name="lastUpdOrg" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新时间</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdTime" xtype="datetime" name="lastUpdTime" maxLength="30" type="text" /></td>
		</tr>
		
		<tr>
			<td class="flabel">最后更新人</td>
			<td class="fcontent"><input class="cdnInput" readonly id="v_lastUpdUser" name="lastUpdUser" maxLength="30" type="text" /></td>
		</tr>
	</table>
	</form>
	</div>
	<div id="viewtabs-2">
  		<!-- 查询条件 -->
		<div id="transrel_queryCondition">
			<form id="transrel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="logSeqNo" id="transrel_q_logSeqNo" qtype="string" comparison="eq" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="transrel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="transrel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="transrel_table"></div>
  	</div>
  	<div id="viewtabs-3">
  		<!-- 查询条件 -->
		<div id="settlerel_queryCondition">
			<form id="settlerel_queryForm" name="queryForm" action="#" method="post">
				<input type="hidden" name="seqNo" id="settlerel_q_logSeqNo" class="param" />
				<ul class="qry-ul">
					<li><label>清算日期</label><input id="settlerel_q_stlmDate" xtype="date" name="stlmDate" type="text"  qtype="string" comparison="like" /></li>
					<li><input class='bt' id="settlerel_queryBtn" value="查询" type="button"/></li>
					<li><input value="重置" class='bt' type="reset" /></li>
				</ul>
			</form>
		</div>
		<!-- 列表 -->
		<div id="settlerel_table"></div>
  	</div>
</div>
</div>
<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	list:'mhtBalanceLogPage.action',
	excel:'mhtBalanceLogPageExcel.action',
	listRel:'mhtBalanceLogRelPage.action',
	excelRel:'mhtBalanceLogRelPageExcel.action',
	settlerel:'payReqSettlePage.action',
	settlerelExcel:'payReqSettlePageExcel.action',
};

$(function() {
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '商户账户出入账详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#v_settlereltab').hide(); $('#v_transreltab').hide();
		if (record.oprType == '01') {
			$('#v_settlereltab').show();
			$('#settlerel_q_logSeqNo').val(record.logSeqNo);
			$('#settlerel_queryBtn').click();
		} else {
			$('#v_trnasreltab').show();
			$('#transrel_q_logSeqNo').val(record.logSeqNo);
			$('#transrel_queryBtn').click();
		}
		$('#viewDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'lastUpdTime', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
			 {name: "详细信息", bclass: 'grid_edit',  id : 'cel',  onpress : view },{separator : true }
			,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
		 	 { display : '记录序号', dataIndex : 'logSeqNo', width : 80, align : 'center', sortable:true }
			,{ display : '商户号', dataIndex : 'mid', width : 180, align : 'center', sortable:true }
			,{ display : '清算日期', dataIndex : 'stlmDate', width : 180, align : 'center', sortable:true, render: fmtDate }
			,{ display : '操作类型', dataIndex : 'oprTypeDesc', width : 120, align : 'center', sortable:true }
			,{ display : '操作金额', dataIndex : 'balance', width : 120, align : 'center', sortable:true, render: fmtMoney }
			,{ display : '操作人', dataIndex : 'oprUser', width : 80, align : 'center', sortable:true }
			,{ display : '操作时间', dataIndex : 'oprTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '冻结标识', dataIndex : 'lockStatusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '出账处理付款单序号', dataIndex : 'payReqSeq', width : 120, align : 'center', sortable:true }
			,{ display : '状态', dataIndex : 'statusDesc', width : 80, align : 'center', sortable:true }
			,{ display : '最后更新机构', dataIndex : 'lastUpdOrg', width : 120, align : 'center', sortable:true }
			,{ display : '最后更新时间', dataIndex : 'lastUpdTime', width : 180, align : 'center', sortable:true, render: fmtTime }
			,{ display : '最后更新账号', dataIndex : 'lastUpdUser', width : 80, align : 'center', sortable:true }
		]
	});
	
	$('#transrel_table').flexigrid({
		url : urls.listRel, height: 330, sort : '', checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#transrel_table').flexFile(urls.excelRel);} }
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
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
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
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	$('#settlerel_table').flexigrid({
		url : urls.settlerel, height: 330, sort : '', checkbox : false, usepager : true, 
		buttons : [
		  {name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#settlerel_table').flexFile(urls.settlerelExcel);} }
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
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费结算方式', dataIndex: 'feeStlmType', width: 80, align: 'center', sortable: true }
		,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费封顶值', dataIndex: 'feeStlmMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '商户手续费固定值', dataIndex: 'feeStlmVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: 'MCC手续费结算方式', dataIndex: 'feeMccType', width: 80, align: 'center', sortable: true }
		,{ display: '银联费率', dataIndex: 'feeUnRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '银联手续费', dataIndex: 'unFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联封顶值', dataIndex: 'feeUnMax', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '银联固定值', dataIndex: 'feeUnVal', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '发卡行费率', dataIndex: 'feeCardRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
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
		,{ display: '服务商方费率', dataIndex: 'devRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '品牌封顶手续费', dataIndex: 'maxBrandFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '备注', dataIndex: 'failRemark', width: 80, align: 'center', sortable: true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();
	
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('#transrel_queryBtn').click(function(){$.queryTable({formId : 'transrel_queryForm', tableId : 'transrel_table'});});
	$('#settlerel_queryBtn').click(function(){$.queryTable({formId : 'settlerel_queryForm', tableId : 'settlerel_table'});});
	$('.bt').button();
	$('#queryBtn').click(function(){$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
});
//-->
</script>
</body>