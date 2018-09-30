<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>小微商户进件审核</title>
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
   			<td class="flabel"> 机构号:</td>
   			<td class="fcontent"> <input class="qFormInput" disabled id="instId" name="instId" type="text" maxlength="20" readonly="readonly"  disabled="disabled"/></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 机构商户号:</td>
   			<td class="fcontent"> <input class="qFormInput" disabled id="instMerId" name="instMerId" type="text" maxlength="100" /> </td>
   			</tr>
   			<tr>
   			<td class="flabel">进件机构商户号:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id=addInstMerId name="addInstMerId" type="text" maxlength="100" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 机构商户名称:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled  id="merName" name="merName" type="text" maxlength="100" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户类型:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled  id="merShortName" name="merShortName" type="text" maxlength="100" /></td>
   			</tr>
   		  <tr>
   				<td class="flabel">商户手机号:</td>
   				<td class="fcontent"><input class="qFormInput" disabled id="merPhoneNo" name="merPhoneNo" type="text" maxlength="50" /></td>
   			</tr>
   			<tr>
  				<td class="flabel">商户地址信息:</td>
  				<td class="fcontent"><input class="qFormInput" disabled id="merAddress" name="merAddress" type="text" /></td>
  			</tr>
   			<tr>
  				<td class="flabel">商户银行卡信息:</td>
  				<td class="fcontent"><input class="qFormInput" disabled id="merCardInfo" name="merCardInfo" type="text" /></td>
  			</tr>
  			<tr>
  				<td class="flabel">商户银行卡名字:</td>
  				<td class="fcontent"><input class="qFormInput" disabled id="merCardName" name="merCardName" type="text" /></td>
  			</tr>
   			<tr>
   			<td class="flabel"> 商户银行联行信息:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="merCardBank" name="merCardBank" type="text" maxlength="100" /></td>
   			</tr>
   			<tr>
   			<td class="flabel">商户银行联行名字:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="merCardBankName" name="merCardBankName" type="text" maxlength="100" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 证件类型:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="merIdType" name="merIdType" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 证件号:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="merIdNo" name="merIdNo" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 商户状态:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="merStatus" name="merStatus" type="text" maxlength="30" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 邀请码:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="inviteCode" name="inviteCode" type="text" maxlength="30" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 联系人类型:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="contactType" name="contactType" type="text" maxlength="30" /></td>
   			</tr>
   			<tr>
   				<td class="flabel"> 联系人姓名:</td>
   				<td class="fcontent">  <input class="qFormInput" disabled id="contactName" name="contactName" type="text" maxlength="20" /></td>
   			</tr>
   			<!-- <tr>
   				<td class="flabel"> 商户对外名称:</td>
   				<td class="fcontent">  <input class="qFormInput" disabled id="merOutName" name="merOutName" type="text" maxlength="20" /></td>
   			</tr> -->
   			<!-- <tr>
   				<td class="flabel">省:</td>
   				<td class="fcontent"><input class="qFormInput" disabled id="provinceCode" name="provinceCode" type="text" maxlength="100" /></td></tr>
   			</tr>
   			<tr>
   			<td class="flabel"> 市:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="cityCode" name="cityCode" type="text" maxlength="15" /></td>
   			</tr> -->
   			<tr>
   			<td class="flabel">地区代码:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="areaCode" name="areaCode" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel">地区名称:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="areaCodeDesc" name="areaCodeDesc" type="text" maxlength="15" /></td>
   			</tr>
   			<tr>
   			<td class="flabel"> 进件状态 :</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="addStatus" name="addStatus" type="text" maxlength="20" /></td>
   			</tr>
   			<tr>
   			<td class="flabel">创建日期:</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="createDate" name="createDate" type="text" maxlength="20" /></td>
   			</tr>
   			<tr>
   			<td class="flabel">微信费率(%):</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="wechatPayRate" name="wechatPayRate" type="text" maxlength="60" /></td>
   			</tr>
   			<tr>
   			<td class="flabel">支付宝费率(%):</td>
   			<td class="fcontent">  <input class="qFormInput" disabled id="alipayPayRate" name="alipayPayRate" type="text" maxlength="60" /></td>
   			</tr>
   			
   			
   			<tr>
    			<td class="flabel"> 进件附件:</td>
    			<td class="fcontent">
					<input id="downloadOutMerApplyFile" class="bt" value="查看附件" type="button">
				</td>
   			</tr>
   		    
   			<tr>
   				<td class="flabel"> 审批意见:</td>
	   			<td class="fcontent">  <textarea class="qFormInput"  id="auditMemo" name="auditMemo" type="text" maxlength="300" ></textarea></td>
	  		</tr>
   			<tr style="display: none"> 
   				<td></td> 
   				<td>
   					<input id="bankAccntId" name="bankAccntId" type="text"/>
   					<input id="firstTcn" name="firstTcn" type="text"/>
   					<input id="accntType" name="accntType" type="text"/>
   					<input id="feeType" name="feeType" type="text"/>
   					<input id="spdFlag" name="spdFlag" type="text"/>
   					<input id="merFax" name="merFax" type="text"/>
   					<input id="areaCode" name="areaCode" type="text"/>
   					<input id="orgCode" name="orgCode" type="text"/>
   					
   					<input id="feeRate" name="feeRate" type="text"/>
  					<input id="feeVal" name="feeVal" type="text"/>
  					<input id="topValue" name="topValue" type="text"/>
  					<input id="mccGrp" name="mccGrp" type="text"/>
  					<input id="mccGrpImp" name="mccGrpImp" type="text"/>
   				</td>
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

