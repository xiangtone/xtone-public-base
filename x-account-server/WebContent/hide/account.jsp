<%@page import="com.account.domain.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<%
	request.getSession(true);
	MyUser user=(MyUser) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("login.jsp");
		return;		
	}
%>
<script type="text/javascript">

	function exit() {
		$.ajax({
			type : "post",
			url : "../AccountServlet",
			async : false,
			success : function(msg) {
				window.location.href = 'login.jsp';
				webjs.clearUser();
				webjs.toastShort('成功退出登录！');
			},
			error : function(){
				window.location.href = 'login.jsp';
			}	
		});
	}
</script>
<style type="text/css">
.circle_head {
	width: 150px;
	height: 150px;
	margin:10px 0 10px 0;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	-o-border-radius: 50%;
	border-radius: 50%;
 	margin-top: 15%;
}

.text_name{
	font-size: 22px;
	color: white;
}
</style>
</head>
<body>
<%-- <jsp:include page="head.jsp"></jsp:include> --%>
		<div class="magin_lr">
			<div class="divCenter">
	<img alt="head" src="../img/ic_head01.png" class="circle_head"><br>
	<font class="text_name"><%=user.getName()%></font><br>
	<div class="account_button input_border" onclick="javascrip:window.location.href='change-pwd.jsp';" style="margin-top: 20px;"><font class="account_select_l">修改密码</font><font class="account_select_r">></font></div>
	<div class="account_button input_border" onclick="exit()"><font class="account_select_l">退出登录</font><font class="account_select_r">></font></div>
<!-- 	<input type="button" class="account_button" value="修改账号信息" onclick="window.location.href = 'updateContent.jsp';"/><br> -->
		</div>
	</div>
</body>
</html>