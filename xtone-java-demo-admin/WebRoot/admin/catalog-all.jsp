﻿<%@page import="org.demo.info.Catalog"%>
<%@page import="org.demo.info.Content"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.text.SimpleDateFormat"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>文章类型列表</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- code.jquery.com -->
<script src="../js-css/jquery-1.7.js"></script>

<script src="../js-css/ie-emulation-modes-warning.js"></script>

<link href="../js-css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript"
	src="../js-css/bootstrap-datetimepicker.js" charset="UTF-8"></script>

<!-- DataTables -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.js"></script>
</head>

<body>
	<jsp:include page="menu.jsp"/>
	<input type="button" style="width: 150px;height: 30px;margin-bottom: 10px;margin-left:10px" value="新增文章类型" onclick="window.location.href='catalog-add.jsp'" >
	<table id="table_id" class="display">
		<thead>
			<tr>
				<th>id</th>
				<th>文章类型</th>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<%
			  PreparedStatement ps = null;
							Connection con = null;
							ResultSet rs = null;
							Catalog catalog=new Catalog();
							try {
								con = ConnectionService.getInstance()
										.getConnectionForLocal();
								String sql = "SELECT c.id,c.content FROM `tbl_cms_catalogs` c;";
								ps = con.prepareStatement(sql);
								rs = ps.executeQuery();
								while (rs.next()) {
									catalog.setId(rs.getInt("id"));
									catalog.setContent((rs.getString("content")));
									
			%>
			<tr>
				<td><%=catalog.getId()%></td>
				<td><%=catalog.getContent()%></td>
				<td> 
				<a href="catalog-update.jsp?id=<%=catalog.getId()%>">编辑</a>&emsp;
			</tr>
			<%
			  }
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();

							} finally {
								if (con != null) {
									try {
										con.close();
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								}
							}
			%>
		</tbody>
	</table>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js-css/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
