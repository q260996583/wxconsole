<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
<head>
<title>财务清算日报</title>
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
			<div class="qdiv-el">
				<ul>
				    <li><label for="stlmDate">清算日期:</label><input id="stlmDate" name="stlmDate" type="text" /></li>
					<li><a id="qfrm-submit" class="btn">查询</a></li>
					<li><a id="qfrm-reset" class="btn">重置</a></li>
				</ul>
			</div>
				<div class="qdiv-el">
					<ul>
						<li><button id="rptExcel">导出excel</button></li>
						<sec:authorize ifAnyGranted="ROLE_FIN_APPLY_LOCK,ROLE_FIN_APPLY_UNLOCK">
							<li><label for="stlmDate">结账状态:</label><input type="text" id="lockDesc" readonly="readonly"/></li>
							<sec:authorize ifAllGranted="ROLE_FIN_APPLY_LOCK">
								<li><button id="applyLock" class="btn" type="button">结账</button></li>
							</sec:authorize>
							<sec:authorize ifAllGranted="ROLE_FIN_APPLY_UNLOCK">
								<li><button id="un_applyLock" class="btn" type="button">解除结账</button></li>
							</sec:authorize>
						</sec:authorize>
					</ul>
				</div>
		</form>
	</div>
	<iframe frameborder="0" name="rptvw" id="rptvw" width="100%"   onLoad="javascript:iframeAutoFit(this);" ></iframe>
<script type="text/javascript">
//<!-- 

var urls = {
 html:'dailyBalanceReportHtml.action'
,excel:'dailyBalanceReportExcel.action'
,lock:'lockApplyLock.action'
,unlock:'unlockApplyLock.action'
,check:'checkApplyLock.action'
};

var call_interval = 30000;	

var openReport = function(_url, _target) {
	$('#stlmDate').removeAttr('disabled');
	//$('#jsonfilter').val($.jyform.jsonfilter('qfrm')); 
	$('#qfrm').attr('action',_url).attr('target',_target); 
	$('#qfrm')[0].submit();
};

var checkApplyLock = function() {
	$.ajax({url:urls.check
		,dataType : 'json'
		,success:function(data) {
			if (data.success) {
				var desc;
				if (data.root[0].paramValue == '0') {
					desc = '未结账';
				} else if (data.root[0].paramValue == '1') {
					desc = '已结账'; 
				} else {
					desc = '未知';
				}
				$('#lockDesc').val(desc);
				setTimeout('checkApplyLock()',call_interval);
			} else {
				alert('获取结账标识失败');
				setTimeout('checkApplyLock()',call_interval);
			}
		}, error : function() {
			alert('获取结账标识失败');
	   		setTimeout('checkApplyLock()',call_interval);
	   	}});
}
$('.qdiv-el li a').hover(function(){$(this).next().show();},function(){$(this).next().hide();});
$('.qdiv-el li .tip').addClass('ui-state-highlight ui-corner-all').prepend('<span style="float: left; margin-right: .3em;" class="ui-icon ui-icon-info"></span>');
// 加载页面 
$(function(){
// 查询按钮
$('#qfrm-submit').button({icons:{primary:"ui-icon-search"}}).click(function(){openReport(urls.html,'rptvw')});	
$('#qfrm-reset').button({icons:{primary:"ui-icon-refresh"}}).click(function(){$('#qfrm')[0].reset();});	
//输入控件渲染
$('#applyLock').button({icons:{primary:"ui-icon-search"}});	
$('#un_applyLock').button({icons:{primary:"ui-icon-search"}});	

$.jyform.dateBox({select:$('#stlmDate'),maxDate:new Date()}); 
// 操作按钮
$('#rptExcel').click(function(){openReport(urls.excel, '_blank');});
$('#rptExcel').button({ text: true, icons: { primary: "ui-icon-print" }});
// Menu 渲染
/* $.jyform.menulist('operate'); */
$.jyform.toolbarfix('rpt-toolbar');

checkApplyLock();

$('#applyLock').click(function(){
	$.ajax({url:urls.lock
	,dataType : 'json'
	,success:function(data) {
		if ( !confirm('是否要进行结账?') ) {
			return;
		}
		if (data.success) {
			var desc;
			if (data.root[0].paramValue == '0') {
				desc = '未结账';
			} else if (data.root[0].paramValue == '1') {
				desc = '已结账'; 
			} else {
				desc = '未知';
			}
			$('#lockDesc').val(desc);
			alert('操作成功');
		} else {
			alert('操作失败 原因是'+ data.syserr);
		}
	}
	});
	
});

$('#un_applyLock').click(function(){
	$.ajax({url:urls.unlock
	,dataType : 'json'
	,success:function(data) {
		if ( !confirm('是否要解除结账?') ) {
			return;
		}
		if (data.success) {
			var desc;
			if (data.root[0].paramValue == '0') {
				desc = '未结账';
			} else if (data.root[0].paramValue == '1') {
				desc = '已结账'; 
			} else {
				desc = '未知';
			}
			$('#lockDesc').val(desc);
			alert('操作成功');
		} else {
			alert('操作失败 原因是'+ data.syserr);
		}
	}
	});
	
});
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