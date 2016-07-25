package com.account.UI;

import com.account.util.Constant;
import com.account.util.WebJsInterface;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.Bitmap;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.WindowManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.FrameLayout.LayoutParams;
import android.widget.TextView;

public class LoginDialog {
	
	private Dialog login_dialog=null;
	
	private EditText et_name=null;
	private EditText et_password=null;
	private Button btnLogin=null;
	private Button btnToRegist=null;
	
	private int width;
	private int height;
	
	public void showView(Context context) {
		LinearLayout linearLayout = new LinearLayout(context);
		WindowManager wm = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
	    width = wm.getDefaultDisplay().getWidth()*80/100;
	    height = wm.getDefaultDisplay().getHeight()*55/100;
		LayoutParams plaqueParams = new LayoutParams(
				new LinearLayout.LayoutParams(width,height));//布局和webview大小
		plaqueParams.gravity=Gravity.CENTER;//设置居中显示
		linearLayout.setLayoutParams(plaqueParams);
		et_name=new EditText(context);
		et_name.setWidth(400);
		et_name.setHeight(30);
		et_password=new EditText(context);
		et_password.setWidth(400);
		et_password.setHeight(30);
		btnLogin = new Button(context);
		btnLogin.setWidth(50);
		btnLogin.setHeight(30);
		login_dialog = new Dialog(context,
				android.R.style.Theme_Translucent_NoTitleBar);
		login_dialog.setCancelable(false);
		login_dialog.show();
		login_dialog.setOnKeyListener(new OnKeyListener() {

			@Override
			public boolean onKey(DialogInterface dialog, int keyCode,
					KeyEvent event) {
				if(keyCode == KeyEvent.KEYCODE_BACK&&event.getAction()==KeyEvent.ACTION_DOWN) {  
						login_dialog.cancel();
                }
				return false;
			}
		});

		// 线性布局装webview
		linearLayout.addView(et_name);
		linearLayout.addView(et_password);
		linearLayout.addView(btnLogin);
		// dialog加载线性布局
		login_dialog.setContentView(linearLayout);
	}
}
