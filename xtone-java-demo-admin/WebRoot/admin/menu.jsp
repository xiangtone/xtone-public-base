<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	long userid =  Long.valueOf(String.valueOf(session.getAttribute("userid"))).longValue();
	PreparedStatement ps = null;
	Connection con = null;
	ResultSet rs = null;
	List<Long> list = new ArrayList<Long>();
	String sql = "";
	try{
		con = ConnectionService.getInstance().getConnectionForLocal();
		sql = "SELECT id FROM `tbl_base_users` WHERE isAdmin=1";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
			list.add(rs.getLong("id"));
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		out.print("{\"status\":\"error\",\"data\":\"\"}");
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
#navigation ul{
	list-style-type: none;
}
#navigation li{
	float: left;
	font-size: 20px;
}

.menus{
	font-size: 20px; 
	margin-left: 20px;
}

</style>
<div style="margin-top: 5px; margin-left: 10px; margin-bottom: 10px">
	<a href="stat-all.jsp" class="menus" style="margin-left: 0px;">文章列表</a>
<!-- 	<a href="catalog-all.jsp" class="menus">文章类型列表</a> -->
	<a href="code-all.jsp" class="menus">兑换码列表</a>
	<%
		
		for(long id : list){
			if(id == userid){
				out.write("<a href='user-all.jsp' class='menus'>用户管理</a>");
			}
		}
	%>
	<a href="password-update.jsp" class="menus">更换密码</a>
</div>
<!-- <div id="navigation"> -->
<!-- 		<ul> -->
<!-- 		<li>文章列表&nbsp;|&nbsp;</li> -->
<!-- 		<li>兑换码列表</li> -->
<!-- 		</ul> -->
<!-- 		</div> -->

