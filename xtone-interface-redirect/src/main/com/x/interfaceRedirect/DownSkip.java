package com.x.interfaceRedirect;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.common.util.ThreadPool;

/**
 * Servlet implementation class Umeng
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/downskip" })
public class DownSkip extends HttpServlet {

  private static final Logger LOG = Logger.getLogger(DownSkip.class);

  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public DownSkip() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      doRedirct(request, response);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      doRedirct(request, response);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  private void doRedirct(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	  String gamename = null;
	String gamenameId = null;
	Urlsinfo urlsinfo = null;
	gamenameId = request.getParameter("gamenameId");
	
	if(gamenameId.equalsIgnoreCase("k")){
		gamename = "杀手";
	}
	if(gamenameId.equalsIgnoreCase("m")){
		gamename = "梦想昆仑";
	}
	if(gamenameId.equalsIgnoreCase("c")){
		gamename = "苍穹仙尊";
	}
	if(gamenameId.equalsIgnoreCase("h")){
		gamename = "梦幻仙魔";
	}
//	byte[] jiema = gamename.getBytes();
//	gamename = new String(jiema,"utf-8");
	System.out.println("gamename为:"+gamename);
	long redirectId = WebDaoConfig.getIdByGamename(gamename);
    String strRedirectId = Long.valueOf(redirectId).toString();
    urlsinfo = DownSkipCacheConfig.getInstance().getNameLoadingCache(strRedirectId);
    String targetUrl = "http://vanggame.com";
    String ua = ((HttpServletRequest) request).getHeader("user-agent").toLowerCase();
     System.out.println(ua);
    if(ua!= null){
    if(ua.indexOf("micromessenger")>0){    //是微信浏览器
    	     if(ua.indexOf("iphone")>0||ua.indexOf("ipod")>0){    //是微信浏览器且是苹果系统
    	    	 targetUrl = urlsinfo.getResult().get("guide-page");
    	     }
    	     else{                                                  //是微信浏览器且是android系统
    	    	 if(urlsinfo.isMyapp()){
    	    		 targetUrl = urlsinfo.getResult().get("android-myapp");
    	    	 }
    	    	 else{
    	    		 targetUrl = urlsinfo.getResult().get("guide-page");
    	    	 }
    	     }
  }
    
    
    else{    //不是微信浏览器

    	 if (ua.matches("(.*)iphone(.*)") || ua.matches(
                 "(.*)ipod(.*)")) {
    		         targetUrl = urlsinfo.getResult().get("apple");
              }
             else{
            	  targetUrl = urlsinfo.getResult().get("android-normal");
                  }  	   
    }
    	
    
    
    
    }
//    ThreadPool.mThreadPool.execute(new LogInsert(request.getParameter("f"), request.getHeader("user-agent"), targetUrl, request.getHeader("X-Real-IP")!=null?request.getHeader("X-Real-IP"):request.getRemoteAddr()));
    response.sendRedirect(targetUrl);  
  }
    
    
    
//    if (request.getHeader("user-agent") != null
//        && (request.getHeader("user-agent").matches("(.*)iPhone(.*)") || request.getHeader("user-agent").matches(
//            "(.*)iPod(.*)"))) {
//      targetUrl = CacheConfig.getInstance().getNameLoadingCache("apple").getTargetUrl();
//    }else{
//      targetUrl = CacheConfig.getInstance().getNameLoadingCache("android").getTargetUrl();
//    }
//    ThreadPool.mThreadPool.execute(new LogInsert(request.getParameter("f"), request.getHeader("user-agent"), targetUrl, request.getHeader("X-Real-IP")!=null?request.getHeader("X-Real-IP"):request.getRemoteAddr()));
//    response.sendRedirect(targetUrl);
  

  @SuppressWarnings("rawtypes")
  private void printHeader(HttpServletRequest request) {
    Enumeration names = request.getHeaderNames();
    StringBuilder sb = new StringBuilder("headerInfo---");
    while (names.hasMoreElements()) {
      String name = names.nextElement().toString();
      Enumeration headers = request.getHeaders(name);
      sb.append(name).append(":");
      while (headers.hasMoreElements()) {
        sb.append(headers.nextElement()).append(" ");
      }
      sb.append("\n");
    }
    LOG.debug(sb.toString());
  }

}
