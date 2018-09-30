<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 交易选择弹出窗口 -->
<div id="dialog_postrans" style="display: none;">
	<form id="dialog_postrans_queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul" class="qtable">
			<li><label>交易流水号</label><input id="dialog_postrans_transSeq" name="transSeq" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_postrans_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script>
$('#dialog_postrans').queryDialog({ width : 700, height : 400, fid: 'dialog_postrans_queryForm', 											
	flexigrid:{ url: 'salesSlipReviewTxnGrid.action', width: 650, height: 150, dir : "DESC", sort:"trans_seq", usepager: true, autoload:false, 
		colModel: [
		 { display: '清算日期', dataIndex: 'stlmDate', width: 80, align: 'center', sortable: true, render:fmtDate  }
		,{ display: '交易流水号', dataIndex: 'transSeq', width: 80, align: 'center', sortable: true }
		,{ display: '交易代码', dataIndex: 'transCode', width: 80, align: 'center', sortable: true }
		,{ display: '交易类型', dataIndex: 'transCodeDesc', width: 80, align: 'center', sortable: true }
		,{ display: '交易时间', dataIndex: 'transTime', width: 80, align: 'center', sortable: true, render:fmtTime }
		,{ display: '商户号', dataIndex: 'mid', width: 80, align: 'center', sortable: true }
		,{ display: '终端号', dataIndex: 'tid', width: 80, align: 'center', sortable: true }
		,{ display: '卡号', dataIndex: 'cardId', width: 80, align: 'center', sortable: true}
		,{ display: 'MCC', dataIndex: 'mcc', width: 80, align: 'center', sortable: true }
		,{ display: 'MCC扣率', dataIndex: 'mccRate', width: 80, align: 'center', sortable: true, render:fmtRate3 }
		,{ display: '交易金额', dataIndex: 'transAmt', width: 80, align: 'center', sortable: true, render:fmtMoney }
		,{ display: '服务商号', dataIndex: 'channelCode', width: 80, align: 'center', sortable: true }
		,{ display: '出账状态', dataIndex: 'mhtApplyStDesc', width: 80, align: 'center', sortable: true }
		]
	}
});
/**  */
var postransDialogBind = function(cid, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_postrans').dialog("option","title","交易记录");
		$('#dialog_postrans').queryDialogOpen({success:function(data){
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