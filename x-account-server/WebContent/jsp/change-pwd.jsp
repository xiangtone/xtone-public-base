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

<input type="password" class="m_input" id="pwd" placeholder="请输入旧密码"/><br/>
<input type="password" class="m_input" id="pwd" placeholder="请输入新密码"/><br/>
<input type="password" class="m_input" id="re_pwd" placeholder="请再次输入新密码"/><br/>
<input type="button" class="ok_button" value="确&nbsp;&nbsp;&nbsp;认&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;改" onclick="regist()"/>
<input type="button" class="cancle_button" value="取&nbsp;&nbsp;&nbsp;消&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;改" onclick="regist()"/>

</body>
</html>