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
<title>添加文章</title>
<link rel="stylesheet" href="../js-css/edit.css">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script language="JavaScript">
   function add(){
      document.form1.method="post";	  
      document.form1.action="add.jsp";
      document.form1.submit();
      return true;
}
   function cancel(){
      document.form1.method="post";
      document.form1.action="stat-all.jsp";
      document.form1.submit();
      return true;
}

</script>
</head>
<body>

	<form class="form-date" method="post" action="add.jsp">
		<div class="note_title clear_float">
			<div class="col_li col_left" style="width: 79%">
				<input class="input_text" id="inputTitle" placeholder="在此编辑标题"
					type="text" name="title">
			</div>
			<select name="catalog" id="catalog" onchange="check(this)"
				style="width: 8%; height: 30px">
				<option value="news">新闻</option>
				<option value="material">资料</option>
				<option value="forum">论坛</option>
			</select> <input class="font_16 " style="width: 4%; height: 30px"
				type="submit" value="确认添加" onclick="add()">
			<input class="font_16 " style="width: 4%; height: 30px"
				type="submit" value="取消编辑" onclick="cancel()">
		</div>

		<textarea id="inputContent" rows="53" cols="53" name="content"></textarea>
	</form>
	<script type="text/javascript">
		CKEDITOR.replace('content',{height:600});
	</script>

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