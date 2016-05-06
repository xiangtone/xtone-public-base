package com.account.activity;

import com.account.R;
import com.account.Server.RawService;
import com.account.bean.UserInfo;
import com.account.util.CallBack;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View.OnClickListener;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;

public class LoginActivity extends Activity {
	private Button btnLogin;
	private Button btnToRegist;
	private EditText etName;
	private EditText etPwd;
	private Context context;

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
	}

	private void setClick() {
		// TODO Auto-generated method stub
		btnLogin.setOnClickListener(clickListener);
		btnToRegist.setOnClickListener(clickListener);
	}

	private void findView() {
		// TODO Auto-generated method stub
		btnLogin = (Button) findViewById(R.id.btn_login);
		btnToRegist = (Button) findViewById(R.id.btn_to_regist);
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
			case R.id.btn_to_regist:

				break;

			default:
				break;
			}
		}
	};

	protected void login() {
		// TODO Auto-generated method stub
		RawService.getInstances().login(context, etName.getText().toString().trim(), etPwd.getText().toString().trim(), new CallBack() {
			
			@Override
			public void loginSuccess(UserInfo userInfo) {
				// TODO Auto-generated method stub
				Log.i("user", userInfo.getUsername()+"/"+userInfo.getUserID());
			}
		});
	}

}
