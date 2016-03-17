package com.accout.util;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;

import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnKeyListener;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;


public class LoginUtils {
	
	private Context context;
	
	public Dialog login_dialog; //动态加载的dialog
	
	private static LoginUtils loginUtils =null;
	
	private LoginUtils() {
		super();
	}
	
	public static LoginUtils getInstances(){
		if(loginUtils == null){
			loginUtils = new LoginUtils();
		}
	return loginUtils;	
	}
	
	/**
	 * 动态创建一个dialog窗口,调用showWebDialog(Context context,String url,String interfaceName),interfaceName默认为webjs。
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,String url){
		return showWebDialog(context,url,"webjs");
	}
	/**
	 * 动态创建一个dialog窗口
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,String url,String interfaceName) {
		this.context=context;
		// 打开登陆界面
		// 装dialog的线性布局Layoutparams
		LinearLayout linearLayout = new LinearLayout(context);
		linearLayout.setLayoutParams(new LinearLayout.LayoutParams(
				LinearLayout.LayoutParams.MATCH_PARENT,
				LinearLayout.LayoutParams.MATCH_PARENT));

		RelativeLayout plaqueRelative = new RelativeLayout(context);

		// 设置padding
		plaqueRelative.setGravity(Gravity.CENTER);
		// 装webview的相对布局Layoutparams
		plaqueRelative.setLayoutParams(new LinearLayout.LayoutParams(
				LinearLayout.LayoutParams.MATCH_PARENT,
				LinearLayout.LayoutParams.MATCH_PARENT));// 设置dialog宽度高度

		final WebView webpobView = new WebView(context);

		// webview的Layoutparams
		LayoutParams plaqueParams = new LayoutParams(
				new LinearLayout.LayoutParams(
						LinearLayout.LayoutParams.MATCH_PARENT,
						LinearLayout.LayoutParams.MATCH_PARENT));

		webpobView.setLayoutParams(plaqueParams);
		webpobView.loadUrl(url);

		// 设置支持javascript
		webpobView.getSettings().setJavaScriptEnabled(true);
		// js能调用android项目方法
		webpobView.addJavascriptInterface(new WebJsInterface(context), interfaceName);
		// 启动缓存
		webpobView.getSettings().setAppCacheEnabled(true);

		webpobView.setWebViewClient(new WebViewClient() {
			@Override
			public boolean shouldOverrideUrlLoading(WebView view, String url) {
				view.loadUrl(url);
				return true;
			}
		});

		webpobView.setOnKeyListener(new OnKeyListener() {
			
			@Override
			public boolean onKey(View v, int keyCode, KeyEvent event) {
				// TODO Auto-generated method stub
				if(keyCode == KeyEvent.KEYCODE_BACK) {  
					if(webpobView.canGoBack()){
						webpobView.goBack();
					}else{
						login_dialog.cancel();
					}
					
                }
				return false;
			}
		});
		
		login_dialog = new Dialog(context,
				android.R.style.Theme_Translucent_NoTitleBar);
		login_dialog.setCancelable(false);
		login_dialog.show();

//		login_dialog.setOnKeyListener(new OnKeyListener() {
//
//			@Override
//			public boolean onKey(DialogInterface dialog, int keyCode,
//					KeyEvent event) {
//				if(keyCode == KeyEvent.KEYCODE_BACK) {  
//					dialog.cancel();
//                }  
//				return false;
//			}
//		});

		// 相对布局装webview
		plaqueRelative.addView(webpobView);
		// 线性布局装相对布局
		linearLayout.addView(plaqueRelative);
		// dialog加载线性布局
		login_dialog.setContentView(linearLayout);

	  return webpobView;
	}
	
}

