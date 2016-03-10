<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="jquery-1.7.js"></script>
<script type="text/javascript" src="js/base.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			alert("Text: " + $("#test").text());
		});
		$("#btn2").click(function() {
			alert("HTML: " + $("#test").html());
		});
	});

	function submitBtn() {
		var name=$("#username");
		var pwd=$("#pwd");
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
		var oriData = {
			userName : name.val().trim(),
			password : pwd.val().trim()
		};
		$.ajax({
			type : "post",
			url : "LoginServlet",
			async : false,
			data : "info=" + JSON.stringify(oriData), 
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {

					alert(msg.data);

					webjs.getUid(msg.data);

				} else {
					
					alert('邮箱或密码错误!');
					
				}
			},
			error : function(msg) {
				
				alert('登录失败!'+msg.data);
				
				webjs.getUid(msg.data);

			}
		});

		//show();

	}

	function show() {
		alert("dfdsf");
	}

	function showUid() {
		//javascript:xtongjs.getUid("oooooooooooo")
		webjs.getUid("获取uid");
	}
</script>


</head>
<body>
	<div class="divCenter">

		<form action="/adTest/LoginServlet" method="get" id="login_form">
			<font class="login_tip">请先登录:</font><br>
			<input type="text" class="m_input" name="username" id="username" placeholder="请输入用户名"/><br />
			<input type="password" class="m_input" name="pwd" id="pwd" placeholder="请输入密码"/><br />
			<input type="button" class="login_button" id="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录" onclick="submitBtn()" /><br /> 
			<a href="regist.jsp" class="regist_a text_a">注册</a><a href="#" class="foget_pwd_a text_a">忘记密码?</a>
		</form>
	</div>

</body>
</html>