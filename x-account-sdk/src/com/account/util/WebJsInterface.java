package com.account.util;

import org.json.JSONObject;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
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
	public void setUser(String json) {
				
		try {
			JSONObject jsonObject=new JSONObject(json);
			editor.putString("name",jsonObject.getString("name"));
			editor.putString("pwd",jsonObject.getString("pwd"));
			editor.putString("uid",jsonObject.getString("uid"));
	        editor.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	@android.webkit.JavascriptInterface
	public void closeWeb(){
		AccountService.getInstances().close();
	}
	
	@android.webkit.JavascriptInterface
	 public void showSource(String html) {
         Log.i("HTML", html);
     }
	
}
