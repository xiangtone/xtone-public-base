package com.onlinegamelogin.activity;

import com.onlinegamelogin.R;
import com.onlinegame.dao.LoginUtils;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends Activity {


	
	private Context context;
	private Button btn_pay; //支付
	private Button btn_login; //网页登陆
	private TextView tx_islogin; 
	private final String NAME_SPASE = "webjs"; //webView交互
	private String url = "http://192.168.1.222:8080/" + "x-account-server/login.jsp"; //登陆界面
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
		tx_uuid = (TextView) findViewById(R.id.txuuid);
		tx_islogin = (TextView) findViewById(R.id.islogin);
		btn_pay.setVisibility(View.INVISIBLE); //隐藏按钮(正式启动 )
//		
//		//登陆按钮点击事件
		btn_login.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				webpobView = LoginUtils.getInstances().showLoginDialog(context, url); //返回一個webview
				webpobView.addJavascriptInterface(new JavascriptInterface(context), NAME_SPASE); //设置webview的javascript
				
				
			}
		});

		
		
	}

	/**
	 * webView使用JavaScript获得网页传的数据
	 * @author 28518
	 *
	 */
	public class JavascriptInterface {
		private Context context;
		
		public JavascriptInterface(Context context) {
			this.context = context;
		}

		
		@android.webkit.JavascriptInterface
		public void getUid(final String uid) {
			 getuid = uid;
			runOnUiThread(new Runnable() {
				public void run() {
					
					LoginUtils.getInstances().login_dialog.cancel();
					
					tx_islogin.setText("已登录");
					tx_uuid.setText("uid = " + uid);
					Toast.makeText(context, "已登录\n" + uid, Toast.LENGTH_SHORT)
							.show();
					btn_pay.setVisibility(View.VISIBLE); //修改为显示的btn
					
				}
			});

		}
	}
	
	
}
