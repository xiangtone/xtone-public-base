package com.zgt.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
 * Servlet implementation class RegsitServlet
 * 用户注册
 */
@WebServlet("/RegsitServlet")
public class RegsitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegsitServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        
        String info = request.getParameter("info"); //获得信息
		System.out.println(info);
		
		JSONObject jsonObject = JSON.parseObject(info); //解析info
		
		String name = jsonObject.getString("name"); 
		String pwd = jsonObject.getString("pwd");
		String email = jsonObject.getString("email");
		String phone = jsonObject.getString("phone");
		
		MyUser myUser = new MyUser(); //写入myUser类
		myUser.setEmail(email);
		myUser.setName(name);
		myUser.setPhone(phone);
		myUser.setPwd(pwd);
		myUser.setUid(UUID.randomUUID().toString()); //增加UUID
        
		MyUserDaoImpl daoImpl = new MyUserDaoImpl(); //连接数据库写入数据库
		
		List<MyUser> list = daoImpl.findByName(name); //查看数据是否存在
		if(list!=null&&!list.isEmpty()){
			String msg = "用户已经存在";
    		response.getWriter().append("{\"status\":\"err\",\"data\":\"" + msg + "\"}");
		}else {
			daoImpl.add(myUser); //写入数据库
			String msg = myUser.getUid();
    		response.getWriter().append("{\"status\":\"success\",\"data\":\"" + msg + "\"}");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
