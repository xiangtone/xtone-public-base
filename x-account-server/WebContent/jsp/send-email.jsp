<%@page import="com.account.domain.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width"><!-- 控制手机获取输入框焦点时不缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title></title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<%
String email=request.getParameter("email");
String uid=request.getParameter("uid");
%>
<script type="text/javascript">

$(document).ready(function(){
	var oriData = {
			email : "<%=email%>",
			uid : "<%=uid%>"
		}; 
	$.ajax({
		type : "post",
		url : "../EmailServlet",
		cache : false,
		async : false,
		data : "info=" + JSON.stringify(oriData),
		dataType : "json",
		success : function(msg) {
			console.log("success");
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log("error");
		}
	});
});
	
</script>
<style type="text/css">
.m_t{
	margin-top: 30%;
	float: left;
}
</style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
		<div class="magin_lr">
			<div class="divCenter">
			<font class="m_t">激活邮件已发送！<br/>请登录邮箱完成激活！</font>
	</div>
	</div>
</body>
</html>