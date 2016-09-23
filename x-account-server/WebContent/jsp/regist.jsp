<%@page import="com.account.domain.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width"><!-- 控制手机获取输入框焦点时不缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>用户注册</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<%@page import="com.account.utils.CacheConfig"%>
<%@page import="com.account.domain.Channel"%>
<%
Channel channel=new Channel();
channel.setChannelId(request.getParameter("channel_id"));
if(request.getParameter("channel_id")!=null){
	 try {
		 channel=CacheConfig.getInstance().getNameLoadingCache(channel.getChannelId());
		} catch (Exception e) {
		}
}else{
	channel.setRegisterType("name");
}
// Channel channel=CacheConfig.getInstance().getNameLoadingCache("uuu9");
// Channel channel=CacheConfig.getInstance().getNameLoadingCache("17173");
%>
<script type="text/javascript">

$(document).ready(function(){
	var registerType='<%=channel.getRegisterType()%>';
	var input_mobile=document.getElementById("mobile");
	var input_email=document.getElementById("email");
	var input_name=document.getElementById("name");
	if(registerType=='mobile'){
		input_email.style.display='none';
		input_name.style.display='none';
	}else if(registerType=='email'){
		input_mobile.style.display='none';
		input_name.style.display='none';
	}else{
		input_email.style.display='none';
		input_mobile.style.display='none';
	}
});

	var waitTime = 60;
	var t = waitTime;
	function getCode(o) {
		if (t == 0) {
			o.removeAttribute("disabled");
			o.value = "获取验证";
			t = waitTime;
		} else {
			o.setAttribute("disabled", true);
			o.value = "重新发送(" + t + ")";
			t--;
			setTimeout(function() {
				getCode(o)
			}, 1000)
		}

	}
	var ifclick=true;
	function regist() {
		if(!ifclick){
			return;
		}
		var pwd = $("#pwd");
		var name = $("#name");
		var re_pwd = $("#re_pwd");
		var phone = $("#phone");
		var email = $("#email");

		var oriData = {
			name : name.val().trim(),
			pwd : pwd.val().trim(),
			phone : phone.val().trim(),
			email : email.val().trim(),
			flagid : undefined,
			channel_id : undefined,
			appkey : undefined,
			loginType : <%=MyUser.LOGINBYNAME%>
		};
		try {
			oriData.flagid = webjs.getFlagId();
		} catch (e) {
		}
		try {
			oriData.channel_id = webjs.getChannel();
		} catch (e) {
		}
		try {
			oriData.appkey = webjs.getAppkey();
		} catch (e) {
		}

		if(document.getElementById("email").style.display!='none'){
			oriData.loginType=<%=MyUser.LOGINBYEMAIL%>;
		}else if(document.getElementById("name").style.display!='none'){
			oriData.loginType=<%=MyUser.LOGINBYNAME%>;
		}else if(document.getElementById("mobile").style.display!='none'){
			oriData.loginType=<%=MyUser.LOGINBYPHONE%>;
		}

		if (!emailRight(email.val())&&document.getElementById("email").style.display!='none') {
			webjs.toastShort("请输入正确的邮箱!");
			email.focus();
			return;
		}

		if (!phoneRight(phone.val())&&document.getElementById("mobile").style.display!='none') {
			var tip = "请输入正确11位手机号码!";
			phone.focus();
			alert(tip);
			webjs.toastShort(tip);
			return;
		}
		
		if(document.getElementById("name").style.display!='none'){
			if (allNum(name.val()) || nameForbidden(name.val())
					|| isNullOrEmpty(name.val()) || name.val().length > 20) {
				var tip = "用户名由1-20位字母和数字组成,不能由纯数字组成，且不能有特殊字符!";
				alert(tip);
				webjs.toastShort(tip);
				name.focus();
				return;
			}
		}

		if (pwd.val().length < 6 || pwd.val().length > 20) {
			var tip = "请输入6-20位数密码!";
			alert(tip);
			webjs.toastShort(tip);
			pwd.focus();
			return;
		}

		if (pwd.val() != re_pwd.val()) {
			var tip = "两次输入的密码不一致!请重新输入!";
			alert(tip);
			webjs.toastShort(tip);
			re_pwd.value = "";
			re_pwd.focus();
			return;
		}
		ifclick=false;
		webjs.showProgressBar();
		$.ajax({
			type : "post",
			url : "../RegsitServlet",
			cache : false,
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {
				webjs.hiddProgressBar();
				var tip = '';
				if (msg.status == "success") {
					webjs.setUser(JSON.stringify(msg));
					webjs.registSuccess(JSON.stringify(msg));
					webjs.closeIfLogin();
					if(msg.data.loginType==<%=MyUser.LOGINBYEMAIL%>){
						window.location.href = 'send-email.jsp?email='+msg.data.email+'&uid='+msg.data.uid;
						return;
					}
					
				} else if (msg.status == "errRepeat") {
					ifclick=true;
					tip = '该用户已被注册!';
					alert(tip);
					webjs.registFailure(msg.status);
					webjs.toastShort(tip);
					name.focus();
				} else {
					ifclick=true;
					tip = '注册失败!请稍后重试。';
					alert(tip);
					webjs.registFailure(msg.status);
					webjs.toastShort(tip);
				}

			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				webjs.hiddProgressBar();
				ifclick=true;
				var tip = "注册失败!";
				switch (XMLHttpRequest.status) {
				case 404:
					tip = "用户名不可用!请更换您的用户名。";
					break;
				default:
					tip = "网络异常，请稍后再试。";
					break;
				}
				alert(tip);
				webjs.toastShort(tip);
			}
		});

	}
</script>



</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
		<div class="magin_lr">
			<div class="divCenter">
			<font class="top_tip">注册</font><br/>
<input type="text" class="m_input input_border" id="email" placeholder="请输入邮箱地址"/>
<input type="text" class="m_input input_border" id="name" maxlength="20" placeholder="请输入用户名"/><br/>
<div id="mobile">
			<input type="text" class="m_input input_border" id="phone" style="IME-MODE: disabled;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11" placeholder="请输入手机号"/>
<input type="text" class="input_border" style="width: 57%;height:30px;margin-top: 20px;text-indent:12px;IME-MODE: disabled;" maxlength="6" placeholder="请输入验证码"/>
<input type="button" class="input_border" id="getCode" style="width: 41%;height:30px;margin-top: 20px;" value="获取验证" onclick="getCode(this)"/><br/>
</div>
<input type="password" class="m_input input_border" id="pwd" maxlength="20" placeholder="请输入密码"/><br/>
<input type="password" class="m_input input_border" id="re_pwd" maxlength="20" placeholder="请再次输入密码"/><br/>
<input type="button" class="double_btn_mp double_button input_border button_color" value="注册" onclick="regist()"/>
<input type="button" class="double_btn_mp double_button input_border button_color" value="取消" onclick="window.location.href = 'login.jsp';"/><br/>
<!-- <a href="login.jsp" class="foget_pwd_a text_a">已有帐号</a> -->
	</div>
	</div>
</body>
</html>