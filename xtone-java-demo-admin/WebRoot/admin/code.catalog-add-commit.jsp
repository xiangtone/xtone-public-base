<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.demo.info.Catalog"%>
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.demo.json.CatalogRsp"%>
<%@page import="com.google.gson.LongSerializationPolicy"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.demo.util.EscapeUnescape"%>
<%@ include file="../admin/inc-receive-body.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.getSession(true);
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	ResultSet rs = null;
	Connection con = null;
	int adds = 0;
	try {
		
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setLongSerializationPolicy(LongSerializationPolicy.STRING);
		Gson gson = gsonBuilder.create();
		Catalog catalog = gson.fromJson(info, Catalog.class);
	  System.out.println(catalog.getContent());
		con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "insert into tbl_cms_catalogs (id,content) values (?,?)";
		ps = con.prepareStatement(sql);	
        ps2 = con.prepareStatement("select * from tbl_games where id = ?");
        ps2.setLong(1, catalog.getId());
       rs = ps2.executeQuery();
       System.out.println("a"+ps2);
       if(!rs.next()){
    	   ps2 = con.prepareStatement("INSERT INTO `tbl_games` VALUES (?,md5(?),null)");
    	   System.out.println("b"+ps2);
    	   ps2.setLong(1, catalog.getId());
    	   ps2.setLong(2,catalog.getId());
    	   System.out.println("c"+ps2);
    	  ps2.executeUpdate();
       }
		int m = 1;
		ps.setLong(m++, catalog.getId());
		ps.setString(m++, catalog.getContent());
		adds = ps.executeUpdate();
		if (adds != 0) {
			CatalogRsp catalogRsp = new CatalogRsp();
			catalogRsp.setStatus("success");
			catalogRsp.setData(catalog);
			String rsp = gson.toJson(catalogRsp);
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