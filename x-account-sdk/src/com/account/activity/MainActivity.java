package com.account.activity;

import java.net.NetworkInterface;

import com.account.R;
import com.account.Server.RawService;
import com.account.UI.LoginDialog;
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
	private Button btn_html;
	private Button btn_auth;
	private Button logout;
	private TextView tx_islogin; 
	private final String NAME_SPASE = "webjs"; //webView交互
	private WebView webpobView ; 
	private TextView tx_uuid; 
	private String getuid ; //登陆成功后得到的uid值
	private Activity act ;
	private static final String TGA="MainActivity";
	
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
		btn_html =(Button) findViewById(R.id.btn_html);
		btn_auth =(Button) findViewById(R.id.btn_auth);
		tx_uuid = (TextView) findViewById(R.id.txuuid);
		tx_islogin = (TextView) findViewById(R.id.islogin);
		btn_pay.setVisibility(View.INVISIBLE); //隐藏按钮(正式启动 )
		RawService.getInstances().init(context);
		//登陆按钮点击事件
		btn_login.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent=new Intent(context, LoginActivity.class);
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
				
				try {
					AccountService.getInstances().autoLogin(context,new CallBack() {
						@Override
						public void loginSuccess(UserInfo userInfo) {
							// TODO Auto-generated method stub
							Log.i("autoLogin", userInfo.getUserName()+"/"+userInfo.getUserID()+"/"+userInfo.getToken());
						}
					});
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				
//				RawService.getInstances().autoLogin(new CallBack() {
//					@Override
//					public void loginSuccess(UserInfo userInfo) {
//						// TODO Auto-generated method stub
//						Toast.makeText(context, userInfo.getUserID(), Toast.LENGTH_SHORT).show();
//					}
//					@Override
//					public void loginFailure(String massage) {
//						// TODO Auto-generated method stub
//						Toast.makeText(context, massage, Toast.LENGTH_SHORT).show();
//					}
//				});
			}
		});
		
		btn_html.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				webpobView = AccountService.getInstances().showWebDialog(context,new CallBack() {
				
				@Override
				public void loginSuccess(UserInfo userInfo) {
					// TODO Auto-generated method stub
					Log.i("login", userInfo.getUserName()+"/"+userInfo.getUserID()+"/"+userInfo.getToken());
				}
			}); //返回一個webview
			}
		});
		
		logout.setOnClickListener(new OnClickListener() {
			@Override 
			public void onClick(View v) {
				// TODO Auto-generated method stub
				RawService.getInstances().logOut();
			}
		});
		
		btn_auth.setOnClickListener(new OnClickListener() {
			@Override 
			public void onClick(View v) {
				AccountService.getInstances().authLogin(context,new CallBack() {
					@Override
					public void loginSuccess(UserInfo userInfo) {
						// TODO Auto-generated method stub
						Log.i("authLogin", userInfo.getUserName()+"/"+userInfo.getUserID()+"/"+userInfo.getToken());
					}
				});
			}
		});
	}

}
