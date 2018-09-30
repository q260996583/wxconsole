<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(function() {
    	$('#queryDate').pickdate({dateFmt:"yyyyMMdd"});
    	

    		$('#table').flexigrid({ 
    		    url : 'findCupsFeeDiffTrans.action', width : 400, dir : "desc", sort : "transSeq", usepager : true, 
    		    buttons : [
    		    ],
    		    colModel : [
    		             { display: '流水号', dataIndex: 'transSeq', align: 'center', sortable:true }
    		            ,{ display: '交易金额(银联)', dataIndex: 'cupsAmt', align: 'center'}
    		            ,{ display: '卡费(银联)', dataIndex: 'cupsCardFee',  algin:'center' }
    		            ,{ display: '返还费(银联)', dataIndex: 'cupsRecvFee',  algin:'center'}
    		            ,{ display: '发卡行手续费(银联)', dataIndex: 'cupsPayFee', align: 'center'  }
    		            ,{ display: '银联手续费(银联)', dataIndex: 'cupsUNFee',align: 'center'} 
    		            ,{ display: '交易金额(申鑫)', dataIndex: 'sxTranAmt',align: 'center'}
    		            ,{ display: '发卡行手续费(申鑫)', dataIndex: 'sxCardFee', align: 'center' }
    		            ,{ display: '银联手续费(申鑫)', dataIndex: 'sxUNFee', align: 'center' }
    		            ,{ display: '手续费差异(申鑫-银联)', dataIndex: 'diffAmt', align: 'center' }
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
		             <td class="qlabel">日期</td>
		             <td class="qinput"><input id="queryDate" name="queryDate" comparison="eq"/>
		             <td class="qlabel">流水号</td>
		             <td class="qinput"><input id="transSeq" name="transSeq" comparison="eq"/>
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