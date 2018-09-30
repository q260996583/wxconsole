<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>银联报备文件导出</title>
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
		<ul class="qry-ul">
			<li><label>审核起始时间</label><input  id="q_bgnSday" name="approveDate" type="text" xtype="datetime" qtype="string" comparison="ge" /></li>
			<li><label>审核结束时间</label><input  id="q_endSday" name="approveDate" type="text" xtype="datetime" qtype="string" comparison="le" /></li>
			<li><input class='bt' id="queryBtn" value="查询" type="button"/></li>
			<li><input value="重置" class='bt' type="reset" /></li>
		</ul>
	</form>
</div>
<!-- 列表 -->
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
	   				<td class="flabel"> 商户名称:</td>
	   				<td class="fcontent"> <input class="qFormInput"  readonly="readonly" id="merName" name="merName" type="text" maxlength="100" /> </td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户对外经营名称:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="merOutName" name="merOutName" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户英文名称:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly"  id="enName" name="enName" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户对外英文名称:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly"  id="enOutName" name="enOutName" type="text" maxlength="100" /></td>
	   			</tr>
	   		    <tr>
	   				<td class="flabel">MCC:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="mcc" name="mcc" type="text" maxlength="50" /></td>
	   			</tr>
	   			<tr>
	  				<td class="flabel">商户类别(结算):</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="mccGrp" name="mccGrpDesc" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">商户类别(预期):</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="mccGrpImp" name="mccGrpImpDesc" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">进件类别备注:</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="mccRemark" name="mccRemark" type="text" /></td>
	  			</tr>
	   			<tr>
	   				<td class="flabel"> 地区代码:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="areaCodeZH" name="areaCodeZH" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 营业执照统一社会信用代码:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="licenseNo" name="licenseNo" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 营业执照有效期:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="bizLicnoExpireDate" name="bizLicnoExpireDate" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 营业执照注册地址:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="licenseAddr" name="licenseAddr" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 企业成立日期:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="merCreateDate" name="merCreateDate" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 月租金(元):</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="monthRent" name="monthRent" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 税务登记证号码:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="taxNO" name="taxNO" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 组织机构代码证:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="certNO" name="certNO" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 法人姓名:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="personName" name="personName" type="text" maxlength="30" /></td>
	   			</tr>
	   			<tr>
    				<td class="flabel"> 法人证件类型:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="personNoTypeDesc" name="personNoTypeDesc" type="text" maxlength="20" /></td>
    			</tr>
    			<tr>
    				<td class="flabel"> 法人证件号:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="personNO" name="personNO" type="text" maxlength="20" /></td>
    			</tr>
    			<tr>
    				<td class="flabel">法人证件有效期:</td>
    				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="personNoExpireDate" name="personNoExpireDate" type="text" maxlength="100" /></td></tr>
	   			<tr>
	   				<td class="flabel"> 营业开始时间:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="busiBgTime" name="busiBgtime" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 营业结束时间:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="busiEndtime" name="busiEndtime" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 营业面积(平方米):</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="area" name="area" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel">对公账号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="fftAccntZH" name="fftAccntZH" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel">商户账户类型:</td>
	   				<td class="fcontent"><select id="accntType" name="accntType" ctype="ACCNT_TYPE_SD" disabled="disabled"></select></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户账户名称:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="accntName" name="accntName" type="text" maxlength="60" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户账户号码:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="accntNO" name="accntNO" type="text" maxlength="60" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户开户行:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="accntBank" name="accntBank" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 一级服务商:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="firstTcnZH" name="firstTcnZH" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 二级服务商:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="secondTcnZH" name="secondTcnZH" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 标识:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="gradeFlag" name="gradeFlag" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 开户行行号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="bankBranchNO" name="bankBranchNO" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 开户人证件类型:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="cardPersonNoTypeDesc" name="cardPersonNoTypeDesc" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 开户人证件号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="cardPersonNO" name="cardPersonNO" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 开户人证件有效期:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="cardLicnoExpireDate" name="cardLicnoExpireDate" type="text" maxlength="30" /></td>
	   			</tr>
	   			
	   			<tr>
	   				<td class="flabel"> 手续费收取类型:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="feeType" name="feeTypeZh" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	  				<td class="flabel"> 借记手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="v_debitRate" name="debitRate" type="text" xtype="rate4" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 借记封顶费(元):</td>
	  				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="v_debitMaxFee" name="debitMaxFee" type="text" xtype="money" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel"> 贷记手续费率(%):</td>
	  				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="v_creditRate" name="creditRate" type="text" xtype="rate4" /></td>
	  			</tr>
	   			
	   			<!-- <tr>
	   				<td class="flabel"> 手续费率(%):</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="feeRate" name="feeRate" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 手续费固定值(元):</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="feeVal" name="feeVal" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 手续费封顶值(元):</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="topValue" name="topValue" type="text" maxlength="15" /></td>
	   			</tr> -->
	   			<tr>
	   				<td class="flabel"> 商户联系人:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="merContact" name="merContact" type="text" maxlength="60" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户联系电话:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="merPhone" name="merPhone" type="text" maxlength="50" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户营销人员姓名:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="merketPerson" name="merketPerson" type="text" maxlength="15" /></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel">开户银行网点号:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="accntBankNoPrivate" name="accntBankNoPrivate" type="text" maxlength="20" /></td>
	   			</tr>
	   			<!-- 调单联系人 -->
    			<tr>
    				<td class="flabel"> 调单联系人姓名:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="docTransferName" name="docTransferName" type="text" maxlength="100" /></td>
    			</tr>
    			<tr>
    				<td class="flabel"> 调单联系人电话:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="docTransferPhone" name="docTransferPhone" type="text" maxlength="100" /></td>
    			</tr>
    			<tr>
    				<td class="flabel">调单联系人邮箱:</td>
    				<td class="fcontent">  <input class="qFormInput" readonly="readonly" id="docTransferEmail" name="docTransferEmail" type="text" maxlength="100" /></td>
    			</tr>
   				<tr>
		   			<td class="flabel"> 备注:</td>
		   			<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="memo" name="memo" type="text" maxlength="200" /></td>
	   			</tr>
	   			<tr>
	    			<td class="flabel"> 商户信息录入时间:</td>
	    			<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="updDate" name="updDate" type="text" /></td>
	   			</tr>
	   			<tr>
	    			<td class="flabel"> 审批状态:</td>
	    			<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="statusZH" name="statusZH" type="text" maxlength="20" /></td>
	   			</tr>
	   		  <tr>
	    			<td class="flabel"> 业务审批人:</td>
	    			<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="admitAcc" name="admitAcc" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	    			<td class="flabel"> 业务审批意见:</td>
	    			<td class="fcontent">  <textarea class="qFormInput" readonly="readonly" id="admitMemo" name="admitMemo" type="text" maxlength="300" ></textarea></td>
	   			</tr>
	   			<tr>
	    			<td class="flabel"> 风控审批人:</td>
	    			<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="approveAcc" name="approveAcc" type="text" maxlength="20" /></td>
	   			</tr>
	   			<tr>
	    			<td class="flabel"> 风控审批意见:</td>
	    			<td class="fcontent">  <textarea class="qFormInput"  readonly="readonly" id="approveMemo" name="approveMemo" type="text" maxlength="300" ></textarea></td>
	   			</tr>
			</tbody>
		</table> 
	</form>
 </div>
 
 <!-- 修改注册标识码界面 -->