<div style="display: none;">
<textarea id="athTrTpl">
	<tr>
		<td><input type="checkbox" readonly="readonly" class="athChecked" id="{athType}_checked" onclick="return false;"/></td>
		<td>{athTypeName} <span class="txt-red">{athNullable}</span><input type="hidden" id="ath_{athType}" athType="{athType}" class="athInMedSeq" /></td>
		<td><input type="button" class="bt preview-in-ath-btn" fileId="ath_{athType}" athType="{athType}" value="查看" /></td>
	</tr>
</textarea>
</div>
<script type="text/javascript">
//<!--
var urls = {
athDef: 'loadQrcMhtAttachDef.action',	
athList: 'loadQrcMhtAttachInfoAdd.action'		
};
var __refNo = false;
var htmlFromTpl = function(_f,_t){
	var html =  _t.replace(/{([^{}]+)}/g,function(word){ 
		var _attr=word.replace(/({|})+/g,""); 
		return _f[_attr]; });
	return $(html);
};
var loadAthDef = function() {
	var tpl = $('#athTrTpl').val();
	var $parent = $('#mhtAttachInfoAddTbody');
	$parent.html('');
	$.ajax({url:urls.athDef, dataType:'json', type:'POST', async:false
		, success: function(data){
			if (data && data.success) {
				$(data.root).each(function(_i,_n){
					_n.athNullable = (_n.nullable=='1'?'*':'');
					$parent.append(htmlFromTpl(_n, tpl));
				});
			} else {
				alert('加载附件定义失败');
			}
		}});
};
var loadAthList = function() {
	$('.athChecked').removeAttr('checked');
	$('.athInMedSeq').val('');
	if ( __refNo ) {
		$.ajax({url:urls.athList, dataType:'json', type:'POST', async:false, data:{'orgCode':__refNo}
			,success:function(data){
				if (data && data.success) {
					if ( data.root ){
						$(data.root).each(function(_i,_n){
							$('#ath_'+_n.athType).val('').val(_n.inMedSeq).change();
						});
					}
				} else {
					alert('加载附件列表失败');
				}
		}});
	}
	
};
var bindAthEvent = function() {
	$('.preview-in-ath-btn').click(function() {
		var fileId = $(this).attr('fileId');
		var athType = $(this).attr('athType');
		var medSeq = $('#' + fileId).val();
		if ( medSeq ) {
			window.open('attach/' + __refNo + '_in_' + athType + '_' + medSeq);
		} else {
			alert('无附件信息');
		}
	});
	$('.athInMedSeq').change(function(){
		var inMedSeq = $(this).val();
		var $checked = $('#' + $(this).attr('athType') + '_checked');
		$checked.removeAttr('checked');
		if ( inMedSeq && inMedSeq.length > 0 ) {
			$checked.attr('checked','checked');
		}
	});
};

var __defCodeBoxParam = function(__opt) {
	return $.extend({emptyOpt:true,valueField:'codeNo', displayField:'codeName', render:function(res){return res.codeName;}, failedMsg:'获取应用参数失败!'}, __opt);
};

