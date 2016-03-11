package com.account.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.account.dao.AdBean;
import com.account.dao.bean.StatisticsCurrent;
import com.account.utils.AES;
import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class AdServlet
 */
@WebServlet("/AdServlet")
public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=utf-8"); 
		
		AdBean bean = new AdBean("今天工作任务","http://192.168.1.153:8080/adTest/app.apk","完成测试接口","http://192.168.1.153:8080/adTest/icon.jpg");
		bean.setPackageName("com.dpx.jllpk");
		bean.setNextTime(60*2);
		String str = JSON.toJSONString(bean);
		System.out.println(str);
		
		response.getWriter().print(str);
		
		String name = request.getParameter("name");
		System.out.println(name);
		
		
		String  encode = request.getParameter("encode");
		if(encode!=null&&!"".equals(encode)){
			System.out.println(encode);
			String KeyOfAES = "f17d2fb4eff547c8bebc1e7cc4dcd43c";
			String decode= AES.DecodeString(encode, KeyOfAES);
			System.out.println(decode);
			StatisticsCurrent statisBean = JSON.parseObject(decode, StatisticsCurrent.class);
			System.out.println(statisBean);
			
		}
		
		
		
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		
//		response.getWriter().print("<h1>减肥的设计费</h1>");
//		
//		String name = request.getParameter("name");
//		System.out.println(name);
//		
//		String a = request.getParameter("a");
//		System.out.println(a);
//		
//		response.getWriter().print("<h1>"+name+"</h1>");
//		
//		response.getWriter().print("<h1>"+a+"</h1>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
