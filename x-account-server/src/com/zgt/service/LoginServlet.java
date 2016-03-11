package com.zgt.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zgt.dao.impl.MyUserDaoImpl;
import com.zgt.domain.MyUser;

/**
 * Servlet implementation class LoginServlet
 * 
 * 用户登录的
 * 
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		String info = request.getParameter("info");
		System.out.println(info);

		JSONObject jsonObject = JSON.parseObject(info);
		// {"userName":"name","password":"pwd"}
		String name = jsonObject.getString("userName");
		String pwd = jsonObject.getString("password");

		MyUserDaoImpl daoImpl = new MyUserDaoImpl();

		MyUser myUser = daoImpl.login(name, pwd);

		if (myUser != null) {
			// 登录成功
			response.getWriter().append("{\"status\":\"success\",\"data\":\"" + myUser.getUid() + "\"}");
			
		} else {
			response.getWriter().append("{\"status\":\"err\"}");
			request.getRequestDispatcher("regist.jsp").forward(request,
			response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
