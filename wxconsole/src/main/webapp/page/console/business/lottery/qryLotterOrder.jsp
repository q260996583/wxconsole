<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>彩票商户管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<style>
.flabel{width:20%}
.qFormInput{width:80%}
</style>
</head>
<body>

	<div id="queryCondition"
		style="background-color: #FBFEFF; padding: 5px;">
		<form id="queryForm" name="queryForm" action="#" method="post"
			style="padding: 0px; margin: 0px;">
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">
				<tr>
					<td class="qlabel">商户号</td>
					<td class="qinput"><input type="text" value="" comparison="like"
						qtype="string" name='merid' size=20 /></td>
					<td class="qlabel">微信名称</td>
					<td class="qinput"><input type="text" value="" comparison="like"
						qtype="string" name='nickname' size=20 /></td>
					<td class="qlabel">彩票类型</td>
					<td class="qinput"><select id="qryLtteryType" comparison="eq"
						name="lotteryType"></select></td>
				</tr>
				<tr>
					<td class="qlabel">彩票编号</td>
					<td class="qinput"><input type="text" value="" comparison="eq"
						qtype="string" name='lotteryId' size=20 /></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
					<td class="qlabel"></td>
					<td class="qinput"></td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" colspan="6" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>
<script type="text/javascript">
//<!--

$(document).ready(function() {
$('#qryLtteryType').ajaxSelect({url:'findSecCodeList.action?codeType=LOTTERY_TYPE',displayField:'codeName',valueField:'codeNo',blank:true});
	
$('#outMerDetail').dialog({	autoOpen: false,	bgiframe: true,	modal: true,	resizable: false,	draggable: false,	width: 800,	height: 500
	,title: '详细信息' , buttons: {
		'增减': function(){									
			if (confirm("确认变更积分吗？")) {
				$('#form2NickName').val('');//不传微信名，常常有特殊符号！
				$.ajaxForm({formId : 'form2', url : "doUpdateLotterMerAmt.action",
					success : function(data) {
						if (data.success) {
							$('#outMerDetail').dialog('close');
							$('#table').refresh();
							alert('操作成功');
						} else {
							alert('操作失败 原因是' + data.syserr);
						}
					}
				});
			} else {
				return false;
			}									
		}
	,'关闭' : function() {$(this).dialog('close');}	
}});

var  viewOutMerDetail = function(record,id) {
	if (!record) { alert("请选择一条记录"); return; }
	$('#form2').fillObject({obj:record});
	$('#outMerDetail').dialog('open');
};

$('#table').flexigrid({url : 'selectLotteryOrderInfo.action', 
	dbClickRecord : viewOutMerDetail,
	width : 400, dir : "desc", sort : "id", usepager : true,	
		buttons: [
		{name : "详细信息", bclass : 'page_excel', id : 'cel', onpress : viewOutMerDetail },
			{separator : true }
		],
		colModel:[ 
		   { display: '编号', dataIndex : 'id', align : 'center', sortable:true }
          ,{ display: '彩票编号', dataIndex : 'lotteryId', align : 'center', sortable:true }
          ,{ display: '开奖号', dataIndex : 'lotteryResult', align : 'center', sortable:true }
          ,{ display: '彩票类型', dataIndex : 'lotteryType', align : 'center' , sortable:true}
          ,{ display: '商户ID', dataIndex : 'merid', align : 'center' , sortable:true}
          ,{ display: '订单状态', dataIndex : 'statusDesc', align : 'center' , sortable:true}
          ,{ display: '下单日期', dataIndex : 'systemTime', align : 'center' , sortable:true}
          ,{ display: '下单代码', dataIndex : 'lotteryCode', align : 'center' , sortable:true}
          ,{ display: '微信名', dataIndex : 'nickname', align : 'center' , sortable:true}
          ,{ display: '返分', dataIndex : 'winAmt', align : 'center' , sortable:true, render:fmtMoney}
          ,{ display: '交易分', dataIndex : 'transAmt', align : 'center' , sortable:true, render:fmtMoney}
         ]
});
		
	
$('#querybutton').click(function(){$.queryTable({ formId: 'queryForm', tableId : 'table' }); });						
//初始化查询;
$('#querybutton').trigger('click');

loadAthDef();
bindAthEvent();
});
//-->
</script>
</body>
</html>