package com.account.util;

import org.json.JSONObject;

import com.account.bean.User;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.util.Log;
import android.widget.Toast;

public class WebJsInterface {
	private Context context = null;
	private SharedPreferences sp;
	private SharedPreferences.Editor editor;
	public WebJsInterface(Context context) {
		this.context = context;
		sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
		editor=sp.edit();
	}

	@android.webkit.JavascriptInterface
	public void toastLong(String tip) {

		Toast.makeText(context, tip, Toast.LENGTH_LONG).show();

	}
	
	@android.webkit.JavascriptInterface
	public void toastShort(String tip) {

		Toast.makeText(context, tip, Toast.LENGTH_SHORT).show();

	}
	
	@android.webkit.JavascriptInterface
	public void setUser(JSONObject object) {
//		if(user!=null){
//			SharedPreferences sp=context.getSharedPreferences("account",Activity.MODE_PRIVATE);
//			SharedPreferences.Editor editor=sp.edit();  
//			editor.putString("name",user.getName()); 
//			editor.putString("pwd",user.getPwd()); 
//			editor.putString("phone",user.getPhone()); 
//			editor.putString("uid",user.getUid()); 
//	        editor.commit();
//		}	
	}
	
	@android.webkit.JavascriptInterface
	public void setUid(String uid) {
		editor.putString("uid",uid); 
        editor.commit();	
	}
	
}
