<%@page import="com.account.domain.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width"><!-- 控制手机获取输入框焦点时不缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>用户登录</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="../js/jquery-1.7.js"></script>
<script type="text/javascript" src="../js/base.js"></script>
<% 
// request.getSession(true);
// session.invalidate();
// 	String uid=null;
// 	try {
// 		uid = new String(request.getParameter("UID").trim());
// 		} catch (Exception e) {
// 		}
%>
<script type="text/javascript">
// $(document).ready(function(){
<%-- 	var uid=<%=uid%>; --%>
// 	console.log("1");
// 	if(uid!=null){
// 		console.log("2");
//  		submitBtn();
		
//  	}
// });
function regist(){
	var appkey=null;
	var channel_id=null;
	try {
		appkey=webjs.getAppkey();
	} catch (e){}
	try {
		channel_id=webjs.getChannel();
	} catch (e) {}
	var url="regist.jsp";
	if(appkey!=null&&channel_id!=null){
		url="regist.jsp?channel_id="+channel_id+"&appkey="+appkey;
	}
	
	window.location.href=url;
}
	function submitBtn() {
		
		var name=$("#username");
		var pwd=$("#pwd");
		var oriData = {
				name : undefined,
				phone : undefined,
				email : undefined,
				pwd : pwd.val().trim(),
				flagid : undefined,
				channel_id : undefined,
				appkey : undefined,
				loginType : <%=MyUser.LOGINBYNAME%>
			}; 
		
		try {
			oriData.flagid=webjs.getFlagId();
		} catch (e){}
		try {
			oriData.channel_id=webjs.getChannel();
		} catch (e) {}
		try {
			oriData.appkey=webjs.getAppkey();
		} catch (e) {}
		if(isNullOrEmpty(name.val())||name.val().length>20){
			var tip="请输入1-20字用户名!";
			alert(tip);
			webjs.toastShort(tip);
			name.focus();
			return;
		}
		console.log(emailRight(name.val()));
		//判断登录方式并根据登录方式赋值
		if(allNum(name.val())&&name.val().length==11){
			oriData.phone=name.val();
			oriData.loginType=<%=MyUser.LOGINBYPHONE%>;
		}else if(emailRight(name.val())){
			oriData.email=name.val();
			oriData.loginType=<%=MyUser.LOGINBYEMAIL%>;
		}else{
			oriData.name=name.val();
		}
		
		if(pwd.val().length<6||pwd.val().length>20){
			var tip="请输入6-20位数密码!";
			alert(tip);
			webjs.toastShort(tip);
			pwd.focus();
			return;
		}
		
		$.ajax({
			type : "post",
			url : "../LoginServlet",
			async : false,
			data : "info=" + JSON.stringify(oriData),
			dataType : "json",
			success : function(msg) {
				var tip='';
				if (msg.status == "success") {
// 					tip='登录成功!';
// 					window.location.href = 'account.jsp';
					webjs.setUser(JSON.stringify(msg.data));
					webjs.closeWeb();
// 					webjs.setuser(JSON.stringify(msg.data));
// 					webjs.closeweb();
				}else if(msg.status == "frezze"){
					tip='该用户没有被激活，请先激活。';
					alert(tip);
					webjs.toastShort(tip);
				}else{
					tip='登录失败!请检查用户名和密码是否正确。';
					alert(tip);
					webjs.toastShort(tip);
				}
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
				var tip="登录失败!";
				switch (XMLHttpRequest.status)
				{
					case 200:
						tip="登录成功!";//json格式不正确会返回200
				  		break;
					case 404:
						tip="登录失败!请检查用户名和密码是否正确。";
				  		break;
					default:
						tip="网络异常，请稍后再试。";
						break;
				  			
				}
				alert(tip);
				webjs.toastShort(tip);
			}
		});


	}

</script>


</head>

<body>
				<jsp:include page="head.jsp"></jsp:include>
		<div class="magin_lr">
			<div class="divCenter">

		<form action="/adTest/LoginServlet" method="get" id="login_form">
			<font class="top_tip ">登录</font><br>
			<input type="text" class="m_input input_border" name="username" id="username" maxlength="20" placeholder="请输入用户名"/>
			<input type="password" class="m_input input_border" name="pwd" id="pwd" maxlength="20" placeholder="请输入密码"/>
			<input type="button" class="btn_mp single_button input_border button_color" id="submit" value="登录" onclick="submitBtn()" /><br /> 
<!-- 			<a href="change-pwd.jsp" class="change_pwd_a text_a">修改密码</a> -->
			<a href="#" class="regist_a text_a" onclick="regist()">注册新用户</a>			
<!-- 			<a href="forget-pwd.jsp" class="foget_pwd_a text_a">忘记密码?</a><br /> -->
		</form>
			</div>
	</div>
</body>
<script type="text/javascript">
// window.onload=function(){
//		webjs.clearUser();
<%-- 	var uid=<%=uid%>; --%>
// 	if(uid!=null){
// 		window.location.href ='auto-login.jsp?uid='+uid;
		
// 	}
// };
</script>
</html>