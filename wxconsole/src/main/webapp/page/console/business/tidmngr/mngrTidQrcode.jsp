<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>终端二维码管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="js/validator/formValidatorRegex.js"></script>
<script type="text/javascript" src="pagejs/console/business/tidmngr/mngrTidQrcode.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
		
	<tr>
		<td class="qlabel">预制</td>
		<td>
			<select id='qrCount' name='qrNo' style="width:50px">
				<option >50</option>
    			<option >100</option>
    			<option >150</option>
    			<option >200</option>
			</select>
			张二维码 
			<input style ="float:right" id="qrCodeBtn" class="bt" value="批量生成"  type="button">
		</td>	
		<td></td>
		<td></td>	
		<td class="qlabel">批量下载未下载的二维码</td>
		<td>
			<input style ="float:right" id="downLoadBtn" class="bt" value="下载"  type="button">
		</td>								
	</tr>
	
	<tr>
		<td class="qlabel">二维码序号：</td>
		<td>
			<input type="text" value="" comparison="like"
				qtype="string" name=qrCodeSeq size=15 id="qrCodeSeq"/>
			<input style ="float:right" id="searchBtn" class="bt" value="检索"  type="button">
	    </td>
	    <td class="qlabel">对应商户号：</td>
	    <td>
	    	<input type="text" value="" comparison="like"
				qtype="string" name=mid size=20 id="mid"/>
	    </td>
	    <td class="qlabel">对应终端号：</td>
	    <td>
	    	<input type="text" value="" comparison="like"
			qtype="string" name=tid size=20 id="tid"/>
	    </td>				
	</tr>
	<tr>
		<td class="qlabel">待绑定二维码序号：</td>
		<td>
		<input type="text" value="" comparison="like"
			qtype="string" name=qrCodeSeq2 size=15 id="qrCodeSeq2"/>
	    </td>
	    <td class="qlabel">商户号：</td>
	    <td>
	    	<input type="text" value="" comparison="like"
			qtype="string" name=mid2 size=20 id="mid2"/>
	    </td>
	    <td class="qlabel">待绑定终端号：</td>
	    <td>
	    	<input type="text" value="" comparison="like"
			qtype="string" name=tid2 size=20 id="tid2"/>
			<input style ="float:right" id="bindingBtn" class="bt" value="绑定二维码"  type="button">
	    </td>				
	</tr>
	
	<!-- <tr>
		<td class="qlabel">批量下载未下载的二维码</td>
		<td>
			<input style ="float:right" id="downLoadBtn" class="bt" value="下载"  type="button">
		</td>		
		<td></td>
		<td></td>
		<td></td>
		<td></td>							
	</tr> -->
		
</table>
</form>
</div>
	
	

<div id="tidDetail" style="display: none;">
<form id="form2" >
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

</body>
</html>