package com.account.util;

import org.json.JSONObject;

import com.account.bean.UserInfo;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.webkit.JavascriptInterface;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Toast;
import android.widget.FrameLayout.LayoutParams;

public class WebJsInterface {
	private Context context = null;
	private SharedPreferences sp;
	private SharedPreferences.Editor editor;
	private static final String TAG="WebJsInterface";
	public static CallBack callBack=null;
	
	public WebJsInterface(Context context) {
		this.context = context;
		sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		editor=sp.edit();
	}

	@JavascriptInterface
	public void toastLong(String tip) {

		Toast.makeText(context, tip, Toast.LENGTH_LONG).show();

	}
	
	@JavascriptInterface
	public void toastShort(String tip) {

		Toast.makeText(context, tip, Toast.LENGTH_SHORT).show();

	}
	
	@JavascriptInterface
	public void setUser(String json) {
		UserInfo user=new UserInfo();
		user.setUserByJson(json);
		Log.i(TAG, json.toString());
		if(user.getStatus().equals("success")){
			try {
				editor.putString("name",user.getUserName());
//				editor.putString("pwd",jsonObject.getString("pwd"));
				editor.putString("uid",user.getUserID());
//				editor.putString("sessionId",user.getSessionId());
				editor.putString("token",user.getUserID());
				editor.putBoolean("iflogin", true);
				AccountService.ifLogin=true;
				callBack.loginSuccess(user);
		        editor.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
	}
	
	@JavascriptInterface
	public void loginFailure(String message){
		callBack.loginFailure(message);
	}
	
	@JavascriptInterface
	public void registSuccess(String message){
		callBack.registSuccess(message);
	}
	
	@JavascriptInterface
	public void registFailure(String message){
		callBack.registFailure(message);
	}
	
	/*
	 * 关闭dialog并回调关闭
	 */
	@JavascriptInterface
	public void closeWeb(){
		Log.i(TAG, "closeWeb");
		AccountService.getInstances().closeWeb();
	}
	
	/*
	 * 登陆/注册成功后关闭dialog，不回调关闭
	 */
	@JavascriptInterface
	public void closeIfLogin(){
		Log.i(TAG, "closeIfLogin");
		AccountService.getInstances().closeIfLogin();
	}
	
	@JavascriptInterface
	public void clearUser(){
		editor.clear();
        editor.commit();
	}
	
	@JavascriptInterface
	public void showSource(String html) {
        Log.i("HTML", html);
    }
	
	@JavascriptInterface
	public String getFlagId() {
		SharedPreferences sp=context.getSharedPreferences("com_epplus_sdk_prefer",Activity.MODE_PRIVATE);
		return sp.getString("flag_id", null);
    }
	
	@JavascriptInterface
	public String getChannel() {
		return MetaUtil.getInstances(context).getMetaDataValue("EP_CHANNEL", null);
    }
	
	@JavascriptInterface
	public String getAppkey() {
		return MetaUtil.getInstances(context).getMetaDataValue("EP_APPKEY", null);
    }
	
	@JavascriptInterface
	public void showProgressBar(){
		AccountService.getInstances().showProgress();
	}
	
	@JavascriptInterface
	public void hiddProgressBar(){
		AccountService.getInstances().hideProgress();
	}
}
