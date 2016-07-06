<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.demo.info.User"%>
<%@page import="org.demo.info.Content"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.demo.json.ContentRsp"%>
<%@page import="com.google.gson.LongSerializationPolicy"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.demo.util.EscapeUnescape"%>
<%@ include file="inc-receive-body.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.getSession(true);
	User user = (User) session.getAttribute("user");
// 	String info = new String(EscapeUnescape.unescape(request.getParameter("info")));

	PreparedStatement ps = null;
	
	Connection con = null;
	ResultSet rs = null;
	int adds = 0;
	try {
	con = ConnectionService.getInstance().getConnectionForLocal();
	ps = con.prepareStatement("delete from tbl_games where id=?");
	ps.setString(1, request.getParameter("f"));
	ps.executeUpdate();
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