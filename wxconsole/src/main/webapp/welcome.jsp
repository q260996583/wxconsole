<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix='security' uri='http://www.springframework.org/security/tags' %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>收单管理控制台</title>
<script type="text/javascript" src="plugins/ext/ext-base.js"></script>
<script type="text/javascript" src="plugins/ext/ext-all.js"></script>
<link type="text/css" rel="stylesheet"	href="css/ui/jquery-ui-1.8.6.custom.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/validator/formValidator.js"></script>
<script type="text/javascript" src="js/validator/formValidatorRegex.js"></script>
<script type="text/javascript" src="js/ui/jquery.bgiframe.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.dialog.min.js"></script>
<script type="text/javascript" src="js/tojson.js"></script>
<script type="text/javascript" src="js/consoleUtil.js"></script>
<style type="text/css">
body,div,a,span,li,td,h1,h2,h3,h4,h5,h6,p,input{ font-family: 'Microsoft YaHei', SimHei, SimSun;}
body{ background-color: #E1EDFD; text-align: center; padding: 0; margin:0;}
.userinfo { width: 800px; float: left; text-align: left; min-height: 150px; overflow: hidden; color: #1562B4; padding-left: 20px;}
</style>    
</head>
<body>
<div style="margin:auto; background-image: url(r/img/bg/bg-tkm.jpg); background-repeat: no-repeat; background-position:center; height:504px;">
	<div class="userinfo">
		<div >
			<h2>您好！${userDetail.opName }</h2>
		</div>
		<div><!-- 预留信息：${userDetail.reserved2 } --> </div>
		<br />
		<!-- <div>最新置顶公告： </div> -->
		<ul id="noticeList" style="list-style-type:none;">
		</ul>
	</div>
	<div id="tidDetail" style="display: none;">
	<form id="form2" >
		<h4 class="modal-title" id="noticeTitle" ></h4></form>
		<iframe id="noticeContentFrame" name="noticeContentFrame" style="width:100%; border:0; height:370px; "></iframe>
	</div>
	<div style="display: none">
	<form method="POST" id="noticeDetailForm" name="noticeDetailForm" target="noticeContentFrame">
		<input name="jsonObject" id="jsonObject" />
	</form>
	</div>
</div>
</body>
<script>
function frmDate(v) {
	if ( v ) {
		if (v == '19000101000000') {
			return '';
		}
		return v.substr(4,2) + '/' + v.substr(6,2) + '/' + v.substr(0,4);
	}
	return v;
}

$().ready(function() {
	<!--$.ajax({
		type : 'POST', dataType:'json',
		url : 'findTopConsoleNotice.action',
		success : function(data) {
			if (data.success) {
				if (data.root.length > 0) {
					$.each(data.root,function(n,value) {  
						var rec = value;
						var $li = $('<li></li>');
						var $font = $('<font color="red" seq='+ rec.noticeSeq +' title="'+ rec.title +'" startTime="'+ rec.startTime + '" >'+ rec.title +'</font>');
						$font.click(function(){
							var record = new Object();
							record.title = $(this).attr('title'); 
							record.startTime = $(this).attr('startTime'); 
							record.noticeSeq = $(this).attr('seq');
							$('#jsonObject').val($.toJSON(record));
							$('#noticeDetailForm').attr('action', 'findConsoleNoticeContentDetail.action');
							$('#noticeDetailForm')[0].submit();
							$('#noticeTitle').html(record.title + '<br/><small>'+frmDate(record.startTime) + '</small>');
							$('#tidDetail').dialog('open');
						});
						var $font2 = $('<font>'+ frmDate(rec.startTime) +'</font>');
						$li.append($font);
						$li.append($font2);
						$('#noticeList').append($li);
					});
				} 
			} else {
				alert("未找到公告");
			}
		}
	});-->
	$('#tidDetail').dialog({autoOpen : false,bgiframe : true,modal : true,resizable : false,draggable : false,width : 800,height : 500});
	$('#tidDetail').dialog("option","title","公告内容");
	$('#tidDetail').dialog("option","buttons",{'关闭' : function() { $('#form2 :input').attr('disabled',''); $(this).dialog('close'); } });

});
</script>
</html>