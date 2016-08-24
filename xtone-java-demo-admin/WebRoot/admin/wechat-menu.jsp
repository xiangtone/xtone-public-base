<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.demo.info.Content"%>
<%@page import="org.demo.service.WechatMenuService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
if (request.getParameter("appId")==null){
	response.getWriter().write("appId is null");
	return;
}
WechatMenuService wechatMenuService = new WechatMenuService();
String currentMenu = wechatMenuService.queryMenuFromWechat(request.getParameter("appId"));
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>wechat菜单</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- code.jquery.com -->
<script src="../js-css/jquery-1.7.js"></script>
<script src="../js-css/base.js"></script>

<script src="../js-css/ie-emulation-modes-warning.js"></script>

<link href="../js-css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript"
	src="../js-css/bootstrap-datetimepicker.js" charset="UTF-8"></script>

</head>

<body>
	<jsp:include page="menu.jsp" />

<%=currentMenu %>
	<button id="btnSetMenu">向微信设置默认菜单</button>
	<script type="text/javascript">
		$(function() {
			$('#btnSetMenu').click(function() {
				$.ajax({
					type : "post",
					url : "wechat-menu-set-default-commit.jsp",
					async : false,
					data : "",
					dataType : "json",
					success : function(msg) {
						if (msg.status == "success") {
							alert("success");
						} else {
							ajaxGetNotSuccessMsg(msg);
						}
					},
					error : ajaxNetworkError
				});
			});
		});
	</script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js-css/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
