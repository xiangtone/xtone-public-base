<%@page import="org.demo.info.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.getSession(true);
	User user = (User) session.getAttribute("user");
	PreparedStatement ps = null;
	Connection con = null;
	ResultSet rs = null;
	String sql = "";
	try{
		con = ConnectionService.getInstance().getConnectionForLocal();
		sql = "SELECT isAdmin FROM `tbl_base_users` WHERE id="+user.getId();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()){
			user.setAdmin(rs.getInt("isAdmin"));
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
	
<!-- 	<a href="seldown-all.jsp" class="menus">下载链接点击量查询</a> -->
<%-- 	<% --%>
<!-- // 			if(user.getAdmin() == 1){ -->
<!-- // 				out.write("<a href='code-all.jsp' class='menus'>兑换码列表</a>"); -->
<!-- // 				out.write("<a href='user-all.jsp' class='menus'>用户管理</a>"); -->
<!-- // 				out.write("<a href='catalog-all.jsp' class='menus'>文章类型</a>"); -->
<!-- // 			} -->
<%-- 	%> --%>
    <a href="code.stat-all.jsp" class="menus">兑换码列表</a>
	<a href="code.jsp" class="menus">导入兑换码</a>
	<a href="gift.jsp" class="menus">填写礼包内容</a>
	<a href="code.num.jsp" class="menus">各游戏兑换码剩余量查看</a>
	<a href="code.password-update.jsp" class="menus">更换密码</a>
	<a href="code.catalog-all.jsp" class="menus">添加游戏</a>
</div>