$(document).ready(function() {
$.formValidator.initConfig({onerror : function(msg) { alert(msg); } });
var list=[{id:"admitMemo",formValidator:{empty:false},inputValidator:{min:1,max:300,onerror:"业务审批意见长度不得为空不得大于150个汉字"}}];
$.someAuthentication(list);	

var flag=false; // lic check flag
var athNullableCheck = false; // nullable attachments check flag. 
var athNullableMessage = false;
$('#outMerDetail').dialog({	autoOpen: false,	bgiframe: true,	modal: true,	resizable: false,	draggable: false,	width: 800,	height: 500
	,title: '详细信息' , buttons: {
		'通过': function(){										
			if ($.formValidator.pageIsValid('1')) {
				var cf = confirm("确认通过进件审核吗？");
				if (!cf) { return; }
				if ( !athNullableCheck ) { 
					if ( !confirm(athNullableMessage?(athNullableMessage+"，确定通过吗？"):'进件必填信息未校验! ') ) { return ;}
				}
				if(flag){
					var licen=confirm("已经有商户使用了这个营业执照统一社会信用代码，确定通过吗？");
					if(!licen){ return; }
				}
				$.ajaxForm({formId : 'form2', url : "doApproveOutQrcMerApplyControl.action",
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
	,'驳回': function(){										
			if ($.formValidator.pageIsValid('1')) {
				var cf = confirm("确认驳回进件审核吗？");
				if (!cf) { return; }
				$.ajaxForm({formId : 'form2', url : "doRejectOutQrcMerApplyControl.action",
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

$('#mhtAttachInfoAddDialog').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 500
	, title:'附件列表', buttons:{'关闭':function() {$(this).dialog('close');}  } });			

$('#downloadOutMerApplyFile').click(function(){
	loadAthList();
	$('#mhtAttachInfoAddDialog').dialog('open');
});	

var  viewOutMerDetail = function(record,id) {
	if (!record) { alert("请选择一条记录"); return; }
	$('#form2').fillObject({obj:record});
	__refNo = record.addInstMerId;
	$.ajax({url: 'queryLicenseNo.action', async	: false, data	: {jsonObject:$.toJSON(record)},
		success:function(data){
			if(data.success){
				$('#licen').show(); flag=true;
			}else{ $('#licen').hide(); }
	}});
	// check attachment
	athNullableCheck = false;  
	athNullableMessage = false;
	$.ajax({url: 'checkQrcMhtAttachInfoAdd.action', async: false, data: {orgCode:record.addInstMerId},
		success:function(data){
			if(data.success){
				athNullableCheck = true;
			}else{ 
				athNullableMessage = data.syserr;
			}
	}});
	$('#outMerDetail').dialog('open');
};
						
$('#table').flexigrid({url : 'findOutQrcMerApplyControl.action', width : 400, dir : "desc", sort : "orgCode", usepager : true,	
buttons: [
{name : "详细信息", bclass : 'page_excel', id : 'cel', onpress : viewOutMerDetail },{separator : true }
],
colModel:[ 
          { display: '机构号', dataIndex : 'instId', align : 'center', sortable:true }
          ,{ display: '机构商户号', dataIndex : 'instMerId', align : 'center' , sortable:true}
          ,{ display: '进件机构商户号', dataIndex : 'addInstMerId', align : 'center' , sortable:true}
          ,{ display: '机构商户名称', dataIndex : 'merName', align : 'center' }
          ,{ display: '商户类型', dataIndex : 'merShortName', align : 'center'}
          ,{ display: '商户手机号', dataIndex: 'merPhoneNo', align: 'center'}
          ,{ display: '商户地址信息', dataIndex: 'merAddress', align: 'center'}
          ,{ display: '商户银行卡信息', dataIndex : 'merCardInfo', align : 'center' }
          ,{ display: '商户银行卡名字', dataIndex : 'merCardName', align : 'center' }
          ,{ display: '商户银行联行信息', dataIndex : 'merCardBank', align : 'center' }
          ,{ display: '商户银行联行名字', dataIndex : 'merCardBankName', align : 'center' }
          ,{ display: '证件类型', dataIndex : 'merIdTypeDesc', align : 'center' }
         /*  ,{ display: '商户状态', dataIndex : 'merStatus', align : 'center' } */
          ]
});
		
	
$('#querybutton').click(function(){$.queryTable({ formId: 'queryForm', tableId : 'table' }); });						
//初始化查询;
$('#querybutton').trigger('click');

loadAthDef();
bindAthEvent();
$.ajax({url:'findSecCodeList.action?codeType=ACCNT_TYPE_SD', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { 
		$.dataSelectBox(__defCodeBoxParam({selectId:'accntType'}), data.root);
	} else { console.log('获取参数失败'); }
}});
});
//-->
</script>
</body>
</html>