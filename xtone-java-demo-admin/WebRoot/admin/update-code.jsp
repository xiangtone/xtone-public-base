<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改兑换码</title>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script language="JavaScript">
	function update() {
		if (document.getElementById("inputTitle").value.trim() == "") {
			alert("兑换码为空！");
			return false;
		}

	}
	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s*$)/g, "");
	};
</script>
</head>
<body>
	<%
		String StrId = new String(request.getParameter("id").trim());
		int id = Integer.parseInt(StrId);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT content FROM tbl_exchange_codes WHERE id=?";
			ps = con.prepareStatement(sql);
			int m = 1;
			ps.setInt(m++, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				String content = rs.getString("content");
	%>
	<div style="text-align: center; margin-top: 200px">
		<form id="form1" name="form1" method="post"
			action="commit-edit-code.jsp" onsubmit="return update();">

			<input id="inputTitle" placeholder="在此编辑兑换码" value="<%=content%>"
				name="title" type="text"
				style="width: 300px; height: 25px"> <input
				type="hidden" name="id" value="<%=id%>"> <input
				style="font-size: 15px; width: 100px; height: 30px" type="submit"
				value="确认修改"> <input
				style="font-size: 15px; width: 100px; height: 30px" type="button"
				value="取消修改" onclick="window.location.href='code-all.jsp'">

		</form>
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
	</div>


</body>
</html>