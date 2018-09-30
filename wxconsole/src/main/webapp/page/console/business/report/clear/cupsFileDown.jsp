<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
<head>
<title>银联对账文件下载</title>
<jsp:include page="/js/linkpage.jsp"></jsp:include>

<script type="text/javascript">
function iframeAutoFit(iframeObj)  {   
	/*setTimeout(function()  {  
		if(!iframeObj)  return;  
		iframeObj.height=(iframeObj.Document?iframeObj.Document.body.scrollHeight:iframeObj.contentDocument.body.offsetHeight)+30;
	},200);*/  
}; 
</script>
<style>
<!--
body{margin: 0; padding: 0;  }
li,ul,ol{list-style: none; padding: 0; margin: 0 0 .2em 0;}
-->
</style>
</head>
<body>
	<div id="rpt-toolbar" class="qdiv"  style="background-color:#D2E1F0; ">
		<form id="qfrm" name="qfrm" target="_blank" action="cupsFileDown.action" method="post" >
			<div class="qdiv-el">
				<ul>
				    <li><label for="stlmDate">清算日期:</label><input id="stlmDate" name="stlmDate" type="text" /></li>
					<li><a id="qfrm-submit" class="btn">下载</a></li>
					<li><a id="qfrm-reset" class="btn">重置</a></li>
				</ul>
			</div>
		</form>
	</div>
<script type="text/javascript">
//<!-- 

var openReport = function(_url, _target) {
	$('#stlmDate').removeAttr('disabled');
	//$('#jsonfilter').val($.jyform.jsonfilter('qfrm')); 
	$('#qfrm').attr('action',_url).attr('target',_target); 
	$('#qfrm')[0].submit();
};

// 加载页面 
$(function(){
// 查询按钮
$('#qfrm-submit').button({icons:{primary:"ui-icon-search"}}).click(function(){openReport('cupsFileDown.action','_blank')});	
$('#qfrm-reset').button({icons:{primary:"ui-icon-refresh"}}).click(function(){$('#qfrm')[0].reset();});	
//输入控件渲染
$.jyform.dateBox({select:$('#stlmDate'),maxDate:new Date()}); 
// Menu 渲染
$.jyform.toolbarfix('rpt-toolbar');

// iframe 高度设置

// 加载默认页面
//$('#qfrm-submit').click();
});
function afterload(){
	$('#rptvw').css({height:$('body').height()-$('#rpt-toolbar').height(),overflow:'auto'});
	$(window).resize(function(){$('#rptvw').css({height:$('body').height()-$('#rpt-toolbar').height(),overflow:'auto'});});
}
//-->
</script>
</body>
</html>