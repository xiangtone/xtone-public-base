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
        
		MyUserDaoImpl daoImpl = new MyUserDaoImpl(); //连接数据库写入数据库
		
		MyUser user = daoImpl.login(myUser); //查看数据是否存在
		if (user != null) {
			int value=daoImpl.changePwd(myUser);
			if(value==1){
				response.getWriter().append("{\"status\":\"success\",\"data\":\"" + myUser.getUid() + "\"}");//更新数据库成功
			}else{
				response.getWriter().append("{\"status\":\"err\"}");//更新数据库失败
			}
		} else {
			response.getWriter().append("{\"status\":\"errPwd\"}");//旧密码输入错误
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
