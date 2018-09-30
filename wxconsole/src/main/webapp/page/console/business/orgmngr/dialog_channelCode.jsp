<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 服务商选择弹出窗口 -->
<div id="dialog_channelCode" style="display: none;">
	<form id="dialog_channelCode_queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul" class="qtable">
			<li><label>服务商编码</label><input id="dialog_channelCode_channelCode" name="channelCode" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label>服务商名称</label><input id="dialog_channelCode_channelName" name="channelName" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_channelCode_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script>
$('#dialog_channelCode').queryDialog({ width : 700, height : 400, fid: 'dialog_channelCode_queryForm', 											
	flexigrid:{ url: 'findAllChannel.action', width: 650, height: 150, dir : "ASC", sort:"channelCode", usepager: true,
		colModel: [
		 { display: '编码', dataIndex: 'channelCode', width: 150, align: 'center', sortable: true }
		,{ display: '名称', dataIndex: 'channelName', width: 200, align: 'center', sortable: true }			           
		]
	}
});
/**  */
var channelCodeDialogBind = function(cid, callbackFunc) {
	$('#' + cid).click(function(){							
		$('#dialog_channelCode').dialog("option","title","服务商信息");
		$('#dialog_channelCode').queryDialogOpen({success:function(data){
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