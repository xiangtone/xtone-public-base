<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.demo.service.UserService"%>
<%@page import="org.demo.info.User"%>
<%@page import="org.demo.info.Code"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.demo.json.CodeRsp"%>
<%@page import="com.google.gson.LongSerializationPolicy"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.demo.util.EscapeUnescape"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.getSession(true);
	User user = (User) session.getAttribute("user");
	String info = new String(EscapeUnescape.unescape(request.getParameter("info")));

	PreparedStatement ps = null;
	Connection con = null;
	int updates = 0;
	
	try {
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setLongSerializationPolicy(LongSerializationPolicy.STRING);
		Gson gson = gsonBuilder.create();
		Code code = gson.fromJson(info, Code.class);
		
		con = ConnectionService.getInstance().getConnectionForLocal();	
		String sql = "UPDATE tbl_exchange_codes SET content=? WHERE id=?";
		ps = con.prepareStatement(sql);

		int m = 1;
		ps.setString(m++, code.getContent());
		ps.setLong(m++, code.getId());
		updates = ps.executeUpdate();

		if (updates != 0) {
			CodeRsp codeRsp = new CodeRsp();
			codeRsp.setStatus("success");
			codeRsp.setData(code);
			String rsp = gson.toJson(codeRsp);
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