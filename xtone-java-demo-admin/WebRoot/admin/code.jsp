<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.common.util.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>导入兑换码</title>
<link rel="stylesheet" href="../js-css/edit.css">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function addAjax() {
// 		alert(10)
// 		var oEditor = CKEDITOR.instances.inputContent;
// 		alert(11)
// 		if (document.getElementById("inputTitle").value.trim() == "") {
// 			alert("标题为空！");
// 			return false;
// 		}
// 		if (oEditor.getData() == "") {
// 			alert("内容为空！");
// 			return false;
// 		}
		var action="添加游戏兑换码";
		var oriData = {
			catalog : $("#catalog").val(),
			title : $("#inputTitle").val(),
			subTitle : $("#inputSubTitle").val(),
			content : $("#inputContent").val()
		};
		
		$.ajax({
			type : "post",
			url : "code.content-add-commit.jsp",
			async : false,
			data : JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) { 

				if (msg.status == "success") {
					
					alert(action+'成功!');
					location.href = 'code.stat-all.jsp';
					
				} else {
					alert(0)
					alert(action+'失败!');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var tip=action+"失败!";
				switch (XMLHttpRequest.status)
				{
					case 404:
				  		break;
					default:
						tip="网络异常，请稍后再试。";
						break;
				}
				alert(tip);
			}
		});

	}
	
</script>
</head>
<body>
<%
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT content FROM tbl_cms_catalogs where content not like '%\\_%'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			ArrayList<String> listCatalog = new ArrayList<String>();
			while (rs.next()) {
				listCatalog.add(rs.getString("content"));
			}

	%>

		<div class="note_title clear_float">
<!-- 			<div class="col_li col_left" style="width: 80%"> -->
<!-- 				<input class="input_text" id="inputTitle" placeholder="在此编辑标题" -->
<!-- 					type="text" name="title"> -->
<!-- 			</div> --> 请选择游戏ID：
			<select name="catalog" id="catalog" onchange="check(this)" style="width: 8%; height: 30px">
				<%for(int i=0;i<listCatalog.size();i++){%>
					<option value="<%=listCatalog.get(i) %>"><%=listCatalog.get(i) %></option>
				<%}%>
			</select> 
			<input class="btn-content-commit" type="button" value="确认添加" onclick="addAjax()">
			<input class="btn-content-commit" type="button" value="取消编辑"
				onclick="window.location.href='code.stat-all.jsp'">
		</div>

<!-- 		<br><font class="ztgs">请在这里编辑副标题（请根据需求选填）:</font><br> -->
<!-- 		<textarea id="inputSubTitle" rows="4" cols="250" name="subTitle" class="input-subtitle"></textarea> -->
		<br><br><font class="ztgs">请在这里粘贴兑换码(每个兑换码间以逗号(,)隔开):</font>
		<textarea id="inputContent" rows="30"  style="width:95%;border:solid 3px red;"></textarea>

	<script type="text/javascript">
		CKEDITOR.replace('content', {
			customConfig : '../ckeditor/config-content.js'
		});
	</script>
<%
                               
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