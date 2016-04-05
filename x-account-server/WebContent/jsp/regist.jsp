<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<script type="text/javascript">

	function regist() {
		var pwd=$("#pwd");
		var name = $("#name");
		var re_pwd = $("#re_pwd");
// 		var phone = $("#phone");
		
		var oriData;
		
		if(isNullOrEmpty(name.val())||name.val().length>20){
			var tip="请输入1-20字用户名!";
			alert(tip);
			webjs.toastShort(tip);
			name.focus();
			return;
		}
		
		if(pwd.val().length<6||pwd.val().length>20){
			var tip="请输入6-20位数密码!";
			alert(tip);
			webjs.toastShort(tip);
			pwd.focus();
			return;
		}
		
		if ( pwd.val()!= re_pwd.val()) {
			var tip="两次输入的密码不一致!请重新输入!";
			alert(tip);
			webjs.toastShort(tip);
			re_pwd.value="";
			re_pwd.focus();
			return;
		}
		
// 		if(!mail_reg.test(email.val())){
// 			webjs.toastShort("请输入正确的邮箱!");
// 			email.focus();
// 			return;
// 		}
		
// 		if(!phoneRight(phone.val())){
// 			var tip="请输入正确11位手机号码!";
// 			alert(tip);
// 			webjs.toastShort(tip);
// 			phone.focus();
// 			return;
// 		}

		var oriData = {
			name : name.val().trim(),
			pwd : pwd.val().trim(),
// 			phone : phone.val().trim()
		};

		$.ajax({
			type : "post",
			url : "../RegsitServlet",
			cache : false,
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {
				var tip='';
				if (msg.status == "success") {
					tip='注册成功';
					window.history.back(-1);
				} else if(msg.status == "errRepeat"){
					tip='用户名已被注册!请更换您的用户名。';
				} else{
					tip='注册失败!请稍后重试。';
				}
				alert(tip);
				webjs.toastShort(tip);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var tip="注册失败!";
				switch (XMLHttpRequest.status)
				{
					case 404:
						tip="用户名不可用!请更换您的用户名。";
				  		break;
					default:
						tip="网络异常，请稍后再试。";
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
			<font class="top_tip">注册</font><br>
<input type="text" class="m_input input_border" id="name" maxlength="20" placeholder="请输入用户名"/><br/>
<input type="password" class="m_input input_border" id="pwd" maxlength="20" placeholder="请输入密码"/><br/>
<input type="password" class="m_input input_border" id="re_pwd" maxlength="20" placeholder="请再次输入密码"/><br/>
<!-- <input type="text" class="m_input" id="phone" style="IME-MODE: disabled;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11" placeholder="请输入手机号，方便日后找回账号"/><br/> -->
<input type="button" class="btn_mp single_button input_border button_color" value="注册" onclick="regist()"/><br/>
<a href="login.jsp" class="foget_pwd_a text_a">已有帐号</a>
	</div>
	</div>
</body>
</html>