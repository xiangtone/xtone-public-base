<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width"><!-- 控制手机获取输入框焦点时不缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>用户登录</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<%-- <% request.getSession(true); --%>
<%-- session.invalidate();%> --%>
<script type="text/javascript">

	function submitBtn() {
		
		var name=$("#username");
		var pwd=$("#pwd");
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
		var oriData = {
			name : name.val().trim(),
			pwd : pwd.val().trim()
		};
		$.ajax({
			type : "post",
			url : "../LoginServlet",
			async : false,
			data : "info=" + JSON.stringify(oriData), 
			dataType : "json",
			success : function(msg) {
				var tip='';
				if (msg.status == "success") {
					tip='登录成功!';
					window.location.href = 'account.jsp';
					
					webjs.setUser(JSON.stringify(msg.data));
				}else {
					tip='登录失败!请检查用户名和密码是否正确。';
				}
				alert(tip);
				webjs.toastShort(tip);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var tip="登录失败!";
				switch (XMLHttpRequest.status)
				{
					case 200:
						tip="登录成功!";//json格式不正确会返回200
				  		break;
					case 404:
						tip="登录失败!请检查用户名和密码是否正确。";
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

		<form action="/adTest/LoginServlet" method="get" id="login_form">
			<font class="top_tip ">登录</font><br>
			<input type="text" class="m_input input_border" name="username" id="username" maxlength="20" placeholder="请输入用户名"/>
			<input type="password" class="m_input input_border" name="pwd" id="pwd" maxlength="20" placeholder="请输入密码"/>
			<input type="button" class="btn_mp single_button input_border button_color" id="submit" value="登录" onclick="submitBtn()" /><br /> 
			<a href="regist.jsp" class="regist_a text_a">注册新帐号</a>
<!-- 			<a href="forget-pwd.jsp" class="foget_pwd_a text_a">忘记密码?</a><br /> -->
		</form>
			</div>
	</div>
</body>
</html>