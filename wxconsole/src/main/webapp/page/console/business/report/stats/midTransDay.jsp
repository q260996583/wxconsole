<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
<head>
<title>商户交易汇总表</title>
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
	<form id="qfrm" name="qfrm" target="rptvw" action="#" >
		<input type="hidden" name="merName" id="merName" />
		<div class="qdiv-el">
				<ul>
				    <li><label for="startDate">开始日期:</label><input id="startDate" name="startDate" type="text" /></li>
				    <li><label for="endDate">结束日期:</label><input id="endDate" name="endDate" type="text" /></li>
				    <li><label for="mid">商户号:</label><input id="mid" name="mid" type="text" /></li>
					<li><a id="qfrm-submit" class="btn">查询</a></li>
					<li><a id="qfrm-reset" class="btn">重置</a></li>
				</ul>
			
		</div>
		<div class="qdiv-el">
			<button id="rptExcel">导出excel</button>
		</div>
		</form>
	</div>
	<iframe frameborder="0" name="rptvw" id="rptvw" width="100%"   onLoad="javascript:iframeAutoFit(this);" ></iframe>

<jsp:include page="/page/console/business/include/dialog_mid.jsp"></jsp:include>
<script type="text/javascript">
//<!-- 

var urls = {
 html:'findMidTransDay.action'
,excel:'findMidTransDayExcel.action'
};
var openReport = function(_url, _target) {
	$('#startDate').removeAttr('disabled');
	$('#endDate').removeAttr('disabled');
	//$('#jsonfilter').val($.jyform.jsonfilter('qfrm')); 
	$('#qfrm').attr('action',_url).attr('target',_target); 
	$('#qfrm')[0].submit();
};
$('.qdiv-el li a').hover(function(){$(this).next().show();},function(){$(this).next().hide();});
$('.qdiv-el li .tip').addClass('ui-state-highlight ui-corner-all').prepend('<span style="float: left; margin-right: .3em;" class="ui-icon ui-icon-info"></span>');
// 加载页面 
$(function(){
// 查询按钮
$('#qfrm-submit').button({icons:{primary:"ui-icon-search"}}).click(function(){
	//wxb
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val()
	if(startDate&&endDate){
		if(startDate>endDate){
			alert("开始日期不能晚于结束日期");
			return false;
		}
	}
	openReport(urls.html,'rptvw')}
	);	
$('#qfrm-reset').button({icons:{primary:"ui-icon-refresh"}}).click(function(){$('#qfrm')[0].reset();});	
//输入控件渲染
$.jyform.dateBox({select:$('#startDate')}); 
$.jyform.dateBox({select:$('#endDate')}); 
// 操作按钮
$('#rptExcel').click(function(){openReport(urls.excel, '_blank');});
$('#rptExcel').button({ text: true, icons: { primary: "ui-icon-print" }});
// Menu 渲染
/* $.jyform.menulist('operate'); */
$.jyform.toolbarfix('rpt-toolbar');
midDialogBind('mid', function(data) { $('#mid').val(data.mid);$('#merName').val(data.merName); });
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