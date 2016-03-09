<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>

<script type="text/javascript" src="jquery-1.7.js"></script>
<script type="text/javascript">

function regist(){
	var oriData = {
			name : $("#name").val(),
			pwd : $("#pwd").val(),
			email : $("#email").val(),
			phone : $("#phone").val()
		};
	
		$.ajax({  
			type : "post",
			url : "RegsitServlet",
			cache:false,
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {

				if (msg.status == "success") {

				//	alert(msg.data);
					
					alert('注册成功');
					
				} else {
					alert('注册失败>>>');
				}
			},
			error : function() {
				
				alert('注册失败!');
				
			}
		});
	
	
	
	
	
}

</script>



</head>
<body>

 用户名:<input type="text" id="name" /><br/>
 密码:<input type="text" id="pwd"/><br/>
email:<input type="text" id="email"/><br/>
手机:<input type="text" id="phone"/><br/>
<input type="button" value="注册" onclick="regist()"/>

</body>
</html>