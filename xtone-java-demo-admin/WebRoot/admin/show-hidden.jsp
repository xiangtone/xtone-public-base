<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.demo.service.UserService"%>
<%@page import="org.demo.info.User"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
	request.setCharacterEncoding("UTF-8");
	int status = Integer.parseInt(new String(request.getParameter("status").trim()))==1?0:1;
	String StrId = new String(request.getParameter("id").trim());
	int id = Integer.parseInt(StrId);

	PreparedStatement ps = null;
	Connection con = null;
	int updates = 0;
	try {
		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "UPDATE tbl_cms_contents SET status=? WHERE id=?";
		ps = con.prepareStatement(sql);
		int m = 1;
		ps.setInt(m++, status);
		ps.setInt(m++, id);
		updates = ps.executeUpdate();
		String str = null;
		if (updates != 0) {
			if(status==1){
				str = "已发布!";
			}else{
				str = "已隐藏!";
			}			
		}
		out.print("<script>alert('" + str + "');location.href='stat-all.jsp';</script>");
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