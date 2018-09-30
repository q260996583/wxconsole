<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 商户付款选择弹出窗口 -->
<div id="dialog_payMhtDtl" style="display: none;">
	<form id="dialog_payMhtDtl_queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul" class="qtable">
			<li><label>商户编码</label><input id="dialog_payMhtDtl_mid" name="mid" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>商户名称</label><input id="dialog_payMhtDtl_merName" name="merName" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_payMhtDtl_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script>
$('#dialog_payMhtDtl').queryDialog({ width : 1000, height : 600, fid: 'dialog_mid_queryForm', 											
	flexigrid:{ url: 'payMchntDtlAccntQryDetail.action', width: 650, height: 150, dir : "desc", sort:"applyTime", usepager: true,
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
/**  */
var payMhtDtlDialogBind = function(cid, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_payMhtDtl').dialog("option","title","商户付款信息");
		$('#dialog_payMhtDtl').queryDialogOpen({success:function(data){
			if( data ){
				callbackFunc(data);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});
};

</script>