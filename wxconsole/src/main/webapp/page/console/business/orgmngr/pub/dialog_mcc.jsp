<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- MCC选择窗口 -->
<div id="dialog_mcc" style="display: none;">
	<form id="dialog_mcc_queryForm" name="queryForm" action="#" method="post">
		<input id="dialog_mcc_mccGrp" name="mccGrp" type="hidden" qtype="string" comparison="eq" />
		<ul class="qry-ul" class="qtable">
			<li><label>MCC</label><input id="dialog_mcc_mcc" name="mcc" type="text" maxlength="4" qtype="string" comparison="like" /></li>
			<li><label>描述</label><input id="dialog_mcc_mccDesc" name="mccDesc" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_mcc_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script type="text/javascript">
var mccDialogCallback = false ;
$('#dialog_mcc').queryDialog({ width : 700, height : 400, fid: 'dialog_mcc_queryForm', 											
	flexigrid:{ url: 'findCoreMccRatePage.action', width: 650, height: 150, dir : "ASC", sort:"mcc", usepager: true
		, dbClickRecord: function(rec,id) { mccDialogCallback(rec,id); }
		, colModel: [
		 { display: 'MCC', dataIndex: 'mcc', width: 120, align: 'center', sortable: true }
		,{ display: '描述', dataIndex: 'mccDesc', width: 300, align: 'center', sortable: true }			           
		//,{ display: '费率(%)', dataIndex: 'rate', width: 100, align: 'center', sortable: true, render: fmtRate3 }			           
		// ,{ display: '封顶费(元)', dataIndex: 'maxFee', width: 100, align: 'center', sortable: true, render: fmtMoney }			           
		]
	}
});
/**  */
var mccDialogBind = function(cid, preFunc, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_mcc').dialog("option","title","MCC费率信息");
		if ( preFunc ) preFunc();
		$('#dialog_mcc').queryDialogOpen({success:function(data){
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