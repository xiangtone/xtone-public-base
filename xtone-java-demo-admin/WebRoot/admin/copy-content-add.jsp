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
<script type="text/javascript">
		function signInAjax() {
			
			var oriData = {
				userName : $("#inputEmail").val(),
				password : $("#inputPassword").val()
			};
			$.ajax({
				type : "post",
				url : "check-login.jsp",
				async : false,
				data : "info="+JSON.stringify(oriData),
				dataType : "json",
				success : function(msg) {
										
					if (msg.status == "success") {

						location.href='console.jsp';
						
					} else {
						alert('邮箱或密码错误!'+msg.data);
					}
				},
				error : function () {
					alert('登录失败!');

				}
			});
			
		}
		
	</script>
</head>
<body>
<script language="JavaScript">
	function add(){
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
	<form class="form-date" id="form1" name="form1" onsubmit="return add();" method="post" action="content-add-commit.jsp">
		<div class="note_title clear_float">
			<div class="col_li col_left" style="width: 80%">
				<input class="input_text" id="inputTitle" placeholder="在此编辑标题"
					type="text" name="title">
			</div>
			<select name="catalog" id="catalog" onchange="check(this)"
				style="width: 8%; height: 30px">
				<option value="news">新闻</option>
				<option value="material">资料</option>
				<option value="forum">论坛</option>
			</select> <input style="width: 5%; height: 30px"
				type="submit" value="确认添加"> <input
				style="width: 5%; height: 30px" type="button"
				value="取消编辑" onclick="window.location.href='stat-all.jsp'">
		</div>

		<textarea id="inputContent" rows="53" cols="53" name="content"></textarea>
	</form>
	<script type="text/javascript">
		CKEDITOR.replace('content', {
			customConfig : '../ckeditor/my_config.js'
		});
	</script>

</body>
</html>