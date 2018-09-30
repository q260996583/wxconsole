<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二维码报备信息差异表</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(function() {
    	$('#queryDate').pickdate({dateFmt:"yyyyMMdd"});
    	

    		$('#table').flexigrid({ 
    		    url : 'findQrcAddInfoDiffMer.action', width : 400, dir : "desc", sort : "instMerId", usepager : true, 
    		    buttons : [
    		    ],
    		    colModel : [
    		             { display: '商户号', dataIndex: 'instMerId', align: 'center', sortable:true }
    		            ,{ display: '商户名称', dataIndex: 'merName', align: 'center'}
    		            ,{ display: '申鑫结算卡户名', dataIndex: 'instAccName',  algin:'center' }
    		            ,{ display: '申鑫结算卡号', dataIndex: 'instAccNo',  algin:'center'}
    		            ,{ display: '渠道标识', dataIndex: 'cooperator', align: 'center'  }
    		            ,{ display: '扫码标识', dataIndex: 'importType',align: 'center'} 
    		            ,{ display: '渠道结算卡户名', dataIndex: 'channelAccName',align: 'center'}
    		            ,{ display: '渠道结算卡号', dataIndex: 'channelAccNo', align: 'center' }
    		            ,{ display: '申鑫费率(%)', dataIndex: 'instTradeRate', align: 'center' }
    		            ,{ display: '渠道费率(%)', dataIndex: 'channelTradeRate', align: 'center' }
    		            ]
    		    })
    $('#querybutton').click(function(){
        $.queryTable({ formId : 'queryForm', tableId : 'table' }); });      

});   
</script>
</head>
<body>
    <div>
        <form id="queryForm">
	        <table class="qtable" width="100%" cellspacing="1" cellpadding="1">   
		        <tr>
		             <td class="qlabel">商户名称</td>
		             <td class="qinput"><input id="qmid" name="merName" comparison="like"/>
		             <td class="qlabel">商户号</td>
		             <td class="qinput"><input id="qmername" name="instMerId" comparison="eq"/>
		        </tr>
		        <tr>
		             <td bgcolor="#ffffff" colspan="6" align="center">
		                 <input id="querybutton" class="bt" value="查询" type="button"> 
		                 <input class="bt" value="重置" type="reset" /> 
		             </td>
		         </tr>
	        </table>
        </form>
    </div>
    <DIV id="table"></DIV>
  
</body>
</html>