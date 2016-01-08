<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.demo.service.UserService"%>
<%@page import="org.demo.json.LoginRsp"%>
<%@page import="org.demo.info.User"%>
<%@page import="com.google.gson.LongSerializationPolicy"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%
	//   String userName = new String(request.getParameter("username").trim());
	//   String pass = new String(request.getParameter("password").trim());
	//   //String roomCode = new String(request.getParameter("roomCode").trim());
	//   UserService userService = new UserService();
	//   //check user name 
	//   User user = new User();
	//   user.setUserName(userName);
	//   long userId = userService.checkLoginUser(pass, user);
	//   //System.out.println(userId);
	//   if (userId > 0) {
	//     request.getSession(true);
	//     //add global cache when begin change
	//     user = userService.getUserById(userId);
	//     session.setAttribute("user", user);
	//     //    response.sendRedirect("control.jsp?roomCode="+roomCode);
	//     if (session.getAttribute("lastFileName") != null
	//         && session.getAttribute("lastFileName").toString().length() > 0) {
	//       response.sendRedirect(session.getAttribute("lastFileName").toString());
	//       session.removeAttribute("lastFileName");
	//       return;
	//     } else {
	//       response.sendRedirect("console.jsp");
	//       return;
	//     }
	//   } else {
	//     out.print("<script>alert('Wrong Username or Password!');location.href='login.jsp';</script>");
	//     return;
	//   }
%>
<%@ include file="inc-receive-body.jsp"%>
<%
	
	try {
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setLongSerializationPolicy(LongSerializationPolicy.STRING);
		Gson gson = gsonBuilder.create();
		User user = gson.fromJson(info, User.class);

		UserService userService = new UserService();
		long userId = userService.checkLoginUser(user);
		user.setId(userId);
		if (userId > 0) {
			LoginRsp loginRsp = new LoginRsp();
			loginRsp.setData(user);
			loginRsp.setStatus("success");			
			String rsp = gson.toJson(loginRsp);

			session.setAttribute("user", user);
			if (session.getAttribute("lastFileName") != null
					&& session.getAttribute("lastFileName").toString().length() > 0) {
				response.sendRedirect(session.getAttribute("lastFileName").toString());
				session.removeAttribute("lastFileName");
				out.print(rsp);
			} else {
				out.print(rsp);
			}
		} else {			
			String msg = "check user failure!";
			out.print("{\"status\":\"error\",\"data\":\"" + msg + "\"}");
		}

	} catch (Exception e) {
		String msg = "check user failure!";
		out.print("{\"status\":\"error\",\"data\":\"" + msg + "\"}");
		e.printStackTrace();
	}
%>