<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.demo.service.UserService"%>
<%@page import="org.demo.info.User"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.demo.info.User"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.getSession(true);
	User user=(User)session.getAttribute("user");
	
	String title = new String(request.getParameter("title").trim());
	String content = new String(request.getParameter("content").trim());
	String catalog = new String(request.getParameter("catalog").trim());
	String StrId = new String(request.getParameter("id").trim());
	int id = Integer.parseInt(StrId);

	PreparedStatement ps = null;
	Connection con = null;
	int updates = 0;
	String str = null;
	try {
		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "UPDATE tbl_cms_contents SET title=?,catalog=?,content=?,lastModifyId=?,lastModifyTime=? WHERE id=?";
		ps = con.prepareStatement(sql);
 		long time=new Date().getTime();

		int m = 1;
		ps.setString(m++, title);
		ps.setString(m++, catalog);
		ps.setString(m++, content);
		ps.setLong(m++, user.getId());
		ps.setLong(m++, time);
		ps.setInt(m++, id);
		updates = ps.executeUpdate();
		if (updates != 0) {
			str = "更新成功!";
		} else {
			str = "更新失败!";
		}
		out.print("<script>alert('" + str + "');location.href='stat-all.jsp';</script>");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		str = "添加失败!";
		out.print("<script>alert('" + str + "');location.href='stat-all.jsp';</script>");
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