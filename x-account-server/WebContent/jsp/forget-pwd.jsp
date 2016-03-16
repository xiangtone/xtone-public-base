<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<script type="text/javascript">

	function find() {
		var name = $("#name");
		var emailorphone = $("#emailorphone");
		if(isNullOrEmpty(name.val())){
			alert("用户名不能为空!");
			name.focus();
			return;
		}
		
		var mail_reg=  /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var num_reg = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
		var oriData;
		if(mail_reg.test(emailorphone.val())){
			oriData = {
					name : name.val().trim(),
					email : emailorphone.val().trim()
				};
		}else if(num_reg.test(emailorphone.val())){
			oriData = {
					name : name.val().trim(),
					phone : emailorphone.val().trim()
				};
		}else{
			alert("请输入正确的邮箱或11位手机号码!");
			emailorphone.focus();
			return;
		}		

		$.ajax({
			type : "post",
			url : "../",
			cache : false,
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {
				if (msg.status == "success") {
					alert('您的申请已提交!');
					window.history.back(-1);
				} else if(msg.status == "errRepeat"){
					alert('');
				} else{
					alert('您的申请提交失败!请稍后重试。');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				var msg="提交失败!";
				switch (XMLHttpRequest.status)
				{
					case 404:
						msg="您输入的用户名或邮箱地址/手机号码不正确!";
				  		break;
					default:
						msg="网络异常，请稍后再试。";
						break;
				  			
				}
				alert(msg);
			}
		});

	}
</script>
<style type="text/css">
.ok_button{
	width: 50%;
	height:35px;
	font-size: 15px;
	margin: 20px 0 10px 0;
	padding: 1px 0 1px 0;
}
.cancle_button{
	width: 50%;
	height:35px;
	font-size: 15px;
	margin: 20px -5px 10px 0;
	padding: 1px 0 1px 0;
}
</style>
</head>
<body>
<!-- <a href="#" class="findby_email_a text_a">通过邮箱找回</a> -->
<!-- <a href="#" class="findby_num_a text_a">通过手机号找回</a> -->
<input type="text" class="m_input" id="name" placeholder="请输入用户名"/><br/>
<input type="text" class="m_input" id="emailorphone" placeholder="请输入邮箱地址或手机号"/><br/>
<input type="button" class="ok_button" value="确&nbsp;&nbsp;&nbsp;&nbsp;认" onclick="find()"/>
<input type="button" class="cancle_button" value="取&nbsp;&nbsp;&nbsp;&nbsp;消" onclick="javascrip:window.history.back(1);"/>

</body>
</html>