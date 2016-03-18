<%@page import="com.account.domain.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<%
	request.getSession(true);
	MyUser user=(MyUser)session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
%>
<script type="text/javascript">

	function update() {
		var name=$("#name");
		var old_pwd=$("#old_pwd");
		var new_pwd = $("#new_pwd");
		var re_new_pwd = $("#re_new_pwd");
		
		if(isNullOrEmpty(name.val())){
			var tip="登录异常,请重新登录后重试!";
			alert(tip);
			webjs.toastShort(tip);
			window.location.href="login.jsp";
		}
		
		if(old_pwd.val().length<6||old_pwd.val().length>20){
			var tip="请输入旧的6-20位数密码!";
			alert(tip);
			webjs.toastShort(tip);
			pwd.focus();
			return;
		}
		
		if(new_pwd.val().length<6||new_pwd.val().length>20){
			var tip="请输入新的6-20位数密码!";
			alert(tip);
			webjs.toastShort(tip);
			pwd.focus();
			return;
		}
		
		if (new_pwd.val()!= re_new_pwd.val()) {
			var tip="两次输入的新密码不一致!请重新输入!";
			alert(tip);
			webjs.toastShort(tip);
			re_new_pwd.value="";
			re_new_pwd.focus();
			return;
		}

		var oriData = {
			name : name.val().trim(),
			pwd : old_pwd.val().trim(),
			newPwd : new_pwd.val().trim()
		};

		$.ajax({
			type : "post",
			url : "../ChangePwdServlet",
			cache : false,
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {
				var tip='';
				if (msg.status == "success") {
					tip='密码修改成功!';
					window.history.back(-1);
				}else if (msg.status == "errPwd") {
					tip='输入的旧密码不正确!';
					old_pwd.focus();
				} else {
					tip='登录异常!请重新登录!';
					window.location.href='login.jsp';
				}
				alert(tip);
				webjs.toastShort(tip);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var tip="密码修改失败!";
				switch (XMLHttpRequest.status)
				{
					case 404:
						tip="密码修改失败!";
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
<style type="text/css">
.ok_button{
	width: 50%;
	height:35px;
	font-size: 15px;
	margin: 20px 0 10px 0;
	padding: 1px 0 1px 0;
}
.cancle_button{
	width: 50%;
	height:35px;
	font-size: 15px;
	margin: 20px -5px 10px 0;
	padding: 1px 0 1px 0;
}
</style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
		<div class="magin_lr">
			<div class="divCenter">
<input type="hidden" id="name" value="<%=user.getName()%>"/>
<input type="password" class="m_input" id="old_pwd" maxlength="20" placeholder="请输入旧密码"/><br/>
<input type="password" class="m_input" id="new_pwd" maxlength="20" placeholder="请输入新密码"/><br/>
<input type="password" class="m_input" id="re_new_pwd" maxlength="20" placeholder="请再次输入新密码"/><br/>
<input type="button" class="ok_button" value="确&nbsp;认&nbsp;修&nbsp;改" onclick="update()"/>
<input type="button" class="cancle_button" value="取&nbsp;消&nbsp;修&nbsp;改" onclick="javascrip:window.history.back(1);"/>
	</div>
	</div>
</body>
</html>