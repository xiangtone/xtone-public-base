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
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class RegistActivity extends Activity {
	private Button btnRegOk;
	private Button btnRegCancle;
	private EditText etRegName;
	private EditText etRegPwd;
	private Context context;
	private static final String TAG = "RegistActivity";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_regist);
		init();
		findView();
		setClick();
	}

	private void init() {
		// TODO Auto-generated method stub
		context=RegistActivity.this;
		RawService.getInstances().init(context);
		WindowManager wm = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
	    int width = wm.getDefaultDisplay().getWidth()*80/100;
	    int height = wm.getDefaultDisplay().getHeight()*55/100;
		getWindow().setLayout(width, height);
	}

	private void setClick() {
		// TODO Auto-generated method stub
		btnRegOk.setOnClickListener(clickListener);
		btnRegCancle.setOnClickListener(clickListener);
	}

	private void findView() {
		// TODO Auto-generated method stub
		btnRegOk = (Button) findViewById(R.id.btn_reg_ok);
		btnRegCancle = (Button) findViewById(R.id.btn_reg_cancle);
		etRegName = (EditText) findViewById(R.id.et_reg_name);
		etRegPwd = (EditText) findViewById(R.id.et_reg_pwd);
	}

	OnClickListener clickListener = new OnClickListener() {

		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			switch (v.getId()) {
			case R.id.btn_reg_ok:
				regist();
				break;
			case R.id.btn_reg_cancle:
				finish();
				break;

			default:
				break;
			}
		}
	};

	protected void regist() {
		String phone=etRegName.getText().toString().trim();
		String password=etRegPwd.getText().toString().trim();
		if(!RegistUtils.isMobileNO(phone)){
			Toast.makeText(context, "请输入11位手机号", Toast.LENGTH_SHORT).show();
			etRegName.requestFocus();
			return;
		}
		if(password.length()<6||password.length()>20||password==null){
			Toast.makeText(context, "请输入6-20位数密码", Toast.LENGTH_SHORT).show();
			etRegPwd.requestFocus();
			return;
		}
		
		// TODO Auto-generated method stub
		RawService.getInstances().regist(phone, password, new CallBack() {
			@Override
			public void registSuccess(UserInfo userInfo) {
				// TODO Auto-generated method stub
				Log.i(TAG, userInfo.getPhone()+"/"+userInfo.getUserID());
				finish();
			}
			@Override
			public void registFailure(String massage) {
				// TODO Auto-generated method stub
				Toast.makeText(context, massage, Toast.LENGTH_SHORT).show();
			}
		});
	}

}
