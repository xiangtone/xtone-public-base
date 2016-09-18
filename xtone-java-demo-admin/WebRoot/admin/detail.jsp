<%@page import="org.demo.info.Detail"%>
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

<title>流量明细查看</title>

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
<jsp:include page="menu.jsp"/>
<a href="detail.jsp" class="menus">流量明细查看</a>


<%-- 	<jsp:include page="menu.jsp"/> --%>
<!-- 	<input type="button" style="width: 150px;height: 30px;margin-bottom: 10px;margin-left:10px" value="新增文章类型" onclick="window.location.href='catalog-add.jsp'" > -->
	<table id="table_id" class="display">
		<thead>
			<tr><th></th>
				<th>日期时间</th>
				<th>ip</th>
				<th>操作</th>
				<th>from</th>
				
				
				
			</tr>
		</thead>
		<tbody>
			<%
		
			  PreparedStatement ps1 = null;
			
							Connection con = null;
							ResultSet rs1 = null;
					
							Detail detail = new Detail();
							try {
								con = Logconnectionservice.getInstance()
										.getConnectionForLocal();
								String sql1 = "SELECT FROM_UNIXTIME(id/1000/1000000, '%Y-%m-%d %H:%i:%s') AS dt,para03 AS ip,logid AS operate,para01 AS f FROM `log_async_last_hundred_days` WHERE logid=2001 OR logid=2002 AND para01 NOT LIKE '%SELECT%' order by id desc limit 0,200";
							
								ps1 = con.prepareStatement(sql1);
								
								
							
// 							
								
								rs1 = ps1.executeQuery();
							
								while (rs1.next()) {
									String operate;
									if(rs1.getInt("operate")==2001)
										operate = "浏览首页";
									else
										 operate = "点击下载";
									detail.setDate(rs1.getString("dt"));
									detail.setIp(rs1.getString("ip"));
									detail.setOperate(operate);
									detail.setFrom(rs1.getString("f"));
									
						
			%>
			<tr>
			    <td></td>
				<td><%=detail.getDate()%></td>
				<td><%=detail.getIp()%></td>
				<td><%=detail.getOperate()%></td>
				<td><%=detail.getFrom()%></td>
				
			     
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
