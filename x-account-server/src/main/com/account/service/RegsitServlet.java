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

import org.common.util.ConfigManager;
import org.common.util.GenerateIdService;

import com.account.dao.impl.MyUserDaoImpl;
import com.account.domain.LogInfo;
import com.account.domain.MyUser;
import com.account.json.Resp;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

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
		JSON.parseObject(info,MyUser.class);
		MyUser myUser = JSON.parseObject(info,MyUser.class); //解析info
		
		myUser.setUid(UUID.randomUUID().toString()); //增加UUID
//		myUser.setSessionId(myUser.getUid());
		myUser.setToken(myUser.getUid());
		myUser.setLastLoginTime(new Date().getTime());
		MyUserDaoImpl daoImpl = new MyUserDaoImpl(); //连接数据库写入数据库
		
		MyUser user; //查看数据是否存在
		if(myUser.getLoginType()==MyUser.LOGINBYEMAIL){
			user = daoImpl.findByEmail(myUser.getEmail());
			myUser.setStatus(0);//将账号设置为未激活状态
		}else if(myUser.getLoginType()==MyUser.LOGINBYPHONE){
			user = daoImpl.findByPhone(myUser.getPhone());
			myUser.setStatus(1);
		}else{
			user = daoImpl.findByName(myUser.getName());
			myUser.setStatus(1);
		}
		
		if (user != null) {
			response.getWriter().append("{\"status\":\"errRepeat\"}");//用户名已存在
		} else {
			int value=daoImpl.add(myUser); // 写入数据库
			if(value==1){
				HttpSession session=request.getSession();		
				session.setAttribute("user", myUser);
				myUser.setPwd("");
				
				//token插入日志库
				LogService.getInstance().addToken(myUser);
				
				Resp rsp=new Resp();
				rsp.setStatus("success");
				rsp.setData(myUser);
				response.getWriter().append(JSONObject.toJSONString(rsp));
			}else{
				response.getWriter().append("{\"status\":\"errInsert\"}");//写入数据库失败
			}			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
