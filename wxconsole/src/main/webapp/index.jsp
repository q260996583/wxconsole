<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>彩票综合管理系统</title>
<link rel="shortcut icon" href="r/img/icon/favicon.ico"  type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="plugins/ext/resources/css/ext-all.css" />
<link type="text/css" rel="stylesheet" href="css/console.css" />
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
.ext-ie .x-form-text{margin-top:-1px;margin-bottom:-1px;height:22px;line-height:18px;}p{width:650px;}.settings{background-image:url(plugins/ext/resources/images/default/folder_wrench.png);}.nav{background-image:url(plugins/ext/resources/images/default/folder_go.png);}BODY,td,th{FONT-SIZE:12px;BACKGROUND:#fff;FONT-FAMILY:'Microsoft YaHei', SimHei, SimSun}BODY{PADDING-RIGHT:0px;PADDING-LEFT:0px;PADDING-BOTTOM:0px;MARGIN:0px;PADDING-TOP:0px}div{WORD-BREAK:break-all;WORD-WRAP:break-word}a{COLOR:#006600;TEXT-DECORATION:none}a:hover{TEXT-DECORATION:underline}
.h{PADDING-RIGHT:0.4em;PADDING-LEFT:0.4em;BACKGROUND:url(images/bg.png) #9AC0CD repeat-x 0px -200px;PADDING-BOTTOM:0.2em;COLOR:#006600;PADDING-TOP:0.2em;BORDER-BOTTOM:#deead2 1px solid;TEXT-ALIGN:center}.menu{BORDER-RIGHT:#deead2 1px solid;BORDER-TOP:#deead2 1px solid;BACKGROUND:#fff;BORDER-LEFT:#deead2 1px solid;BORDER-BOTTOM:#deead2 1px solid;POSITION:absolute}.menu td,th{PADDING:0px;BACKGROUND:#fff;MARGIN:0px;}.menu LI{PADDING:0px;BACKGROUND:#fff;MARGIN:0px;}.menu UL{PADDING:0px;BACKGROUND:#fff;MARGIN:0px;}.menu LI{LIST-STYLE-TYPE:none}.menu a{PADDING-RIGHT:15px;DISPLAY:block;PADDING-LEFT:15px;BACKGROUND:#fff;PADDING-BOTTOM:0px;PADDING-TOP:0px}.menu a:hover{BACKGROUND:#E0EEEE;COLOR:#000000;TEXT-DECORATION:none}.menu UL.ul1 LI a{PADDING-RIGHT:0px;DISPLAY:inline;PADDING-LEFT:0px;PADDING-BOTTOM:0px;PADDING-TOP:0px}.s1{COLOR:#008000}.s2{COLOR:#984b98}.s3{COLOR:#fa891b}.s4{COLOR:#0033ff}.s5{COLOR:#659b28}.f_one{BACKGROUND:#ffffff}.bt{height:21px;BORDER:#7EBF4F 1px solid;PADDING-RIGHT:3px;PADDING-LEFT:1px;font-family:"Arial";FONT-SIZE:9pt;FONT-COLOR:#000000;FILTER:progid:DXImageTransform.Microsoft.Gradient ( GradientType = 0,StartColorStr = #ffffff,EndColorStr = #B3D997 );CURSOR:hand;COLOR:#000000;PADDING-TOP:3px;}

#north {background-color: #fff; border-top: 5px solid #285577; }
.title-logo {height:34px; float: left; margin-left: .4em; }
.app-title{
color: #004892; font-size: 18px; font-style: italic; font-weight: 700; float: left; padding-top: .2em; 
text-shadow: 0 0 1px #4378AF ;
/* filter:glow(color=#4378AF, strength=5);  */
filter:progid:DXImageTransform.Microsoft.MotionBlur(strength=3, direction=145);
font-size:20px\0; 
}
.guide { padding: .7em .5em; text-align: right; letter-spacing: 1px; color: #004892; font-size:14px\0; }
.guide a { color: #004892; text-decoration: none; padding: .1em .2em; margin: 0px 0px; border: 0px solid #DFE8F6; border-radius:2px; letter-spacing: 1px;  }
.guide a:hover {/* background-color: #F0F8FF;  */ font-weight: 700; text-decoration: none; border: 0px solid #FFFFFF; }

#companyInfo {text-align: center; color: #004892; border-top: 1px solid #99BBE8; }
#changepwd-form td.flabel, #coi_form td.flabel{width:80px;}
#changepwd-form td, #coi_form td{ background-color: none;} 
</style>
</head>
<body>
<div id="north">
<div class="title-logo"><!-- <img src="r/img/icon/sx_logo_xs.png" style="width:35px;" /> --></div>
<div class="app-title">福利彩票</div>
<div class="guide">
    <span class=s3>&raquo;欢迎您:</span>
    <span class=s5 style="FONT-WEIGHT: bold"><s:property value="userDetail.opName"/></span>
    <a  id="changeSignInfoBtn" style="cursor:pointer;">修改信息</a>|
    <a  id="changePWBtn" style="cursor:pointer;">密码修改</a>|<a href="j_spring_security_logout">安全退出</a>
</div>
</div>
<div id="companyInfo">福利彩票</div>
</body>




<div id="changepwd" style="display:none">
<form id="changepwd-form">
	<table class="ftable" width="100%" >
	<tr>
		<td class="flabel">原始密码 </td>
		<td class="fcontent"><input name="passwdOrg" type="password" id="cpd_password" /><span id="cpd_passwordTip" /></td>
	</tr>
	<tr>
		<td class="flabel">新密码</td>
		<td class="fcontent"><input name="passwd" type="password" id="cpd_passwd" /><span id="cpd_passwdTip" /></td>
	</tr>
	<tr>
		<td class="flabel">重复新密码</td>
		<td class="fcontent"><input name="passwdrep" type="password" id="cpd_passwdrep"/><span id="cpd_passwdrepTip" /></td>
	</tr>
	<!--wxb
	<tr>
		<td class="flabel">短信验证码</td>
		<td class="fcontent">
			<input name="phoCheCode"  id="phoCheCode"/>
		 	<input id="btnSendCode" type="button" value="获取验证码" onclick="sendMessage()" />  
		<!--	<button id="btnSendCode" onclick="sendMessage()">获取验证码</button>-->
		</td>
	</tr>  -->
	</table>
	<div>
		密码要求：8~15位由英文字母、数字和特殊字符(<span style="color: red;">!@#$</span>)组成<br/>
		例如：aaa1111! 
	</div>
</form>
</div>

<!-- change operator info -->
<div id="coi_div" style="display: none;">
<form id="coi_form" >
<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td class="flabel"><font color="red">*</font>操作员姓名:</td>
		<td class="fcontent"><input id="coi_op_name" name="op_name" maxLength="10" /><span id="coi_op_nameTip"/></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>证件类型:</td>
		<td class="fcontent">
			<select id="coi_cert_type_no" name="coi_cert_type_no">
				<option value="01" selected="selected">身份证</option>
			</select><span id="coi_cert_type_noTip" />
		</td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>证件号:</td>
		<td class="fcontent"><input id="coi_cert_no" name="cert_no" maxLength="18" /><span id="coi_cert_noTip" /></td>
	</tr>
	<tr>
		<td class="flabel">电话:</td>
		<td class="fcontent"><input id="coi_phone" name="phone" maxLength="40" /><span id="coi_phoneTip" /></td>
	</tr>
	<tr>
		<td class="flabel">E-MAIL:</td>
		<td class="fcontent"><input id="coi_email" name="email" maxLength="40" /><span id="coi_emailTip" /></td>
	</tr>
	<tr>
		<td class="flabel">描述:</td>
		<td class="fcontent"><textarea id='coi_description' name="description" cols="30" rows="1" maxLength="200"></textarea><span id="coi_descriptionTip" /></td>
	</tr>
	<tr>
		<td class="flabel">备注:</td>
		<td class="fcontent"><textarea id='coi_misc' name="misc" cols="30" rows="1"></textarea><span id="coi_miscTip" /></td>
	</tr>
	<tr>
		<td class="flabel">预留信息:</td>
		<td class="fcontent"><input id="coi_reserved2" name="reserved2" maxLength="60" /><span id="coi_reserved2Tip" /></td>
	</tr>
</table>
</form>
</div>

<script type="text/javascript" charset="utf-8">

Ext.BLANK_IMAGE_URL = 'plugins/ext/resources/images/default/s.gif';
var buttonAutor = '<%=request.getAttribute("buttonsAuthor")%>';
var buttonAutors=buttonAutor.split(',');
 
var menunode = <s:text name="resData"/>;
var menuTree = new Ext.tree.TreePanel({
	split : true,	autoScroll : true, width:220, region:'center', collapseFirst:false , 
	loader: new Ext.tree.TreeLoader({ preloadChildren: true, clearOnLoad: false}),
	root  : new Ext.tree.AsyncTreeNode({ text:'管理控制台', id:'root', expanded:true, children: menunode[0].children})
});

IFrameComponent = Ext.extend(Ext.BoxComponent, {
	onRender : function(ct, position){
		this.el = ct.createChild({tag: "iframe", id: "iframe-"+ this.id, frameBorder: 0, src: this.url});
	}
});

var tabs = new Ext.TabPanel({
	enableTabScroll:true,
	region: 'center',
	activeTab: 0,
	defaults:{autoScroll:true},
	// plugins: new Ext.ux.TabCloseMenu(),
	items:[{
		id:'INDEX_PAGE', title: '首页', layout:'fit',frame:true , items: [new IFrameComponent({id: 'INDEX_PAGE', url: 'welcome.jsp'})], closable:false			
		 /* autoLoad: {url:'welcome.jsp'}	 */
		}]	
});
    	
function addTab(node_id,node_text,_href){
	var _id = node_id;
	var _tab = tabs.findById(_id);
	if(_tab) {
		if(_href.indexOf('refresh=true')>0)	
		document.getElementById('iframe-'+_id).contentWindow.location.replace(_href);
		tabs.activate(_id);
		return;
	}
	if(tabs.items.length>10){
		Ext.Msg.alert('提示', '标签数量过多,请关闭不必要的标签项');
		return;
	}
	var t= new IFrameComponent({id: _id, url: _href});
	tabs.add({id: _id, title: node_text, layout:'fit', frame:true, items: [t],	closable:true }).show();
}
	
menuTree.on("click", function(node, e){
	e.stopEvent();
	if(node.isLeaf()&&node.attributes.href){
		addTab(node.id,node.text,node.attributes.href);			
	}
}.createDelegate(this));	

var bodyContent = new Ext.Viewport({
	layout: 'border',
	items: [
		{layout:'border',  width:280, split:true, collapsible: true, region:'west'
			, title: '综合管理系统', id:'westBorder'
			, items:[menuTree, new Ext.BoxComponent({region:'south', height: 20, el: 'companyInfo' }) ]},
		new Ext.BoxComponent({region: 'north', height : 40, el: 'north'}), 
		tabs 
	],
	renderTo: Ext.getBody()
});
menuTree.animate = false;
menuTree.expandAll();
menuTree.animate = true;

function frmDate(v) {
	if ( v ) {
		return v.substr(4,2) + '/' + v.substr(6,2) + '/' + v.substr(0,4);
	}
	return v;
}


/*wxb  */
var InterValObj; //timer变量，控制时间  
var count = 180; //间隔函数，1秒执行  
var curCount;//当前剩余秒数  
function sendMessage() {  
    curCount = count;  	  
        //设置button效果，开始计时  
        $("#btnSendCode").attr("disabled", "true");  
        $("#btnSendCode").val("请在" + curCount + "秒内输入验证码" );  
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
        $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");  
    }  
}



$().ready(function() {
	$.formValidator.initConfig({ formid:'changepwd-form', validatorgroup:'2',onerror : function(msg,obj) { 	alert(msg); $(obj).focus();}});
	$("#cpd_password").formValidator({validatorgroup:'2', empty : false, onshow : "请输入内容", oncorrect : "√" })
		.inputValidator({ min : 1, max : 20, onerror : "密码最多20个字符" });
	$("#cpd_passwd").formValidator({validatorgroup:'2', empty : false, onshow : "请输入内容", oncorrect : "√" })
		.inputValidator({ min: 8, max: 20, onerror : "密码为8~20个字符" })
		.regexValidator({ regexp : regexEnum.passwd_strong, onerror : "密码强度不足" });
	$("#cpd_passwdrep").formValidator({ validatorgroup:'2',empty : false, onshow : "请输入内容", oncorrect : "√" })
		.compareValidator({ desid : "cpd_passwd", operateor : "=", onerror : "2次密码不一致,请确认" });

	$.formValidator.initConfig({ formid:'coi_form', validatorgroup:'3',onerror : function(msg,obj) { 	alert(msg); $(obj).focus();}});
	$("#coi_op_name").formValidator({validatorgroup:"3", empty: false, onshow: "请输入内容", oncorrect: "√" }).inputValidator({ min: 1, max: 10, onerror: "用户名最多10个汉字或20个英文字母" });
	$("#coi_cert_no").formValidator({validatorgroup:"3", empty: false, onshow: "请输入内容", oncorrect: "√" }).inputValidator({ min: 18, max: 18, onerror: "证件号长度18位" }).functionValidator({ fun: isCardID });
	$("#coi_email") .formValidator({validatorgroup:"3", empty: true, oncorrect: "√" }) .inputValidator({ min: 1, max: 40, onerror: "EMAIL最多40个英文字母" }) .regexValidator( { regexp: "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", onerror: "邮箱格式不正确" });
	$("#coi_reserved2").formValidator({validatorgroup:"3", empty: true, oncorrect: "√"}) .inputValidator({min: 1, max: 60, onerror: "预留信息最多可输入60个中英文字符。" });

	// change operator info
	var changeOperInfo = function() {
		if ($.formValidator.pageIsValid('3')) {
			$.ajaxForm({formId: 'coi_form', url: 'doUpdateLoginOperInfo.action', 
				success : function(data) {
					if (data.success == true) {
						alert('操作成功！'); $('#coi_div').dialog('close');
					} else
						alert('操作失败：' + data.syserr);
					}
			});
		} 
	};
	$('#coi_div').dialog({title: "修改用户信息", width: 550, height: 350, bgiframe: true,
		autoOpen: false, draggable: false, resizable: false, modal: true
		, buttons:{
			'确定': changeOperInfo,
			'取消': function(){$(this).dialog('close'); }} 
	});
	$('#changeSignInfoBtn').click(function() {
		$('#coi_form')[0].reset();
		// 异步加载用户信息
		$.ajax({url:'loadLoginOperInfo.action', type:'POST', dataType:'json', async:false
			, success: function(data){
				if ( data && data.success ) {
					$.fillForm('coi_form', data.root[0]);
				} else { alsert('加载用户信息失败! ');}
		}});
		$('#coi_div').dialog('open');
	});
	
	
	// change password
	var changePwd = function() {
		var oldpwd = $('#changepwd input[name="passwdOrg"]').val();
		var newpwd = $('#changepwd input[name="passwd"]').val();
		var pwdrep = $('#changepwd input[name="passwdrep"]').val();
		//wxb 
		var phoCheCode = $('#changepwd input[name="phoCheCode"]').val();
		if (newpwd == "" || newpwd == "" || oldpwd == "") { alert("密码不许为空"); return; }
		if (newpwd != pwdrep) { alert("密码和确认密码输入不一致"); return; }
		// formValidator check
		if ($.formValidator.pageIsValid('2')) {
			$.ajax({url: 'doResetAccountPasswd.action', dataType : 'json', type : "POST",
				data: { 'newpwd' : newpwd, 'oldpwd' : oldpwd,'phoCheCode':phoCheCode},
				success : function(data) {
					if (data.success == true) {
						$('#changepwd').dialog('close');
						alert("密码修改成功， 注销后重新登录！");
						$('#changepwd input').val('');
						$('#changepwd').dialog('close');
						window.location = "j_spring_security_logout";
					} else
						alert(data.syserr);
					}
			});
		}
	};
	
	
	//获取商户手机号    wxb
	$("#btnSendCode").click(function(){
		$.ajax({
			url:'getMerPhoneNo.action',
			type: 'POST',
			dataType:'json',	
			success:function(data){			
				if(data){
	        		alert("验证码已发送！"); 
	        	}else{
	        		alert("没有预留手机号");
	        	}
			}
		});
	});
	
	
	
	$('#changepwd').dialog({title: "修改密码", width: 440, height: 200, bgiframe: true,
		autoOpen: false, draggable: false, resizable: false, modal: true });
	
	$('#changePWBtn').click(function() {
		$('#changepwd').dialog('option',{title: "修改密码", buttons: {
			'确定': changePwd,
			'取消': function(){$(this).dialog('close'); }
		} });
		//$('#changepwd input').val('');   /*wxb  */
		$('#changepwd').dialog('open');
	});
	<c:choose>
		<c:when test="${userDetail.passwdExpireTime lt userDetail.loginTime}">
		$('#changepwd').dialog('option',{title: "修改密码", buttons: {
			'确定': changePwd
		} });
		$('#changepwd').dialog('open');
		$('#changepwd').parent().find('.ui-dialog-titlebar-close').remove();
		</c:when>
		<c:otherwise>
		<c:if test="${expireInTen}" >
		alert("密码即将过期，请尽快修改！");
		</c:if>
		</c:otherwise>
	</c:choose>
});
</script>
</html>