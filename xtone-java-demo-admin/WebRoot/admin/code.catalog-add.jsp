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
<% response.setCharacterEncoding("UTF-8");%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加文章类型</title>
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
		var action="添加游戏类型";
		$.ajax({
			type : "post",
			url : "code.catalog-add-commit.jsp",
			async : false,
			data : JSON.stringify(oriData),
			dataType : "json",
			charset : "utf-8",
			success : function(msg) {

				if (msg.status == "success") {

					alert(action+'成功!');
					location.href = 'code.catalog-all.jsp';
				} else {
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
	
	<input id="content" placeholder="在此编辑游戏名称"
				name="content" type="text"
				style="width: 300px; height: 25px"> <br/>
				<input id="id" placeholder="在此编辑游戏ID"
				name="id" type="text"
				style="width: 300px; height: 25px">  
				 <input
				style="font-size: 15px; width: 100px; height: 30px" type="button"
				value="确认添加" onclick="updateAjax()"> 
				
</body>
</html>