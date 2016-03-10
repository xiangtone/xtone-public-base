<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="jquery-1.7.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript">

	function regist() {
		var pwd=$("#pwd");
		var name = $("#name");
		var re_pwd = $("#re_pwd");
		var email = $("#email");
		var phone = $("#phone");
		if(isNullOrEmpty(name.val())){
			alert("用户名不能为空!");
			name.focus();
			return;
		}
		
		if(isNullOrEmpty(pwd.val())){
			alert("密码不能为空!");
			pwd.focus();
			return;
		}
		
		if ( pwd.val()!= re_pwd.val()) {
			alert("两次输入的密码不一致!请重新输入!");
			re_pwd.value="";
			re_pwd.focus();
			return;
		}
		
		if(!isNullOrEmpty(phone.val())&&phone.val().length!=11){
			alert("输入11位手机号码!");
			phone.focus();
			return;
		}

		var oriData = {
			name : name.val().trim(),
			pwd : pwd.val().trim(),
			email : email.val().trim(),
			phone : phone.val().trim()
		};

		$.ajax({
			type : "post",
			url : "RegsitServlet",
			cache : false,
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {

					//	alert(msg.data);

					alert('注册成功');
					window.history.back(-1);
				} else {
					alert('注册失败>>>');
				}
			},
			error : function() {

				alert('注册失败!');

			}
		});

	}
</script>



</head>
<body>

<input type="text" class="m_input" id="name" placeholder="请输入用户名"/><br/>
<input type="password" class="m_input" id="pwd" placeholder="请输入密码"/><br/>
<input type="password" class="m_input" id="re_pwd" placeholder="请再次输入密码"/><br/>
<input type="text" class="m_input" id="email" placeholder="请输入邮箱地址，方便日后找回账号"/><br/>
<input type="text" class="m_input" id="phone" style="IME-MODE: disabled;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11" placeholder="请输入手机号，方便日后找回账号"/><br/>
<input type="button" class="login_button" value="注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册" onclick="regist()"/><br/>
<a href="#" onclick="javascript:window.history.back(-1)" class="foget_pwd_a text_a">已有帐号</a>

</body>
</html>