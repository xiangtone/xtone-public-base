package com.account.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.account.dao.impl.MyUserDaoImpl;
import com.account.domain.MyUser;
import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class ForgetPwdServer
 * 用户修改密码
 */
@WebServlet("/ForgetPwdServer")
public class ForgetPwdServer extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ForgetPwdServer(){
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");
        
        String info = req.getParameter("info"); //获得信息
		System.out.println(info);
		
		MyUser myUser = JSON.parseObject(info,MyUser.class); //解析info
        
		MyUserDaoImpl daoImpl = new MyUserDaoImpl(); //连接数据库写入数据库
		
		MyUser user = daoImpl.findByName(myUser.getName()); //查看数据是否存在
		if (user != null) {
//			int value=daoImpl.(myUser);
//			if(value==1){
//				resp.getWriter().append("{\"status\":\"success\",\"data\":\"" + myUser.getUid() + "\"}");
//			}else{
//				resp.getWriter().append("{\"status\":\"err\"}");
//			}
		} else {
//			resp.getWriter().append("{\"status\":\"err\"}");
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
