package com.account.Server;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import com.account.bean.UserInfo;
import com.account.util.CallBack;
import com.account.util.Constant;
import com.account.util.HttpUtils;
import com.account.util.MetaUtil;

public class RawService {
	public static final int BYNAME=1;
	public static final int BYPHONE=2;
	public static final int BYEMAIL=3;
	
	private Context context;

	public Dialog login_dialog = null; // 动态加载的dialog

	private static RawService instances = null;

	private SharedPreferences sp = null;

	private SharedPreferences.Editor editor;

	private UserInfo userInfo = null;

	private CallBack callBack;

	private boolean ifLogin = false;

	private static final String TAG = "RawService";

	private RawService() {
		super();
	}

	public static RawService getInstances() {
		if (instances == null) {
			instances = new RawService();
		}
		return instances;
	}
	
	/**
	 * 通过手机号登录
	 * 
	 */
	@SuppressWarnings("deprecation")
	public void login(final Context context,final String phone,final String password,final CallBack callBack){
		this.context=context;
		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        Log.i(TAG, "login"+userInfo.getStatus());
		        if(userInfo.getStatus().equals("success")){
		        	callBack.loginSuccess(userInfo);
		        }else if(userInfo.getStatus().equals("frezze")){//用户未激活
		        	
		        }else if(userInfo.getStatus().equals("err")){//用户不存在
		        	
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject stoneObject;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
					stoneObject = new JSONObject();  
		            try {
						stoneObject.put("phone", phone);
						stoneObject.put("pwd", password);
						stoneObject.put("loginType", BYPHONE);
						params.add(new BasicNameValuePair("info", stoneObject.toString()));
						String value=HttpUtils.httpPost(Constant.URLLOGINSERVLET,params);
						Message msg = new Message();
				        Bundle data = new Bundle();
				        data.putString("value",value);
				        msg.setData(data);
				        handler.sendMessage(msg);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		};
		new Thread(runnable).start();
        	
	}
	
	/**
	 * 通过手机号注册
	 * 
	 */
	@SuppressWarnings("deprecation")
	public void regist(final Context context,final String phone,final String password,final CallBack callBack){
		this.context=context;
		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        Log.i(TAG, "regist"+userInfo.getStatus());
		        if(userInfo.getStatus().equals("success")){
		        	callBack.loginSuccess(userInfo);
		        }else if(userInfo.getStatus().equals("errRepeat")){//用户已存在
		        	
		        }else if(userInfo.getStatus().equals("errInsert")){//插入数据库失败
		        	
		        	
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject stoneObject;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
					stoneObject = new JSONObject();  
		            try {
						stoneObject.put("phone", phone);
						stoneObject.put("pwd", password);
						stoneObject.put("loginType", BYPHONE);
						params.add(new BasicNameValuePair("info", stoneObject.toString()));
						String value=HttpUtils.httpPost(Constant.URLREGISTSERVLET,params);
						Message msg = new Message();
				        Bundle data = new Bundle();
				        data.putString("value",value);
				        msg.setData(data);
				        handler.sendMessage(msg);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		};
		new Thread(runnable).start();
        	
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
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        Log.i(TAG, "autoLogin"+userInfo.getStatus());
		        if(userInfo.getStatus().equals("success")){
		        	callBack.loginSuccess(userInfo);
		        }else if(userInfo.getStatus().equals("frezze")){//用户未激活
		        	
		        }else if(userInfo.getStatus().equals("err")){//用户不存在
		        	
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject stoneObject;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
				if(sp!=null&&sp.getString("uid",null)!=null&&sp.getBoolean("iflogin", true)){
					stoneObject = new JSONObject();  
		            try {
						stoneObject.put("uid", sp.getString("uid",null));
						stoneObject.put("channel_id", MetaUtil.getInstances(context).getMetaDataValue("EP_CHANNEL", null));
						stoneObject.put("appkey", MetaUtil.getInstances(context).getMetaDataValue("EP_APPKEY", null));
						params.add(new BasicNameValuePair("info", stoneObject.toString()));
						String value=HttpUtils.httpPost(Constant.URLLOGINSERVLET,params);
						Message msg = new Message();
				        Bundle data = new Bundle();
				        data.putString("value",value);
				        msg.setData(data);
				        handler.sendMessage(msg);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		};
		new Thread(runnable).start();
        	
	}
}
