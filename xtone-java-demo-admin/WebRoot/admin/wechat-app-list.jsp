<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.demo.info.Content"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.demo.service.WechatBaseService"%>
<%@page import="org.demo.info.WechatToken"%>
<!DOCTYPE html>
<%
	List<WechatToken> wechatAppList = WechatBaseService.getInstance().getAllAppId();
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>wechatList</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- code.jquery.com -->
<script src="../js-css/jquery-1.7.js"></script>
<script src="../js-css/base.js"></script>

<script src="../js-css/ie-emulation-modes-warning.js"></script>

<link href="../js-css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script src="../js-css/bootstrap-datetimepicker.js" charset="UTF-8"></script>

<!-- DataTables -->
<link rel="stylesheet" type="text/css"
	href="../js-css/jquery.dataTables-1.10.4.css">
<script charset="utf8" src="../js-css/jquery.dataTables-1.10.4.min.js"></script>

<script charset="utf8" src="../js-css/private-wechat.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<table id="table_id" class="display">
		<thead>
			<tr>
				<th>appId</th>
				<th>operate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (WechatToken wechatToken : wechatAppList) {
			%>
			<tr>
				<td><%=wechatToken.getAppId()%></td>
				<td><button
						onclick="javascript:goWechatMenu('<%=wechatToken.getAppId()%>');">menu</button></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js-css/ie10-viewport-bug-workaround.js"></script>
</body>
<script>
	function goWechatMenu(appId) {
		location = 'wechat-menu.jsp?appId=' + appId;
	}
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
</html>
