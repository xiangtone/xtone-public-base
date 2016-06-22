package com.account.service;

import java.io.IOException;
import java.sql.Time;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.common.util.Base;
import org.common.util.ConfigManager;
import org.common.util.GenerateIdService;

import com.account.dao.impl.LogDaoImpl;
import com.account.dao.impl.MyUserDaoImpl;
import com.account.domain.LogInfo;
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

		MyUser myUser = JSON.parseObject(info,MyUser.class);
		
		MyUserDaoImpl daoImpl = new MyUserDaoImpl();
		
		MyUser loginUser=null;
		if(myUser.getUid()!=null){
//			if(LogService.getInstance().seleteToken(myUser)!=null){
//				LogService.getInstance().updateToken(myUser);
//			}else {
//				response.getWriter().append("{\"status\":\"tokenErr\"}");
//				return;
//			}
			loginUser = daoImpl.loginByUid(myUser);
		}else if(myUser.getLoginType()==MyUser.LOGINBYPHONE&&myUser.getPhone()!=null){
			loginUser = daoImpl.loginByPhone(myUser);
		}else if(myUser.getLoginType()==MyUser.LOGINBYEMAIL&&myUser.getEmail()!=null){
			loginUser = daoImpl.loginByEmail(myUser);
		}else{
			loginUser = daoImpl.login(myUser);
		}
		
		if (loginUser != null) {
			if(loginUser.getStatus()==MyUser.FREEZE){
				response.getWriter().append("{\"status\":\"frezze\"}");//账号没有激活
				return;
			}
			
			//更新登录时间
			loginUser.setFlagid(myUser.getFlagid());
			loginUser.setChannel_id(myUser.getChannel_id());
			loginUser.setAppkey(myUser.getAppkey());
			loginUser.setLastLoginTime(new Date().getTime());
//			loginUser.setSessionId(loginUser.getUid());
			loginUser.setToken(loginUser.getUid());
			
			daoImpl.updateTime(loginUser);
//			loginUser.setPwd(myUser.getPwd());
			HttpSession session=request.getSession();
			session.setAttribute("user", loginUser);
			Resp rsp=new Resp();
			rsp.setStatus("success");
			rsp.setData(loginUser);
			response.getWriter().append(JSONObject.toJSONString(rsp));//登录成功
		} else {
			response.getWriter().append("{\"status\":\"err\"}");//用户不存在
//			request.getRequestDispatcher("regist.jsp").forward(request,
//			response);
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
