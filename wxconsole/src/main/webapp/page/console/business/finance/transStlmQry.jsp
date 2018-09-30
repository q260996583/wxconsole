<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>交易清算查询</title>
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
			<li><label>交易时间从</label><input id="q_bgnSday" name="transTime" type="text" xtype="time" qtype="string" comparison="ge" /></li>
			<li><label>到</label><input id="q_endSday" name="transTime" type="text" xtype="time" qtype="string" comparison="le" /></li>
			<li><label>出款时间从</label><input id="q_appBgnTime" name="mhtApplyTime" type="text" xtype="time" qtype="string" comparison="ge" /></li>
			<li><label>到</label><input id="q_appEndTime" name="mhtApplyTime" type="text" xtype="time" qtype="string" comparison="le" /></li>
			<li><label>商户号</label><input id="q_mid" name="mid" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>中心交易流水号</label><input id="q_transSeq" name="transSeq" type="text" maxlength="20" qtype="string" comparison="like" /></li>
			<li><label>对账状态</label><select id="q_checkFlag" name="checkFlag" ctype="TRNAS_CHECK_FLAG" multiple="multiple" comparison="eq" ></select></li>
			<li><label>出账状态</label><select id="q_mhtApplySt" name="mhtApplySt" ctype="PAY_REQ_APPLY" multiple="multiple" comparison="eq" ></select></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
<div id="table"></div>

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
<form id="viewForm" action="#">
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel">清算日期</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_stlmDate" name="stlmDate" maxLength="15" xtype="date" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易流水号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_transSeq" name="transSeq" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易类型</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_transCodeDesc" name="transCodeDesc" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">原交易流水号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_oriSeq" name="oriSeq" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易时间</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_transTime" xtype="datetime" name="transTime" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mid" name="mid" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">终端号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_tid" name="tid" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">卡号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_cardId" name="cardId" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">MCC</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mcc" name="mcc" maxLength="4" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易金额</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_transAmt" name="transAmt" maxLength="20" xtype="money" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户实际费率</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mRealRate" name="mRealRate" maxLength="20" xtype="rate4" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户实际手续费</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mRealFee" name="mRealFee" maxLength="20" xtype="money" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户实际清算额</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mRealAmt" name="mRealAmt" maxLength="20" type="text"  xtype="money"/></td>
	</tr>
	<tr>
		<td class="flabel">服务商号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_channelCode" name="channelCode" maxLength="20" type="text"  xtype="money"/></td>
	</tr>
	<tr>
		<td class="flabel">出账状态</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mhtApplyStDesc" name="mhtApplyStDesc" maxLength="20" type="text"/></td>
	</tr>
	<tr>
		<td class="flabel">出账时间</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mhtApplyTime" name="mhtApplyTime" maxLength="20" type="text" xtype="time"/></td>
	</tr>
	<tr>
		<td class="flabel">出账操作人</td>
		<td class="fcontent"><input class="cdnInput" readonly id="v_mhtApplyUser" name="mhtApplyUser" maxLength="20" type="text" /></td>
	</tr>
</table>
</form>
</div>

<!-- 详情界面 -->
<div id="appDiv" style="display: none;">
<form id="appForm" action="#">
<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
	<tr>
		<td class="flabel">出账商户明细号</td>
		<td class="fcontent"><input class="cdnInput" id="ap_dtlNo" name="dtlNo" maxLength="20" type="text"/></td>
	</tr>
	<tr>
		<td class="flabel">出账付款单号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_reqSeqNo" name="reqSeqNo" maxLength="20" type="text"/></td>
	</tr>
	<tr>
		<td class="flabel">出账时间</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mhtApplyTime" name="mhtApplyTime" maxLength="20" type="text" xtype="time"/></td>
	</tr>
	<tr>
		<td class="flabel">出账操作人</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mhtApplyUser" name="mhtApplyUser" maxLength="20" type="text" /></td>
	</tr>
	
	<tr>
		<td class="flabel">清算日期</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_stlmDate" name="stlmDate" maxLength="15" xtype="date" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易流水号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_transSeq" name="transSeq" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易类型</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_transCodeDesc" name="transCodeDesc" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">原交易流水号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_oriSeq" name="oriSeq" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易时间</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_transTime" xtype="datetime" name="transTime" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mid" name="mid" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">终端号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_tid" name="tid" maxLength="15" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">卡号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_cardId" name="cardId" maxLength="20" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">MCC</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mcc" name="mcc" maxLength="4" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">交易金额</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_transAmt" name="transAmt" maxLength="20" xtype="money" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户实际费率</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mRealRate" name="mRealRate" maxLength="20" xtype="rate4" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户实际手续费</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mRealFee" name="mRealFee" maxLength="20" xtype="money" type="text" /></td>
	</tr>
	<tr>
		<td class="flabel">商户实际清算额</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_mRealAmt" name="mRealAmt" maxLength="20" type="text"  xtype="money"/></td>
	</tr>
	<tr>
		<td class="flabel">服务商号</td>
		<td class="fcontent"><input class="cdnInput" readonly id="ap_channelCode" name="channelCode" maxLength="20" type="text"  xtype="money"/></td>
	</tr>
