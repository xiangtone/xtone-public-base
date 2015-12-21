<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.demo.json.CodeRsp"%>
<%@page import="org.demo.info.Code"%>
<%@page import="com.google.gson.LongSerializationPolicy"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改兑换码</title>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="../js-css/jquery-2.1.3.min.js"></script>
<script language="JavaScript">
	function updateAjax() {
		// 		if (document.getElementById("content").value.trim() == "") {
		// 			alert("兑换码为空！");
		// 			return false;
		// 		}
		var oriData = {
			id : $("#id").val(),
			content : $("#content").val()
		};
		
		$.ajax({
			type : "post",
			url : "code-update-commit.jsp",
			async : false,
			data : encodeURI("info="+escape(JSON.stringify(oriData))),
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {

					alert('修改兑换码成功!');
					location.href = 'code-all.jsp';

				} else {
					alert('修改兑换码失败!');
				}
			},
			error : function() {
				alert('修改兑换码失败!');

			}
		});
	}
</script>
</head>
<body>
	<%
		String StrId = new String(request.getParameter("id").trim());
		long id = Long.parseLong(StrId);
		Code code = new Code();
		code.setId(id);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT content FROM tbl_exchange_codes WHERE id=?";
			ps = con.prepareStatement(sql);
			int m = 1;
			ps.setLong(m++, code.getId());
			rs = ps.executeQuery();
			while (rs.next()) {
				code.setContent(rs.getString("content"));
	%>
	<div style="text-align: center; margin-top: 200px">
		<form id="form1" name="form1">

			<input id="content" placeholder="在此编辑兑换码"
				value="<%=code.getContent()%>" name="title" type="text"
				style="width: 300px; height: 25px"> <input type="hidden"
				name="id" id="id" value="<%=code.getId()%>"> <input
				style="font-size: 15px; width: 100px; height: 30px" type="button"
				value="确认修改" onclick="updateAjax()"> <input
				style="font-size: 15px; width: 100px; height: 30px" type="button"
				value="取消修改" onclick="window.location.href='code-all.jsp'">

		</form>
		<%
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.print("{\"status\":\"error\",\"data\":\"无法编辑\"}");
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
	</div>

</body>
</html>