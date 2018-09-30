<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 商户选择弹出窗口 -->
<div id="dialog_mid" style="display: none;">
	<form id="dialog_mid_queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul" class="qtable">
			<li><label>商户编码</label><input id="dialog_mid_mid" name="mid" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>商户名称</label><input id="dialog_mid_merName" name="merName" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_mid_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script>
$('#dialog_mid').queryDialog({ width : 700, height : 400, fid: 'dialog_mid_queryForm', 											
	flexigrid:{ url: 'findAllMerchant.action', width: 650, height: 150, dir : "ASC", sort:"mid", usepager: true,
		colModel: [
		 { display: '商户编码', dataIndex: 'mid', width: 150, align: 'center', sortable: true }
		,{ display: '商户名称', dataIndex: 'merName', width: 200, align: 'center', sortable: true }			           
		]
	}
});
/**  */
var midDialogBind = function(cid, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_mid').dialog("option","title","商户信息");
		$('#dialog_mid').queryDialogOpen({success:function(data){
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