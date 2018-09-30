<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>批量修改-间联终端</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>
<style type="text/css">
.fcontent input,.fcontent select,.fcontent textarea{width: 200px;}
table caption { text-align: left; font-size: 14px; padding: 5px 0;}
</style>
</head>
<body>
<!-- 查询条件 -->
<div id="queryCondition">
	<form id="queryForm" name="queryForm" action="#" method="post">
		<ul class="qry-ul" >
			<li><label>起始时间</label><input  id="q_bgnSday" name="confTime" type="text" xtype="datetime" qtype="string" comparison="ge" /></li>
			<li><label>结束时间</label><input  id="q_endSday" name="confTime" type="text" xtype="datetime" qtype="string" comparison="le" /></li>
			<li><label>SN号</label><input  id="q_terSerial" name="terSerial" type="text" qtype="string" comparison="eq" /></li>
            <li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 
<style>
#table{width:100%;}
.hDivBox{width:100%;}
.itable{width:100%;}


.ihead tr th:nth-of-type(1){width:300px}
.ihead tr th:nth-of-type(2){width:120px}
.ihead tr th:nth-of-type(3){width:120px}
.ihead tr th:nth-of-type(4){width:120px}
.ihead tr th:nth-of-type(5){width:120px}
.ihead tr th:nth-of-type(6){width:120px}
.ihead tr th:nth-of-type(7){width:120px}
.ihead tr th:nth-of-type(8){width:120px}

