package com.account.util;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.Bitmap;

import android.util.Log;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.webkit.CookieSyncManager;
import android.webkit.CookieManager;
//import android.view.View.OnKeyListener;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;


public class AccountService {
	
	private Context context;
	
	public Dialog login_dialog=null; //动态加载的dialog
	
	private WebView webpobView=null;
	
	private static AccountService loginUtils =null;
	
	private SharedPreferences sp=null;
	
	private SharedPreferences.Editor editor;
	
	private String cookieStr;
	
	private AccountService() {
		super();
	}
	
	public static AccountService getInstances(){
		if(loginUtils == null){
			loginUtils = new AccountService();
		}
	return loginUtils;	
	}
	
	/**
	 * 动态创建一个dialog窗口,调用showWebDialog(Context context,String url,int width,int height,String interfaceName),width默认为屏幕4/5,height默认为屏幕3/5,interfaceName默认为webjs。
	 * @param width为弹出窗口的宽
	 * @param height为弹出窗口的高
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,String url){
		WindowManager wm = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
		 
	     int width = wm.getDefaultDisplay().getWidth()*4/5;
	     int height = wm.getDefaultDisplay().getHeight()*11/20;
//		return showWebDialog(context,url,650,700,"webjs");
	     return showWebDialog(context,url,width,height,"webjs");
	}
	/**
	 * 动态创建一个dialog窗口,调用showWebDialog(Context context,String url,int width,int height,String interfaceName),interfaceName默认为webjs。
	 * @param width为弹出窗口的宽
	 * @param height为弹出窗口的高
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,String url,int width,int height){
		return showWebDialog(context,url,width,height,"webjs");
	}
	/**
	 * 动态创建一个dialog窗口
	 * @param width为弹出窗口的宽
	 * @param height为弹出窗口的高
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,String url,int width,int height,String interfaceName) {
		
//		if(login_dialog!=null){
//			login_dialog.show();
//			return webpobView;
//		}
		webpobView = new WebView(context);
		this.context=context;
		sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		editor=sp.edit();
		// 打开登陆界面
		// 装dialog的线性布局Layoutparams
		LinearLayout linearLayout = new LinearLayout(context);
		linearLayout.setLayoutParams(new LinearLayout.LayoutParams(width,height));
		linearLayout.setGravity(Gravity.CENTER);//设置居中弹出

		// webview的Layoutparams
		LayoutParams plaqueParams = new LayoutParams(
				new LinearLayout.LayoutParams(width,height));

		webpobView.setLayoutParams(plaqueParams);
		
		webpobView.loadUrl(url);
		// 设置支持javascript
		webpobView.getSettings().setJavaScriptEnabled(true);
		// js能调用android项目方法
		webpobView.addJavascriptInterface(new WebJsInterface(context), interfaceName);
		// 启动缓存
		webpobView.getSettings().setAppCacheEnabled(true);
//		webpobView.getSettings().setCacheMode();
		webpobView.getSettings().setUseWideViewPort(false);//禁止缩放
		webpobView.setWebViewClient(new WebViewClient() {
			@Override
			public boolean shouldOverrideUrlLoading(WebView view, String url) {
//				view.loadUrl(url);
				return false;
			}
			@Override
			public void onPageStarted(WebView view, String url, Bitmap favicon) {
				// TODO Auto-generated method stub
				cookieStr=sp.getString("cookies",null);
				if(cookieStr!=null){
					CookieManager cookieManager = CookieManager.getInstance();
					cookieManager.setAcceptCookie(true); 
					cookieManager.setCookie(url, cookieStr);
				}
				super.onPageStarted(view, url, favicon);
			}

			public void onPageFinished(WebView view, String url) {
				CookieManager cookieManager = CookieManager.getInstance();
				cookieStr = cookieManager.getCookie(url);
				editor.putString("cookies",cookieStr);
		        editor.commit();
		        view.loadUrl("javascript:window.webjs.showSource('<head>'+" +
	                    "document.getElementsByTagName('html')[0].innerHTML+'</head>');");
				super.onPageFinished(view, url);
			}

			@Override
			public void onReceivedError(WebView view, int errorCode,
					String description, String failingUrl) {
				// TODO Auto-generated method stub
				view.loadUrl("file:///android_asset/404.html");
//				super.onReceivedError(view, errorCode, description, failingUrl);
			}
		});

//		webpobView.setOnKeyListener(new OnKeyListener() {
//			
//			@Override
//			public boolean onKey(View v, int keyCode, KeyEvent event) {
//				// TODO Auto-generated method stub
//				if(keyCode == KeyEvent.KEYCODE_BACK) {  
//					if(webpobView.canGoBack()){
//						webpobView.goBack();
//						Log.i("", "1");
//					}else{
//						login_dialog.cancel();
//					}
//					
//                }
//				return false;
//			}
//		});
		
		login_dialog = new Dialog(context,
				android.R.style.Theme_Translucent_NoTitleBar);
		login_dialog.setCancelable(false);
		login_dialog.show();
		login_dialog.setOnKeyListener(new OnKeyListener() {

			@Override
			public boolean onKey(DialogInterface dialog, int keyCode,
					KeyEvent event) {
				if(keyCode == KeyEvent.KEYCODE_BACK&&event.getAction()==KeyEvent.ACTION_DOWN) {  
//					if(webpobView.canGoBack()){
//						webpobView.goBack();
//					}else{
						login_dialog.cancel();
//					}
//						login_dialog.hide();
                }
				return false;
			}
		});

		// 线性布局装webview
		linearLayout.addView(webpobView);
		// dialog加载线性布局
		login_dialog.setContentView(linearLayout);

	  return webpobView;
	}
	
	public String getUid() {
		String Uid="请先登录!";
		if(sp!=null){
			Uid=sp.getString("uid",Uid);
		}	
		return Uid;
	}
	
	public void close(){
//		login_dialog.hide();
		login_dialog.cancel();
	}

	public void refresh() {
		// TODO Auto-generated method stub
		webpobView.goBack();
	}
	
}

