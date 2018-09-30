<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 服务商选择弹出窗口 -->
<div id="dialog_sysCode" style="display: none;">
	<form id="dialog_sysCode_queryForm" name="queryForm" action="#" method="post">
		<input id="dialog_sysCode_codeType" type="hidden" name="codeType" comparison="like" qtype="string" />
		<ul class="qry-ul" class="qtable">
			<li><label id="dialog_sysCode_codeNo_label">参数编号</label><input id="dialog_sysCode_codeNo" name="codeNo" type="text" maxlength="15" qtype="string" comparison="like" /></li>
			<li><label id="dialog_sysCode_codeName_label">参数名称</label><input id="dialog_sysCode_codeName" name="codeName" type="text" maxlength="100" qtype="string" comparison="like" /></li>
			<li><input class='bt qbutton' id="dialog_channelCode_queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>	
</div>
<script>
/**  */
var sysCodeDialogBind = function(cid, callbackFunc, ctype, title, codeNoDesc, codeNameDesc, pager) {
	if (!ctype) {
		return;
	}
	$('#dialog_sysCode_codeType').val(ctype);
	if (!title) {
		title = '参数信息';
	}
	if (!codeNoDesc) {
		codeNoDesc = '编码';
	}
	if (!codeNameDesc) {
		codeNameDesc = '名称';
	}
	if (pager == false) {
		pager = false;
		limit = 20;
	} else {
		pager = true;
		limit = 1000;
	}
	$('#dialog_sysCode_codeName_label').html(codeNameDesc);
	$('#dialog_sysCode_codeNo_label').html(codeNoDesc);
	$('#dialog_sysCode').queryDialog({ width : 700, height : 400, fid: 'dialog_sysCode_queryForm', 											
		flexigrid:{ url: 'findCodePage.action', width: 650, height: 200, dir : "ASC", sort:"codeSort", usepager: pager,
			checkbox: true, list: true, limit:1000,
			colModel: [
			 { display: codeNoDesc, dataIndex: 'codeNo', width: 150, align: 'center', sortable: true }
			,{ display: codeNameDesc, dataIndex: 'codeName', width: 200, align: 'center', sortable: true }			           
			]
		}
	});
	$('#' + cid).click(function(){							
		$('#dialog_sysCode').dialog("option","title",title);
		$('#dialog_sysCode').queryDialogOpen({list: true,success:function(data){
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