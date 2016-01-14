<%@page import="org.demo.info.Content"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
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
   function updateAjax() {
	   var contentEditor = CKEDITOR.instances.inputContent;
	   var subTitleEditor = CKEDITOR.instances.inputSubTitle;
// 		if (document.getElementById("inputTitle").value.trim() == "") {
// 			alert("标题为空！");
// 			return false;
// 		}
// 		if (oEditor.getData() == "") {
// 			alert("内容为空！");
// 			return false;
// 		}
		var action="修改文章";
		var oriData = {
			id : $("#id").val(),
			catalog : $("#catalog").val(),
			title : $("#inputTitle").val(),
			subTitle : $("#inputSubTitle").val(),
			content : contentEditor.getData()
			
		};
		
		$.ajax({
			type : "post",
			url : "content-update-commit.jsp",
			async : false,
			data : JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {
					
					alert(action+'成功!');
					history.go(-1);
// 					location.href = 'stat-all.jsp';
					
				} else {
					alert(action+'失败!');
				}
			},
			error : function(msg) {
				alert(action+'失败!');

			}
		});

	}

</script>
</head>
<body>

	<%
		String StrId = new String(request.getParameter("id").trim());
		Content content=new Content();
		content.setId(Integer.parseInt(StrId));
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT content FROM tbl_cms_catalogs";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			ArrayList<String> listCatalog = new ArrayList<String>();
			while (rs.next()) {
				listCatalog.add(rs.getString("content"));
			}
			sql = "SELECT title,content,catalog,subTitle FROM tbl_cms_contents WHERE id=?";
			ps = con.prepareStatement(sql);
			int m = 1;
			ps.setInt(m++, content.getId());
			rs = ps.executeQuery();		
			while (rs.next()) {
				content.setTitle(rs.getString("title"));
				content.setContent(rs.getString("content"));
				content.setCatalog(rs.getString("catalog"));
				content.setSubTitle(rs.getString("subTitle"));
	%>
	
<!-- 	<form class="form-date" id="form1" name="form1"> -->
		<div class="note_title clear_float">
			<div class="col_li col_left" style="width: 79%">
				<input class="input_text" id="inputTitle" placeholder="在此编辑标题"
					value="<%=content.getTitle()%>" type="text" name="title">
			</div>
			<select name="catalog" id="catalog" style="width: 8%; height: 30px">
				<%for(int i=0;i<listCatalog.size();i++){%>
				
					<option value="<%=listCatalog.get(i) %>"><%=listCatalog.get(i)%></option>
				<%}%>
			</select> 
			<input class="btn-content-commit" 
				type="button" value="保存更新" onclick="updateAjax()">
			<input class="btn-content-commit"
				type="button" value="取消编辑" onclick="window.location.href='stat-all.jsp'">
			<input type="hidden" name="id" id="id" value="<%=content.getId()%>">
		</div>
		
		<br><font class="ztgs">请在这里编辑副标题（请根据需求选填）:</font><br>
		<textarea id="inputSubTitle" rows="4" cols="250" name="subTitle" class="input-subtitle"><%=content.getSubTitle()%></textarea>
		<br><br><font class="ztgs">请在这里编辑内容:</font>
		<textarea id="inputContent" rows="53" cols="53" name="content"><%=content.getContent()%></textarea>
		
<!-- 	</form> -->
	<script>
		var province = "<%=content.getCatalog()%>";
		$("#catalog").val(province);
	</script>
	<script type="text/javascript">
	CKEDITOR.replace('content',{
        customConfig : '../ckeditor/config-content.js'
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