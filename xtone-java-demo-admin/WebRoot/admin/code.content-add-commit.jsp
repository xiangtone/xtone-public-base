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
	PreparedStatement ps2 = null;
	Connection con = null;
	ResultSet rs = null;
	int adds = 0;
	try {
		
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setLongSerializationPolicy(LongSerializationPolicy.STRING);
		Gson gson = gsonBuilder.create();
		Content content = gson.fromJson(info, Content.class);
		long time = new Date().getTime();
		content.setAuthorId(user.getId());
		content.setAddTime(time);
		content.setLastModifyId(user.getId());
		content.setLastModifyTime(time);
	    String[] codeary = content.getContent().split(",");
		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "insert into tbl_exchange_codes(id,gamename) values(?,?)";
		ps = con.prepareStatement(sql);	
		ps2 = con.prepareStatement("select id from tbl_cms_catalogs where content = ? ");
		ps2.setString(1, content.getCatalog());
		rs = ps2.executeQuery();
		String id =null;
		
		if(rs.next())
			id = rs.getString("id");
		 ps.setString(2,id);
		 System.out.println(id);
    for(String tem : codeary){
		
	   
	    ps.setString(1, tem);
		
		adds = ps.executeUpdate();}
		if (adds != 0) {
			ContentRsp contentRsp = new ContentRsp();
			contentRsp.setStatus("success");
			contentRsp.setData(content);
			String rsp = gson.toJson(contentRsp);
			out.print(rsp);
		} else {	
			out.print("{\"status\":\"error\"}");
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