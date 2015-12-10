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
<title>修改文章</title>
<link rel="stylesheet" href="../js-css/edit.css">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="../js-css/jquery-2.1.3.min.js"></script>
<script language="JavaScript">
   function update(){
		var oEditor = CKEDITOR.instances.inputContent;
		if (document.getElementById("inputTitle").value.trim() == "") {
			alert("标题为空！");
			return false;
		}
		if (oEditor.getData()== "") {
			alert("内容为空！");
			return false;
		}
		 
	}
	String.prototype.trim = function(){ 
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
			String sql = "SELECT title,content,catalog FROM tbl_cms_contents WHERE id=?";
			ps = con.prepareStatement(sql);
			int m = 1;
			ps.setInt(m++, id);
			rs = ps.executeQuery();		
			while (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
	%>
	
	<form class="form-date" id="form1" name="form1" onsubmit="return update();" method="post" action="commit-update-content.jsp">
		<div class="note_title clear_float">
			<div class="col_li col_left" style="width: 79%">
				<input class="input_text" id="inputTitle" placeholder="在此编辑标题"
					value="<%=title%>" type="text" name="title">
			</div>
			<select name="catalog" id="catalog" style="width: 8%; height: 30px">
				<option value="news">新闻</option>
				<option value="material">资料</option>
				<option value="forum">论坛</option>
			</select> 
			<input class="font_16 " style="width: 5%; height: 30px"
				type="submit" value="保存更新">
			<input class="font_16 " style="width: 5%; height: 30px"
				type="button" value="取消编辑" onclick="window.location.href='stat-all.jsp'">
			<input type="hidden" name="id" value="<%=id%>">
		</div>

		<textarea id="inputContent" rows="53" cols="53" name="content"><%=content%></textarea>
	</form>
	<script>
		var province = "<%=rs.getString("catalog")%>";
		$("#catalog").val(province);
	</script>
	<script type="text/javascript">
	CKEDITOR.replace('content',{
        customConfig : '../ckeditor/my_config.js'
    });
		
	</script>
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
<%-- 	<script>
		window.onload = function(){
	    var obj = document.getElementById('saveUpdate');
	    var title = document.getElementById("inputTitle");
	    var content = document.getElementById("inputContent");
	    obj.onclick=function(){  
	        window.location.href="updateEdit.jsp?id=<%=id%>&title=title&content=content";            
	     }
	 }
</script> --%>
</body>
</html>