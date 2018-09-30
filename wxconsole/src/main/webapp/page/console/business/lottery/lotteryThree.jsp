<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快3机器人</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>

</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td>
			<input id="runRobot" class="bt" value="启动"  type="button">
			<input id="close" class="bt" value="关闭"  type="button">
  		</td>	
		</tr>
</table>
</form>
</div>
<div id="qrcodeDiv">
	<img id="qrcode"
	alt="" 
	style="display:block;width:40%;"
	src="">
</div>
<script type="text/javascript">
var uuid;
var startFlag = false;
var status = 0;
var stopObj;

var getUUID = function() {
	$.ajax({
		type : 'POST', dataType:'json',
		url : 'getLoginInfo.action?lotteryType=03',
		success : function(data) {
			if (data.success) {
				uuid = data.syserr;
				status = data.status;
			} else {
				alert("请求失败！");
				location.replace(location.href);
				$('#qrcode').attr('src','runRobot.action?uuid=' + uuid);
			}
		}
	});
}

var loop = function () {
	if(true == startFlag) {
		$.ajax({
			type : 'POST',
			url : 'executeRobot.action?uuid=' + uuid + "&lotteryType=03",
			 beforeSend:function(XMLHttpRequest){
				 $("#a_load").dialog('close');
	         },
			success : function(data) {
				if(data) {
					if (data.success) {
						status = data.status;
						$('#qrcode').attr('src','');
						alert("登录成功！");
						clearInterval(stopObj);
					}
				}
			},
			error: function(data) {
			}
		});
	}
}

$(document).ready(function() {
	getUUID();
	
	$('#runRobot').click(function(){
		if(status == 0) {
			$('#qrcode').attr('src','runRobot.action?lotteryType=03&uuid=' + uuid);
			startFlag = true;
		} else {
			alert("机器人已启动!");
		}
	});						
	
	$('#close').click(function(){
		$('#qrcode').attr('src','destoryRobot.action?lotteryType=03');
	});	
	stopObj = setInterval(loop ,3800); //启动定时
});
	
</script>
</body>
</html>