<div id="updDiv" style="display: none;">
  	<form id="updForm" action="#">
  		<input name="firstTcn" hidden="text"/>
		<table class="ftable" cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
   			<tbody>
   				<tr>
	   				<td class="flabel"> 内部商户号:</td>
	   				<td class="fcontent"> <input class="qFormInput"  readonly="readonly" id="u_orgCode" name="orgCode" type="text" maxlength="20" readonly="readonly"   readonly="readonly"=" readonly="readonly""/></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户号:</td>
	   				<td class="fcontent"> <input class="qFormInput"  readonly="readonly" id="u_mid" name="mid" type="text" maxlength="20" readonly="readonly"   readonly="readonly"=" readonly="readonly""/></td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户名称:</td>
	   				<td class="fcontent"> <input class="qFormInput"  readonly="readonly" id="u_merName" name="merName" type="text" maxlength="100" /> </td>
	   			</tr>
	   			<tr>
	   				<td class="flabel"> 商户对外经营名称:</td>
	   				<td class="fcontent">  <input class="qFormInput"  readonly="readonly" id="u_merOutName" name="merOutName" type="text" maxlength="100" /></td>
	   			</tr>
	   			<tr>
	  				<td class="flabel">商户类别(结算):</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="u_mccGrp" name="mccGrpDesc" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">商户类别(预期):</td>
	  				<td class="fcontent"><input class="qFormInput" readonly="readonly" id="u_mccGrpImp" name="mccGrpImpDesc" type="text" /></td>
	  			</tr>
	  			<tr>
	  				<td class="flabel">注册标识码:</td>
	  				<td class="fcontent"><input class="qFormInput" id="u_regSeqNo" name="regSeqNo" type="text" /></td>
	  			</tr>
			</tbody>
		</table> 
	</form>
 </div>
