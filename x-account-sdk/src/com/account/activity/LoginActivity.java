package com.account.activity;

import org.json.JSONException;
import org.json.JSONObject;

import com.account.R;
import com.account.Server.RawService;
import com.account.bean.UserInfo;
import com.account.util.CallBack;
import com.account.util.MetaUtil;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View.OnClickListener;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout.LayoutParams;
import android.widget.Toast;

public class LoginActivity extends Activity {
	private Button btnLogin;
	private Button btnToRegist;
	private EditText etName;
	private EditText etPwd;
	private Context context;
	private static final String TAG = "LoginActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_login);
		init();
		findView();
		setClick();
	}

	private void init() {
		// TODO Auto-generated method stub
		context=LoginActivity.this;
		RawService.getInstances().init(context);
		WindowManager wm = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
	    int width = wm.getDefaultDisplay().getWidth()*80/100;
	    int height = wm.getDefaultDisplay().getHeight()*55/100;
		getWindow().setLayout(width, height);
	}

	private void setClick() {
		// TODO Auto-generated method stub
		btnLogin.setOnClickListener(clickListener);
		btnToRegist.setOnClickListener(clickListener);
	}

	private void findView() {
		// TODO Auto-generated method stub
		btnLogin = (Button) findViewById(R.id.btn_login);
		btnToRegist = (Button) findViewById(R.id.btn_to_regsit);
		etName = (EditText) findViewById(R.id.et_name);
		etPwd = (EditText) findViewById(R.id.et_pwd);
	}

	OnClickListener clickListener = new OnClickListener() {

		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			switch (v.getId()) {
			case R.id.btn_login:
				login();
				break;
			case R.id.btn_to_regsit:
				toRegist();
				break;

			default:
				break;
			}
		}
	};

	protected void login() {
		String phone=etName.getText().toString().trim();
		String password=etPwd.getText().toString().trim();
		if(phone.length()!=11||phone==null){
			Toast.makeText(context, "请输入11位手机号", Toast.LENGTH_SHORT).show();
			etName.requestFocus();
			return;
		}
		if(password.length()<6||password.length()>20||password==null){
			Toast.makeText(context, "请输入6-20位数密码", Toast.LENGTH_SHORT).show();
			etPwd.requestFocus();
			return;
		}
		// TODO Auto-generated method stub
		RawService.getInstances().login(phone, password, new CallBack() {
			
			@Override
			public void loginSuccess(UserInfo userInfo) {
				// TODO Auto-generated method stub
				Log.i(TAG, userInfo.getPhone()+"/"+userInfo.getUserID());
				finish();
			}
			
			@Override
			public void loginFailure(String massage) {
				// TODO Auto-generated method stub
				Toast.makeText(context, massage, Toast.LENGTH_SHORT).show();
			}
		});
	}

	protected void toRegist() {
		// TODO Auto-generated method stub
		Intent intent=new Intent(context,RegistActivity.class);
		startActivity(intent);
//		JSONObject object = new JSONObject();  
//        	try {
//				object.put("name", "phone");
//				object.put("phone", "phone");
//				object.put("pwd", "phone");
//				object.put("loginType", "phone");
//				object.put("flagid", "phone");
//				Log.i(TAG, object.toString());
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
	}

}