.cDrag div:
.cDrag div th:nth-of-type(1){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(2){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(3){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(4){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(5){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(6){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(7){style="display: block; left: 239px; height: 361px;"}
.cDrag div th:nth-of-type(8){style="display: block; left: 239px; height: 361px;"}

.ibody tr td:nth-of-type(1){width:300px}
.ibody tr td:nth-of-type(2){width:120px}
.ibody tr td:nth-of-type(3){width:120px}
.ibody tr td:nth-of-type(4){width:120px}
.ibody tr td:nth-of-type(5){width:120px}
.ibody tr td:nth-of-type(6){width:120px}
.ibody tr td:nth-of-type(7){width:120px}
.ibody tr td:nth-of-type(8){width:120px}
 
</style>
-->
<div id="table"></div>

<!-- 详情界面 -->
<div id="viewDiv" style="display: none;">
  	<form id="viewForm" action="#">
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
   			<tbody>
	   			<tr>
	   				<td class="flabel"> 商户号:</td>
	   				<td class="fcontent"> <input class="qFormInput"  readonly="readonly" id="mid" name="mid" type="text" maxlength="20" readonly="readonly"   readonly="readonly"=" readonly="readonly""/></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 收单机构代码:</td>
	   				<td class="fcontent"> <input class="qFormInput"  readonly="readonly" id="sysOrgCode" name="sysOrgCode" type="text" maxlength="100" /> </td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 受理终端状态:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terStat" name="terStat" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 受理终端编号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly"  id="tid" name="tid" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 受理终端类型:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly"  id="terType" name="terType" type="text" maxlength="100" /></td>
	   			</tr>
	   		    <tr>
	   				<td class="flabel">业务类型:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="busiType" name="busiType" type="text" maxlength="50" /></td>
	   			</tr>
	   			<tr>
	  				<td class="flabel">受理终端绑定电话号码:</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="terPhone" name="terPhone" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">受理终端布放地址:</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="terAddr" name="terAddr" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">受理终端布放实体店法人:</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="terPersonName" name="terPersonName" type="text" /></td>
	  			</tr>
	   			<tr>
	   				<td class="flabel"> 受理终端实体店营业名称:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terMerName" name="terMerName" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 支持业务的商户编码:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="busiMerNO" name="busiMerNO" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 受理机构代码:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="orgCode" name="orgCode" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 终端序列号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terSerial" name="terSerial" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 终端生产企业:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terMadeFacName" name="terMadeFacName" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 终端产品型号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terModel" name="terModel" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 终端布放时间:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terDeployTime" name="terDeployTime" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 终端通讯方式:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terCommType" name="terCommType" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 扫码功能:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terScanFunc" name="terScanFunc" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
    				<td class="flabel"> 磁条卡读取功能:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="terBarCardFunc" name="terBarCardFunc" type="text" maxlength="20" /></td>
    			</tr>
    			<tr>
    				<td class="flabel"> 接触式IC卡读取功能:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="terContactICFunc" name="terContactICFunc" type="text" maxlength="20" /></td>
    			</tr>
    			<tr>
    				<td class="flabel">非接IC卡读取功能:</td>
    				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="terNonContactICFunc" name="terNonContactICFunc" type="text" maxlength="100" /></td></tr>
	   			<tr>
	   				<td class="flabel"> 无卡支付功能:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terNoCardPayFunc" name="terNoCardPayFunc" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel">终端业务功能:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="terBusiFunc" name="terBusiFunc" type="text" maxlength="15" /></td>
	   			</tr>
			</tbody>
		</table> 
	</form>
 </div>

<script type="text/javascript">
var urls = {
	exportTerCSV:'exportTerApplyCSV.action',
	list:'findOutTerApplyChecked.action',
	nonstand:'findNonstandMerNoRegCode.action'
};
$(function() {
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : '100px', height : '350px'
	, title: '进件详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});	
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};

	var exportTerCsvFile = function() {
		var jsonFilter = $.perpareJsonFilter('queryForm');
		$.ajax({url : urls.list,dataType : 'json',type : 'POST',
			data : {jsonfilter : jsonFilter},
			success : function(data) {
				if (data.success) { 
/* 					if (data.totalProperty > 0) {
						var mids;
						$.each(data.root,function(i,n){
							if (i==0) {
								mids = n.merName;
							} else {
								mids += ',' + n.merName;
							}
						}); */
						//if (confirm('商户['+ mids +']的商户是非标商户且没有录入注册标识码,确认导出?') ) {
						//	$('#table').flexFile(urls.exportTerCSV);
						//}
					//} else {
                        $('#table').flexFile(urls.exportTerCSV);
					//}
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
			}});
	}

	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: '350px', sort : 'tid', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
			{name : "详细信息",bclass : 'grid_excel',id : 'cel',onpress : view},{separator : true}
		   ,{name : "导出已审核记录",bclass : 'grid_excel',id : 'cel',onpress : exportTerCsvFile}
		],
		colModel : [
			{display : '外部商户号',dataIndex : 'mid',align : 'center'} //, width : '350px'
		   ,{display : '商户名称',dataIndex : 'merName',sortable:true}
		   ,{display : '终端编号',dataIndex : 'tid',sortable:true }
		   ,{ display: 'SN号', dataIndex: 'terSerial', align: 'center'}
		   ,{ display: '终端生产企业', dataIndex: 'terMadeFacName', align: 'center'}
		   ,{ display: '终端产品型号', dataIndex: 'terModel', align: 'center'}
		   ,{ display: '终端布放时间', dataIndex : 'terDeployTime', align : 'center' }
		   ,{ display: '终端通讯方式', dataIndex : 'terCommType', align : 'center' }
		   ,{ display: '扫码功能', dataIndex : 'terScanFunc', align : 'center' }
		   ,{ display: '磁条卡读取功能', dataIndex : 'terBarCardFunc', align : 'center' }
		   ,{ display: '接触IC卡读取功能', dataIndex : 'terContactICFunc', align : 'center' }
		   ,{ display: '非接IC卡读取功能', dataIndex : 'terNonContactICFunc', align : 'center' }
		   ,{ display: '无卡支付功能', dataIndex : 'terNoCardPayFunc', align : 'center' }
		]
	});
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	//$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();	
	 
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		var startTime=$("#q_bgnSday").val();
		var endTime=$("#q_endSday").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能大于结束日期"); 
				return false;
			}
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	//$('#queryBtn').click();
});

</script>
</body>