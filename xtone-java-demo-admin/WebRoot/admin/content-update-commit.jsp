<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	User user=(User)session.getAttribute("user");
// 	String info= new String(EscapeUnescape.unescape(request.getParameter("info")));

	PreparedStatement ps = null;
	Connection con = null;
	int updates = 0;

	try {		
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setLongSerializationPolicy(LongSerializationPolicy.STRING);
		Gson gson = gsonBuilder.create();
		Content content = gson.fromJson(info, Content.class);
		long time = new Date().getTime();
		content.setLastModifyId(user.getId());
		content.setLastModifyTime(time);

		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "UPDATE tbl_cms_contents SET title=?,catalog=?,content=?,lastModifyId=?,lastModifyTime=?,subTitle=? WHERE id=?";
		ps = con.prepareStatement(sql);	

		int m = 1;	
		ps.setString(m++, content.getTitle());
		ps.setString(m++, content.getCatalog());
		ps.setString(m++, content.getContent());
		ps.setLong(m++, content.getLastModifyId());
		ps.setLong(m++, content.getLastModifyTime());
		ps.setString(m++, content.getSubTitle());
		ps.setInt(m++, content.getId());
		updates = ps.executeUpdate();
		
		if (updates != 0) {
			ContentRsp contentRsp = new ContentRsp();
			contentRsp.setStatus("success");
			contentRsp.setData(content);
			String rsp = gson.toJson(contentRsp);
			out.print(rsp);
		} else {			
			out.print("{\"status\":\"error\",\"data\":\"" + info + "\"}");
		}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		out.print("{\"status\":\"error\",\"data\":\"" + info + "\"}");
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