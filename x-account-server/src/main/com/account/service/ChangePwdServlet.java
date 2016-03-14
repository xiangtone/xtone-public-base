package com.account.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.account.dao.impl.MyUserDaoImpl;
import com.account.domain.MyUser;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class ChangePwdServlet
 * 用户修改密码
 */
@WebServlet("/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePwdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        
        String info = request.getParameter("info"); //获得信息
		System.out.println(info);
		
		MyUser myUser = JSON.parseObject(info,MyUser.class); //解析info

//		myUser.setUid(UUID.randomUUID().toString()); //增加UUID
//        
//		MyUserDaoImpl daoImpl = new MyUserDaoImpl(); //连接数据库写入数据库
//		
//		List<MyUser> list = daoImpl.findByName(myUser.getName()); //查看数据是否存在
//		if(list!=null&&!list.isEmpty()){	
//			
//    		response.getWriter().append("{\"status\":\"err\"}");
//		}else {
//			
//			daoImpl.add(myUser); //写入数据库
//    		response.getWriter().append("{\"status\":\"success\",\"data\":\"" + myUser.getUid() + "\"}");
//		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
