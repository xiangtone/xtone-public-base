package com.account.util;

public class Constant {
	
	//本机测试
	public static final String URL="http://192.168.1.222:8080/x-account-server";

	//内网测试
//	public static final String URL="http://192.168.0.51:8080/account-test";
	
	//外网
//	public static final String URL="http://account.n8wan.com";
	
	public static final String URLLOGIN=URL+"/jsp/login.jsp"; //登录页面
	public static final String URLLOGINSERVLET=URL+"/LoginServlet";//登录Servlet
	public static final String URLREGISTSERVLET=URL+"/RegsitServlet";//注册Servlet

}
