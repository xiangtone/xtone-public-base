<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.demo.json.CodeRsp"%>
<%@page import="org.demo.info.Catalog"%>
<%@page import="com.google.gson.LongSerializationPolicy"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改文章类型</title>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="../js-css/jquery-2.1.3.min.js"></script>
<script language="JavaScript">
	function updateAjax() {
		// 		if (document.getElementById("content").value.trim() == "") {
		// 			alert("兑换码为空！");
		// 			return false;
		// 		}
		var oriData = {
			id:$("#id").val(),
			content : $("#content").val()
		};
		var action="修改文章类型";
		$.ajax({
			type : "post",
			url : "catalog-update-commit.jsp",
			async : false,
			data : JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {

					alert(action+'成功!');
					location.href = 'catalog-all.jsp';
				} else {
					alert(action+'失败!');
				}
			},
			error : function() {
				alert(action+'失败!');

			}
		});
	}
</script>
</head>
<body>
	<%
		String StrId = new String(request.getParameter("id").trim());
		Catalog catalog=new Catalog();
		catalog.setId(Integer.parseInt(StrId));
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT content FROM tbl_cms_catalogs WHERE id="+catalog.getId();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();		
			while (rs.next()) {			
				catalog.setContent(rs.getString("content"));

	%>
	<input id="content" placeholder="在此编辑文章类型"
				name="content" type="text" value="<%=catalog.getContent() %>"
				style="width: 300px; height: 25px">  
				<input type="hidden"
				name="id" id="id" value="<%=catalog.getId()%>"> 
				<input
				style="font-size: 15px; width: 100px; height: 30px" type="button"
				value="确认修改" onclick="updateAjax()"> 
				<%
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
</body>
</html>