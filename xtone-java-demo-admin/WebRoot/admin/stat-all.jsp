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
<%@page import="org.common.util.ConnectionService"%>
<%@page import="org.demo.info.Content"%>
<%
  TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
			Calendar calendar = Calendar.getInstance();
			String today = calendar.get(Calendar.YEAR) + "-"
					+ (calendar.get(Calendar.MONTH) + 1) + "-"
					+ calendar.get(Calendar.DAY_OF_MONTH);
			String dateFrom = request.getParameter("dateFrom") == null
					? today
					: request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo") == null
					? today
					: request.getParameter("dateTo");
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>所有文章</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- code.jquery.com -->
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../js-css/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
	<%--<div class="con tainer">

		<form class="form-signin" role="form">
			from:<input size="10" name="dateFrom" type="text"
				value="<%=dateFrom%>" class="form_datetime"> 00:00:00 to:<input
				size="10" name="dateTo" type="text" value="<%=dateTo%>"
				class="form_datetime"> 23:59:59
			<script type="text/javascript">
				$(".form_datetime").datetimepicker({
					format : 'yyyy-mm-dd',
					minView : 2,
					autoclose : 1
				});
			</script>

			<button type="submit" name="submit" value="1">view</button>
		</form>

	</div> --%>
	<%
// 	  if (request.getParameter("submit") != null
// 						&& request.getParameter("submit").equals("1")) {
	%>
	<jsp:include page="menu.jsp"/>	
	<input type="button" style="width: 150px;height: 30px;margin-bottom: 10px;margin-left:10px" value="新增文章" onclick="window.location.href='content-add.jsp'" >
	<table id="table_id" class="display">
		<thead>
			<tr>
				<th>id</th>
				<th>标题</th>
				<th>类型</th>
				<!-- <th>内容</th>-->
				<th>状态</th>
				<th>作者</th>
				<th>创建时间</th>
				<th>最后修改人</th>
				<th>最后修改时间</th> 
				<th>优先级</th> 
				<td></td>
			</tr>
		</thead>
		<tbody>
			<%
				Content content;
			  	PreparedStatement ps = null;
							Connection con = null;
							ResultSet rs = null;
							try {
								con = ConnectionService.getInstance()
										.getConnectionForLocal();
								//String sql = "SELECT FROM_UNIXTIME(id/1000/100000, '%Y-%m-%d') AS dt,service_id,msg,msg_type,status_report,send_status,COUNT(DISTINCT link_id) AS ct FROM receives WHERE id>=UNIX_TIMESTAMP('"+dateFrom+" 0:0:0')*1000*100000 AND id<=UNIX_TIMESTAMP('"+dateTo+" 23:59:59')*1000*100000  GROUP BY FROM_UNIXTIME(id/1000/100000, '%Y-%m-%d'),     service_id,msg,msg_type,status_report,send_status ORDER BY dt DESC";
								String sql = "SELECT c.id,c.title,c.catalog,c.`status`,u1.`username` AS addname,c.`addTime`,u2.`username` AS lastname,c.lastModifyTime,priority FROM `tbl_cms_contents` c LEFT JOIN `tbl_base_users` u1 ON c.`authorId`=u1.`id` LEFT JOIN `tbl_base_users` u2 ON c.`lastModifyId`= u2.`id`;";
								ps = con.prepareStatement(sql);
								rs = ps.executeQuery();
								while (rs.next()) {
									content=new Content();
									content.setId(rs.getInt("id"));
									content.setTitle(rs.getString("title"));
									content.setCatalog(rs.getString("catalog"));					
									content.setStatus(rs.getInt("status"));
									content.setAuthorName(rs.getString("addname"));
									content.setLastModifyName(rs.getString("lastname"));
									content.setAddTime(rs.getLong("addTime"));
									content.setLastModifyTime(rs.getLong("lastModifyTime"));
									content.setPriority(rs.getInt("priority"));
									
// 									String catalogStr="null";
// 									if("news".equals(catalog)){
// 										catalogStr="新闻";
// 									}else if("material".equals(catalog)){
// 										catalogStr="资料";
// 									}else if("forum".equals(catalog)){
// 										catalogStr="论坛";
// 									}else{
// 										catalogStr=catalog;
// 									}									
			%>
			<tr>
				<td><%=content.getId()%></td>
				<td><%=content.getTitle()%></td>
				<td><%=content.getCatalog()%></td>
				<%--<td><%=rs.getString("content")%></td>--%>
				<td><%=content.getStatusStr()%></td>
				<td><%=content.getAuthorName()%></td>
				<td><%=content.getAddTimeStr()%></td> 
				<td><%=content.getLastModifyName()%></td>
				<td><%=content.getLastModifyTimeStr()%></td> 
				<td>
					<input id="priority<%=content.getId()%>" placeholder="优先级"
					value="<%=content.getPriority()%>" name="title" type="text"
					style="width: 80px; height: 25px">&nbsp;<input
					style="font-size: 15px; width: 70px; height: 28px" type="button"
					value="确认" onclick="updatePriority(<%=content.getId()%>)">
				</td>
				<td>
				<a href="content-update.jsp?id=<%=rs.getInt("id")%>">编辑</a>&emsp;
<%-- 				<a href="content-preview.jsp?id=<%=rs.getInt("id")%>" target="_blank">预览</a>&emsp;--%>
				<a href="content-show-hidden.jsp?id=<%=rs.getInt("id")%>&status=<%=content.getStatus()%>"><%=content.getStatusStr()%></a></td>
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


		function updatePriority(id) {
			// 		if (document.getElementById("content").value.trim() == "") {
			// 			alert("兑换码为空！");
			// 			return false;
			// 		}
			var oriData = {
				id : id,
				priority : $("#priority"+id).val(),
			};
			
			$.ajax({
				type : "post",
				url : "priority-update-commit.jsp?",
				async : false,
				data : JSON.stringify(oriData),
				dataType : "json",
				success : function(msg) {

					if (msg.status == "success") {

						alert('修改优先级成功!');

					} else {
						alert('修改优先级失败!');
					}
				},
				error : function() {
					alert('修改优先级失败!');

				}
			});
		}
	
	</script>
	<%
// 	  }
	%>

	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js-css/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
