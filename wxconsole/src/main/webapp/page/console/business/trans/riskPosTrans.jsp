<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>风险交易预警查询</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style>
.fcontent input,.fcontent select,.fcontent textarea{width: 200px;}
</style>
</head>

<body>
	<div id="queryCondition">
		<form id="queryForm" name="queryForm" action="#" method="post">
			<ul class="qry-ul">
				<li><label>起始日期</label><input  id="pospStmtStart" name="pospStmt" type="text" xtype="date" comparison="ge" /></li>
				<li><label>结束日期</label><input  id="pospStmtEnd" name="pospStmt" type="text" xtype="date" comparison="le" /></li>
				<li><label>商户</label><input id="qmid" name="mid" comparison="like" /></li>
				<li><label>终端号</label><input id="qtid" name="tid" comparison="like" /></li>
				<li><label>中心交易流水</label><input id="q_transSeq" name="transSeq" type="text" comparison="like" /></li>
				<li><label>终端交易流水</label><input id="tidSeq" name="tidSeq" type="text" qtype="string" comparison="like" /></li>
				<li><label>贷记交易金额大于等于(元)</label><input id="q_creditTransAmt" name="creditTransAmt" xtype="money" comparison="ge" value="50000"/></li>
				<li><label>借记交易金额大于等于(元)</label><input id="q_debitTransAmt" name="debitTransAmt" xtype="money" comparison="ge" value="100000"/></li>
				<li><label>自动刷新间隔</label><select id="reloadIntervalField">
							<option value="-9999" selected="selected">不刷新</option>
							<option value="5000" >5秒</option>
							<option value="10000" >10秒</option>
							<option value="15000" >15秒</option>
							<option value="30000" >30秒</option>
							<option value="60000" >60秒</option>
						</select></li>
				<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
				<li><input value="重置" class='bt' type="reset" /></li>
			</ul>
		</form>
	</div>
	<div id="table"></div>
	<!-- 上级机构选择弹出窗口 -->
	<div id="merchantSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" name="merName" comparison="like" qtype="string" /></td>
					<td class="qlabel">商户代码</td>
					<td class="qinput"><input type="text" name="orgCode" comparison="like" qtype="string" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff">
						<input type="button" class="bt qbutton" id="querysup" value="查询" /> 
						<input type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="posTransDetail" style=display:none;">
		<form id="form2">
			<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td class="flabel">中心交易时间：</td>
						<td class="fcontent"><INPUT id="transTimeDesc" name="transTimeDesc"></td>
						<td class="flabel">本系统清算日：</td>
						<td class="fcontent"><INPUT id="pospStmtDesc" name="pospStmtDesc">
						</td>
					</tr>
					<tr>
						<td class="flabel">消息类型(请求)：</td>
						<td class="fcontent"><INPUT id="msgType" name="msgType">
						</td>
						<td class="flabel">消息类型(应答)：</td>
						<td class="fcontent"><INPUT id="msgTypeResp" name="msgTypeResp">
						</td>
					</tr>
					<tr>
						<td class="flabel">主帐号：</td>
						<td class="fcontent"><INPUT id="pan" name="pan">
						</td>
						<td class="flabel">发卡行：</td>
						<td class="fcontent"><INPUT id="issuerName" name="issuerName">
						</td>
					</tr>
					<tr>
						<td class="flabel">交易处理码：</td>
						<td class="fcontent"><INPUT id="procCode" name="procCode">
						</td>
						<td class="flabel">交易金额(元)：</td>
						<td class="fcontent"><INPUT id="transAmtDesc" name="transAmtDesc"></td>
					</tr>
					<tr>
						<td class="flabel">应答交易金额：</td>
						<td class="fcontent"><INPUT id="transAmtRepDesc" name="transAmtRepDesc"></td>
						<td class="flabel">终端交易流水号：</td>
						<td class="fcontent"><INPUT id="tidSeq" name="tidSeq">
						</td>
					</tr>
					<tr>
						<td class="flabel">终端交易时间：</td>
						<td class="fcontent"><INPUT id="tidTransTimeDesc" name="tidTransTimeDesc"></td>
						<td class="flabel">终端交易日期：</td>
						<td class="fcontent"><INPUT id="tidTransDateDesc" name="tidTransDateDesc"></td>
					</tr>
					<tr>
						<td class="flabel">中心交易清算日：</td>
						<td class="fcontent"><INPUT id="stlmDateDesc" name="stlmDateDesc">
						</td>
						<td class="flabel">服务点输入方式码：</td>
						<td class="fcontent"><INPUT id="pointEntryCode" name="pointEntryCode">
						</td>
					</tr>
					<tr>
						<td class="flabel">卡序列号：</td>
						<td class="fcontent"><INPUT id="cardSeqNum" name="cardSeqNum">
						</td>
						<td class="flabel">服务点条件码：</td>
						<td class="fcontent"><INPUT id="pointCondCode" name="pointCondCode"></td>
					</tr>
					<tr>
						<td class="flabel">服务点PIN获取码：</td>
						<td class="fcontent"><INPUT id="pinCaptureCode" name="pinCaptureCode">
						</td>
						<td class="flabel">受理方标识码：</td>
						<td class="fcontent"><INPUT id="acquireInstitCode" name="acquireInstitCode">
						</td>
					</tr>
					<tr>
						<td class="flabel">银行受理方标识码：</td>
						<td class="fcontent"><INPUT id="respAcquireInstitCode" name="respAcquireInstitCode">
						</td>
						<td class="flabel">中心交易流水：</td>
						<td class="fcontent"><INPUT id="transSeq" name="transSeq">
						</td>
					</tr>
					<tr>
						<td class="flabel">请求参考号：</td>
						<td class="fcontent"><INPUT id="askReference" name="askReference">
						</td>
						<td class="flabel">授权标识应答码：</td>
						<td class="fcontent"><INPUT id="authRespCode" name="authRespCode"></td>
					</tr>
					<tr>
						<td class="flabel">请求时应答码：</td>
						<td class="fcontent"><INPUT id="askRespCode" name="askRespCode">
						</td>
						<td class="flabel">应答码：</td>
						<td class="fcontent"><INPUT id="respCode" name="respCodeZh">
						</td>
					</tr>
					<tr>
						<td class="flabel">本地应答码：</td>
						<td class="fcontent"><INPUT id="respCodeLocal" name="respCodeLocal">
						</td>
						<td class="flabel">本地应答信息：</td>
						<td class="fcontent"><INPUT id="respCodeLocalZh" name="respCodeLocalZh" />
						</td>
					</tr>
					<tr>
						<td class="flabel">终端标识号：</td>
						<td class="fcontent"><INPUT id="tid" name="tid">
						</td>
						<td class="flabel">商户号：</td>
						<td class="fcontent"><INPUT id="mid" name="mid">
						</td>
					</tr>
					<tr>
						<td class="flabel">商户名称：</td>
						<td class="fcontent"><textarea id="merName" name="merName"></textarea></td>
						<td class="flabel">银行端商户号：</td>
						<td class="fcontent"><INPUT id="respMid" name="respMid">
						</td>
					</tr>
					<tr>
						<td class="flabel">接收/收单机构标识：</td>
						<td class="fcontent"><INPUT id="acqId" name="acqId">
						</td>
						<td class="flabel">货币代码：</td>
						<td class="fcontent"><INPUT id="amtCode" name="amtCodeZh"></td>
					</tr>
					<tr>
						<td class="flabel">安全控制信息：</td>
						<td class="fcontent"><INPUT id="secInfo" name="secInfo">
						</td>
						<td class="flabel">交易类型码：</td>
						<td class="fcontent"><INPUT id="txnTypeCode" name="txnTypeCodeZh">
						</td>
					</tr>
					<tr>
						<td class="flabel">批次号：</td>
						<td class="fcontent"><INPUT id="batchNo" name="batchNo">
						</td>
						<td class="flabel">原始交易批次号：</td>
						<td class="fcontent"><INPUT id="oriBatchNo" name="oriBatchNo">
						</td>
					</tr>
					<tr>
						<td class="flabel">原始交易POS流水：</td>
						<td class="fcontent"><INPUT id="oriTidSeq" name="oriTidSeq">
						</td>
						<td class="flabel">原始交易日期：</td>
						<td class="fcontent"><INPUT id="oriTidTransDate" name="oriTidTransDate">
						</td>
					</tr>
					<tr>
						<td class="flabel">原中心交易流水号：</td>
						<td class="fcontent"><INPUT id="oriTransSeq" name="oriTransSeq">
						</td>
						<td class="flabel">国际信用卡公司代码：</td>
						<td class="fcontent"><INPUT id="creditOrgCode" name="creditOrgCode">
						</td>
					</tr>
					<tr>
						<td class="flabel">报文原因码：</td>
						<td class="fcontent"><INPUT id="messageReasonCode" name="messageReasonCode"></td>
						<td class="flabel">特殊计费类型：</td>
						<td class="fcontent"><INPUT id="sepcialchargeType" name="sepcialchargeType">
						</td>
					</tr>
					<tr>
						<td class="flabel">特殊计费级别：</td>
						<td class="fcontent"><INPUT id="sepcialchargeLevel" name="sepcialchargeLevel">
						</td>
						<td class="flabel">位商户扣率，值为扣率*10000：</td>
						<td class="fcontent"><INPUT id="busiDeductionRate" name="busiDeductionRate">
						</td>
					</tr>
					<tr>
						<td class="flabel">中心交易类型：</td>
						<td class="fcontent"><INPUT id="transCodeZh" name="transCodeZh">
						</td>
						<td class="flabel">交易状态：</td>
						<td class="fcontent"><INPUT id="transStZh" name="transStZh">
						</td>
					</tr>
					<tr>
						<td class="flabel">冲正标志：</td>
						<td class="fcontent"><INPUT id="rollbackFlagZh" name="rollbackFlagZh">
						</td>
						<td class="flabel">撤销标志：</td>
						<td class="fcontent"><INPUT id="cancelFlagZh" name="cancelFlagZh">
						</td>
					</tr>
					<tr>
						<td class="flabel">清算标志：</td>
						<td class="fcontent"><INPUT id="settleFlagZh" name="settleFlagZh">
						</td>
						<td class="flabel">退款类型：</td>
						<td class="fcontent"><INPUT id="backTypeDesc" name="backTypeDesc">
						</td>
					</tr>
					<tr>
						<td class="flabel">退款数额：</td>
						<td class="fcontent"><INPUT id="backAmtType" name="backAmtType">
						</td>
						<td class="flabel">已退款金额：</td>
						<td class="fcontent"><INPUT id="backAmtDesc" name="backAmtDesc">
						</td>
					</tr>
					<tr>
						<td class="flabel">退货状态：</td>
						<td class="fcontent"><INPUT id="backStat" name="backStat"></td>
						<td class="flabel">退货原因：</td>
						<td class="fcontent"><INPUT id="backReason" name="backReason">
						</td>
					</tr>
					<tr>
						<td class="flabel">路由规则号：</td>
						<td class="fcontent"><INPUT id="routeId" name="routeId">
						</td>
						<td class="flabel">转发支付机构号：</td>
						<td class="fcontent"><INPUT id="transferPayorg" name="transferPayorg">
						</td>
					</tr>
					<tr>
						<td class="flabel">RSV1：</td>
						<td class="fcontent"><INPUT id="rsv1" name="rsv1"></td>
						<td class="flabel">RSV2：</td>
						<td class="fcontent"><INPUT id="rsv2" name="rsv2">
						</td>
					</tr>
					<tr>
						<td class="flabel">RSV3：</td>
						<td class="fcontent"><INPUT id="rsv3" name="rsv3">
						</td>
						<td class="flabel">RSV4：</td>
						<td class="fcontent"><INPUT id="rsv4" name="rsv4">
						</td>
					</tr>
				</tbody>
			</table>
			<input id="formreset" style="display: none;" type="reset" />
		</form>
	</div>
