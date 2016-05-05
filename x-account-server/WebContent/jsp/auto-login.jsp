<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String uid = null;
	try {
		uid = new String(request.getParameter("uid").trim());
	} catch (Exception e) {
		// TODO: handle exception
	}
%>
<script type="text/javascript">
// $(document).ready(function(){

// });
</script>
</head>
<body>
自动登录中。。。
</body>
<script type="text/javascript">
window.onload=function(){
	$.ajax({
		type : "post",
		url : "../LoginServlet",
		async : false,
		data : "info=" + JSON.stringify(<%=uid.trim()%>),
		dataType : "json",
		success : function(msg) {
			webjs.toastShort(a);
			if (msg.status == "success") {
				
				webjs.setUser(JSON.stringify(msg.data));
				webjs.closeWeb();
			}else {
				webjs.clearUser();
			}
			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			
			var tip="登录失败!";
			switch (XMLHttpRequest.status)
			{
				default:
					tip="网络异常，请稍后再试。";
					break;
			  			
			}
			webjs.toastShort(tip);
		}
	});
}
</script>
</html>