<script type="text/javascript">
var urls = {
	exportCSV:'exportMerApplyCSV.action',
	list:'findOutMerApplyChecked.action',
	updReg:'doUpdateRegSeqNo.action',
	nonstand:'findNonstandMerNoRegCode.action'
};
$(function() {
	
	// viewForm
	$('#viewDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '进件详情', buttons:{'关闭' : function() { $(this).dialog('close'); }
	}});	
	
	// viewForm
	$('#updDiv').dialog({ autoOpen : false, bgiframe : true, modal : true, resizable : false, draggable : true, width : 600, height : 350
	, title: '注册码更新', buttons:{'更新' : function(){
			$.ajaxForm({url:urls.updReg,formId : 'updForm'
			,success:function(data) {
				if (data.success) {
					$('#table').flexModifyData(data.root[0]);
					$('#updDiv').dialog('close');
					alert('操作成功');
				} else {
					alert('更新注册标识码失败 原因是'+ data.syserr);
				}
			}
		});
		},'关闭' : function() { $(this).dialog('close'); }
	}});	
	
	// VIEW
	var view = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		$.jyform.resetForm('viewForm');
		$.jyform.fillForm('viewForm', record);
		$('#viewDiv').dialog('open');
	};
	
	// UPD
	var upd = function(record,id) {
		if (!record) {alert("请选择一条记录"); return;}
		if (record.mccGrpImp == '1000') {
			alert('标准类商户无需录入注册标识码');
			return;
		}
		$.jyform.resetForm('updForm');
		$.jyform.fillForm('updForm', record);
		$('#updDiv').dialog('open');
	};
	
	var exportCsv = function() {
		var jsonFilter = $.perpareJsonFilter('queryForm');
		$.ajax({url : urls.nonstand,dataType : 'json',type : 'POST',
			data : {jsonfilter : jsonFilter},
			success : function(data) {
				if (data.success) { 
					if (data.totalProperty > 0) {
						var mids;
						$.each(data.root,function(i,n){
							if (i==0) {
								mids = n.merName;
							} else {
								mids += ',' + n.merName;
							}
						});
						if (confirm('商户['+ mids +']的商户是非标商户且没有录入注册标识码,确认导出?') ) {
							$('#table').flexFile(urls.exportCSV);
						}
					} else {
						$('#table').flexFile(urls.exportCSV);
					}
				} else { 
					alert('操作失败 原因是'+ data.syserr); 
				}
			}});
	}
	// datagrid
	$('#table').flexigrid({
		url : urls.list, height: 330, sort : 'approveDate', checkbox : false, usepager : true, dbClickRecord: view,
		buttons : [
			{name : "详细信息",bclass : 'grid_excel',id : 'cel',onpress : view},{separator : true}
		   ,{name : "导出已审核记录",bclass : 'grid_excel',id : 'cel',onpress : exportCsv}
		   ,{name : "更新商户注册标识码",bclass : 'grid_excel',id : 'cel',onpress : upd}
		],
		colModel : [
			{display : '内部商户号', dataIndex : 'orgCode',align : 'center',sortable:true}
		   ,{display : '外部商户号',dataIndex : 'mid',align : 'center'}
		   ,{display : '商户名称',dataIndex : 'merName',sortable:true}
		   ,{display : '一级服务商',dataIndex : 'firstTcnZH',sortable:true}
		   ,{ display: '商户类别(预期)', dataIndex: 'mccGrpImpDesc', align: 'center'}
		   ,{ display: '商户类别(结算)', dataIndex: 'mccGrpDesc', align: 'center'}
		   ,{ display: '注册标识码', dataIndex: 'regSeqNo', align: 'center'}
		   ,{ display: '借记费率(%)', dataIndex : 'debitRate', align : 'right', render:fmtRate4 }
		   ,{ display: '借记封顶费', dataIndex : 'debitMaxFee', align : 'right', render:fmtMoney }
		   ,{ display: '贷记费率(%)', dataIndex : 'creditRate', align : 'right', render:fmtRate4 }
		   //,{display : '银行费率(%)',dataIndex : 'feeRate',align : 'center'}
		   //,{display : '单笔限额(元)',dataIndex : 'tranLimit',sortable:true}
		   ,{display : '账户号码',dataIndex : 'accntNO',sortable:true}
		   ,{display : '风控审批时间',dataIndex : 'approveDate',align : 'center', render:fmtTime}
		   ,{display : '审批状态',dataIndex : 'statusZH',align : 'center'}
		]
	});
	// 初始化页面控件
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
	$.jyform.components();	
	// 
	$('#viewDiv').fullScreen();
	$('#viewtabs').tabs(); $('#viewtabs').fixTabInDialog('viewDiv');
	
	$('.bt').button();
	$('#queryBtn').click(function(){
		//wxb
		var startTime=$("#q_bgnSday").val();
		var endTime=$("#q_endSday").val();
		if(startTime&&endTime){
			if(startTime>endTime){
				alert("起始日期不能大于结束日期"); 
				return false;
			}
		}
		$.queryTable({formId : 'queryForm', tableId : 'table'});});
	$('#queryBtn').click();
});
//-->
</script>
</body>