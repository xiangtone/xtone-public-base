package com.account.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
 * Servlet implementation class ConfrimAccountServlet 邮箱验证
 */
@WebServlet("/ConfrimAccountServlet")
public class ConfrimAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ConfrimAccountServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String info = request.getParameter("info"); // 获得信息
		System.out.println(info);
		JSON.parseObject(info, MyUser.class);
		MyUser myUser = JSON.parseObject(info, MyUser.class); // 解析info

		MyUserDaoImpl daoImpl = new MyUserDaoImpl(); // 连接数据库写入数据库
		int value = daoImpl.updateStatus(myUser); // 写入数据库
		if (value == 1) {
			response.getWriter().append("{\"status\":\"success\"}");// 写入数据库失败
		} else {
			response.getWriter().append("{\"status\":\"error\"}");// 写入数据库失败
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
