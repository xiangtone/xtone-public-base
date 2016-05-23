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
import com.account.utils.ConfigManager;
import com.account.utils.MailUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class EmailServlet
 * 
 * 注册邮件发送
 * 
 */
@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailServlet() {
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
		String info = request.getParameter("info");
		System.out.println(info);
		MyUser myUser = JSON.parseObject(info,MyUser.class);
		
		StringBuffer url = new StringBuffer(ConfigManager.getConfigData("ACTIVATION_URL") + "?email="+myUser.getEmail()+"&uid=" + myUser.getUid());
		String company=ConfigManager.getConfigData("COMPANY");
		String sendMail=ConfigManager.getConfigData("SENDMAIL");
		try {
			StringBuilder mailMessage = new StringBuilder();
			mailMessage.append("<html><head>"+company+"激活邮件</head><body><br />尊敬的用户，您好！<br /><br />欢迎注册"+company+"平台,请激活账户以完成注册；<br /><br />");
			mailMessage.append("<a href='" + url + "'>" + url + "</a>");
			mailMessage.append("如有任何问题，欢迎查阅"+company+"平台<a href='"+"#"+"'>常见问题</a>或直接与我们联系，邮件地址：<br /><a href='mailto:"+sendMail+"'>"+sendMail+";</a>");
			mailMessage.append("<br />期待与您的合作，谨此致意！<br /><br />"+company+" 服务团队");
			mailMessage.append("</body></html>");
			MailUtil.send(company+" 注册激活邮件", sendMail, myUser.getEmail(), mailMessage.toString());
			response.getWriter().append("{\"status\":\"success\"}");
		} catch (Exception e) {
			System.out.println("发送邮件时发生异常");
			response.getWriter().append("{\"status\":\"err\"}");//用户不存在
			e.printStackTrace();
		}
		

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
