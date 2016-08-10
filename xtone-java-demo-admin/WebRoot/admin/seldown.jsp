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

<title>浏览量下载量查看</title>

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
<div style="margin-top:35px;" align="center">
请选择渠道：
<select id="select">
<option id="uc" value="uc">uc</option>
<option id="jr" value="jr">今日头条</option>
<option id="zh" value="zh">智汇推</option>



</select>
</div>

<script>
 var sel = document.getElementById("select"); 
 var s = document.location.href; 
 var opid = s.substr(s.length-2,2) 

  if(opid=='sp') 
 	; 
 else{
 var op = document.getElementById(opid).selected="selected"; 
 } 
 sel.onchange=function(){ 
 	document.location.href ="seldown.jsp?f="+sel.value; 
	
 }
 </script> 
<%-- 	<jsp:include page="menu.jsp"/> --%>
<!-- 	<input type="button" style="width: 150px;height: 30px;margin-bottom: 10px;margin-left:10px" value="新增文章类型" onclick="window.location.href='catalog-add.jsp'" > -->
	<table id="table_id" class="display">
		<thead>
			<tr><th></th>
				<th>日期</th>
				<th>from</th>
				<th>首页浏览量</th>
				<th>游戏下载量</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			 String f = request.getParameter("f");
			String qd;
			if(f==null){
				qd = "uc";
			}
			else
				qd = f;
			  PreparedStatement ps1 = null;
			
			  PreparedStatement ps3 = null;
							Connection con = null;
							ResultSet rs1 = null;
							
							ResultSet rs3 = null;
							Mxklsel mxklsel =new Mxklsel();
							try {
								con = Logconnectionservice.getInstance()
										.getConnectionForLocal();
								String sql1 = "SELECT FROM_UNIXTIME(id/1000/1000000, '%Y-%m-%d') AS dt,SUBSTRING(para01,1,33) as para01,para01 as fr,count(*) as n FROM `log_async_last_hundred_days` where logid=2001 and para01 like ? AND para01 NOT LIKE '%SELECT%' GROUP BY FROM_UNIXTIME(id/1000/1000000, '%Y-%m-%d'),para01 ORDER BY id DESC";
							
								ps1 = con.prepareStatement(sql1);
						
								ps1.setString(1, "f="+qd+"%");
								
// 								System.out.println(ps1);
// 								System.out.println(ps2);
								
								rs1 = ps1.executeQuery();
								
							
								while (rs1.next()) {
									String dt = rs1.getString("dt");
									String from = rs1.getString("fr");
									System.out.println(dt);
									String sql3 = "SELECT COUNT(*) as n FROM `log_async_last_hundred_days` WHERE logid=2002  and FROM_UNIXTIME(id/1000/1000000, '%Y-%m-%d')=? and para01=? AND para01 NOT LIKE '%SELECT%'";
									ps3 = con.prepareStatement(sql3);
									
									ps3.setString(1, dt);
									ps3.setString(2, from);
									rs3 = ps3.executeQuery();
									if(rs3.next())
										mxklsel.setDownnum(rs3.getInt("n"));
									else
										mxklsel.setDownnum(0);
									
									System.out.println(ps3);
								mxklsel.setDate(dt);
								
								mxklsel.setPaynum(rs1.getInt("n"));
								mxklsel.setFrom(rs1.getString("para01"));
									
			%>
			<tr>
			    <td></td>
				<td><%=mxklsel.getDate()%></td>
				<td><%=mxklsel.getFrom()%></td>
				<td><%=mxklsel.getPaynum()%></td>
				<td><%=mxklsel.getDownnum()%></td>
				
			     
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
