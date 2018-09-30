<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>移动商户二维码报备</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
</head>
<style>
    .flabel{width:20%}
    .qFormInput{width:80%}
</style>
<body>

    <div id="queryCondition"
        style="background-color: #FBFEFF; padding: 5px;">
        <form id="queryForm" name="queryForm" action="#" method="post"
            style="padding: 0px; margin: 0px;">
            <table class="qtable" width="100%" cellspacing="1" cellpadding="1">
                <tr>
                    <td class="qlabel">商户名称</td>
                    <td class="qinput"><input type="text" value="" comparison="like" qtype="string" name=instMerName size=20 /></td>
                    <td class="qlabel">机构商户号</td>
                    <td class="qinput"><input type="text" value=""
                        comparison="like" qtype="string" name=instMerId maxlength="15" /></td>
                    <td class="qlabel"></td>
                    <td class="qinput"></td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff" colspan="6" align="center">
                        <input id="querybutton" class="bt" value="查询" type="button" />
                        <input class="bt" value="重置" type="reset" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <DIV id="table"></DIV>
    
    <div id="outMobileMerDetail" class="detailDialog" style="display:none;">
        <form id="form2" >
        <div style="overflow-x: auto; overflow-y: auto; width:100%;">
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
                <td class="flabel"> 机构商户名称:</td>
                <td class="fcontent">  <input class="qFormInput" disabled id="instMerName" name="instMerName" type="text" maxlength="100" /></td>
                </tr>
                <tr>
                <td class="flabel"> 手机号码:</td>
                <td class="fcontent">  <input class="qFormInput" disabled  id="merPhoneNO" name="merPhoneNO" type="text" maxlength="20" /></td>
                </tr>
                <tr>
                <td class="flabel"> 地址:</td>
                <td class="fcontent">  <input class="qFormInput" disabled  id="merAddr" name="merAddr" type="text" maxlength="100" /></td>
                </tr>
              <tr>
                    <td class="flabel">卡信息:</td>
                    <td class="fcontent"><input class="qFormInput" disabled id="merCardInfo" name="merCardInfo" type="text" maxlength="50" /></td>
                </tr>
                <tr>
                    <td class="flabel">发卡行:</td>
                    <td class="fcontent"><input class="qFormInput" disabled id="merCardBank" name="merCardBank" type="text" /></td>
                </tr>
                <tr>
                    <td class="flabel">证件类型:</td>
                    <td class="fcontent"><input class="qFormInput" disabled id="merIDType" name="merIDType" type="text" /></td>
                </tr>
                <tr>
                    <td class="flabel">证件号:</td>
                    <td class="fcontent"><input class="qFormInput" disabled id="merIDNO" name="merIDNO" type="text" /></td>
                </tr>
                <tr>
                <td class="flabel"> 状态:</td>
                <td class="fcontent">  <input class="qFormInput" disabled id="merStat" name="merStat" type="text" maxlength="100" /></td>
                </tr>
                <tr>
                <td class="flabel"> 简称:</td>
                <td class="fcontent">  <input class="qFormInput" disabled id="merShortName" name="merShortName" type="text" maxlength="100" /></td>
                </tr>
                                <tr>
                <td class="flabel"> 民生微信报备:</td>
                <td class="fcontent">
                    <input type="checkbox" id="mobileAddWechat" name="mobileAdd"  value="SMZF_WX_HD">
                 <!-- <input id="mobileAddWechatUpdate" class="bt" value="修改" type="button">   -->
                </td>
                </tr>
                <tr>
                <td class="flabel"> 民生支付宝报备:</td>
                <td class="fcontent">
                    <input type="checkbox" id="mobileAddAlipay" name="mobileAdd"  value="SMZF_ZFB">
             <!--   <input id="mobileAddAlipayUpdate" class="bt" value="修改" type="button"> -->
                    <input id="mobileAddAlipayQuery" class="bt" value="查询" type="button">
                </td>
                </tr>
                <tr>
                <td class="flabel">恒丰报备:</td>
                <td class="fcontent"><input type="checkbox" id="mobileAddHF"
                    name="mobileAdd" value="SMZF_HF"></td>
                </tr>
                <tr>
                    <td class="flabel">交易使用二维码渠道:</td>
                    <TD class="finput"><input type="radio" id="activeChannelMS"
                        name="merActiveQrcChannel" value="MS" />民生 <input type="radio"
                        id="activeChannelHF" name="merActiveQrcChannel" value="HF" />恒丰</TD>
                </tr>
                 </TBODY>
                  </table> 
                  </div>              
              </form>
         </div> 

<script type="text/javascript">

var __refNo = false;
var htmlFromTpl = function(_f,_t){
    var html =  _t.replace(/{([^{}]+)}/g,function(word){ 
        var _attr=word.replace(/({|})+/g,""); 
        return _f[_attr]; });
    return $(html);
};

var __defCodeBoxParam = function(__opt) {
    return $.extend({emptyOpt:true,valueField:'codeNo', displayField:'codeName', render:function(res){return res.codeName;}, failedMsg:'获取应用参数失败!'}, __opt);
};

