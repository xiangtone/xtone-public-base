package com.account.util;

public class Constant {

	// 本机测试
//	 public static final String URL="http://192.168.1.223:8080/account.xtonegame.com";

	// 内网测试
	// public static final String URL="http://192.168.0.51:8080/account-test";

	// n8wan服务器
//	 public static final String URL="https://account.n8wan.com";

	// youka服务器
//	public static final String URL = "http://account.youkala.com";
	// 南方银谷服务器
	public static final String URL = "http://account.wifi8.com:29141";

	public static final String URLLOGIN = URL + "/jsp/login.jsp"; // 登录页面
	public static final String URLLOGINSERVLET = URL + "/LoginServlet";// 登录Servlet
	public static final String URLREGISTSERVLET = URL + "/RegsitServlet";// 注册Servlet
	public static final String URLLOGAUTHSERVLET = URL + "/LoginAuthServlet";// 登录认证Servlet

}
