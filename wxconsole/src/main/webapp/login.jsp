<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-store, must-revalidate"> 
<meta http-equiv="expires" content="0">
<title>福利彩票综合管理系统</title>
<link rel="shortcut icon" href="r/img/icon/favicon.ico"  type="image/x-icon" />
<link href="r/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="r/bootstrap-3.3.5-dist/libs/html5shiv.min.js"></script>
  <script src="r/bootstrap-3.3.5-dist/libs/respond.min.js"></script>
<![endif]-->
<style type="text/css" media="screen, projection">
<!--
body{
	background-color: #7090A8;
	font-family: "Microsoft YaHei", SimHei, SimSun;
	padding-top: 90px;
}
.div-signin { 
	width: 300px;
	text-align: center;
	margin: 0 auto;
}
.form-signin-title {
	color: #fff;
}
.panel-default {
	border-radius: 4px; 
	behavior: url(r/jquery/ie-css3.htc);
}
.panel-default > .panel-heading{
	background-color: #fff;
	border-bottom: none;
}
.btn {
    background-image: none;
    border: medium none;
    border-radius: 3px;
    box-shadow: none;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 0;
    outline: medium none !important;
    padding: 8px 16px;
    text-shadow: none;
}
.input.btn {
    outline: medium none;
}
.btn-lg {
    padding: 16px 28px;
}
.btn-sm {
    font-size: 12px;
    padding: 4px 8px;
}
.btn-sm i {
    font-size: 14px;
}
.btn-xs {
    font-size: 12px;
    padding: 1px 5px;
}
.btn-primary {
    background: none repeat scroll 0 0 #7191a8;
    color: white !important;
}
.btn-primary:hover, .btn-primary:focus {
    background: none repeat scroll 0 0 #61859e;
    text-decoration: none;
}
.btn-primary:active, .btn-primary.active {
    background: none repeat scroll 0 0 #61859e;
    outline: 0 none;
}
.auth-company {
	color: #fff;
}
.auth-company a{
	color: #fff;
	text-decoration: none;
}

