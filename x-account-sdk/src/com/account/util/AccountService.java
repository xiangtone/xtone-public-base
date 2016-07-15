package com.account.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EncodingUtils;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

import com.account.bean.UserInfo;

import android.R;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.Bitmap;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
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
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
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
	
	private UserInfo userInfo=null;
	
	private CallBack callBack;
	
	public static boolean ifLogin=false;
	
	private static final String TAG="AccountService";
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
	 * 动态创建一个dialog窗口,调用showWebDialog(Context context,String url,int width,int height,String interfaceName),width默认为屏幕80%,height默认为屏幕55%,interfaceName默认为webjs。
	 * @param width为弹出窗口的宽
	 * @param height为弹出窗口的高
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,CallBack callBack){
		WindowManager wm = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
		 
	     int width = wm.getDefaultDisplay().getWidth()*80/100;
	     int height = wm.getDefaultDisplay().getHeight()*55/100;
	     return showWebDialog(context,width,height,"webjs",callBack);
	}
	/**
	 * 动态创建一个dialog窗口,调用showWebDialog(Context context,String url,int width,int height,String interfaceName),interfaceName默认为webjs。
	 * @param width为弹出窗口的宽
	 * @param height为弹出窗口的高
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,int width,int height,CallBack callBack){
		return showWebDialog(context,width,height,"webjs",callBack);
	}
	/**
	 * 动态创建一个dialog窗口
	 * @param width为弹出窗口的宽
	 * @param height为弹出窗口的高
	 * @param interfaceName:为与web应用js交互的对象
	 * @return WebView
	 */
	public WebView showWebDialog(Context context,int width,int height,String interfaceName,final CallBack callBack) {
		webpobView = new WebView(context);
		this.context=context;
		this.callBack = callBack;
		sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		editor=sp.edit();
		
//		if(ifLogin&&userInfo.getUsername()!=null){
//			Toast.makeText(context, "用户 "+userInfo.getUsername()+" 已登录", Toast.LENGTH_SHORT).show();
//			return null;
//		}
		
		// 装dialog的叠层布局Layoutparams
		FrameLayout linearLayout = new FrameLayout(context);
		LayoutParams plaqueParams = new LayoutParams(
				new LinearLayout.LayoutParams(width,height));//布局和webview大小
		plaqueParams.gravity=Gravity.CENTER;//设置居中显示
//		linearLayout.setGravity(Gravity.CENTER);//设置居中显示
		linearLayout.setLayoutParams(plaqueParams);
		//进度条
		final ProgressBar progressBar=new ProgressBar(context);
		LayoutParams barParams = new LayoutParams(
				new LinearLayout.LayoutParams(200,200));//进度条大小
		barParams.gravity=Gravity.CENTER;//设置居中显示
		progressBar.setLayoutParams(barParams);

		// webview的Layoutparams

		webpobView.setLayoutParams(plaqueParams);
		
		webpobView.loadUrl(Constant.URLLOGIN);
		// 设置支持javascript
		webpobView.getSettings().setJavaScriptEnabled(true);
		// js能调用android项目方法
		webpobView.addJavascriptInterface(new WebJsInterface(context), interfaceName);
		// 启动缓存
		webpobView.getSettings().setAppCacheEnabled(true);
		//禁止缩放
		webpobView.getSettings().setUseWideViewPort(false);
		webpobView.setWebViewClient(new WebViewClient() {
			@Override
			public boolean shouldOverrideUrlLoading(WebView view, String url) {
//				view.loadUrl(url);
				return false;
			}
			@Override
			public void onPageStarted(WebView view, String url, Bitmap favicon) {
//				cookieStr=sp.getString("cookies",null);
//				if(cookieStr!=null){
//					CookieManager cookieManager = CookieManager.getInstance();
//					cookieManager.setAcceptCookie(true); 
//					cookieManager.setCookie(url, cookieStr);
//				}
				super.onPageStarted(view, url, favicon);
			}
			@Override
			public void onPageFinished(WebView view, String url) {
//				CookieManager cookieManager = CookieManager.getInstance();
//				cookieStr = cookieManager.getCookie(url);
//				editor.putString("cookies",cookieStr);
//		        editor.commit();
				progressBar.setVisibility(View.GONE);
		        view.loadUrl("javascript:window.webjs.showSource('<head>'+" +
	                    "document.getElementsByTagName('html')[0].innerHTML+'</head>');");
				super.onPageFinished(view, url);
			}
			@Override
			public void onReceivedError(WebView view, int errorCode,
					String description, String failingUrl) {
				//还不能实现重试功能
				view.loadUrl("file:///android_asset/404.html");
				super.onReceivedError(view,errorCode,description,failingUrl);
			}
		});
		
//		webpobView.setWebChromeClient(new WebChromeClient() {
//			public void onProgressChanged(WebView view, int progress) {
//				progressBar.setProgress(progress * 100);
//			}
//			});
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
						login_dialog.dismiss();
//					}
                }
				return false;
			}
		});

		// 线性布局装webview
		linearLayout.addView(webpobView);
		linearLayout.addView(progressBar);
		
		// dialog加载线性布局
		login_dialog.setContentView(linearLayout);

	  return webpobView;
	}
	
	public void logout() {
		userInfo=null;
		if(editor!=null){
			editor.clear();
			editor.commit();
		}
//		Log.i("iflogin", sp.getBoolean("iflogin",false)+"");
	}
	
	private Boolean loginSuccess(){
//		ifLogin=sp.getBoolean("iflogin",false);
//		Log.i(TAG, "是否登录成功:"+ifLogin);
		if(ifLogin){
			userInfo=new UserInfo();
			userInfo.setUserName(sp.getString("name",null));
			userInfo.setToken(sp.getString("token",null));
			userInfo.setUserID(sp.getString("uid",null));
//			userInfo.setSessionId(sp.getString("sessionId",null));
		}
		return ifLogin;
	}
	
	public void closeWeb(){
		login_dialog.dismiss();
		callBack.clickClose();
		if(loginSuccess()){
			ifLogin=false;
			callBack.loginSuccess(userInfo);
		}
	}
	
	@SuppressWarnings("deprecation")
	public void autoLogin(final Context context,final CallBack callBack){
		//如果有账号信息自动登录
		this.context=context;
		sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		editor=sp.edit();
		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        Bundle data = msg.getData();
		        String val = data.getString("value");

		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        ifLogin=false;
		        if(userInfo.getStatus().equals("success")){
//		        	editor.putBoolean("iflogin",true);
		        	editor.putString("uid", userInfo.getUserID());//保存uuid，用于下次自动登录
//		        	editor.putString("sessionId", userInfo.getSessionId());
		        	editor.putString("token", userInfo.getToken());
		        	editor.commit();
		        	ifLogin=true;
		        	callBack.loginSuccess(userInfo);
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject stoneObject;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
				if(sp!=null&&sp.getString("uid",null)!=null){
					stoneObject = new JSONObject();  
		            try {
						stoneObject.put("uid", sp.getString("uid",null));
//						stoneObject.put("sessionId", sp.getString("sessionId",null));
						stoneObject.put("token", sp.getString("token",null));
						stoneObject.put("channel_id", MetaUtil.getInstances(context).getMetaDataValue("EP_CHANNEL", null));
						stoneObject.put("appkey", MetaUtil.getInstances(context).getMetaDataValue("EP_APPKEY", null));
						params.add(new BasicNameValuePair("info", stoneObject.toString()));
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		            String value=HttpUtils.httpPost(Constant.URLLOGINSERVLET,params);
			        if(value==null||value.isEmpty()){
			        	return;
			        }
					Message msg = new Message();
			        Bundle data = new Bundle();
			        data.putString("value",value);
			        msg.setData(data);
			        handler.sendMessage(msg);
				}
			}
		};
		new Thread(runnable).start();
        	
	}
	
	@SuppressWarnings("deprecation")
	public void authLogin(final Context context,final CallBack callBack){
		//如果有账号信息自动登录
		this.context=context;
		sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		editor=sp.edit();
		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        ifLogin=false;
		        if(userInfo.getStatus().equals("success")){
		        	editor.putBoolean("iflogin",true);
		        	editor.putString("uid", userInfo.getUserID());//保存uuid，用于下次自动登录
//		        	editor.putString("sessionId", userInfo.getSessionId());
		        	editor.putString("token", userInfo.getToken());
		        	editor.commit();
		        	ifLogin=true;
		        	callBack.loginSuccess(userInfo);
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject stoneObject;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
				
					stoneObject = new JSONObject();  
//		            try {
//						stoneObject.put("token", sp.getString("token",null));
						params.add(new BasicNameValuePair("token", sp.getString("token",null)));
						String value=HttpUtils.httpPost(Constant.URLLOGAUTHSERVLET,params);
						if(value==null||value.isEmpty()){
				        	return;
				        }
						Message msg = new Message();
				        Bundle data = new Bundle();
//				        Log.i(TAG, value);
				        data.putString("value",value);
				        msg.setData(data);
				        handler.sendMessage(msg);
//					} catch (JSONException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
				}
			
		};
		new Thread(runnable).start();
        	
	}

}

