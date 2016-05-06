package com.account.activity;

import java.net.NetworkInterface;

import com.account.R;
import com.account.Server.RawService;
import com.account.bean.UserInfo;
import com.account.util.AccountService;
import com.account.util.CallBack;
import com.account.util.MACUtil;
import com.account.util.MetaUtil;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends Activity {


	
	private Context context;
	private Button btn_pay; //支付
	private Button btn_login; //网页登陆
	private Button btn_uid;
	private Button logout;
	private TextView tx_islogin; 
	private final String NAME_SPASE = "webjs"; //webView交互
//	private String url = "http://192.168.1.222:8080/x-account-server/jsp/login.jsp"; //登陆界面
	private WebView webpobView ; 
	private TextView tx_uuid; 
	private String getuid ; //登陆成功后得到的uid值
	private Activity act ;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		context = this;
		act = this;
		btn_pay = (Button)findViewById(R.id.btn_pay);
		btn_login =(Button) findViewById(R.id.btn_login);
		logout=(Button) findViewById(R.id.logout);
		btn_uid =(Button) findViewById(R.id.btn_uid);
		tx_uuid = (TextView) findViewById(R.id.txuuid);
		tx_islogin = (TextView) findViewById(R.id.islogin);
		btn_pay.setVisibility(View.INVISIBLE); //隐藏按钮(正式启动 )
		ProgressBar progressBar=new ProgressBar(context);
		progressBar.setLayoutParams(new LinearLayout.LayoutParams(500,100));
		//登陆按钮点击事件
		btn_login.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
//				webpobView = AccountService.getInstances().showWebDialog(context,new CallBack() {
//					
//					@Override
//					public void loginSuccess(UserInfo userInfo) {
//						// TODO Auto-generated method stub
//						Log.i("user", userInfo.getUsername()+userInfo.getUserID());
//					}
//				}); //返回一個webview
				Intent intent=new Intent(MainActivity.this, LoginActivity.class);
				startActivity(intent);
				
			}
		});

		btn_uid.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
//				if(AccountService.getInstances().getUid()!=null){
//					tx_uuid.setText(AccountService.getInstances().getUid());
//					Log.i("x", AccountService.getInstances().getName()+AccountService.getInstances().getToken());
//				}else{
//					tx_uuid.setText("uid为空");
//				}
//				String url="http://192.168.1.222:8080/x-account-server/LoginServlet";
				
				AccountService.getInstances().autoLogin(context,new CallBack() {
					@Override
					public void loginSuccess(UserInfo userInfo) {
						// TODO Auto-generated method stub
						Log.i("user", userInfo.getUsername()+userInfo.getUserID());
					}
				});
			}
		});
		logout.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				AccountService.getInstances().logout();
			}
		});
	}

}
