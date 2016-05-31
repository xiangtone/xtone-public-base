package com.account.util;

import org.json.JSONObject;

import com.account.bean.UserInfo;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.widget.Toast;

public class WebJsInterface {
	private Context context = null;
	private SharedPreferences sp;
	private SharedPreferences.Editor editor;
	private static final String TAG="WebJsInterface";
	
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
		if(user.getStatus().equals("success"));
		Log.i(TAG, json.toString());
//		try {
//			JSONObject jsonObject=new JSONObject(json);
//			editor.putString("name",jsonObject.getString("name"));
//			editor.putString("pwd",jsonObject.getString("pwd"));
//			editor.putString("uid",jsonObject.getString("uid"));
//			editor.putString("token",MACUtil.getInstances().getMac());
//			editor.putBoolean("iflogin", true);
//	        editor.commit();
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
	}
	
	@JavascriptInterface
	public void closeWeb(){
		Log.i(TAG, "closeWeb");
		AccountService.getInstances().closeWeb();
	}
	
	@JavascriptInterface
	public void clearUser(){
		editor.putString("name",null);
		editor.putString("pwd",null);
		editor.putString("uid",null);
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
	
}