#softkb_div {display: block; position: absolute; width: 393px; height: 145px; background-image: url(security/softkb); overflow:none; z-index: 1000; }
.soft_key{display:block; position:absolute; border-radius: 3px; background-color: none ;height: 29px; width: 29px;
filter:alpha(opacity=50);-moz-opacity:0.50;opacity:0.50;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;-khtml-user-select:none;user-select:none;}
.soft_key:hover{background-color:#0000FF; }

.soft_ckey{display:block; position:absolute; border-radius: 3px; background-color: none ;height: 29px;
filter:alpha(opacity=50);-moz-opacity:0.50;opacity:0.50;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;-khtml-user-select:none;user-select:none;}
.soft_ckey:hover{background-color:#0000FF; }
-->
</style>
</head> 
<body>
<div class="container">
	<div class="div-signin">
		<h2 class="form-signin-title" id="logo">福利彩票综合管理系统</h2>
		<br/>
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>
				<c:if test="${param.login_error==1}">
					<font color="red"> <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.</font>
				</c:if>
				<c:if test="${param.login_error==2}">
					<font color="red"><c:out value="验证码错误！" /></font>
				</c:if> 
				<!--wxb  -->
				<c:if test="${param.login_error==3}">
					<font color="red"><c:out value="短信验证错误！" /></font>
				</c:if> 
				</strong>
			</div>
			<div class="panel-body">
				<!--<form class="form-signin" id="loginForm" role="form" action="softkb_security" method="POST">-->
				<form class="form-signin" id="loginForm" role="form" action="j_spring_security_check" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="账号" name="j_username" id="securityLogNm" required autofocus maxlength="20" /> 
					</div>
					<div class="form-group" id="passwdinput">
						<input type="password" class="form-control" placeholder="密码" name="j_password" id="securityPasswd" maxlength="20" />
					</div>
					<!-- <div class="form-group" id="softkbinput" >
						<input type="text" class="form-control" placeholder="密码" id="passwdDisplay" name="skb_password" maxlength="20" required="required"/>
						<input type="hidden" name="skb_password" id="passwdInput" />
					</div> -->
					<!-- <div class="form-group input-group">
						<input class="form-control" name="j_code" id="verifyCode" maxlength="4" type="text" placeholder="验证码"/>
						<span class="input-group-addon" style="padding: 0;">
					    	<img src="Captcha.jpg" style="width: 100px; max-height: 30px;" onclick="this.src='Captcha.jpg?r='+Math.random();" >
					    </span>			
					</div> -->
					
					<!-- wxb 
					<div class="form-group">						
							<input type="text" class="form-control" placeholder="短信验证码" name="phoCheCode" id=""phoCheCode""  required autofocus maxlength="10" 
								style="width:110px;display:inline-block;float:left"/> 
							<input id="btnSendCode" type="button" style="folat:left;display:inline-block;top:5px" value="获取短信验证码" onclick="sendMessage()" />
					</div>-->
					
					
					<hr>
					<div class="row">
						<div class="col-md-4">
							<a class="btn btn-primary" role="button" id="loginBtn" href="javascript:void(0);">登录</a>
						</div>
						<div class="col-md-8 text-left">
							<input id="isRemember" type="checkbox" checked="checked" />&emsp;记住用户名<br/>
							<small style="color: #555;">忘记密码请联系系统管理员</small>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div><!-- /container -->
<div class="text text-center auth-company">福利彩票</div>

<script type="text/javascript" src="r/plugins/jquery/jquery-1.11.0.min.js"></script>
<script src="r/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="r/jquery/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="r/plugins/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="r/plugins/jquery/ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="r/plugins/jquery/jquery.cookie.js"></script>
<script type="text/javascript">
if(self!=top){
	top.location="login.jsp";
}
var USERNAME = "USERNAME";
if ( $.cookie(USERNAME) ) {
	$('input[name="j_username"]').val($.cookie(USERNAME));
}
var loginFormSubmit = function() {
	if ( $('#isRemember').attr('checked')) {
		$.cookie(USERNAME, $('input[name="j_username"]').val(), {expires: 7})
	} else {
		$.removeCookie(USERNAME);
	}
	$('#loginForm')[0].submit();
};
$('#loginForm input').bind('keydown', function(e){
	if ( e.which == 13 ) {
		loginFormSubmit();
	}
});
$('#loginBtn').click(function(){ loginFormSubmit();});


/*wxb  */
var InterValObj; //timer变量，控制时间  
var count = 180; //间隔函数，1秒执行  
var curCount;//当前剩余秒数  
function sendMessage() {  
    curCount = count;  	  
        //设置button效果，开始计时  
        $("#btnSendCode").attr("disabled", "true");  
        $("#btnSendCode").val("请在" + curCount + "秒内输入" );  
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次  	    
}  
//timer处理函数  
function SetRemainTime() {  
    if (curCount == 0) {                  
        window.clearInterval(InterValObj);//停止计时器  
        $("#btnSendCode").removeAttr("disabled");//启用按钮  
        $("#btnSendCode").val("重新获取验证码");  	         
    }  
    else {  
        curCount--;  
        $("#btnSendCode").val("请在" + curCount + "秒内输入");  
    }  
}
//获取商户手机号    wxb
$("#btnSendCode").click(function(){
	var loginNm=$('#securityLogNm').val();
	var passwdDisplay=$('#passwdDisplay').val();
	var verifyCode=$('#verifyCode').val();
	if(!loginNm){
		alert("请输入账号！");
		return false;
	}else if(!passwdDisplay){
		alert("请输入密码！");
		return false;
	}else if(!verifyCode){
		alert("请输入验证码！");
		return false;
	}
	$.ajax({
		url:'getMerPhoneNoLog.action', 
		type: 'POST',
		dataType:'json',
		data:{'loginNm' : loginNm,},
		success:function(data){			
			if(data){
        		alert("验证码已发送！"); 
        	}else{
        		alert("没有预留手机号");
        	}
		}
	});
});

var urls = {
skb:'softkb_security',
sec:'j_spring_security_check'
};
var shift = false;
var securityLogin = false;
var initSoftkb = function() {
	/* $('#logo').click(function(){
		securityLogin = !securityLogin;
		if ( securityLogin ) {
			alert('切换密码输入模式为键盘.');
			$('#softkbinput').hide();
			$('#passwdinput').show();
			$('#passwdDisplay').removeAttr('required');
			$('#securityPasswd').attr('required','true');
			$('#loginForm').attr('action',urls.sec);
		} else {
			alert('切换密码输入模式为图片软键盘.');
			$('#passwdinput').hide();
			$('#softkbinput').show();
			$('#securityPasswd').removeAttr('required');
			$('#passwdDisplay').attr('required','true');
			$('#loginForm').attr('action',urls.skb);
		}
	}); */
	
	$('#passwdDisplay').click(function(){
		$('#softkb_div').show();
	});
	$('#skb_close').click(function(){
		$('#softkb_div').hide();
	});
	$('#skb_reset').click(function(){
		$('#passwdInput').val('').change();
	});
	$('#skb_backspace').click(function(){
		var val = $('#passwdInput').val();
		if ( val.indexOf(',') >= 0 ) {
			$('#passwdInput').val(val.substr(0, val.lastIndexOf(','))).change();
		}
	});
	$('.soft_key').click(function(){
		var val = shift?$(this).attr('sftId'):$(this).attr('id');
		$('#passwdInput').val($('#passwdInput').val() + ',' + val ).change();
	});
	$('#passwdInput').change(function() {
		var val = $(this).val();
		$('#passwdDisplay').val('');
		if ( val ) {
			var arr = val.split(',');
			var dispVal = '';
			$.each(arr, function(_i,_n){
				if ( _n.length > 0 ) {
					dispVal += '*';
				}
			});
			$('#passwdDisplay').val(dispVal);
		} 
	});
	$('#skb_shift').click(function(){
		shift = !shift;
		if ( shift ) {
			$('#softkb_div').css({'backgroundPosition':'0 -145px'});
		} else { 
			$('#softkb_div').css({'backgroundPosition':'0 0'});
		}
	});
	
	$('#passwdInput').val('').change();
};

$(function(){
	//initSoftkb();
	
	$('input[name="j_username"]').placeholder();
	$('input[name="j_password"]').placeholder();
	$('input[name="j_code"]').placeholder();
	$('input[name="phoCheCode"]').placeholder();/*wxb  */
});
</script>
</body>    
</html>