$(document).ready(function() {

$('#outMobileMerDetail').dialog({autoOpen: false, bgiframe: true, modal: true, resizable: false, draggable: false, width: 800, height: 430 });                    
          

var  viewOutMobileMerDetail = function(record,id) {
    if (!record) { alert("请选择一条记录"); return;    }
    __refNo = record.orgCode;
    $('#form2').fillObject({obj:record});
    $("input[name=merActiveQrcChannel]").val([record.merActiveQrcChannel]);
    var mhtObj = $('#form2').formToJSON();
    $.ajax({url:'queryQrcRouteInfo.action', type:'POST', dataType:'json', 
        async:false, data:{mers:$.toJSON(mhtObj)}
        ,success: function(data) {
            $("input[name='mobileAdd']").attr("checked",false);
            //$("#mobileAddAlipayUpdate").hide();
            //$("#mobileAddWechatUpdate").hide();
            $("#mobileAddAlipayQuery").show();
            for(var i=0; i<data.root.length; i++) {
                if(data.root[i].qrcImportType == 'SMZF_ZFB') {
                    $("#mobileAddAlipay").attr("checked",true);
                    //$("#mobileAddAlipayUpdate").show();
                    $("#mobileAddAlipayQuery").hide();
                } else if(data.root[i].qrcImportType == 'SMZF_WX_HD') {
                    $("#mobileAddWechat").attr("checked",true);
                   // $("#mobileAddWechatUpdate").show();
                }else if(data.root[i].qrcImportType == 'SMZF_HF') {
                    $("#mobileAddHF").attr("checked",true);
                    $("#mobileAddWechatUpdate").show();
                }
            }
    }});
    
    $('#outMobileMerDetail').dialog("option","title","详细信息");
    $('#outMobileMerDetail').dialog("option","buttons",{
            '报备' : function() {
                //alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
                var mhtObj2 = $('#form2').formToJSON();
                if(0 == $("input[name='mobileAdd']:checked").length) {
                    alert("您还没有选择报备机构！");
                    return;
                }
                $.ajax({url:'qrcodeApplyAddCommit.action', type:'POST', dataType:'json', 
                    async:false, data:{mers:$.toJSON(mhtObj2)}
                ,success: function(data) {
                    if ( data && data.success ) {
                        alert(data.syserr);
                    } else { alert('保存出错：' + data.syserr); }
                }});
                $(this).dialog('close');
            }, '关闭' : function() {$(this).dialog('close');}
        });
    $('#outMobileMerDetail').dialog('open');
};

                        
$('#table').flexigrid({url: 'findAllMobileMerchant.action', width: 560, dir: "desc", sort: "instMerId", usepager: true, 
buttons: [
{name: "详细信息", bclass: 'page_excel', id: 'cel', onpress: viewOutMobileMerDetail },{separator: true }
],
colModel: [ 
 { display: '机构号', dataIndex : 'instId', align : 'center', sortable:true }
,{ display: '机构商户号', dataIndex : 'instMerId', align : 'center' , sortable:true}
,{ display: '机构商户名称', dataIndex : 'instMerName' , align : 'center'}
,{ display: '简称', dataIndex : 'merShortName', align : 'center' }
,{ display: '手机号码', dataIndex: 'merPhoneNO', align: 'center'}
,{ display: '地址', dataIndex: 'merAddr', align: 'center'}
,{ display: '卡信息', dataIndex : 'merCardInfo', align : 'center' }
,{ display: '发卡行', dataIndex : 'merCardBank', align : 'center' }
,{ display: '证件类型', dataIndex : 'merIDType', align : 'center' }
,{ display: '证件号', dataIndex : 'merIDNO', align : 'center' }
,{ display: '状态', dataIndex : 'merStat', align : 'center'}
]
});
 
$('#mobileAddAlipayQuery').click(function(){
    //支付宝报备结果查询
    var mhtObj2 = $('#form2').formToJSON();
    $.ajax({url:'qrcodeApplyQryAlipayCommit.action', type:'POST', dataType:'json', 
        async:false, data:{mers:$.toJSON(mhtObj2)}
    ,success: function(data) {
        if ( data && data.success ) {
            alert(data.syserr);
            if (data.syserr == "审核已通过"){
                $("#mobileAddAlipay").attr("checked",true);
                $("#mobileAddAlipayUpdate").show();
                $("#mobileAddAlipayQuery").hide();
            }
        } else { alert('查询出错：' + data.syserr); }
    }});
}); 

$('#querybutton').click(function(){
    $.queryTable({ formId : 'queryForm', tableId : 'table'  });
});                     
//初始化查询;
$('#querybutton').trigger('click');

$.ajax({url:'findSecCodeList.action?codeType=ACCNT_TYPE', type:'POST', dataType:'json', success:function(data){
    if ( data && data.success ) { 
        $.dataSelectBox(__defCodeBoxParam({selectId:'accntType'}), data.root);
    } else { console.log('获取参数失败'); }
}});
});
</script>
</body>
</html>