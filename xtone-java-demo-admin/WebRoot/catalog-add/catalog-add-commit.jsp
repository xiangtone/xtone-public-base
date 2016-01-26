<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.demo.service.UserService"%>
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
<%@ include file="../admin/inc-receive-body.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.getSession(true);
	User user = (User) session.getAttribute("user");
	PreparedStatement ps = null;
	Connection con = null;
	int adds = 0;
	String msg = "添加失败!";
	try {
		
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setLongSerializationPolicy(LongSerializationPolicy.STRING);
		Gson gson = gsonBuilder.create();
		Content content = gson.fromJson(info, Content.class);
	
		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "insert into tbl_cms_catalogs (content) values (?)";
		ps = con.prepareStatement(sql);	

		int m = 1;
		ps.setString(m++, content.getCatalog());
		adds = ps.executeUpdate();
		if (adds != 0) {
			ContentRsp contentRsp = new ContentRsp();
			contentRsp.setStatus("success");
			contentRsp.setData(content);
			String rsp = gson.toJson(contentRsp);
			out.print(rsp);
		} else {	
			out.print("{\"status\":\"error\",\"data\":\"" + msg + "\"}");
		}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		
		out.print("{\"status\":\"error\",\"data\":\"" + msg + "\"}");
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