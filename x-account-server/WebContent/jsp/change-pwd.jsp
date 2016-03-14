<%@page import="com.account.domain.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			alert("登录异常,请重新登录后重试!");
			window.location.href="login.jsp";
		}
		
		if(isNullOrEmpty(old_pwd.val())){
			alert("旧密码不能为空!");
			old_pwd.focus();
			return;
		}
		
		if(isNullOrEmpty(new_pwd.val())){
			alert("新密码不能为空!");
			new_pwd.focus();
			return;
		}
		
		if (new_pwd.val()!= re_new_pwd.val()) {
			alert("两次输入的新密码不一致!请重新输入!");
			re_new_pwd.value="";
			re_new_pwd.focus();
			return;
		}

		var oriData = {
			name : name.val.trim(),
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

				if (msg.status == "success") {
					alert('密码修改成功!');
					window.history.back(-1);
				} else {
					alert('');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var msg="密码修改失败!";
				switch (XMLHttpRequest.status)
				{
					case 404:
						msg="密码修改失败!";
				  		break;
					default:
						msg="网络异常，请稍后再试。";
						break;
				  			
				}
				alert(msg);
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
<input type="hidden" id="name" value="<%=user.getName()%>"/>
<input type="password" class="m_input" id="old_pwd" placeholder="请输入旧密码"/><br/>
<input type="password" class="m_input" id="new_pwd" placeholder="请输入新密码"/><br/>
<input type="password" class="m_input" id="re_new_pwd" placeholder="请再次输入新密码"/><br/>
<input type="button" class="ok_button" value="确&nbsp;认&nbsp;修&nbsp;改" onclick="update()"/>
<input type="button" class="cancle_button" value="取&nbsp;消&nbsp;修&nbsp;改" onclick="javascrip:window.history.back(1);"/>

</body>
</html>