<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>

<script type="text/javascript">

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
			url : "../LoginServlet",
			async : false,
			data : "info=" + JSON.stringify(oriData), 
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {

					alert('登录成功!');

// 					webjs.getUid(msg.data);
					
					window.location.href = 'accout.jsp';
				}else {
					alert('登录失败!请检查用户名和密码是否正确。');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var msg="登录失败!";
				switch (XMLHttpRequest.status)
				{
									 
					case 200:
				  		msg="登录成功!";
				  		break;
					case 404:
						msg="登录失败!请检查用户名和密码是否正确。";
				  		break;
					default:
						msg="网络异常，请稍后再试。";
						break;
				  			
				}
				alert(msg);

			}
		});


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