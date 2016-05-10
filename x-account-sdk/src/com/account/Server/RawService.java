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

	private SharedPreferences spAccount = null;

	private SharedPreferences.Editor editor;
	
	private SharedPreferences spSDK;

	private UserInfo userInfo = null;

	private CallBack callBack;

	private boolean ifLogin = false;

	private static final String TAG = "RawService";

	private RawService() {
		
	}

	public void init(Context context){
		this.context=context;
		spAccount=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		spSDK=context.getSharedPreferences("com_epplus_sdk_prefer",Activity.MODE_PRIVATE);
		editor=spAccount.edit();
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
	public void login(final String phone,final String password,final CallBack callBack){

		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        if(val==null){
		        	callBack.loginFailure("网络异常");
		        	return;
		        }
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        Log.i(TAG, "login/"+userInfo.getStatus());
		        ifLogin=false;
		        if(userInfo.getStatus().equals("success")){
		        	editor.putString("uid", userInfo.getUserID());//保存uuid，用于下次自动登录
		        	editor.commit();
		        	ifLogin=true;
		        	callBack.loginSuccess(userInfo);
		        }else if(userInfo.getStatus().equals("frezze")){//用户未激活
		        	callBack.loginFailure("该用户未激活");
		        }else if(userInfo.getStatus().equals("err")){//用户不存在
		        	callBack.loginFailure("用户名或密码错误");
		        }else{
		        	callBack.loginFailure("登录失败，请稍后重试");
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject object;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
					object = new JSONObject();  
		            try {
						object.put("phone", phone);
						object.put("pwd", password);
						object.put("loginType", BYPHONE);
						object.put("flagid", spSDK.getString("flag_id", null));
						object.put("channel_id", MetaUtil.getInstances(context).getMetaDataValue("EP_CHANNEL", null));
						object.put("appkey", MetaUtil.getInstances(context).getMetaDataValue("EP_APPKEY", null));
						params.add(new BasicNameValuePair("info", object.toString()));
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
	public void regist(final String phone,final String password,final CallBack callBack){
		
		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        if(val==null){
		        	callBack.loginFailure("网络异常");
		        	return;
		        }
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        Log.i(TAG, "regist/"+userInfo.getStatus());
		        ifLogin=false;
		        if(userInfo.getStatus().equals("success")){
		        	editor.putString("uid", userInfo.getUserID());//保存uuid，用于下次自动登录
		        	editor.commit();
				    ifLogin=true;
		        	callBack.registSuccess(userInfo);
		        }else if(userInfo.getStatus().equals("errRepeat")){//用户已存在
		        	callBack.registFailure("该用户已存在");
		        }else{//插入数据库失败
		        	callBack.registFailure("注册失败，请稍后重试");
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject object;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
					object = new JSONObject();  
		            try {
						object.put("phone", phone);
						object.put("pwd", password);
						object.put("loginType", BYPHONE);
						object.put("flagid", spSDK.getString("flag_id", null));
						object.put("channel_id", MetaUtil.getInstances(context).getMetaDataValue("EP_CHANNEL", null));
						object.put("appkey", MetaUtil.getInstances(context).getMetaDataValue("EP_APPKEY", null));
						params.add(new BasicNameValuePair("info", object.toString()));
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
	public void autoLogin(final CallBack callBack){
		//如果有账号信息自动登录
		final Handler handler = new Handler(){
		    @Override
		    public void handleMessage(Message msg) {
		        super.handleMessage(msg);
		        Bundle data = msg.getData();
		        String val = data.getString("value");
		        if(val==null){
		        	callBack.loginFailure("网络异常");
		        	return;
		        }
		        userInfo=new UserInfo();
		        userInfo.setUserByJson(val);
		        Log.i(TAG, "autoLogin/"+userInfo.getStatus());
		        ifLogin=false;
		        if(userInfo.getStatus().equals("success")){
		        	editor.putString("uid", userInfo.getUserID());
		        	editor.commit();
		        	ifLogin=true;
		        	callBack.loginSuccess(userInfo);
		        }else if(userInfo.getStatus().equals("frezze")){//用户未激活
		        	callBack.loginFailure("该用户未激活");
		        }else if(userInfo.getStatus().equals("err")){//用户不存在
		        	callBack.loginFailure("该用户不存在");
		        }else{
		        	callBack.loginFailure("登录失败，请稍后重试");
		        }
		    }
		};
		
		Runnable runnable= new Runnable() {
			JSONObject object;
			@Override
			public void run() {
				List<NameValuePair> params = new ArrayList<NameValuePair>();
				if(spAccount!=null&&spAccount.getString("uid",null)!=null){
					object = new JSONObject();  
		            try {
						object.put("uid", spAccount.getString("uid",null));
						object.put("flagid", spSDK.getString("flag_id", null));
						object.put("channel_id", MetaUtil.getInstances(context).getMetaDataValue("EP_CHANNEL", null));
						object.put("appkey", MetaUtil.getInstances(context).getMetaDataValue("EP_APPKEY", null));
						params.add(new BasicNameValuePair("info", object.toString()));
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
	
	public void logOut(){
		if(editor!=null){
			editor.clear();
			editor.commit();
		}
	}
}
