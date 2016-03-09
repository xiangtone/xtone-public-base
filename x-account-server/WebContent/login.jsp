<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="jquery-1.7.js"></script>


<style type="text/css">
.divCenter {
	margin: 0px auto;
	text-align: center
}

body {
	margin: 0px auto;
}
</style>



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
		var oriData = {
			userName : $("#username").val(),
			password : $("#pwd").val()
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
			error : function() {
				
				alert('登录失败!');

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
	<div>

		<form action="/adTest/LoginServlet" method="get" id="login_form">

			用户名: <input type="text" name="username" id="username" /><br />
			密码:<input type="text" name="pwd" id="pwd" /><br /> <input
				type="button" value="登录" id="submit" onclick="submitBtn()"/> <a
				href="regist.jsp">注册</a>

		</form>
	</div>

</body>
</html>