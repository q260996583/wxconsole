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
					<td class="qlabel">机构号</td>
					<td class="qinput"><input type="text" value="" comparison="like"
						qtype="string" name=instId size=20 /></td>
					<td class="qlabel">机构商户号</td>
					<td class="qinput"><input type="text" value="" comparison="like"
						qtype="string" name=instMerId size=20 /></td>
				</tr>
				<tr>
					<td class="qlabel">商户手机号</td>
					<td class="qinput"><input type="text" value="" comparison="like" 
						qtype="string" name=merPhoneNo size=20 /></td>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" value="" comparison="like"
						qtype="string" name=merName size=20 /></td>
				</tr>
				<tr>
					<td></td>
					<td bgcolor="#ffffff" colspan="2" align="center"><input
						id="querybutton" class="bt" value="查询" type="button"> <input
						class="bt" value="重置" type="reset" /></td>
						<td></td>
				</tr>
			</table>
		</form>
	</div>
	<DIV id="table"></DIV>
	

	<div id="outMerDetail" class="detailDialog" style="display:none;">
		<form id="form2" >
		<div style="overflow-x: auto; overflow-y: auto; width:100%">
   		<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
   			<TBODY>
   				<tr>
	   				<td class="flabel"> 商户号:</td>
	   				<td class="fcontent"> <input class="qFormInput" disabled id="merid" name="merid" type="text" maxlength="20" readonly="readonly"  disabled="disabled"/></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 微信名称:</td>
	   				<td class="fcontent"> <input class="qFormInput" disabled id="form2NickName" name="nickName" type="text" maxlength="20" readonly="readonly"  disabled="disabled"/></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 积分:</td>
	   				<td class="fcontent"> <input class="qFormInput" disabled id="amt" xtype="money"
	   					name="amt" type="text" maxlength="20" readonly="readonly"  disabled="disabled"/></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 积分增减:</td>
		   			<td class="fcontent">  <input class="qFormInput"  xtype="money" id="addAmt" name="addAmt" type="text" maxlength="300" ></input></td>
		  		</tr>
         </TBODY>
	  </table> 
               </div>              
           </form>
        <div style="overflow: auto; width:100%; background:#ffffff">
        	<div id="outMerTidDetail" ></div>
        </div>
	</div>
<!-- 商户附件 -->
<div id="mhtAttachInfoAddDialog" class="detailDialog" style="display:none;">
	<table id="mhtAttachInfoAddTable" class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th width="80%">名称</th>
				<th>查看</th>
			</tr>
		</thead>
		<tbody id="mhtAttachInfoAddTbody">
		</tbody>
	</table>
</div>
<script type="text/javascript">
//<!--

$(document).ready(function() {

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

//撤回公告
var dropLotteryMerchant = function(record,id){
	if(!record){ alert('请选择一条记录'); return false; }
	record.nickName = '';
	if(confirm('确认删除此用户吗？')){
		$.ajax({url:'dropLotteryMerchant.action', data:{jsonObject:$.toJSON(record)}, dataType:'json',
			success:function(data){
				if(data.success){
					alert('删除成功');
					$('#table').refresh();
				} else{
					alert('删除失败 失败原因是'+data.syserr);
				}												
			}
		});
	}
};

$('#table').flexigrid({url : 'findLotterMerInfo.action', 
	dbClickRecord : viewOutMerDetail,
	width : 400, dir : "desc", sort : "orgCode", usepager : true,	
buttons: [
{name : "详细信息", bclass : 'page_excel', id : 'cel', onpress : viewOutMerDetail }
,{name : "删除", bclass : 'page_excel', id : 'cel', onpress : dropLotteryMerchant }
,{separator : true }
],
colModel:[ 
          { display: '商户号', dataIndex : 'merid', align : 'center', sortable:true }
          ,{ display: '微信名称', dataIndex : 'nickName', align : 'center' , sortable:true}
          ,{ display: '积分', dataIndex : 'amt', align : 'center' , sortable:true, render:fmtMoney}
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