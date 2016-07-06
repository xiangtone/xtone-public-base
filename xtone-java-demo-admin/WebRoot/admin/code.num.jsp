<%@page import="org.demo.util.Logconnectionservice"%>
<%@page import="org.demo.info.Mxklsel"%>
<%@page import="org.demo.info.Catalog"%>
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

<title>各游戏兑换码剩余量查看</title>

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
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.js"></script> 
</head>

<body>
<jsp:include page="code.menu.jsp"/>

<div style="margin-top:35px;" align="center">

</div>

<script>

 </script> 
<%-- 	<jsp:include page="menu.jsp"/> --%>
<!-- 	<input type="button" style="width: 150px;height: 30px;margin-bottom: 10px;margin-left:10px" value="新增文章类型" onclick="window.location.href='catalog-add.jsp'" > -->
	<table id="table_id" class="display">
		<thead>
			<tr><th></th>
				<th>游戏名称</th>
				<th>剩余兑换码数量</th>
				
				
			</tr>
		</thead>
		<tbody>
			<%
			
			  PreparedStatement ps1 = null;
			
			
							Connection con = null;
							ResultSet rs = null;
							ResultSet rs2 = null;
							PreparedStatement ps2 = null;
							
						
							try {
								con = ConnectionService.getInstance()
										.getConnectionForLocal();
								String sql1 = "SELECT gamename,COUNT(*) AS num FROM `tbl_exchange_codes` WHERE gameName NOT LIKE '%meng%' AND matchOpenIdTime IS NULL GROUP BY gamename";
							
								ps1 = con.prepareStatement(sql1);
						
							
							rs = ps1.executeQuery();
								ps2 = con.prepareStatement("select content from tbl_cms_catalogs where id=?");
							
								while (rs.next()) {
									String gamename = rs.getString("gamename");
									ps2.setString(1, gamename);
									rs2 = ps2.executeQuery();
									if(rs2.next())
									gamename = rs2.getString("content");
									
									
									
									
			%>
			<tr>
			    <td></td>
				<td><%=gamename%></td>
				<td><%=rs.getString("num")%></td>
			
				
			     
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
