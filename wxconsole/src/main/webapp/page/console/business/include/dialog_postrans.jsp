<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 交易选择弹出窗口 -->
<div id="dialog_postrans" style="display: none;">
	<form id="dialog_postrans_queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul" class="qtable">
			<li><label>中心流水号</label><input id="dialog_postrans_transSeq" name="transSeq" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>清算日期</label><input id="dialog_postrans_stlmDate" name="pospStmt" xtype="date" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><label>交易状态</label><select id="dialog_postrans_transSt" name="transSt" ctype="TRANS_ST" multiple="multiple" comparison="eq" ></select></li>
			<li><input class='bt qbutton' id="dialog_postrans_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script>
$('#dialog_postrans').queryDialog({ width : 1000, height : 600, fid: 'dialog_postrans_queryForm', 											
	flexigrid:{ url: 'findPosTrans.action', width: 950, height: 450, dir : "ASC", sort:"mid", usepager: true,
		colModel: [
		 { display: '中心交易流水', dataIndex: 'transSeq', align: 'center', sortable:true }
		,{ display: '终端交易流水', dataIndex: 'tidSeq', align: 'center' }
		,{ display: '本系统清算日', dataIndex: 'pospStmt', sortable:true, render: fmtDate }
		,{ display: '中心交易时间', dataIndex: 'transTime', sortable:true, render: fmtTime }
		,{ display: '中心交易类型', dataIndex: 'transCodeZh', align: 'center' }
		,{ display: '交易金额(元)', dataIndex: 'transAmtDesc', sortable:true }
		,{ display: '商户名称', dataIndex: 'merName', sortable:true }
		,{ display: '终端号', dataIndex: 'tid', align: 'center' }
		,{ display: '主帐号', dataIndex: 'pan', align: 'center' }
		,{ display: '交易状态', dataIndex: 'transStZh', align: 'center' }
		,{ display: '本地应答信息', dataIndex: 'respCodeLocalZh', align: 'center', render: function(row, value) { if ( row.respCodeLocal != '00' ) { return '<font style="color:red;">' + value + '</font>'; } return value; } }
		,{ display: '数字签名', dataIndex: 'signsZh', align: 'center' }
		,{ display: '冲正标志', dataIndex: 'rollbackFlagZh', align: 'center' }
		,{ display: '撤销标志', dataIndex: 'cancelFlagZh', align: 'center' }
		,{ display: '借贷标记', dataIndex: 'debitCreditFlagDesc', align: 'center' }
		,{ display: '退货类型', dataIndex: 'backTypeDesc', align: 'center' }			           
		]
	}
});
/**  */
var postransDialogBind = function(cid, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_postrans').dialog("option","title","交易信息");
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