<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="FuMing">

<title>Login</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../js-css/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
		function signInAjax() {
			
			var oriData = {
				userName : $("#inputEmail").val(),
				password : $("#inputPassword").val()
			};
			$.ajax({
				type : "post",
				url : "check-login.jsp",
				async : false,
				data : "info="+JSON.stringify(oriData),
				dataType : "json",
				success : function(msg) {
										
					if (msg.status == "success") {

						location.href='console.jsp';
						
					} else {
						alert('邮箱或密码错误!'+msg.data);
					}
				},
				error : function () {
					alert('登录失败!');

				}
			});
			
		}
		
	</script>
</head>

<body>

	<div class="container">

		<form class="form-signin" role="form" id="signin">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputEmail" class="sr-only">Email address</label> 
			<input
				type="email" id="inputEmail" class="form-control" name="username"
				placeholder="Email address" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> 
				<input
				name="password" type="password" id="inputPassword"
				class="form-control" placeholder="Password" required>

			<div class="checkbox">
				<label> 
				<input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<input class="btn btn-lg btn-primary btn-block" type="button" onclick="signInAjax()" value="Sign
				in">
		</form>

	</div>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js-css/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">

	</script>

</body>
</html>