</table>
</form>
</div>

<!-- 商户付款选择弹出窗口 -->
<div id="dialog_payMhtDtl" style="display: none;">
	<form id="dialog_payMhtDtl_queryForm" name="queryForm" action="#" method="post">
		<input type="hidden" name="applyState" value="02"  qtype="string" comparison="eq"/>
		<input id="dialog_payMhtDtl_mid" type="hidden" name="mid"  qtype="string" comparison="eq"/>
		<input id="dialog_payMhtDtl_applyTime" type="hidden" name="applyTime" qtype="string" comparison="ge"/>
		<ul class="qry-ul" class="qtable">
			<!-- <li><label>商户编码</label><input id="dialog_payMhtDtl_mid" name="mid" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>商户名称</label><input id="dialog_payMhtDtl_merName" name="merName" type="text" maxlength="100" qtype="string" comparison="like" /></li> -->
			<li><input class='bt qbutton' id="dialog_payMhtDtl_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>

<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
var urls = {
	list:'findTransStlmPage.action',
	excel:'findTransStlmPageExcel.action',
	app:'doMarkTransApply.action' 
};

Date.prototype.Format = function(fmt)   
{    
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  

$(function() {
	var time2 = new Date().Format("yyyyMMdd");    
	// $('#dialog_payMhtDtl_applyTime').val(time2+"000000");
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '清算信息详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});	
	
	// appForm
	$('#appDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '出账标记', buttons:{
		 '确认' : function() { 
			 if (!confirm('是否进行出账标记?此操作不可撤销')) {
					return;
			 }
			 $.ajaxForm({formId : 'appForm', url : urls.app,
				success : function(data) {
					if (data.success) { 
						$('#appDiv').dialog('close'); alert('操作成功'); 
						if ( data.root && data.root[0] ) $('#table').flexModifyData(data.root[0]);
					} else { 
						alert('操作失败 原因是'+ data.syserr); 
					}
				}});
			 $(this).dialog('close');
		 }
		,'关闭' : function() { $(this).dialog('close'); }
	}});	
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};
	
	// MARK
	var mark = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if (record.checkFlag != '02') {
			alert('仅对账不平交易可以标记');
			return;
		}
		if (record.mhtApplySt != '01') {
			alert('仅未出账交易可以标记');
			return;
		}
		$.jyform.resetForm('appForm');
		$.jyform.fillForm('appForm', record);
		$('#dialog_payMhtDtl_mid').val(record.mid);
		$('#appDiv').dialog('open');
	};
	
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'transTime', dir : "desc", checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
		    {name: "标记为已出账", show:'', bclass: 'grid_add', id: 'txt', onpress : mark },{separator : true }
		   ,{name: "导出Excel", bclass: 'grid_excel',  id : 'excel',  onpress: function() {$('#table').flexFile(urls.excel);} }
		],
		colModel : [ 
			 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
			,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
			,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
			,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
			,{ display: '商户实际费率', dataIndex: 'mRealRate', width: 80, align: 'center', sortable: true, render:fmtRate4 }
			,{ display: '商户手续费', dataIndex: 'mRealFee', width: 80, align: 'center', sortable: true, render:fmtMoney }
			,{ display: '实际清算额', dataIndex: 'mRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
			,{ display: '出账状态', dataIndex: 'mhtApplyStDesc', width: 80, align: 'center', sortable: true }
			,{ display: '支付机构号', dataIndex: 'bankId', width: 80, align: 'center', sortable: true }
			,{ display: '原交易流水号', dataIndex: 'oriSeq', width: 80, align: 'center', sortable: true }
			,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
			,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
			,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
			,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
			,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
			,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
			,{ display: '出账时间', dataIndex: 'mhtApplyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
			,{ display: '出账操作人', dataIndex: 'mhtApplyUser', width: 80, align: 'center', sortable: true }
		]
	});
	
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();	
	// 
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		//wxb
		var q_bgnSday=$("#q_bgnSday").val();
		var q_endSday=$("#q_endSday").val();
		var q_appBgnTime=$("#q_appBgnTime").val();
		var q_appEndTime=$("#q_appEndTime").val();
		if(q_bgnSday>q_endSday){
			alert("请选择正确的交易时间");
			return false;
		}
		if(q_appBgnTime>q_appEndTime){
			alert("请选择正确的出款时间"); 
			return false;
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
	
	midDialogBind('q_mid', function(data) { $('#q_mid').val(data.mid); });
	
	$('#dialog_payMhtDtl').queryDialog({ width : 800, height : 400, fid: 'dialog_payMhtDtl_queryForm', 											
		flexigrid:{ url: 'payMchntDtlAccntQryDetail.action', width: 700, height: 300, dir : "desc", sort:"applyTime", usepager: true,
			colModel: [
			 { display: '序号', dataIndex: 'dtlNo', width: 80, align: 'center', sortable: true }
	       	,{ display: '开始日期', dataIndex: 'bgnSday', width: 80, align: 'center', sortable: true, render:fmtDate }
	   		,{ display: '结束日期', dataIndex: 'endSday', width: 80, align: 'center', sortable: true, render:fmtDate}
	   		,{ display: '服务商编号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
	   		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
	   		,{ display: '商户名称', dataIndex: 'merName', width: 80, align: 'center', sortable: true }
	   		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '费率', dataIndex: 'applyFeeRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
	   		,{ display: '手续费', dataIndex: 'feeAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '清算金额', dataIndex: 'stlmAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '交易结算款', dataIndex: 'settleAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '风控调整款', dataIndex: 'riskAjAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '清算调整款', dataIndex: 'stlmAjAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '结算调整款', dataIndex: 'settleAjAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '应付金额', dataIndex: 'realAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '实付金额', dataIndex: 'bankRealAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
	   		,{ display: '账户类型', dataIndex: 'accntTypeDesc', width: 80, align: 'center', sortable: true }
	   		,{ display: '行号', dataIndex: 'bankNo', width: 80, align: 'center', sortable: true }
	   		,{ display: '账户名称', dataIndex: 'accntName', width: 80, align: 'center', sortable: true }
	   		,{ display: '账号', dataIndex: 'accntNo', width: 80, align: 'center', sortable: true }
	   		,{ display: '支行名', dataIndex: 'bankName', width: 80, align: 'center', sortable: true }
	   		,{ display: '持卡人证件号', dataIndex: 'cardPersonNo', width: 80, align: 'center', sortable: true }
	   		,{ display: '总行名', dataIndex: 'bankTitleDesc', width: 80, align: 'center', sortable: true }
	   		,{ display: '出账用户', dataIndex: 'applyUser', width: 80, align: 'center', sortable: true }
	   		,{ display: '出账时间', dataIndex: 'applyTime', width: 80, align: 'center', sortable: true, render:fmtTime }
	   		,{ display: '出账状态', dataIndex: 'applyStateDesc', width: 80, align: 'center', sortable: true }		           
			]
		}
	});
	$('#ap_dtlNo').click(function(){							
		$('#dialog_payMhtDtl').dialog("option","title","商户付款信息");
		$('#dialog_payMhtDtl').queryDialogOpen({success:function(data){
			if( data ){
				$('#ap_dtlNo').val(data.dtlNo); 
				$('#ap_reqSeqNo').val(data.reqSeqNo); 
				$('#ap_mhtApplyTime').val(frmTime(data.applyTime)); 
				$('#ap_mhtApplyUser').val(data.applyUser);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});
});
//-->
</script>
</body>