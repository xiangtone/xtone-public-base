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
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function addAjax() {
		var oEditor = CKEDITOR.instances.inputContent;
// 		if (document.getElementById("inputTitle").value.trim() == "") {
// 			alert("标题为空！");
// 			return false;
// 		}
// 		if (oEditor.getData() == "") {
// 			alert("内容为空！");
// 			return false;
// 		}
		var oriData = {
			catalog : $("#catalog").val(),
			title : $("#inputTitle").val(),
			content : oEditor.getData()
		};
		
		$.ajax({
			type : "post",
			url : "content-add-commit.jsp",
			async : false,
			data : encodeURI("info="+escape(JSON.stringify(oriData))),
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {
					
					alert('添加文章成功!');
					location.href = 'stat-all.jsp';
					
				} else {
					alert('添加文章失败!内容暂不支持首位空格。。。');
				}
			},
			error : function() {
				alert('添加文章失败!内容暂不支持首位空格。。。');

			}
		});

	}
	
</script>
</head>
<body>

	<form class="form-date" id="form1" name="form1">
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
			</select> 
			<input style="width: 5%; height: 30px" type="button" value="确认添加" onclick="addAjax()">
			<input style="width: 5%; height: 30px" type="button" value="取消编辑"
				onclick="window.location.href='stat-all.jsp'">
		</div>

		<textarea id="inputContent" rows="53" cols="53" name="content"></textarea>
	</form>
	<script type="text/javascript">
		CKEDITOR.replace('content', {
			customConfig : '../ckeditor/config.js'
		});
	</script>

</body>
</html>