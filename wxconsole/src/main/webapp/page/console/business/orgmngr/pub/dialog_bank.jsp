<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 银行选择弹出窗口 -->
<div id="dialog_bank" style="display: none;">
	<form id="dialog_bank_queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul">
			<li><label>银行行号</label><input id="dialog_bank_unionBankNo" name="unionBankNo" type="text" maxlength="60" qtype="string" comparison="like" /></li>
			<li><label>上级行号</label><input id="dialog_bank_parentBankNo" name="parentBankNo" type="text" qtype="string" comparison="like" /></li>
			<li><label>银行名称</label><input id="dialog_bank_bankName" name="bankName" type="text" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_bank_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<script type="text/javascript">
var bankDialogCallback = false ;
$('#dialog_bank').queryDialog({ width : 700, height : 600, fid: 'dialog_bank_queryForm', 											
	flexigrid:{ url: 'branchBankComobo.action', width: 650, height: 150, dir : "ASC", sort:"unionBankNo", usepager: true
		, dbClickRecord: function(rec,id) { bankDialogCallback(rec,id); }
		, colModel: [
		  { display : '联行号', dataIndex : 'unionBankNo', width : 120, align : 'center', sortable:true }
		 ,{ display : '上级行号', dataIndex : 'parentBankNo', width : 80, align : 'center', sortable:true }
		 ,{ display : '名称', dataIndex : 'bankName', width : 120, align : 'center', sortable:true }
		 ,{ display : '地址', dataIndex : 'address', width : 150, align : 'center', sortable:true }         
		]
	}
});
/**  */
var bankDialogBind = function(cid, preFunc, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_bank').dialog("option","title","开户行选择");
		if ( preFunc ) preFunc();
		$('#dialog_bank').queryDialogOpen({success:function(data){
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