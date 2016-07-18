package com.account.service;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.account.dao.impl.MyUserDaoImpl;
import com.account.domain.MyUser;
import com.account.json.Resp;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class LoginServlet
 * 
 * 用户登录的
 * 
 */
@WebServlet("/LoginAuthServlet")
public class LoginAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAuthServlet() {
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

		String token = request.getParameter("token");
		System.out.println(token);

		MyUser myUser = new MyUser();
		myUser.setUid(token);
		MyUserDaoImpl daoImpl = new MyUserDaoImpl();
		MyUser loginUser=null;
		loginUser = daoImpl.loginByUid(myUser);
		
		if (loginUser != null) {
			if(loginUser.getStatus()==MyUser.FREEZE){
				response.getWriter().append("{\"status\":\"frezze\"}");//账号没有激活
				return;
			}
			//更新登录时间
			loginUser.setLastLoginTime(new Date().getTime());
			loginUser.setToken(loginUser.getUid());
			daoImpl.updateTime(loginUser);
			HttpSession session=request.getSession();
			session.setAttribute("user", loginUser);
			
			//更新日志库
//			LogService.getInstance().checkLog(loginUser);
			
			Resp rsp=new Resp();
			rsp.setStatus("success");
			rsp.setData(loginUser);
			response.getWriter().append(JSONObject.toJSONString(rsp));//登录成功
		} else {
			response.getWriter().append("{\"status\":\"err\"}");//用户不存在
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