<script>
var reloadTimer = false;
var reloadGrid = function() { $('#queryBtn').click(); };
var reloadIntervalEvent = function( newInterval ) {
	if (reloadTimer) clearInterval(reloadTimer);
	if ( newInterval && newInterval > 0 ) {
		reloadTimer = setInterval("reloadGrid()", newInterval);
	} else {
		if (reloadTimer) clearInterval(reloadTimer);
	}
};

$(document).ready(function() {
$('#merchantSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllMerchant.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				colModel : [ {
					display : '商户代码',
					width : 200,
					dataIndex : 'orgCode',
					align : 'center',
					sortable:true
				}, {
					display : '商户名称',
					width : 300,
					dataIndex : 'merName',
					align : 'center'
				}]
			}
});

//上级选择机构按钮
$('#qmid').click(function(){
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#qmid').val(data.orgCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});

$('#posTransDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});					

var  viewPosTransDetail = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2').fillObject({obj:record});
	$('#form2 :input').attr('disabled','disabled');
	$('#posTransDetail').dialog("option","title","详细信息");
	$('#posTransDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#posTransDetail').dialog('open');
};

var disableTid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	if (!confirm('是否停用该交易的终端?')) {
		return;
	}
	var obj = new Object();
	obj.tid = record.tid;
	$.ajax({url:'doDisableTid.action',data:{jsonObject:$.toJSON(obj)}
		,dataType : 'json'
		,success:function(data) {
			if (data.success) {
				alert('操作成功');
				$('#queryBtn').click();
			} else {
				alert('停用终端失败 原因是'+ data.syserr);
			}
		}
	});
};

$('#table').flexigrid({ 
	url : 'findRiskPosTrans.action', dir : "desc", sort : "transSeq", usepager : true, dbClickRecord: viewPosTransDetail,
	buttons : [
		 {name: "详细信息", bclass: 'grid_excel', id: 'cel', onpress: viewPosTransDetail },{separator: true }
		,{name: "停用终端", bclass: 'grid_excel', id: 'cel', onpress: disableTid },{separator: true }
		,{name: "导出", bclass: 'grid_excel' , id: 'cel', onpress: function() {$('#table').flexFile('findRiskPosTransExcel.action'); } },{separator: true }
	],
	colModel : [
		 { display: '中心交易流水', dataIndex: 'transSeq', align: 'center', sortable:true }
		,{ display: '终端交易流水', dataIndex: 'tidSeq', align: 'center' }
		,{ display: '本系统清算日', dataIndex: 'pospStmt', sortable:true, render: fmtDate }
		,{ display: '中心交易时间', dataIndex: 'transTime', sortable:true, render: fmtTime }
		,{ display: '中心交易类型', dataIndex: 'transCodeZh', align: 'center' }
		,{ display: '交易金额(元)', dataIndex: 'transAmtDesc', sortable:true }
		,{ display: '结算类型', dataIndex: 'stlmAcctSettleTypeDesc', sortable:true }
		,{ display: '商户号', dataIndex: 'mid', sortable:true }
		,{ display: '商户名称', dataIndex: 'merName', sortable:true }
		,{ display: '终端号', dataIndex: 'tid', align: 'center' }
		,{ display: '终端状态', dataIndex: 'tidStatusDesc', align: 'center' }
		,{ display: '主帐号', dataIndex: 'pan', align: 'center' }
		,{ display: '发卡行', dataIndex: 'issuerName', align: 'center' }
		,{ display: '撤销标志', dataIndex: 'cancelFlagZh', align: 'center' }
		]
	});
	$('.bt').button();
	$.jyform.components();	
	$('#posTransDetail').fullScreen();
	$('#queryBtn').click(function(){ 
		var camt = $('#q_creditTransAmt').val();
		var damt = $('#q_debitTransAmt').val();
		$('#q_creditTransAmt').val(camt*100);
		$('#q_debitTransAmt').val(damt*100);
		$.queryTable({ formId : 'queryForm', tableId : 'table' }); 
		$('#q_creditTransAmt').val(camt);
		$('#q_debitTransAmt').val(damt);
		//wxb
		var startTime=$("#pospStmtStart").val();
		var endTime=$("#pospStmtEnd").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能晚于结束日期！");
				return false;
			}
		}
	});
	// Set Table Reload Interval. 
	$('#reloadIntervalField').change(function(){reloadIntervalEvent($('#reloadIntervalField').val());});
	reloadIntervalEvent($('#reloadIntervalField').val());
});
</script>
</body>
</html>